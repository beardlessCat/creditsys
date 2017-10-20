<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:true" class="easyui-panel" 
  					style="width: 350px;height:60px">
  				<input type="hidden" id="id"  />				
  				<table id="areaList" calss="form">
		  				<tr>
							<td class="form-label" align="right">角色名称：</td>
							<td class="form-control"><input id="roleName" class="easyui-textbox" readonly="readonly" data-options="required:true"></td>					
						</tr>
  				</table>	
  	</div>
  	<div data-options="region:'center',border:false" style="padding: 5px;height:600px">
		<ul id="dataAuthorityTree"  class="easyui-tree"></ul>	
	</div>
 	<script type="text/javascript">
  		var selected ;
	  	function doInit(dialog){
	  		selected= dialog.getData("selected")[0];
	  		initallTree(selected.roleId);
	  		$('#roleName').textbox('setValue',selected.roleName);
	  	}
  		function doSave(dialog){
  			var nodes =$('#dataAuthorityTree').tree('getChecked');
  			selectlayer = new Array();
  			for(var i=0;i<nodes.length;i++){
  				selectlayer[selectlayer.length] = nodes[i]; ;
  			}
  			 var s = '';
  		     for(var i=0; i<selectlayer.length; i++){
  		    	 if (selectlayer[i].resType=="2"){
  		    		if (s != '') s += ',';
  	  		         s += selectlayer[i].resId;
  		    	 }
  		     }
  			 $.ajax({
  				type : "POST",
  				//提交的网址
  				url : "sysRoleRes/savrRela",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						resIds:s,
  						roleId:selected.roleId
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','保存成功!','warning');
  						initTree();
  						dialog.close();
  		               }else{
  		                   $.messager.alert('error', 'error');
  		               }
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
  		function initallTree(roleId){
  			$('#dataAuthorityTree').tree({
  				lines:true,
  				checkbox: true,
  		 		customAttr:{
  					dataModel: 'simpleData',
  					idField: 'resId',
  		            textField: 'resName',
  		            parentField: 'resParentId'
  				}
  			}).tree('followCustomHandle');
  			$.ajax({
  				type : 'POST',
  		        url: 'sysRoleRes/resRoleTree', 
  		        dataType:'json',
  		        data:{
  		        	roleId :roleId
  		        },
  		        success: function(data){
  		            	$('#dataAuthorityTree').tree('loadData',eval(data.data));
  		            	 $(data.data).each(function(i,obj){
 						 	var url = obj.resUrl ;
 							if(!url){
 								return ;
 							} 
  		            		if(obj.isChecked=="true"){
								var n = $("#dataAuthorityTree").tree('find',obj.id);							
	                     		$("#dataAuthorityTree").tree('check',n.target);
							}
  		            	});  
  		        },
  		        error: function(){
  		            $.messager.alert('提示','初始化失败!','warning');
  		        }
  			});
  		}
  		function vailNull(){        
  			var roleName =$('#roleName').textbox('getValue')  ? true : false;
  			return (roleName);
  		}
  	</script>
  	</div>