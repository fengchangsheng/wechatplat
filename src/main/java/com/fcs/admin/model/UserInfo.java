package com.fcs.admin.model;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
public class UserInfo {

    private Integer id;

    private String username;

    private String password;

    private List<RoleInfo> roleList;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<RoleInfo> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<RoleInfo> roleList) {
        this.roleList = roleList;
    }
}
