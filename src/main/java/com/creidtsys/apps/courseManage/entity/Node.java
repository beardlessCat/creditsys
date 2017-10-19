package com.creidtsys.apps.courseManage.entity;

public class Node {
	private int id ;
	private String nodename ;
	private int pid ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getNodename() {
		return nodename;
	}
	public void setNodename(String nodename) {
		this.nodename = nodename;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
}
