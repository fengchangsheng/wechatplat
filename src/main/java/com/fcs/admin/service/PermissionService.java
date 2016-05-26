package com.fcs.admin.service;

import com.alibaba.fastjson.JSONObject;
import com.fcs.admin.model.MenuTree;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
public interface PermissionService {

    List<MenuTree> selectMenuTreeByUserId(String userId);

    List<MenuTree> selectPerByUserId(String userId);

    List<String> selectPerUrlByUserId(String userId);

    List<MenuTree> getMenuList();

    JSONObject getPermissionJson(List<MenuTree> hasList);

    List<MenuTree> getPermissionsByPid(String parentId);

    int addPermission(MenuTree menuTree);

    int deleteById(String id);

    int editPermission(MenuTree menuTree);

    MenuTree getPermissionById(String id);

    List<MenuTree> getPermissionsByRole(String roleId);
}
