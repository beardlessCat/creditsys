<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">课程类型：</td>
							<td class="form-control" ><input id="courseType"
								 class="easyui-combobox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">先修课程：</td>
							<td class="form-control"><input id="coursePid" 
								 class="easyui-combobox"
								data-options="required:true,multiple:true" style="width:250px"></td>
						</tr>
		  				<tr>
							<td class="form-label" align="right">课程代码：</td>
							<td class="form-control" ><input id="courseCode"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">课程名称：</td>
							<td class="form-control"><input id="courseName" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
						<tr >
							<td class="form-label" align="right">课时：</td> 
							<td class="form-control"><input id="coursePeriod" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">课程要求：</td>
							<td class="form-control"><input id="courseRequire" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
						<tr >
							<td class="form-label" align="right">成绩构成：</td> 
							<td class="form-control"><input id="courseScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								 <td class="form-label" align="right">考试形式：</td>
								<td class="form-control"><input id="courseForm"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">	
						</tr> 
						<tr >
							<td class="form-label" align="right">参考教材：</td> 
							<td class="form-control"><input id="courseRefer" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">课程反馈：</td>
							<td class="form-control"><input id="courseFeed" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
						<tr>
							<td class="form-label" align="right">学分：</td>
							<td class="form-control" ><input id="courseCredit"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">考核方式：</td>
							<td class="form-control"><input id="courseChecked" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
						<tr>
							<td class="form-label" align="right">讲课学时：</td>
							<td class="form-control" ><input id="pdLesson"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">上机学时：</td>
							<td class="form-control"><input id="plLesson" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
						<tr>
								<td class="form-label" align="right">实验学时：</td>
							<td class="form-control"><input id="pdTest" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
  				</table>
  				</div>
  				</div>	
  	<script type="text/javascript">
  		var node ;
	  	function doInit(dialog){
	  		initCobbobox() ;
	  	}
	  	//初始化类型下拉框
	  		function initCobbobox(){
	  		$('#courseType').combobox({    
	  		    url:'courseType/initType',    
	  		    valueField:'id',    
	  		    textField:'text'   
	  		});  
	  	}
	  	function doSave(dialog){
	  		node = $('#coursePid').combobox('getValues');
	  		 var ID = '';	
	        //批量获取选中行的ID  
	        for (i = 0; i < node.length;i++) {  
	            if (ID =="") {  
	                ID = node[i];  
	            } else {  
	                ID = node[i] + "," + ID;  
	            }                 
	        }	  		
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "course/add",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"pids":ID,
  						"courseCode":$('#courseCode').textbox('getValue'),
  		 				"courseName": $("#courseName").textbox("getValue"),
  						"coursePeriod":$('#coursePeriod').textbox('getValue'),
  						"courseRequire":$('#courseRequire').textbox('getValue'),
  						"courseScore":$('#courseScore').textbox('getValue'),
  						"courseForm":$('#courseForm').textbox('getValue'),
  						"courseRefer":$('#courseRefer').textbox('getValue'),
  						"courseFeed":$('#courseFeed').textbox('getValue'),
  						"courseCredit":$('#courseCredit').textbox('getValue'),
  		 				"courseChecked": $("#courseChecked").textbox("getValue"),
  						"pdLesson":$('#pdLesson').textbox('getValue'),
  						"plLesson":$('#plLesson').textbox('getValue'),
  						"courseProperty":$('#courseType').combobox('getValue'),
  						"pdTest":$('#pdTest').textbox('getValue')
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  						$.messager.alert('提示','保存成功!','warning');
  						initGrid('','1','10') ;
  						if(node.length>1){
  							chooseMust(data.data);
  						}
  		           		dialog.close();
  				},
  				//调用出错执行的函数
  				error: function(XMLHttpRequest, textStatus, errorThrown) {
  					$.messager.alert('提示','保存失败!','warning');
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
  			});
  		}
	  	function chooseMust(courseSid){
	  		 $.showModalDialog({
	            title: '判定选修课程的关系',
	            content:'url:course/toNesCourse',   
	            data: {
	            	courseSid: courseSid
	            	},//扩展属性，给dilog页面传值
	            useiframe:false,//默认false，扩展属性
	            width:'80%',
	            height:'80%',
	            toolbar:[{
	                text:'保存',
	                iconCls:'icon-save',
	                handler: 'doSave'
	            },'-',{
	                text: '关闭',
	                iconCls: 'icon-cancel',
	                handler: function(dialog){
	                    dialog.close();
	                }
	            }],
	            onLoad: function(dialog, cotent){//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
	                if(cotent && cotent.doInit){//判断弹出页面是否加载完，是否有这个方法
	                    cotent.doInit(dialog);//调用dialog页面的方法
	                }
	            }
	        });  
	  	}
	  	function vailNull(){        
			var projectName =$('#projectName').textbox('getValue')  ? true : false;
			var state=$('#state').combobox('getValue')  ? true : false;
			var dept=$('#dept').combotree('getValue')  ? true : false;
			var creator=$('#creator').textbox('getValue')  ? true : false;
			var createTime=$('#createTime').textbox('getValue')  ? true : false;
			var mapParam=$('#mapParam').textbox('getValue')  ? true : false;
			return (projectName && state && dept && creator && createTime && mapParam );
		}
  	</script>
