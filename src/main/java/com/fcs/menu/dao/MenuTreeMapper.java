package com.fcs.menu.dao;

import com.fcs.menu.model.MenuTree;

import java.util.List;

/**
 * Created by Lucare on 2016/1/29.
 */
public interface MenuTreeMapper {

    List<MenuTree> buildMenuTree(String pid);

    String saveMenu(MenuTree menuTree);

    void delMenu(MenuTree menuTree);

    MenuTree searchOne(String menuId);

    void editMenu(MenuTree menuTree);
}
