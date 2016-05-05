package com.fcs.admin.service;

import com.fcs.admin.model.UserInfo;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
public interface UserService {

    UserInfo getUserById(int id);

    List<UserInfo> getUsers();

    int insert(UserInfo userInfo);

    UserInfo login(UserInfo userInfo);

}
