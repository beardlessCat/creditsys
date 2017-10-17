package com.creidtsys.apps.manage.entity;

import com.creidtsys.apps.courseManage.entity.Course;

//public class Paper extends User{
public class Paper extends Course{
	private String paperName;
	private String paperId ;
	private String coursePaperId;
	private String majorPaperId  ;
	private String termMark ;
	private String totalResult ;
	private String resultMax ;
	private String resultDesc ;
	private String resultMin ;
	private String userTotal ;
	private String hardDegree ;
	private String paperCode ;
	
	public String getPaperCode() {
		return paperCode;
	}
	public void setPaperCode(String paperCode) {
		this.paperCode = paperCode;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public String getCoursePaperId() {
		return coursePaperId;
	}
	public void setCoursePaperId(String coursePaperId) {
		this.coursePaperId = coursePaperId;
	}
	public String getMajorPaperId() {
		return majorPaperId;
	}
	public void setMajorPaperId(String majorPaperId) {
		this.majorPaperId = majorPaperId;
	}
	public String getTermMark() {
		return termMark;
	}
	public void setTermMark(String termMark) {
		this.termMark = termMark;
	}
	public String getTotalResult() {
		return totalResult;
	}
	public void setTotalResult(String totalResult) {
		this.totalResult = totalResult;
	}
	public String getResultMax() {
		return resultMax;
	}
	public void setResultMax(String resultMax) {
		this.resultMax = resultMax;
	}
	public String getResultDesc() {
		return resultDesc;
	}
	public void setResultDesc(String resultDesc) {
		this.resultDesc = resultDesc;
	}
	public String getResultMin() {
		return resultMin;
	}
	public void setResultMin(String resultMin) {
		this.resultMin = resultMin;
	}
	public String getUserTotal() {
		return userTotal;
	}
	public void setUserTotal(String userTotal) {
		this.userTotal = userTotal;
	}
	public String getHardDegree() {
		return hardDegree;
	}
	public void setHardDegree(String hardDegree) {
		this.hardDegree = hardDegree;
	}
}
