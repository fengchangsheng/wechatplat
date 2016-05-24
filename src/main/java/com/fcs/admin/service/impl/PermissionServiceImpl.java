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
        List<MenuTree> cmvList = null;
        for (MenuTree mv : perList) {
            List<MenuTree> cmenus = permissionMapper.getMenuList(mv.getId(),1);
            cmvList = new ArrayList<MenuTree>();
            for (MenuTree menuTree : cmenus) {
                List<MenuTree> smenus = permissionMapper.getMenuList(menuTree.getId(),2);
                menuTree.setChildren(smenus);
                cmvList.add(menuTree);
            }
            mv.setChildren(cmvList);
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
        return permissionMapper.insert(menuTree);
    }

    public int deleteById(String id) {
        return permissionMapper.deleteById(id);
    }

    public int editPermission(MenuTree menuTree) {
        return permissionMapper.update(menuTree);
    }

    public MenuTree getPermissionById(String id) {
        return permissionMapper.selectById(id);
    }
}
