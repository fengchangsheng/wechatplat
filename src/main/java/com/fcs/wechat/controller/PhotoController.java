package com.fcs.wechat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Lucare.Feng on 2016/5/2.
 */
@Controller
@RequestMapping("/material")
public class PhotoController {

//    https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=ACCESS_TOKEN

    @RequestMapping("/index")
    public String index(ModelMap modelMap){

        return "";
    }


}
