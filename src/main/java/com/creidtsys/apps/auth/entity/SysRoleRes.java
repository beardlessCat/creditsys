package com.creidtsys.apps.auth.entity;

import java.io.Serializable;

import com.creidtsys.utils.Pager;
/**
 * 
* @ClassName: SysRoleRes
* @Description: TODO   角色url资源关联表
* @author liuyj
* @date 2017年8月26日 上午9:30:59
*
 */
@SuppressWarnings("serial")
public class SysRoleRes  extends SysRes   implements Serializable{
	private String isChecked   ; //选中标识
	private  String rrRoleId ;  //角色id
	private  String rrResId ;   //url权限id
	public String getIsChecked() {
		return isChecked;
	}
	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}
	public String getRrRoleId() {
		return rrRoleId;
	}
	public void setRrRoleId(String rrRoleId) {
		this.rrRoleId = rrRoleId;
	}
	public String getRrResId() {
		return rrResId;
	}
	public void setRrResId(String rrResId) {
		this.rrResId = rrResId;
	}

	
 	 
}
