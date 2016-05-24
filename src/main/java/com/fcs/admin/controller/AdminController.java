package com.fcs.admin.controller;

import com.fcs.admin.model.Role;
import com.fcs.admin.model.User;
import com.fcs.admin.model.UserRole;
import com.fcs.admin.service.RoleService;
import com.fcs.admin.service.UserService;
import com.fcs.common.Strings;
import com.fcs.platform.annotation.Operate;
import com.fcs.platform.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController{

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping("/list")
    public String showAdmins(ModelMap modelMap){
        List<User> users = userService.selectList();
        modelMap.addAttribute("users", users);
        return "/admin/admin_list";
    }


    @RequestMapping("/toAdd")
    public String toAdd(ModelMap modelMap){
        List<Role> roleList = roleService.getRoleList();
        modelMap.addAttribute("roleList", roleList);
        return "/admin/admin_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(ModelMap modelMap,String id){
        try {
            User user = userService.selectById(id);
            Role role = roleService.getRoleByUser(user.getId());
            List<Role> roleList = roleService.getRoleList();
            modelMap.addAttribute("user",user);
            modelMap.addAttribute("roleInfo", role);
            modelMap.addAttribute("roleList", roleList);
            return "/admin/admin_edit";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":toEdit()", e);
            return "";
        }
    }

    @Operate(name = "添加管理员")
    @RequestMapping("/add")
    @ResponseBody
    public int add(User user, String adminRole){
        Date date = new Date();
        String uid = Strings.getID();
        user.setId(uid);
        user.setCreateTime(date);
        user.setUpdateTime(date);
        int res = userService.insert(user);
        if (res != 0 && !Strings.isEmpty(adminRole)){
            UserRole userRole = new UserRole();
            userRole.setId(Strings.getID());
            userRole.setUserid(uid);
            userRole.setRoleid(adminRole);
            userService.addAdminRole(userRole);
        }
        return res;
    }

    @Operate(name = "编辑管理员")
    @RequestMapping("/edit")
    @ResponseBody
    public int edit(User user, String adminRole){
        Date date = new Date();
        user.setUpdateTime(date);
        int res = userService.update(user);
        if (res != 0) {
            userService.updateUserRole(user.getId(),adminRole);
        }
        return res;
    }

    @Operate(name = "禁用或启用账号")
    @RequestMapping("/disable")
    @ResponseBody
    public int disable(String id,int isOrNo){
        Date date = new Date();
        User user = userService.selectById(id);
        user.setUpdateTime(date);
        if (isOrNo == 1){
            user.setStatus(0);//禁用
        }else if (isOrNo == 2){
            user.setStatus(1);//启用
        }
        int res = userService.update(user);
        return res;
    }

    @Operate(name = "删除管理员")
    @RequestMapping("/delete")
    @ResponseBody
    public int delete(String id){
        int res = userService.deleteById(id);
        return res;
    }

}
