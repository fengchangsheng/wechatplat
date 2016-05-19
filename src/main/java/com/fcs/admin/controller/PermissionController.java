package com.fcs.admin.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fcs.admin.model.MenuTree;
import com.fcs.admin.service.PermissionService;
import com.fcs.common.Strings;
import com.fcs.platform.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
@Controller
@RequestMapping("/per")
public class PermissionController extends BaseController{

    @Autowired
    private PermissionService permissionService;

    @RequestMapping("/index")
    public String index(Model model){
        try {
            List<MenuTree> list = permissionService.getMenuList();
            model.addAttribute("list", list);
            return "/admin/admin_per";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":index()", e);
            return "";
        }
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model){
        try {
            List<MenuTree> list = permissionService.getPermissionsByPid("0");
            model.addAttribute("list", list);
            return "/admin/admin_per_add";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":toAdd()", e);
            return "";
        }
    }

    @ResponseBody
    @RequestMapping("/add")
    public int add(MenuTree menuTree,String pid){
        try {
            Date date = new Date();
            menuTree.setCreateTime(date);
            menuTree.setId(Strings.getID());
            menuTree.setParentId(pid);
            menuTree.setEnabled(1);
            int res = permissionService.addPermission(menuTree);
            return res;
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":add()", e);
            return 0;
        }
    }

    @RequestMapping("/toEdit")
    public String toEdit(String id,Model model){
        try {
            MenuTree menuTree = permissionService.getPermissionById(id);
            List<MenuTree> list = permissionService.getPermissionsByPid("0");
            model.addAttribute("list", list);
            model.addAttribute("menuTree", menuTree);
            return "/admin/admin_per_edit";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":toEdit()", e);
            return "";
        }
    }

    @ResponseBody
    @RequestMapping("/edit")
    public int edit(MenuTree menuTree,String pid){
        try {
            Date date = new Date();
            menuTree.setCreateTime(date);
            menuTree.setId(Strings.getID());
            menuTree.setParentId(pid);
            menuTree.setEnabled(1);
            int res = permissionService.editPermission(menuTree);
            return res;
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":edit()", e);
            return 0;
        }
    }

    @ResponseBody
    @RequestMapping("/delete")
    public int delete(String id){
        try {
            int res = permissionService.deleteById(id);
            return res;
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":delete()", e);
            return 0;
        }
    }

    @ResponseBody
    @RequestMapping("/getPers")
    public String getPers(String id){
        try {
            JSONArray jsonArray = new JSONArray();
            JSONObject jsonObject = new JSONObject();
            List<MenuTree> list = permissionService.getPermissionsByPid("0");
            int i = 0;
            for (MenuTree menuTree : list) {
                List<MenuTree> seclist = permissionService.getPermissionsByPid(menuTree.getId());
                jsonObject.put("pmenu", menuTree);
                for (MenuTree sonMenu : seclist) {
                    jsonObject.put("son", sonMenu);
                }
                jsonArray.add(jsonObject);
            }
            return jsonArray.toString();
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":getPers()", e);
        }
        return null;
    }
}
