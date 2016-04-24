package com.fcs.user.controller;

import com.fcs.platform.controller.BaseController;
import com.fcs.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Lucare.Feng on 2016/4/24.
 * 微信用户管理
 */
@Controller
@RequestMapping("/weuser")
public class UserController extends BaseController{

    @Autowired
    private UserService weUserService;

    @ResponseBody
    @RequestMapping("/index")
    public String getUserList(){
        return weUserService.getUserList();
    }

}
