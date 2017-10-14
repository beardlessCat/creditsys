package com.creidtsys.apps.auth.entity;

import java.io.Serializable;
/**
 * 
* @ClassName: SysUserRole
* @Description: TODO 权限用户角色关联实体
* @author liuyj
* @date 2017年8月26日 上午9:23:20
*
 */
@SuppressWarnings("serial")
public class SysUserRole   extends SysRole implements Serializable{
	private String urUserId ;  //用户标识
	private String urRoleId ;  //角色标识
	private String roleIds ;   //角色标识串
	
	public String getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
	public String getUrUserId() {
		return urUserId;
	}
	public void setUrUserId(String urUserId) {
		this.urUserId = urUserId;
	}
	public String getUrRoleId() {
		return urRoleId;
	}
	public void setUrRoleId(String urRoleId) {
		this.urRoleId = urRoleId;
	}
}
