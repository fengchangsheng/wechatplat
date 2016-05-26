package com.fcs.admin.service.impl;

import com.fcs.admin.mapper.RoleMapper;
import com.fcs.admin.model.Role;
import com.fcs.admin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/24.
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    public List<Role> getRoleList() {
        List<Role> list = roleMapper.selectList();
        return list;
    }

    public int addRole(Role role) {
        return roleMapper.insert(role);
    }

    public int addRoleAndPer(String id, String roleId, String perId) {
        return roleMapper.addRoleAndPer(id,roleId,perId);
    }

    public Role getRoleByUser(String userId) {
        return roleMapper.getRoleByUser(userId);
    }

    public Role getRoleById(String id) {
        return roleMapper.selectById(id);
    }

    public int delRoleAndPer(String roleId) {
        return roleMapper.delRoleAndPer(roleId);
    }

    public int update(Role role) {
        return roleMapper.update(role);
    }

    public int delete(String id) {
        return roleMapper.deleteById(id);
    }
}
