package com.fcs.admin.controller;

import com.fcs.admin.model.RoleInfo;
import com.fcs.admin.service.RoleService;
import com.fcs.platform.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController{

    @Autowired
    private RoleService roleService;

    @RequestMapping("/index")
    public String index(ModelMap model){
        try {
            List<RoleInfo> list = roleService.getRoleList();
            model.addAttribute("list", list);
            return "/admin/admin_role";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":index()", e);
            return "";
        }
    }



}
