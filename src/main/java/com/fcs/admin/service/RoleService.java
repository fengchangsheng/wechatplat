package com.fcs.admin.service;

import com.fcs.admin.model.Role;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/24.
 */
public interface RoleService {

    List<Role> getRoleList();

    int addRole(Role role);

    int addRoleAndPer(String id, String roleId, String perId);

    Role getRoleByUser(String userId);

    Role getRoleById(String id);

    int delRoleAndPer(String roleId);

    int update(Role role);

    int delete(String id);
}
