package com.creidtsys.apps.auth.entity;

import java.util.HashMap;
import java.util.Map;

public class UserRole {
    private Integer id;

    private Integer userId;

    private Integer roleId;

    public Integer getId() {
        return id;
    }
    Map map = new  HashMap<>() ;
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}