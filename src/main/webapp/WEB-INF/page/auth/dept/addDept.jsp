<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" style="width:100%;padding:30px 60px">	
 				<table id="deptList"  >
	  				<tr>
						<td class="form-label" align="right" >
							<div>组织机构名称:</div>
						</td>
						<td class="form-control">
							<input class="easyui-textbox" id="deptName" style="width:300px;height:30px;margin-top: 10px">
						</td>	
						<td class="form-label" align="right">上级组织机构：</td>
						<td class="form-control">			
							<input id="deptParentId"  class="easyui-combotree"   data-options="required:true"  style="width:300px;height:30px">
						</td>
					</tr>
					<tr >
						<td class="form-label" align="right" style="padding-top: 30px"> 组织机构等级：</td>
						<td class="form-control" style="padding-top: 20px"><input id="deptLevel"
							 class="easyui-textbox"  
							data-options="required:true"  style="width:300px;height:30px">
						<td class="form-label" align="right" style="padding-top: 20px">组织机序号：</td>
						<td class="form-control" style="padding-top: 20px">
							<input id="deptOrder" class="easyui-textbox" data-options="required:true"  style="width:300px;height:30px;">
						</td>
					</tr>
					<tr>
						<td class="form-label" align="right" style="padding-top: 20px">组织有效标识：</td> 
						<td class="form-control" style="padding-top: 20px">
						<select id="deptIsValid" class="easyui-combobox" data-options="required:true" style="width:300px;height:30px;">
							<option value = 0> 无效</option>
							<option value = 1> 有效</option>
						</select>
						</td>	
						<td class="form-label" align="right" style="padding-top: 20px">组织机构负责人：</td>
						<td class="form-control" style="padding-top: 20px ">
						<input id="deptLeader" class="easyui-textbox" data-options="required:true" style="width:300px;height:30px;"></td>
					</tr> 
					<tr>
						<td class="form-label" align="right" style="padding-top: 20px">组织机构描述：</td>
						<td class="form-control" style="padding-top: 20px ">
						 <textarea style="height:50px;width: 500" id="deptDesc"></textarea>					
					</tr>
 				</table>	
  	</div>
  	</div>
  	<script type="text/javascript">
	  	function doInit(dialog){
	  		commonComboTree('deptParentId','sysDept/initDeptTree')	;  		
	  	}
	  	function doSave(dialog){
	  		datas = JSON.stringify({
						"deptName":$('#deptName').textbox('getValue'),
		 				"deptParentId":  $('#deptParentId').combotree('getValue'),
						"deptLevel":$('#deptLevel').textbox('getValue'),
						"deptOrder":$('#deptOrder').textbox('getValue'),
						"deptIsValid":$('#deptIsValid').val(),
						"deptLeader":$('#deptLeader').val() 
						}) ;
	  		doActionForm('sysDept/add',datas,initGrid,dialog) ;
  		}
  	</script>
