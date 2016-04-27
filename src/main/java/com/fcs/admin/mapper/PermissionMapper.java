package com.fcs.admin.mapper;

import com.fcs.admin.model.MenuTree;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Lucare on 2016/1/29.
 */
public interface PermissionMapper {

    List<MenuTree> selectMenuByUserId(@Param("userId") String userId, @Param("pid") String pid);

    List<MenuTree> getMenuList(String pid);

    List<MenuTree> getPermissionList();

//    List<MenuTree> buildMenuTree(String pid);
//
//    void saveMenu(MenuTree menuTree);
//
//    void delMenu(String menuTreeId);
//
//    MenuTree searchOne(String menuId);
//
//    void editMenu(MenuTree menuTree);


}
