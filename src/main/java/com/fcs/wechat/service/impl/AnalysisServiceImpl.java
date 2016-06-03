package com.fcs.wechat.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.fcs.common.util.WebUtils;
import com.fcs.wechat.service.AnalysisService;
import org.springframework.stereotype.Service;

/**
 * Created by Lucare.Feng on 2016/4/27.
 */
@Service
public class AnalysisServiceImpl implements AnalysisService {

    public String getUserSummary(String access_token) {
        String url = "https://api.weixin.qq.com/datacube/getusersummary?access_token="+access_token;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("begin_date", "2016-04-26");
        jsonObject.put("end_date", "2016-05-01");
        String res = WebUtils.sendPost(url, jsonObject.toJSONString());
        return res;
    }

    public String getUserCumulate(String access_token) {
        String url = "https://api.weixin.qq.com/datacube/getusercumulate?access_token="+access_token;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("begin_date", "2016-04-26");
        jsonObject.put("end_date", "2016-05-01");
        String res = WebUtils.sendPost(url, jsonObject.toJSONString());
        return res;
    }
}
