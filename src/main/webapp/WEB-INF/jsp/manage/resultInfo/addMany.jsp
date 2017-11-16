<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath%>static/js/jquery.form.js"></script>
<div class="easyui-layout" data-options="fit:true">
 	<form  id="readFile" name="readFile" enctype="multipart/form-data">
            <label>文件</label> <input id="file" name="file" class="easyui-filebox" data-options="prompt:'选择文件',buttonText:'&nbsp;选&nbsp;择&nbsp;',required:true">   </br></br>
            <label>请选择excel文件文件</label>
</form>
</div>  
    <script>
		    function doSave(dialog){  
				$("#readFile").ajaxSubmit({
					type: "POST",
					beforeSubmit: showRequest,
					url:"resultInfo/addResults",
					dataType: "json",
				    success: function(data){
				    	console.log(data.data)
				    	  for(var i =0;i<data.data.length;i++){
				    		initTrees(data.data[i].riPaperId,data.data[i].resultId,data.data[i].userNo);
				    	  }  
				     	if(data.meta.success){ 
				    		$.messager.alert('提示','读取成功!','info');
				    		initdatagrid();
				    		dialog.close();
				   		 }
				    	else{
				    		$.messager.alert('提示','读取失败!','warning');;
				    	}
					}
				});  
			}
		    function initTrees(paperId,resultId,userLoginName){
				$.ajax({
					url:'resultDetial/initPaperInfo',
					type:'POST',
					dataType:'json',
					data:{
						"data":JSON.stringify({
						    otherId:paperId,
							resultId:resultId,
							userLoginName:userLoginName
						})
					},success:function(data){
						initDetial();
					}
					
				}); 
		  	}
		    function initDetial(){
		    	$.ajax({
					url:'resultInfo/initDetial',
					type:'POST',
					dataType:'json',
					success:function(data){
						initdatagrid();
					}
				}); 
		    }
		  //提交前的一些校验
		    function showRequest(formData, jqForm, options){
		      if(formData[0].value=="" || formData[0].value==null){
		    	  $.messager.alert('提示','请选择文件!','info');
		        return false;
		      }
		      var fileName = $('#file').filebox('getValue').split("\\").pop();
		      var strs = new Array(); //定义一数组
		      strs = fileName.split('.');
		      var suffix = strs [strs .length - 1];
		      if (suffix != 'cdi' && suffix != 'xlsx') {
		        $.messager.alert('提示','请选择xlsx文件！','warning');
		        return false;
		      }
		    } 	    
</script>