package com.creidtsys.apps.courseManage.entity;

import com.creidtsys.utils.Pager;

//public class Major extends UserDep{

public class Major extends  Pager {
	
	private String majorId;
	private String majorCode;
	private String majorName;
	private String majorEnglishName;
	private String majorLength;//鐎涳箑鍩�
	private String majorDegree;//鐎涳缚缍�
	private String majorAcademy;//閹碉拷鐏炵偛顒熼梽锟�
	private String majorPurpose;
	private String majorCondition;
	private String majorOverview;
	public String getMajorId() {
		return majorId;
	}
	public void setMajorId(String majorId) {
		this.majorId = majorId;
	}
	public String getMajorCode() {
		return majorCode;
	}
	public void setMajorCode(String majorCode) {
		this.majorCode = majorCode;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getMajorEnglishName() {
		return majorEnglishName;
	}
	public void setMajorEnglishName(String majorEnglishName) {
		this.majorEnglishName = majorEnglishName;
	}
	public String getMajorLength() {
		return majorLength;
	}
	public void setMajorLength(String majorLength) {
		this.majorLength = majorLength;
	}
	public String getMajorDegree() {
		return majorDegree;
	}
	public void setMajorDegree(String majorDegree) {
		this.majorDegree = majorDegree;
	}
	public String getMajorAcademy() {
		return majorAcademy;
	}
	public void setMajorAcademy(String majorAcademy) {
		this.majorAcademy = majorAcademy;
	}
	public String getMajorPurpose() {
		return majorPurpose;
	}
	public void setMajorPurpose(String majorPurpose) {
		this.majorPurpose = majorPurpose;
	}
	public String getMajorCondition() {
		return majorCondition;
	}
	public void setMajorCondition(String majorCondition) {
		this.majorCondition = majorCondition;
	}
	public String getMajorOverview() {
		return majorOverview;
	}
	public void setMajorOverview(String majorOverview) {
		this.majorOverview = majorOverview;
	}
}
