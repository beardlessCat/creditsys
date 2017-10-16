package com.creidtsys.apps.manage.entity;

import java.io.Serializable;
public class CompanyType implements Serializable{
	private String typeId ;
	private String typeName ;
	private String typeRemake ;
	
	public String getTypeRemake() {
		return typeRemake;
	}
	public void setTypeRemake(String typeRemake) {
		this.typeRemake = typeRemake;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
}
