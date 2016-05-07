package com.fcs.admin.model;

import com.fcs.platform.model.BaseModel;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
public class UserInfo extends BaseModel{

    private String username;

    private String password;

    private String email;

    private int status;

    private int sex;

    private String phone;

    private List<RoleInfo> roleList;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setRoleList(List<RoleInfo> roleList) {
        this.roleList = roleList;
    }

}
