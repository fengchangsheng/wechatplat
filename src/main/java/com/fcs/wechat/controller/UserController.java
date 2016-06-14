package com.fcs.wechat.controller;

import com.fcs.wechat.common.WeChatBaseController;
import com.fcs.wechat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Lucare.Feng on 2016/4/24.
 * 微信用户管理
 */
@Controller
@RequestMapping("/weuser")
public class UserController extends WeChatBaseController {

    @Autowired
    private UserService weUserService;

    @RequestMapping("/index")
    public String index(ModelMap modelMap){
        String res = weUserService.getUserList(getAccess_token());
        modelMap.addAttribute("data", res);
        return "/user/user_list";
    }

    @ResponseBody
    @RequestMapping("/getUsers")
    public String getUserList(){
        return weUserService.getUserList(getAccess_token());
    }

    @RequestMapping("/edit")
    public String edit(){
        return "/user/user_list";
    }

}
