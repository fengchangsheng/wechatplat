package com.fcs.wechat.controller;

import com.fcs.wechat.common.WeChatBaseController;
import com.fcs.wechat.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Lucare.Feng on 2016/5/2.
 */
@Controller
@RequestMapping("/material")
public class PhotoController extends WeChatBaseController {

    @Autowired
    private MaterialService materialService;

    @RequestMapping("/tuWen")
    public String tuWen(ModelMap modelMap) {
        String res = materialService.getTuwen(getAccess_token());
        modelMap.addAttribute("data", res);
        System.out.println(res);
        return "/material/tuwen_list";
    }

    @RequestMapping("/detail")
    public String detail(ModelMap modelMap,String media_id) {
        String res = materialService.getDetail(getAccess_token(),media_id);
        System.out.println(res);
        modelMap.addAttribute("data", res);
        return "/material/tuwen_detail";
    }

}
