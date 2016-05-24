package com.fcs.admin.service;

import com.fcs.admin.model.User;
import com.fcs.admin.model.UserRole;
import com.fcs.platform.service.SuperService;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
public interface UserService extends SuperService<User>{

    User login(User user);

    int addAdminRole(UserRole userRole);

    int updateUserRole(String id, String adminRole);
}
