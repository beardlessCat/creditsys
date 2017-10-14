<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 100% ;padding:30px 60px">
  				<table id="deptList"  >
	  				<tr>
						<td class="form-label" align="right" >
							<div>用户姓名:</div>
						</td>
						<td class="form-control">
							<input class="easyui-textbox" id="userName" style="width:300px;height:30px;margin-top: 10px">
						</td>	
						<td class="form-label" align="right">所属机构：</td>
						<td class="form-control">			
							<input id="userDeptId"  class="easyui-combotree"   data-options="required:true"  style="width:300px;height:30px">
						</td>
					</tr>
					<tr >
						<td class="form-label" align="right" style="padding-top: 30px">用户编码：</td>
						<td class="form-control" style="padding-top: 20px"><input id="userNo"
							 class="easyui-textbox"  
							data-options="required:true"  style="width:300px;height:30px">
						<td class="form-label" align="right" style="padding-top: 20px">登录密码：</td>
						<td class="form-control" style="padding-top: 20px">
							<input id="userPwd" class="easyui-textbox" data-options="required:true"  style="width:300px;height:30px;">
						</td>
					</tr>
					<tr>
						<td class="form-label" align="right" style="padding-top: 20px">用户性别：</td> 
						<td class="form-control" style="padding-top: 20px">
						<select id="userSex" class="easyui-combobox" data-options="required:true" style="width:300px;height:30px;">
							<option value = 2> 男</option>
							<option value = 1> 女</option>
						</select>
						</td>	
						<td class="form-label" align="right" style="padding-top: 20px">身份证号：</td>
						<td class="form-control" style="padding-top: 20px ">
						<input id="cardId" class="easyui-textbox" data-options="required:true" style="width:300px;height:30px;"></td>
					</tr> 
					<tr>
						<td class="form-label" align="right" style="padding-top: 30px"> 家庭住址：</td>
						<td class="form-control" style="padding-top: 20px"><input id="userAddr"
							 class="easyui-textbox"  
							data-options="required:true"  style="width:300px;height:30px">
						<td class="form-label" align="right" style="padding-top: 20px">联系方式：</td>
						<td class="form-control" style="padding-top: 20px">
							<input id="userContact" class="easyui-textbox" data-options="required:true"  style="width:300px;height:30px;">
						</td>
					</tr>
					<tr >
						<td class="form-label" align="right" style="padding-top: 30px"> 入校时间：</td>
						<td class="form-control" style="padding-top: 20px"><input id="enterDate"
							 class="easyui-datebox"  
							data-options="required:true"  style="width:300px;height:30px">
						<td class="form-label" align="right" style="padding-top: 20px">离校时间：</td>
						<td class="form-control" style="padding-top: 20px">
							<input id="leaveDate" class="easyui-datebox" data-options="required:true"  style="width:300px;height:30px;">
						</td>
					</tr>
					<tr>
						<td class="form-label" align="right" style="padding-top: 20px">用户状态：</td> 
						<td class="form-control" style="padding-top: 20px">
						<select id="userStatus" class="easyui-combobox" data-options="required:true" style="width:300px;height:30px;">
							<option value = 0> 锁定</option>
							<option value = 1> 正常</option>
						</select>
						</td>	
						<td class="form-label" align="right" style="padding-top: 20px">职称：</td>
						<td class="form-control" style="padding-top: 20px ">
						<input id="userProfess" class="easyui-textbox" data-options="required:true" style="width:300px;height:30px;"></td>
					</tr> 
					<tr>
						<td class="form-label" align="right" style="padding-top: 20px">邮箱：</td> 
						<td class="form-control" style="padding-top: 20px">
						<input id="userEmail" class="easyui-textbox" data-options="required:true" style="width:300px;height:30px;">
						</td>	
						<td class="form-label" align="right" style="padding-top: 20px">学年制：</td>
						<td class="form-control" style="padding-top: 20px ">
						<input id="schoolYear" class="easyui-textbox" data-options="required:true" style="width:300px;height:30px;"></td>
					</tr> 
					<tr>
						<td class="form-label" align="right" style="padding-top: 20px">备注：</td>
						<td class="form-control" style="padding-top: 20px ">
						 <textarea style="height:50px;width: 500" id="remark"></textarea>	
						 </td>
					</tr> 
 				</table>	
  	</div>
  </div>
<script type="text/javascript">
	var selected;
	function doInit(dialog){
		commonComboTree('userDeptId','sysDept/initDeptTree') ;
		selected = dialog.getData("selected")[0];
		console.log(selected)
	 	$("#userName").textbox("setValue",selected.userName);
		$("#userDeptId").combotree("setValue",selected.userDeptId);
		$("#userNo").textbox("setValue",selected.userNo);
		$("#userPwd").textbox("setValue",selected.userPwd);
		$("#userSex").combobox("setValue",selected.userSex);
		$("#userAddr").textbox("setValue",selected.userAddr);
		$("#userContact").textbox("setValue",selected.userContact);
		$("#enterDate").datebox("setValue",selected.enterDate);
		$("#leaveDate").datebox("setValue",selected.leaveDate);
		$("#cardId").textbox("setValue",selected.cardId);
		$("#userStatus").combobox("setValue",selected.userStatus);
		$("#userProfess").textbox("setValue",selected.userProfess);
		$("#userEmail").textbox("setValue",selected.userEmail);
		$("#schoolYear").textbox("setValue",selected.schoolYear);
		$("#remark").val(selected.remark);  
	}
	function doSave(dialog){
		datas = JSON.stringify({
			"userId":selected.userId ,
			"userName":$('#userName').textbox('getValue'),
			"userDeptId":"1",
			"userNo":$('#userNo').textbox('getValue'),
			"userPwd":$('#userPwd').textbox('getValue'),
			"userSex":$('#userSex').combobox('getValue'),
			"cardId":$('#cardId').textbox('getValue'),
			"userAddr":$('#userAddr').textbox('getValue'),
			"userContact":$('#userContact').textbox('getValue'),
			"enterDate":$('#enterDate').datebox('getValue'),
			"leaveDate":$('#leaveDate').datebox('getValue'),
			"userStatus":$('#userStatus').combobox('getValue'),
			"userProfess":$('#userProfess').textbox('getValue'),
			"userEmail":$('#userEmail').textbox('getValue'),
			"schoolYear":$('#schoolYear').textbox('getValue'),
			"remark":$('#remark').val(),
		}) ;
		doActionForm('sysUser/edit',datas,initGrid,dialog) ;
  	}
</script>
