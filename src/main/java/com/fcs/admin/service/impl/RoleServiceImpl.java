package com.fcs.admin.service.impl;

import com.fcs.admin.mapper.RoleInfoMapper;
import com.fcs.admin.model.RoleInfo;
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
    private RoleInfoMapper roleInfoMapper;

    public List<RoleInfo> getRoleList() {
        List<RoleInfo> list = roleInfoMapper.getRoleList();
        return list;
    }
}
