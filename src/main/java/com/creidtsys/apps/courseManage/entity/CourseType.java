package com.creidtsys.apps.courseManage.entity;

import com.creidtsys.apps.auth.entity.SysUser;

@SuppressWarnings("serial")
public class CourseType extends SysUser{
	private String ctypeId;
	private String ctypeName ;
	private String ctypeDesc ;
	public String getCtypeId() {
		return ctypeId;
	}
	public void setCtypeId(String ctypeId) {
		this.ctypeId = ctypeId;
	}
	public String getCtypeName() {
		return ctypeName;
	}
	public void setCtypeName(String ctypeName) {
		this.ctypeName = ctypeName;
	}
	public String getCtypeDesc() {
		return ctypeDesc;
	}
	public void setCtypeDesc(String ctypeDesc) {
		this.ctypeDesc = ctypeDesc;
	}
	
}
