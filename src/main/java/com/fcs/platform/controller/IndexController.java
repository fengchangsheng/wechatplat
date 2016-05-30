package com.fcs.platform.controller;

import com.fcs.admin.model.MenuTree;
import com.fcs.admin.model.User;
import com.fcs.admin.service.PermissionService;
import com.fcs.common.Strings;
import com.fcs.common.util.CheckCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping("/getCode")//后台管理首页
    public void getCode(HttpServletRequest request, HttpServletResponse response){
        try {
            CheckCode.getRegisterImage(request,response);
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":getCode()", e);
        }
    }

    @RequestMapping("/welcome")//后台管理首页
    public String welcome(Model model){
        try {
//            List<MenuTree> list = permissionService.getMenuList();//暂时不用登录获取权限
//            model.addAttribute("list", list);
            return "/welcome";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":welcome()", e);
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

    @RequestMapping("/validateCode")//验证码校验
    @ResponseBody
    public boolean validateCode(HttpSession session,String strcode){
        try {
            String code = (String) session.getAttribute("code");
            System.out.println("index check");
            if (!Strings.isEmpty(strcode) && code.equals(strcode)) {
                return true;
            }else {
                return false;
            }
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":validateCode()", e);
            return false;
        }
    }

}
