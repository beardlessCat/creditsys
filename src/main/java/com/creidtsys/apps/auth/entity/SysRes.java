package com.creidtsys.apps.auth.entity;

import java.io.Serializable;

import com.creidtsys.utils.Pager;

/**
 * 
* @ClassName: SysRes
* @Description: TODO url权限实体表
* @author liuyj
* @date 2017年8月26日 上午9:06:26
*
*/
public class SysRes  extends Pager implements Serializable{
	private static final long serialVersionUID = -6579533328390250520L;
	private String  resId ;  		//权限标识
	private String resName ;  		//权限名称
	private String resParentId ;	//权限上级标识
	private String resUrl ;		    //权限url
	private String resCode ;		//权限代码
	private String resType ;		//资源类型  url或者按钮
	private String resOrder ;		//序号
	private String resDesc ;		//描述
	private String id ;
	

	public String getId() {
		return this.resId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public SysRes() {
		super();
	}
	
	public String getResType() {
		return resType;
	}

	public void setResType(String resType) {
		this.resType = resType;
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResUrl() {
		return resUrl;
	}

	public void setResUrl(String resUrl) {
		this.resUrl = resUrl;
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	

	public String getResParentId() {
		return resParentId;
	}

	public void setResParentId(String resParentId) {
		this.resParentId = resParentId;
	}

	public String getResOrder() {
		return resOrder;
	}

	public void setResOrder(String resOrder) {
		this.resOrder = resOrder;
	}

	public String getResDesc() {
		return resDesc;
	}

	public void setResDesc(String resDesc) {
		this.resDesc = resDesc;
	}
}
