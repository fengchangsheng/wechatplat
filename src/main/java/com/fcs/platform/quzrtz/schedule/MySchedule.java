package com.fcs.platform.quzrtz.schedule;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fcs.common.GlobalStatic;
import com.fcs.common.util.WebUtils;


/**
 * Created by Lucare.Feng on 2016/6/12.
 * 定时计划
 */
public class MySchedule {

    private volatile String access_token = null;

    public void doJob() {
        StringBuilder url = new StringBuilder();
        url.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential");
        url.append("&appid=").append(GlobalStatic.APPID);
        url.append("&secret=").append(GlobalStatic.SECRET);
        String result = WebUtils.sendGet(url.toString());
        JSONObject json = JSON.parseObject(result);
        access_token = (String) json.get("access_token");
    }

    public String getAccess_token(){
        if (access_token == null) {
            doJob();
        }
        return access_token;
    }

}
