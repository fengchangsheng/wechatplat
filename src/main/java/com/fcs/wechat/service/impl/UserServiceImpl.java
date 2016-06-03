package com.fcs.wechat.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fcs.common.util.WebUtils;
import com.fcs.wechat.service.UserService;
import org.springframework.stereotype.Service;

import java.util.Iterator;

/**
 * Created by Lucare.Feng on 2016/4/24.
 */
@Service("weUserService")
public class UserServiceImpl implements UserService{

    public String getUserList(String access_token) {

        String getUserUrl = "https://api.weixin.qq.com/cgi-bin/user/get?access_token="+access_token+"&next_openid=";
        String listResult = WebUtils.sendGet(getUserUrl);

        JSONObject jsonObject = JSONObject.parseObject(listResult);
        JSONArray jsonArray = (JSONArray) jsonObject.getJSONObject("data").get("openid");
        Iterator<Object> iterator = jsonArray.iterator();
        JSONArray newJsonArray = new JSONArray();
        int i = 0;
        String openid = null,innerUrl = null,resUser =null;
        JSONObject innerObj = null;
        while (iterator.hasNext()) {
            openid = (String) iterator.next();
            innerUrl = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
            resUser  = WebUtils.sendGet(innerUrl);
            innerObj = JSONObject.parseObject(resUser);
            newJsonArray.add(i++, innerObj);
        }
        jsonObject.remove("data");
        jsonObject.put("datas",newJsonArray);
        System.out.println(jsonObject.toJSONString());
        return jsonObject.toJSONString();
    }
}
