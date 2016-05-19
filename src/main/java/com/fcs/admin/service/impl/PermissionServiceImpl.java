package com.fcs.admin.service.impl;

import com.fcs.admin.mapper.PermissionMapper;
import com.fcs.admin.model.MenuTree;
import com.fcs.admin.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    public List<MenuTree> selectMenuTreeByUserId(String userId) {
        List<MenuTree> perList = permissionMapper.selectMenuByUserId(userId, "0");
        if (perList == null || perList.isEmpty()) {
            return null;
        }
        List<MenuTree> mvList = new ArrayList<MenuTree>();
        for (MenuTree mv : perList) {
            mv.setChildren(permissionMapper.selectMenuByUserId(userId, mv.getId()));
            mvList.add(mv);
        }
        return mvList;
    }

    public List<String> selectPerUrlByUserId(String userId) {
        return permissionMapper.selectPerUrlByUserId(userId);
    }

    public List<MenuTree> getMenuList() {
        List<MenuTree> perList = permissionMapper.getMenuList("0",1);
        if (perList == null || perList.isEmpty()) {
            return null;
        }
        List<MenuTree> mvList = new ArrayList<MenuTree>();
        for (MenuTree mv : perList) {
            mv.setChildren(permissionMapper.getMenuList(mv.getId(),1));
            mv.setOthers(permissionMapper.getMenuList(mv.getId(),2));
            mvList.add(mv);
        }
        return mvList;
    }

    public List<MenuTree> getPermissionList() {
        List<MenuTree> perList = permissionMapper.getPermissionList();
        return perList;
    }

    public List<MenuTree> getPermissionsByPid(String parentId) {
        return permissionMapper.getMenuList(parentId,1);
    }

    public int addPermission(MenuTree menuTree) {
        return permissionMapper.addPermission(menuTree);
    }

    public int deleteById(String id) {
        return permissionMapper.deleteById(id);
    }

    public int editPermission(MenuTree menuTree) {
        return permissionMapper.editPermission(menuTree);
    }

    public MenuTree getPermissionById(String id) {
        return permissionMapper.getPermissionById(id);
    }
}
