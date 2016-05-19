package com.fcs.admin.mapper;

import com.fcs.admin.model.MenuTree;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Lucare on 2016/1/29.
 */
public interface PermissionMapper {

    List<MenuTree> selectMenuByUserId(@Param("userId") String userId, @Param("pid") String pid);

    List<String> selectPerUrlByUserId(String userId);

    List<MenuTree> getMenuList(@Param("pid") String pid, @Param("type") int type);

    List<MenuTree> getPermissionList();

    int addPermission(MenuTree menuTree);

    int deleteById(String id);

    int editPermission(MenuTree menuTree);

    MenuTree getPermissionById(String id);

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
