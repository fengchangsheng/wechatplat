package com.fcs.admin.service;

import com.fcs.admin.model.MenuTree;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
public interface PermissionService {

    List<MenuTree> selectMenuTreeByUserId(String userId);

    List<MenuTree> getMenuList();

    List<MenuTree> getPermissionList();
}
