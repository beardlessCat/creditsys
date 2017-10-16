package com.creidtsys.apps.manage.entity;

public class TestTreeGrid {
	private String id ;
	private String name ;
	private String pid ;
	private int _parentId ;
	private int xid ;
	
	/*public String get_parentId() {
		return pid;
	}
	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}*/
	public int get_parentId() {
		return Integer.parseInt(pid);
	}
	public void set_parentId(int _parentId) {
		this._parentId = _parentId;
	}
	public int getXid() {
		return Integer.parseInt(id);
	}
	public void setXid(int xid) {
		this.xid = xid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	
}
