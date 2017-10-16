package com.creidtsys.apps.courseManage.entity;

public class Point extends Unit{
	private String pointId ;
	private String pointUnitId ;	
	private String pointName ;
	private String pointContent ;
	private String pointRemake ;
	public String getPointUnitId() {
		return pointUnitId;
	}
	public void setPointUnitId(String pointUnitId) {
		this.pointUnitId = pointUnitId;
	}
	public String getPointId() {
		return pointId;
	}
	public void setPointId(String pointId) {
		this.pointId = pointId;
	}
	public String getPointName() {
		return pointName;
	}
	public void setPointName(String pointName) {
		this.pointName = pointName;
	}
	public String getPointContent() {
		return pointContent;
	}
	public void setPointContent(String pointContent) {
		this.pointContent = pointContent;
	}
	public String getPointRemake() {
		return pointRemake;
	}
	public void setPointRemake(String pointRemake) {
		this.pointRemake = pointRemake;
	}
	
}
