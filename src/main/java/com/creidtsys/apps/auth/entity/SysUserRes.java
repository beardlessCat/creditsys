package com.creidtsys.apps.auth.entity;


/**
 * 
* @ClassName: SysUserRes
* @Description: TODO 用户与资源关系实体
* @author liuyj
* @date 2017年8月26日 上午9:59:52
*
 */
public class SysUserRes  extends SysRoleRes  {
	private String urUserId ; 	//用户标识
	private String urResId ;  	//资源标识
	public SysUserRes() {
		super();
	}
	public String getUrUserId() {
		return urUserId;
	}
	public void setUrUserId(String urUserId) {
		this.urUserId = urUserId;
	}
	public String getUrResId() {
		return urResId;
	}
	public void setUrResId(String urResId) {
		this.urResId = urResId;
	}
}
