package com.creidtsys.apps.auth.entity;

import java.io.Serializable;

import com.creidtsys.utils.Pager;
/**
 * 
* @ClassName: SysRole
* @Description: TODO 权限角色实体
* @author liuyj
* @date 2017年8月26日 上午8:53:08
*
 */
@SuppressWarnings("serial")
public class SysRole   extends Pager  implements Serializable{
	private String roleId ;       //角色标识
	private String roleName ;     //角色名称
	private String roleIsValid ;  //角色有效标
	private String roleParentId ; //上级角色标识
	private String remake ;       //备注
	private String resIds ;       //与之关联的权限的集合
	
	public SysRole() {
		super();
	}
	
	public String getResIds() {
		return resIds;
	}

	public void setResIds(String resIds) {
		this.resIds = resIds;
	}

	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleIsValid() {
		return roleIsValid;
	}
	public void setRoleIsValid(String roleIsValid) {
		this.roleIsValid = roleIsValid;
	}
	public String getRoleParentId() {
		return roleParentId;
	}
	public void setRoleParentId(String roleParentId) {
		this.roleParentId = roleParentId;
	}
	public String getRemake() {
		return remake;
	}
	public void setRemake(String remake) {
		this.remake = remake;
	}
}
