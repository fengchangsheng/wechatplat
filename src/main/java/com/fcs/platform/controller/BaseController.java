package com.fcs.platform.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fcs.common.GlobalStatic;
import com.fcs.common.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by Lucare on 2016/1/29.
 */
public class BaseController {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    private static String access_token = null;

    public String getAccess_token(){
        if (access_token == null) {
            StringBuilder url = new StringBuilder();
            url.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential");
            url.append("&appid=").append(GlobalStatic.APPID);
            url.append("&secret=").append(GlobalStatic.SECRET);
            String result = WebUtils.sendGet(url.toString());
            JSONObject json = JSON.parseObject(result);
            access_token = (String) json.get("access_token");
        }
        return access_token;
    }

}
