<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true"> 
	<div data-options="region:'north',border:true" class="easyui-panel"  style="width: 350px ;padding:30px 60px;height:150px">
		 <table >
			<tr>
				<td class="form-label" align="right" >
					<div>角色名称:</div>
				</td>
				<td class="form-control">
					<input class="easyui-textbox" id="roleName" style="width:300px;height:30px;margin-top: 10px">
				</td>	
				<td class="form-label" align="right">上级角色：</td>
				<td class="form-control">			
					<select id="roleParentId"  class="easyui-combotree"   data-options="required:true"  style="width:300px;height:30px"></select>
				</td>
			</tr>
			<tr >
				<td class="form-label" align="right" style="padding-top: 30px">有效标识：</td>
				<td class="form-control" style="padding-top: 20px">
				<select id="roleIsValid" class="easyui-combobox" data-options="required:true"  style="width:300px;height:30px">
					<option value ="0">无效</option>
					<option value ="1">有效</option>
				</select>
				<td class="form-label" align="right" style="padding-top: 20px">备注：</td>
				<td class="form-control" style="padding-top: 20px">
					<input id="remake" class="easyui-textbox" data-options="required:true"  style="width:300px;height:30px;">
			</tr>
	</table>	
  	</div> 
  
  	<div data-options="region:'center',border:false" style="padding: 5px;width=100%">
		<ul id="dataAuthorityTree"  class="easyui-tree" data-options="animate:true,checkbox:true"></ul>	
	</div>
	
 	<script type="text/javascript">
	  	function doInit(dialog){
	  		commonComboTree('roleParentId','sysRole/initRoleTree')
	  		initTree() ;
	  	}
		function initTree(){
  			$('#dataAuthorityTree').tree({
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
  		        url: 'sysRes/initTree',
  		        dataType:'json',
  		        data:{
  		        },
  		        success: function(data){
  		            $('#dataAuthorityTree').tree('loadData',eval(data.data));
  		        },
  		        error: function(){
  		            $.messager.alert('提示','初始化失败!','warning');
  		        }
  			});
  		}
  		function doSave(dialog){
	  		var t = $('#roleParentId').combotree('tree'); // 得到树对象 
	  		var n = t.tree('getSelected'); // 得到选择的节点 
	  		var rows =  $('#dataAuthorityTree').tree('getChecked') ;
	  		//获取树的选中节点
	  		var ID=""; 		
	        for (i = 0; i < rows.length;i++) {  
	            if (ID =="") {  
	                ID = rows[i].resId;  
	            } else {  
	                ID = rows[i].resId + "," + ID;  
	            }   
	        }
	    	datas = JSON.stringify({
					"roleName":$('#roleName').textbox('getValue'),
					"roleParentId": n.roleId,
					"roleIsValid":$('#roleIsValid').combobox('getValue'),
					"remake":$('#remake').textbox('getValue'),
					"resIds":ID
				}) ;
			doActionForm('sysRole/add',datas,initGrid,dialog) ;
  	}
</script>
</div>
 