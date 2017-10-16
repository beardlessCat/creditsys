<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div id="cc" class="easyui-layout" style="width:100%;height:100%;">   
    	<ul id="tree"  class="easyui-tree"></ul>	
</div>  
  	<script type="text/javascript">
  	var courseSid ;
	function doInit(dialog){
		courseSid = dialog.getData("courseSid");
		console.log("courseSid-->"+courseSid);
		initownTree();
  		};
  		function initownTree(){ 
  			$('#tree').tree({
  				checkbox: true,
  		 		customAttr:{
  					dataModel: 'simpleData',
  					idField: 'courseSid',
  		            textField: 'coursePname',
  		            parentField: 'coursePid'
  				}
  			}).tree('followCustomHandle');
  			$.ajax({
  				type : 'POST',
  		        url: 'courseDepend/getAll', 
  		        dataType:'json',
  		        data:{
  		        	courseSid :courseSid
  		        },
  		        success: function(data){
  		            	$('#tree').tree('loadData',eval(data.data));
  		            	  $(data.data).each(function(i, obj){
                               if(obj.isNes=="checked"){
									console.log(obj)			
								 	var node = $("#tree").tree('find',obj.id);
	                     			$("#tree").tree('check', node.target); 
								}
                            }); 
  		        },
  		        error: function(){
  		            $.messager.alert('提示','初始化失败!','warning');
  		        }
  			});
  		}
  		
  		function doSave(dialog){
  			var nodes =$('#tree').tree('getChecked','unchecked');
  			selectlayer = new Array();
  			for(var i=0;i<nodes.length;i++){		
  					selectlayer[selectlayer.length] = nodes[i];
  			}
  			 var s = '';
  		     for(var i=0; i<selectlayer.length; i++){
  		         if (s != '') s += ',';
  		         s += selectlayer[i].dependId;
  		     }
  		     console.log(s);
  			$.ajax({
  				type : 'POST',
  		        url: 'courseDepend/editChecked', 
  		        dataType:'json',
  		        data:{
  		        	dependIds :s
  		        },
  		        success: function(data){
  		        	$.messager.alert('提示','添加成功!','warning');
  		        	dialog.close();
  		        },
  		        error: function(){
  		            $.messager.alert('提示','初始化失败!','warning');
  		        }
  			});
  		}
  	</script>
