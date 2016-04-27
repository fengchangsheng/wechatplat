package com.fcs.statistics.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.fcs.common.util.WebUtils;
import com.fcs.statistics.service.UserAnalysisService;
import org.springframework.stereotype.Service;

/**
 * Created by Lucare.Feng on 2016/4/27.
 */
@Service
public class UserAnalysisServiceImpl implements UserAnalysisService {

    public String getUserSummary(String access_token) {
        String url = "https://api.weixin.qq.com/datacube/getusersummary?access_token="+access_token;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("begin_date", "2015-12-02");
        jsonObject.put("end_date", "2014-12-07");
        String res = WebUtils.sendPost(url, jsonObject.toJSONString());
        return res;
    }

    public String getUserCumulate(String access_token) {
        String url = "https://api.weixin.qq.com/datacube/getusercumulate?access_token="+access_token;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("begin_date", "2015-12-02");
        jsonObject.put("end_date", "2014-12-07");
        String res = WebUtils.sendPost(url, jsonObject.toJSONString());
        return res;
    }
}
