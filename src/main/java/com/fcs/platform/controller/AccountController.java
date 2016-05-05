package com.fcs.platform.controller;

import com.fcs.admin.model.UserInfo;
import com.fcs.admin.service.UserService;
import com.fcs.common.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

/**
 * Created by Lucare.Feng on 2016/4/23.
 * 账户相关--登录注册
 */
@Controller
@RequestMapping("/account")
public class AccountController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping("/index")//后台管理首页
    public String index(Model model) {
        return "/login";
    }

    @RequestMapping("/login")//后台管理首页
    public String login(UserInfo userInfo, Model model, HttpSession session) {
        if (Strings.isEmpty(userInfo.getUsername())) {
            model.addAttribute("error", "用户名不能为空!");
            return "/login";
        }else{
            UserInfo userInfo1 =userService.login(userInfo);
            if (userInfo1 != null) {
                session.setAttribute("user", userInfo1);
                model.addAttribute("user", userInfo1);
            }else{
                model.addAttribute("error", "用户名或密码错误!");
                return "/login";
            }

        }
        return "redirect:/index";
    }

}
