package com.creidtsys.apps.auth.entity;

import java.io.Serializable;

import com.creidtsys.utils.Pager;
/**
 * 
* @ClassName: SysUser
* @Description: TODO 权限用户实体 
* @author liuyj
* @date 2017年8月26日 上午8:44:23
*
 */
@SuppressWarnings("serial")
public class SysUser  extends Pager  implements Serializable{
	private String userId ;        //用户标识
	private String userDeptId ;    //用户部门标识
	private String userNo ;        //用户编号（学号。工号） 
 	private String userPwd ;       //用户密码
	private String userName ;      //用户名
	private String userSex ;       //用户性别
	private String cardId ;        //身份证号
	private String userAddr ;      //用户地址
	private String userContact ;   //用户联系方式
	private String enterDate ;     //入校日期日期
	private String leaveDate ;     //离校日期
	private String userProfess ;   //职称
	private String userStatus ;    //用户状态 
	private String userEmail ;     //用户邮箱
	private String lastLogin ;     //上次登录时间
	private String schoolYear ;    //学年制
	private String remark ;        //备注
	private String urUserId ;      //欢喜用户id
	
	public SysUser() {
		super();
	}
	
	public String getUrUserId() {
		return urUserId;
	}

	public void setUrUserId(String urUserId) {
		this.urUserId = urUserId;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserDeptId() {
		return userDeptId;
	}
	public void setUserDeptId(String userDeptId) {
		this.userDeptId = userDeptId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserContact() {
		return userContact;
	}
	public void setUserContact(String userContact) {
		this.userContact = userContact;
	}
	public String getEnterDate() {
		return enterDate;
	}
	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}
	public String getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}
	public String getUserProfess() {
		return userProfess;
	}
	public void setUserProfess(String userProfess) {
		this.userProfess = userProfess;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getSchoolYear() {
		return schoolYear;
	}
	public void setSchoolYear(String schoolYear) {
		this.schoolYear = schoolYear;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	
}
