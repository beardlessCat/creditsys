package com.creidtsys.apps.courseManage.entity;

import com.creidtsys.utils.Pager;

public class MajorDirect extends Pager {
	private String majorDirectId;
	private String majorDirectName;
	private String majorDirectDesc;
	private String dMajorId ;
	
	public String getMajorDirectId() {
		return majorDirectId;
	}

	public String getMajorDirectName() {
		return majorDirectName;
	}

	public void setMajorDirectName(String majorDirectName) {
		this.majorDirectName = majorDirectName;
	}

	public String getMajorDirectDesc() {
		return majorDirectDesc;
	}

	public void setMajorDirectDesc(String majorDirectDesc) {
		this.majorDirectDesc = majorDirectDesc;
	}

	public void setMajorDirectId(String majorDirectId) {
		this.majorDirectId = majorDirectId;
	}

	public String getdMajorId() {
		return dMajorId;
	}
	public void setdMajorId(String dMajorId) {
		this.dMajorId = dMajorId;
	}

	
	
}
