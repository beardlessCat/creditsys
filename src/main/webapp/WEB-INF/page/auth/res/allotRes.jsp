<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div id="cc" class="easyui-layout" style="width:100%;height:100%;">   
    <div data-options="region:'north',split:true" style="height:50px;">
    	<table>
    		<tr>
    			<!-- <td class="form-label" align="right">当前用户</td>
    			<td class="form-label" align="right">动态（未设置）</td> -->
    		</tr>
    	</table>
    </div>   
    <div data-options="region:'east',iconCls:'icon-reload,collapsible:false',title:'资源树',split:true" style="width:30%;">
    	<ul id="allTree"  class="easyui-tree"></ul>	
    </div>   
    <div data-options="region:'center',title:'单独分配'" style="padding:5px;background:#eee;width:30%">
    	<ul id="ownTree"  class="easyui-tree"></ul>	
    </div>   
    <div data-options="region:'west',title:'来自所属用户组',split:true,collapsible:false" style="width:30%;">
    	<ul id="groupTree"  class="easyui-tree"></ul>	
    </div>    
</div>  
  	<script type="text/javascript">
  	var row ;
	function doInit(dialog){
  			row = dialog.getData("row");
 			initgroupTree(row.userId);
  			initownTree(row.userId);
  			initallTree(row.userId);
  		};
  		
  		function initownTree(userId){ 
  			$("#ownTree").treegrid({
  		            url: 'sysUserRes/getUserRes',
  		            idField: 'resId',
  		            treeField: 'resName',
  		            lines:true,
  		        	checkOnSelect:true,
  					striped: true,
  					border:false,
  					queryParams:{
  	  		        	userId:userId
  	  		        },
  		            columns:[[    
  		              	     {title:'资源名称',field:'resName',width:'100%',align:'left',halign:'center'}  
  		              	    ]]      ,
  		            customAttr: {
  		                parentField: 'resParentId'
  		            }
  		        }).treegrid('followCustomHandle');
  		}
  		
  		function initgroupTree(userId){ 			
  			$("#groupTree").treegrid({
  		            url: 'sysUserRes/getRoleRes',
  		            idField: 'resId',
  		            treeField: 'resName',
  		            lines:true,
  		        	checkOnSelect:true,
  					striped: true,
  					border:false,
  					queryParams:{
  						userId:userId
  	  		        },  
  		            columns:[[    
  		              	        {title:'资源名称',field:'resName',width:'100%',align:'left',halign:'center'}  
  		              	    ]]   ,
  		            customAttr: {
  		                parentField: 'resParentId'
  		            }
  		        }).treegrid('followCustomHandle');
  		}
  		
  		function initallTree(userId){
  			$('#allTree').tree({
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
  		        url: 'sysUserRes/resUserTree', 
  		        dataType:'json',
  		        data:{
  		        	userId :userId
  		        },
  		        success: function(data){
  		            	$('#allTree').tree('loadData',eval(data.data));
  		            	 $(data.data).each(function(i,obj){
  		            		var url = obj.resUrl ;
 							if(!url){
 								return ;
 							} 
  		            		if(obj.isChecked=="true"){
								var n = $("#allTree").tree('find',obj.id);							
	                     		$("#allTree").tree('check',n.target);
							}
  		            	});  
  		        },
  		        error: function(){
  		            $.messager.alert('提示','初始化失败!','warning');
  		        }
  			});
  		}
  		
  		function doSave(dialog){
  			var nodes =$('#allTree').tree('getChecked');
  			selectlayer = new Array();
  			for(var i=0;i<nodes.length;i++){
  				var cnode = $("#allTree").tree("getChildren",nodes[i].target);
  				//叶子节点
  				//if(cnode.length == 0){
  					selectlayer[selectlayer.length] = nodes[i]; ;
  			//	}
  			}
  			 var s = '';
  		     for(var i=0; i<selectlayer.length; i++){
  		    	 if(selectlayer[i].resType=="2"){
  		    		  if (s != '') s += ',';
  	  		         s += selectlayer[i].resId;
  		    	 }
  		     }
  			 $.ajax({
  				type : "POST",
  				//提交的网址
  				url : "sysUserRes/saveUserRes",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						resIds:s,
  						userId:row.userId
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','保存成功!','warning');
  						initownTree(row.userId);
  						initTreeGrid(row.userId);
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
  	</script>
