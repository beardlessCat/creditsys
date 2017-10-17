package com.creidtsys.apps.manage.entity;

import com.creidtsys.utils.Pager;

public class Position extends Pager {
	private String positionId ;
	private String positionName ;
	private String positionSalary ;
	private String positionDesc ;
	private String positionRemake ;
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getPositionSalary() {
		return positionSalary;
	}
	public void setPositionSalary(String positionSalary) {
		this.positionSalary = positionSalary;
	}
	public String getPositionDesc() {
		return positionDesc;
	}
	public void setPositionDesc(String positionDesc) {
		this.positionDesc = positionDesc;
	}
	public String getPositionRemake() {
		return positionRemake;
	}
	public void setPositionRemake(String positionRemake) {
		this.positionRemake = positionRemake;
	}
	
}
