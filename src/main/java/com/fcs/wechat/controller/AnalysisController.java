package com.fcs.wechat.controller;

import com.fcs.wechat.common.WeChatBaseController;
import com.fcs.wechat.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Lucare.Feng on 2016/6/2.
 */
@Controller
@RequestMapping("/westatis")
public class AnalysisController extends WeChatBaseController {

    @Autowired
    private AnalysisService analysisService;

    @RequestMapping("/index")
    public String getUserCumulate(ModelMap modelMap) {//获取累计用户数据
        String sum = analysisService.getUserSummary(getAccess_token());
        String cum = analysisService.getUserCumulate(getAccess_token());
        modelMap.addAttribute("sumData", sum);
        modelMap.addAttribute("cumData", cum);
        return "/statistics/user_analysis";
    }

    @RequestMapping("/summary")
    @ResponseBody
    public String getSummary(){
        return analysisService.getUserSummary(getAccess_token());
    }

    @RequestMapping("/cumulate")
    @ResponseBody
    public String getCumulate(){
        return analysisService.getUserCumulate(getAccess_token());
    }

}
