package com.fcs.platform.controller;

import com.fcs.admin.model.MenuTree;
import com.fcs.admin.model.User;
import com.fcs.admin.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
@Controller
public class IndexController extends BaseController{

    @Autowired
    private PermissionService permissionService;

    @RequestMapping("/index")//后台管理首页
    public String index(Model model, HttpSession session){
        try {
            User user = (User) session.getAttribute("user");
            List<MenuTree> list = permissionService.selectMenuTreeByUserId(user.getId());//暂时不用登录获取权限
            model.addAttribute("user", user);
            model.addAttribute("list", list);
            return "/index";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":index()", e);
            return "";
        }
    }

    @RequestMapping("/welcome")//后台管理首页
    public String welcome(Model model){
        try {
//            List<MenuTree> list = permissionService.getMenuList();//暂时不用登录获取权限
//            model.addAttribute("list", list);
            return "/welcome";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":index()", e);
            return "";
        }
    }

    @RequestMapping("/operate")
    public String record(){//操作记录
        try {
//            List<MenuTree> list = permissionService.getMenuList();//暂时不用登录获取权限
//            model.addAttribute("list", list);
            return "/welcome";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":record()", e);
            return "";
        }
    }

}
