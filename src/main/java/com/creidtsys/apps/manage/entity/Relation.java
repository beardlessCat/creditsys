package com.creidtsys.apps.manage.entity;

public class Relation {
	private String relationId;
	private String relationPid ;
	private String relationRes ;
	private String relationType ;
	private String relationRemake ;
	private String relationRemain ;
	private String otherId ;
	public String getOtherId() {
		return otherId;
	}
	public void setOtherId(String otherId) {
		this.otherId = otherId;
	}
	public String getRelationId() {
		return relationId;
	}
	public void setRelationId(String relationId) {
		this.relationId = relationId;
	}
	public String getRelationRemain() {
		return relationRemain;
	}
	public void setRelationRemain(String relationRemain) {
		this.relationRemain = relationRemain;
	}
	public String getRelationPid() {
		return relationPid;
	}
	public void setRelationPid(String relationPid) {
		this.relationPid = relationPid;
	}
	public String getRelationRes() {
		return relationRes;
	}
	public void setRelationRes(String relationRes) {
		this.relationRes = relationRes;
	}
	public String getRelationType() {
		return relationType;
	}
	public void setRelationType(String relationType) {
		this.relationType = relationType;
	}
	public String getRelationRemake() {
		return relationRemake;
	}
	public void setRelationRemake(String relationRemake) {
		this.relationRemake = relationRemake;
	}
}
