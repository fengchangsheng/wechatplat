package com.fcs.wechat.controller;

import com.fcs.wechat.common.WeChatBaseController;
import com.fcs.wechat.service.GroupService;
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
public class GroupController extends WeChatBaseController {

    @Autowired
    private GroupService groupService;

    @RequestMapping("/index")
    public String index(ModelMap modelMap){
        String res = groupService.getGroupList(getAccess_token());
        modelMap.addAttribute("data", res);
        return "/user/user_group";
    }

    @ResponseBody
    @RequestMapping("/getGroups")
    public String getAllGroups(){
        String res = groupService.getGroupList(getAccess_token());
        return res;
    }

    @RequestMapping("/toEdit")
    public String toEdit(int id,ModelMap mm){
        mm.addAttribute("id", id);
        return "/user/user_group_edit";
    }

    @ResponseBody
    @RequestMapping("/edit")
    public String edit(int id,String name){
        String res = groupService.edit(id,name,getAccess_token());
        return res;
    }

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "/user/user_group_add";
    }

    @ResponseBody
    @RequestMapping("/add")
    public String add(String name){
        String res = groupService.add(name,getAccess_token());
        return res;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public String delete(int id){
        String res = groupService.delete(id,getAccess_token());
        return res;
    }

}
