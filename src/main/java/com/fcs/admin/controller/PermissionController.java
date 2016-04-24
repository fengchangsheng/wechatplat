package com.fcs.admin.controller;

import com.fcs.admin.model.MenuTree;
import com.fcs.admin.service.PermissionService;
import com.fcs.platform.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
            List<MenuTree> list = permissionService.getPermissionList();
            model.addAttribute("list", list);
            return "/admin/admin_list";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":index()", e);
            return "";
        }
    }
}
