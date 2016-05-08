package com.fcs.admin.controller;

import com.fcs.admin.model.RoleInfo;
import com.fcs.admin.model.UserInfo;
import com.fcs.admin.model.UserRole;
import com.fcs.admin.service.RoleService;
import com.fcs.admin.service.UserService;
import com.fcs.common.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping("/list")
    public String showAdmins(ModelMap modelMap){
        List<UserInfo> users = userService.getUsers();
        modelMap.addAttribute("users", users);
        return "/admin/admin_list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(ModelMap modelMap){
        List<RoleInfo> roleList = roleService.getRoleList();
        modelMap.addAttribute("roleList", roleList);
        return "/admin/admin_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(ModelMap modelMap,String id){
        UserInfo user = userService.getUserById(id);
        modelMap.addAttribute("user",user);
        return "/admin/admin_edit";
    }

    @RequestMapping("/add")
    @ResponseBody
    public int add(UserInfo userInfo,String adminRole){
        Date date = new Date();
        String uid = Strings.getID();
        userInfo.setId(uid);
        userInfo.setCreateTime(date);
        userInfo.setUpdateTime(date);
        int res = userService.insert(userInfo);
        if (res != 0 && !Strings.isEmpty(adminRole)){
            UserRole userRole = new UserRole();
            userRole.setId(Strings.getID());
            userRole.setUserid(uid);
            userRole.setRoleid(adminRole);
            userService.addAdminRole(userRole);
        }
        return res;
    }

    @RequestMapping("/edit")
    @ResponseBody
    public int edit(UserInfo userInfo){
        Date date = new Date();
        userInfo.setUpdateTime(date);
        int res = userService.update(userInfo);
        return res;
    }

    @RequestMapping("/disable")
    @ResponseBody
    public int disable(String id,int isOrNo){
        Date date = new Date();
        UserInfo userInfo = userService.getUserById(id);
        userInfo.setUpdateTime(date);
        if (isOrNo == 1){
            userInfo.setStatus(0);//禁用
        }else if (isOrNo == 2){
            userInfo.setStatus(1);//启用
        }
        int res = userService.update(userInfo);
        return res;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(String id){
        int res = userService.delete(id);
        return res;
    }

}
