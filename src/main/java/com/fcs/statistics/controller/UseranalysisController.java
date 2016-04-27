package com.fcs.statistics.controller;

import com.fcs.platform.controller.BaseController;
import com.fcs.statistics.service.UserAnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Lucare.Feng on 2016/4/27.
 * 用户分析控制器
 */
@Controller
@RequestMapping("/westatis")
public class UserAnalysisController extends BaseController{

    @Autowired
    private UserAnalysisService userAnalysisService;

    @RequestMapping("/index")
    public String index(){
        return "/statistics/user_analysis";
    }

    @ResponseBody
    @RequestMapping("/summary")
    public String getUserSummary(){//获取用户增减数据
        return userAnalysisService.getUserSummary(getAccess_token());
    }

    @ResponseBody
    @RequestMapping("/cumulate")
    public String getUserCumulate() {//获取累计用户数据
        return userAnalysisService.getUserCumulate(getAccess_token());
    }

}
