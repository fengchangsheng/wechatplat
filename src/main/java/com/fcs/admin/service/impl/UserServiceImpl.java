package com.fcs.admin.service.impl;

import com.fcs.admin.mapper.UserInfoMapper;
import com.fcs.admin.model.UserInfo;
import com.fcs.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    public UserInfo getUserById(String id) {
        return userInfoMapper.selectByPrimaryKey(id);
    }

    public List<UserInfo> getUsers() {
        return userInfoMapper.selectAll();
    }

    public int insert(UserInfo userInfo) {
        return userInfoMapper.insert(userInfo);
    }

    public int update(UserInfo userInfo) {
        return userInfoMapper.updateByPrimaryKey(userInfo);
    }

    public int delete(String id) {
        return userInfoMapper.deleteByPrimaryKey(id);
    }

    public UserInfo login(UserInfo userInfo) {
        return userInfoMapper.login(userInfo);
    }
}
