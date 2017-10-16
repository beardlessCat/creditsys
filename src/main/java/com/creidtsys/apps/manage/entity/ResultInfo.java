package com.creidtsys.apps.manage.entity;

public class ResultInfo extends Paper{
	private String resultId ;
	private String riPaperId ;
	private String riUserId ;
	private String riResult ;
	private String riRate ;
	private String resultTotal;
	
	public String getResultTotal() {
		return resultTotal;
	}
	public void setResultTotal(String resultTotal) {
		this.resultTotal = resultTotal;
	}
	public String getResultId() {
		return resultId;
	}
	public void setResultId(String resultId) {
		this.resultId = resultId;
	}
	public String getRiPaperId() {
		return riPaperId;
	}
	public void setRiPaperId(String riPaperId) {
		this.riPaperId = riPaperId;
	}
	public String getRiUserId() {
		return riUserId;
	}
	public void setRiUserId(String riUserId) {
		this.riUserId = riUserId;
	}
	public String getRiResult() {
		return riResult;
	}
	public void setRiResult(String riResult) {
		this.riResult = riResult;
	}
	public String getRiRate() {
		return riRate;
	}
	public void setRiRate(String riRate) {
		this.riRate = riRate;
	}
}
