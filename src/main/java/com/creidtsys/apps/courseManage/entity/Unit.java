package com.creidtsys.apps.courseManage.entity;

public class Unit extends Course{
	private String unitId ;
	private String unCourseId ;
	private String unitName ;
	private String unitContent ;
	private String unitRemake ;
	public String getUnitId() {
		return unitId;
	}
	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}
	public String getUnCourseId() {
		return unCourseId;
	}
	public void setUnCourseId(String unCourseId) {
		this.unCourseId = unCourseId;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getUnitContent() {
		return unitContent;
	}
	public void setUnitContent(String unitContent) {
		this.unitContent = unitContent;
	}
	public String getUnitRemake() {
		return unitRemake;
	}
	public void setUnitRemake(String unitRemake) {
		this.unitRemake = unitRemake;
	}
}
