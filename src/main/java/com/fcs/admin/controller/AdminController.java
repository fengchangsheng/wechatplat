package com.fcs.admin.controller;

import com.fcs.admin.model.UserInfo;
import com.fcs.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @RequestMapping("/list")
    public String showAdmins(ModelMap modelMap){
        List<UserInfo> users = userService.getUsers();
        modelMap.addAttribute("users", users);
        return "/admin/admin_list";
    }

    @RequestMapping("/showInfo/{userId}")
    public String showUserInfo(ModelMap modelMap, @PathVariable int userId){
        UserInfo userInfo = userService.getUserById(userId);
        modelMap.addAttribute("userInfo", userInfo);
        return "/user/showInfo";
    }

    @RequestMapping("/showInfos")
    public @ResponseBody
    Object showUserInfos(){
        List<UserInfo> userInfos = userService.getUsers();
        return userInfos;
    }
}
