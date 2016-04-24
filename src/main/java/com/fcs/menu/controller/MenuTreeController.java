package com.fcs.menu.controller;

import com.fcs.menu.model.MenuTree;
import com.fcs.menu.service.MenuTreeService;
import com.fcs.platform.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Lucare on 2016/1/29.
 */
//@Controller
//@RequestMapping("/menu")
public class MenuTreeController extends BaseController{

    @Autowired
    private MenuTreeService menuTreeService;

    @RequestMapping("/home")//后台管理首页
    public String index(){
        try {
            System.out.println(">>>>--------$$$$#####$$$$$--------++++++");
            return "/home";
        } catch (Exception e) {
            logger.error(this.getClass().getName()+":index()", e);
            return "";
        }
    }

    @RequestMapping(value="/toMenuList", method= RequestMethod.GET)
    public String toMenuList(){
        try {
            return "/menu/menu_list";
        }catch (Exception e){
            logger.error(this.getClass().getName()+":toMenuList()", e);
            return "";
        }
    }

    @RequestMapping(value="/buildTree", method= RequestMethod.POST)
    @ResponseBody
    public List<MenuTree> buildTree(){
        try {
            List<MenuTree> menuTreeList = menuTreeService.tree();
            return menuTreeList;
        }catch (Exception e){
            logger.error(this.getClass().getName()+":buildTree()", e);
            return null;
        }
    }

    @RequestMapping(value="/menuList", method= RequestMethod.POST)
    @ResponseBody
    public List<MenuTree> menuList(){
        try {
            List<MenuTree> menuTreeList = menuTreeService.tree();
            return menuTreeList;
        }catch (Exception e){
            logger.error(this.getClass().getName()+":menuList()", e);
            return null;
        }
    }

    @RequestMapping(value="/addMenu", method= RequestMethod.POST)
    @ResponseBody
    public Map addMenu(MenuTree menuTree){
        Map<String,String> map = new HashMap<String,String>();
        try {
            menuTreeService.saveMenu(menuTree);
            map.put("code","200");
            map.put("msg","菜单添加成功!");
            return map;
        }catch (Exception e){
            logger.error(this.getClass().getName()+":addMenu()", e);
            map.put("code","500");
            map.put("msg","菜单添加失败!");
            return map;
        }
    }

    @RequestMapping(value="/editMenu", method= RequestMethod.POST)
    @ResponseBody
    public Map editMenu(MenuTree menuTree){
        Map<String,String> map = new HashMap<String,String>();
        try {
            menuTreeService.editMenu(menuTree);
            map.put("code","200");
            map.put("msg","菜单编辑成功!");
            return map;
        }catch (Exception e){
            logger.error(this.getClass().getName()+":editMenu()", e);
            map.put("code","500");
            map.put("msg","菜单编辑失败!");
            return map;
        }
    }

    @RequestMapping(value="/delMenu", method= RequestMethod.POST)
    @ResponseBody
    public Map delMenu(String menuId){
        Map<String,String> map = new HashMap<String,String>();
        try {
            menuTreeService.delMenu(menuId);
            map.put("code","200");
            map.put("msg","菜单删除成功!");
            return map;
        }catch (Exception e){
            logger.error(this.getClass().getName()+":delMenu()", e);
            map.put("code","500");
            map.put("msg","菜单删除失败!");
            return map;
        }
    }
}
