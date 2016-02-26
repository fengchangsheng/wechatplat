package com.fcs.menu.service;

import com.fcs.menu.model.MenuTree;

import java.util.List;

/**
 * Created by Lucare on 2016/1/29.
 */
public interface MenuTreeService {

    /**
     * 构建菜单树
     * @return List<MenuTree>
     * @author Lucare.Feng
     */
    List<MenuTree> tree();

    /**
     * 保存菜单
     * @param menuTree
     * @return id
     * @author Lucare.Feng
     */
    String saveMenu(MenuTree menuTree);

    /**
     * 删除菜单
     * @param menuTreeId
     * @author Lucare.Feng
     */
    void delMenu(String menuTreeId);

    /**
     * 根据id查找菜单对象
     * @param menuId
     * @return MenuTree
     * @author Lucare.Feng
     */
    MenuTree searchOne(String menuId);

    /**
     * 编辑菜单
     * @param menuTree
     * @author Lucare.Feng
     */
    void editMenu(MenuTree menuTree);
}
