package com.creidtsys.apps.courseManage.entity;
/**
 * 
 * 类名称: CourseDepend.
 * 类描述:课程之间多对多关系以及前驱后继关系的维护
 * 创建者: LYJ 
 * 创建时间: 2017年5月1日 下午3:13:46
 */
public class CourseDepend {
	private String dependId ;
	private String coursePid ;
	private String courseSid ;
	private String majorId ;
	private String courseName;
	private String isNes;
	private String coursePname ;
	private String id ;
	
	public String getId() {
		return dependId;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCoursePname() {
		return coursePname;
	}
	public void setCoursePname(String coursePname) {
		this.coursePname = coursePname;
	}
	public String getIsNes() {
		return isNes;
	}
	public void setIsNes(String isNes) {
		this.isNes = isNes;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getDependId() {
		return dependId;
	}
	public void setDependId(String dependId) {
		this.dependId = dependId;
	}
	public String getCoursePid() {
		return coursePid;
	}
	public void setCoursePid(String coursePid) {
		this.coursePid = coursePid;
	}
	public String getCourseSid() {
		return courseSid;
	}
	public void setCourseSid(String courseSid) {
		this.courseSid = courseSid;
	}
	public String getMajorId() {
		return majorId;
	}
	public void setMajorId(String majorId) {
		this.majorId = majorId;
	}
	
}
