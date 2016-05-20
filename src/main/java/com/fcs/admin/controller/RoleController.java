package com.fcs.admin.controller;

import com.fcs.admin.model.MenuTree;
import com.fcs.admin.model.RoleInfo;
import com.fcs.admin.model.UserInfo;
import com.fcs.admin.service.PermissionService;
import com.fcs.admin.service.RoleService;
import com.fcs.common.Strings;
import com.fcs.platform.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController{

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @RequestMapping("/index")
    public String index(ModelMap model){
        try {
            List<RoleInfo> list = roleService.getRoleList();
            model.addAttribute("list", list);
            return "/admin/admin_role";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":index()", e);
            return "";
        }
    }

    @RequestMapping("/toAdd")
    public String toAdd(ModelMap model){
        try {
            List<MenuTree> list = permissionService.getMenuList();
            model.addAttribute("list", list);
            return "/admin/admin_role_add";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":toAdd()", e);
            return "";
        }
    }

    @ResponseBody
    @RequestMapping("/add")
    public int add(String[] ids,RoleInfo roleInfo){
        try {
            String roleId = Strings.getID();
            Date date = new Date();
            roleInfo.setId(roleId);
            roleInfo.setCreateTime(date);
            roleInfo.setUpdateTime(date);
            int status = roleService.addRole(roleInfo);
            if (status != 0) {
                for (String id : ids) {
                    roleService.addRoleAndPer(Strings.getID(),roleId,id);
                }
                return 1;
            }
            return 0;
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":add()", e);
            return 0;
        }
    }

    @RequestMapping("/toEdit")
    public String toEdit(ModelMap model,String id, HttpSession session){
        try {
            List<MenuTree> list = permissionService.getMenuList();
            UserInfo userInfo = (UserInfo) session.getAttribute("user");
            RoleInfo roleInfo = roleService.getRoleById(id);
            List<MenuTree> hasList = permissionService.selectMenuTreeByUserId(userInfo.getId());
            model.addAttribute("list", list);
            model.addAttribute("roleInfo", roleInfo);
            model.addAttribute("hasList", hasList);
            return "/admin/admin_role_edit";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":toEdit()", e);
            return "";
        }
    }



}
