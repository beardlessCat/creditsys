package com.creidtsys.apps.auth.entity;

import java.io.Serializable;
/**
 * 
 * 类名称: Resource.
 * 类描述:请在这里填写该类具有xxxx作用
 * 创建者: LYJ 
 * 创建时间: 2016年10月11日 下午4:11:05
 */
public class Resources implements Serializable {
	private String  resId ;
	private String  pid;
	private String  resCode;
	private String  resName;
	private String  resPath;
	private String 	resIcon;
	private String  resType;
	private String  resIndex;
	private String  appCode;
	private String  resFloorCode ;
	private String  resFloorNum;
	private String  resDesc;

	public String getResId() {
		return resId;
	}
	public void setResId(String resId) {
		this.resId = resId;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getResCode() {
		return resCode;
	}
	public void setResCode(String resCode) {
		this.resCode = resCode;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResPath() {
		return resPath;
	}
	public void setResPath(String resPath) {
		this.resPath = resPath;
	}
	public String getResIcon() {
		return resIcon;
	}
	public void setResIcon(String resIcon) {
		this.resIcon = resIcon;
	}
	public String getResType() {
		return resType;
	}
	public void setResType(String resType) {
		this.resType = resType;
	}
	public String getResIndex() {
		return resIndex;
	}
	public void setResIndex(String resIndex) {
		this.resIndex = resIndex;
	}
	public String getAppCode() {
		return appCode;
	}
	public void setAppCode(String appCode) {
		this.appCode = appCode;
	}
	public String getResFloorCode() {
		return resFloorCode;
	}
	public void setResFloorCode(String resFloorCode) {
		this.resFloorCode = resFloorCode;
	}
	public String getResFloorNum() {
		return resFloorNum;
	}
	public void setResFloorNum(String resFloorNum) {
		this.resFloorNum = resFloorNum;
	}
	public String getResDesc() {
		return resDesc;
	}
	public void setResDesc(String resDesc) {
		this.resDesc = resDesc;
	}

}
