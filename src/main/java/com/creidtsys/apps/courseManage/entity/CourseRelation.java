package com.creidtsys.apps.courseManage.entity;

public class CourseRelation {
	private String srId ;  //关系id
	private String srPid ; //关系父id
	private String srName ; // 关系名称
	private String srType ; // 关系类型
	private String srDate ; //课时
	private String srIsNess ; //是否必修
	private String srProperty ;  //属性
	private String srOtherId ;//来源id
	private String srRemake ; //备注
	public String getSrId() {
		return srId;
	}
	public void setSrId(String srId) {
		this.srId = srId;
	}
	public String getSrPid() {
		return srPid;
	}
	public void setSrPid(String srPid) {
		this.srPid = srPid;
	}
	
	public String getSrName() {
		return srName;
	}
	public void setSrName(String srName) {
		this.srName = srName;
	}
	public String getSrType() {
		return srType;
	}
	public void setSrType(String srType) {
		this.srType = srType;
	}
	public String getSrDate() {
		return srDate;
	}
	public void setSrDate(String srDate) {
		this.srDate = srDate;
	}
	public String getSrIsNess() {
		return srIsNess;
	}
	public void setSrIsNess(String srIsNess) {
		this.srIsNess = srIsNess;
	}
	public String getSrProperty() {
		return srProperty;
	}
	public void setSrProperty(String srProperty) {
		this.srProperty = srProperty;
	}
	public String getSrOtherId() {
		return srOtherId;
	}
	public void setSrOtherId(String srOtherId) {
		this.srOtherId = srOtherId;
	}
	public String getSrRemake() {
		return srRemake;
	}
	public void setSrRemake(String srRemake) {
		this.srRemake = srRemake;
	}
	
}
