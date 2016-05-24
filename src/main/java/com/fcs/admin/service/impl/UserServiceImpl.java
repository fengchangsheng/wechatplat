package com.fcs.admin.service.impl;

import com.fcs.admin.mapper.UserMapper;
import com.fcs.admin.model.User;
import com.fcs.admin.model.UserRole;
import com.fcs.admin.service.UserService;
import com.fcs.platform.service.SuperService;
import com.fcs.platform.service.impl.SuperServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
@Service("userService")
public class UserServiceImpl extends SuperServiceImpl<UserMapper,User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    public User login(User user) {
        return userMapper.login(user);
    }

    public int addAdminRole(UserRole userRole) {
        return userMapper.addAdminRole(userRole);
    }

    public int updateUserRole(String id, String adminRole) {
        return userMapper.updateUserRole(id, adminRole);
    }
}
