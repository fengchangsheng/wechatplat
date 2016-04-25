package com.fcs.user.controller;

import com.fcs.platform.controller.BaseController;
import com.fcs.user.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Lucare.Feng on 2016/4/25.
 * 用户分组控制器
 */
@Controller
@RequestMapping("/wegroup")
public class GroupController extends BaseController{

    @Autowired
    private GroupService groupService;

    @RequestMapping("/index")
    public String index(ModelMap modelMap){
        return "/user/user_group";
    }

    @ResponseBody
    @RequestMapping("/getGroups")
    public String getAllGroups(){
        String res = groupService.getGroupList(getAccess_token());
        return res;
    }

    @ResponseBody
    @RequestMapping("/update")
    public String update(){
        String res = groupService.getGroupList(getAccess_token());
        return res;
    }
}
