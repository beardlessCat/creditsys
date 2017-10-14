package com.creidtsys.apps.auth.entity;

import com.creidtsys.utils.Pager;

/**
 * 
* @ClassName: SysDept
* @Description: TODO 权限组织机构实体
* @author liuyj
* @date 2017年8月26日 上午8:59:40
*
 */
public class SysDept extends Pager {
	private String deptId ;    		//组织机构标识
	private String deptName ;   	//组织机构名称
	private String deptDesc ;		//组织机构描述
	private String deptParentId ; 	//上级组织机构标识
	private String deptLevel ; 		//组织机构等级
	private String deptOrder ;		//组织机构序号
	private String deptIsValid ;	//组织机构有效标识
	private String deptLeader ;     //组织机构负责人
	
	public String getDeptLeader() {
		return deptLeader;
	}
	public void setDeptLeader(String deptLeader) {
		this.deptLeader = deptLeader;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptDesc() {
		return deptDesc;
	}
	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}
	public String getDeptParentId() {
		return deptParentId;
	}
	public void setDeptParentId(String deptParentId) {
		this.deptParentId = deptParentId;
	}
	public String getDeptLevel() {
		return deptLevel;
	}
	public void setDeptLevel(String deptLevel) {
		this.deptLevel = deptLevel;
	}
	public String getDeptOrder() {
		return deptOrder;
	}
	public void setDeptOrder(String deptOrder) {
		this.deptOrder = deptOrder;
	}
	public String getDeptIsValid() {
		return deptIsValid;
	}
	public void setDeptIsValid(String deptIsValid) {
		this.deptIsValid = deptIsValid;
	}
	

}
