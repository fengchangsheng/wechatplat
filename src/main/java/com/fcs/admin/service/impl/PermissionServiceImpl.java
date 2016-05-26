package com.fcs.admin.service.impl;

import com.alibaba.fastjson.JSONObject;
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

    /**
     * 用户拥有的菜单树
     * @param userId
     * @return
     */
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

    public List<MenuTree> selectPerByUserId(String userId) {
        return permissionMapper.selectPerByUserId(userId);
    }

    /**
     * 用户拥有的权限
     * @param userId
     * @return
     */
    public List<String> selectPerUrlByUserId(String userId) {
        return permissionMapper.selectPerUrlByUserId(userId);
    }

    /**
     * 分层展现所有资源
     * @return
     */
    public List<MenuTree> getMenuList() {
        List<MenuTree> perList = permissionMapper.getMenuList("0",1);
        if (perList == null || perList.isEmpty()) {
            return null;
        }
        List<MenuTree> mvList = new ArrayList<MenuTree>();
        for (MenuTree mv : perList) {
            List<MenuTree> cmenus = permissionMapper.getMenuList(mv.getId(),1);
            for (MenuTree menuTree : cmenus) {
                List<MenuTree> smenus = permissionMapper.getMenuList(menuTree.getId(),2);
                menuTree.setChildren(smenus);
            }
            mv.setChildren(cmenus);
            mvList.add(mv);
        }
        return mvList;
    }

    public JSONObject getPermissionJson(List<MenuTree> hasList) {
        List<MenuTree> pList = permissionMapper.getPermissionList("0");
        JSONObject jsonObject = new JSONObject();
        List<MenuTree> flist = handle(pList, hasList);
        List<MenuTree> mvList = new ArrayList<MenuTree>();
        for (MenuTree menuTree : flist) {
            List<MenuTree> smenus = permissionMapper.getPermissionList(menuTree.getId());
            List<MenuTree> hsmenus = handle(smenus, hasList);
            for (MenuTree cmenu : smenus) {
                List<MenuTree> cmenus = permissionMapper.getPermissionList(cmenu.getId());
                List<MenuTree> hcmenus = handle(cmenus, hasList);
                cmenu.setChildren(hcmenus);
            }
            menuTree.setChildren(hsmenus);
            mvList.add(menuTree);
        }
        jsonObject.put("pmenu", mvList);
        return jsonObject;
    }

    private List<MenuTree> handle(List<MenuTree> alls, List<MenuTree> owns){
        for (MenuTree menuTree : alls) {
            for (MenuTree omenuTree : owns) {
                if (menuTree.getId().equals(omenuTree.getId())) {
                    menuTree.setChecked("checked");
                }
            }
        }
        return alls;
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

    public List<MenuTree> getPermissionsByRole(String roleId) {
        return permissionMapper.getPermissionsByRole(roleId);
    }
}
