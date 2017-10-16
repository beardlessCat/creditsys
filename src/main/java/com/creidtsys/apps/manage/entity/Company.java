package com.creidtsys.apps.manage.entity;

public class Company extends CompanyType{
	private String companyId ;
	private String companyName ;
	private String companyInfo ;
	private String companyAddress ;
	private String companyTel ;
	private String companyUrl ;
	private String companyAptitude ;
	private String companySize ;
	private String companyBusiness ;
	private String companyTypeId ;

	public String getCompanyAptitude() {
		return companyAptitude;
	}
	public void setCompanyAptitude(String companyAptitude) {
		this.companyAptitude = companyAptitude;
	}
	public String getCompanySize() {
		return companySize;
	}
	public void setCompanySize(String companySize) {
		this.companySize = companySize;
	}

	public String getCompanyTypeId() {
		return companyTypeId;
	}
	public String getCompanyBusiness() {
		return companyBusiness;
	}
	public void setCompanyBusiness(String companyBusiness) {
		this.companyBusiness = companyBusiness;
	}
	public void setCompanyTypeId(String companyTypeId) {
		this.companyTypeId = companyTypeId;
	}
	public String getCompanyTel() {
		return companyTel;
	}
	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}
	public String getCompanyUrl() {
		return companyUrl;
	}
	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyInfo() {
		return companyInfo;
	}
	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	
}
