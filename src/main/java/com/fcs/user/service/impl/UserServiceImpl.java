package com.fcs.user.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fcs.common.util.WebUtils;
import com.fcs.user.service.UserService;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

import static com.fcs.common.util.WebUtils.sendGet;

/**
 * Created by Lucare.Feng on 2016/4/24.
 */
@Service("weUserService")
public class UserServiceImpl implements UserService{

    public String getUserList(String access_token) {

        String getUserUrl = "https://api.weixin.qq.com/cgi-bin/user/get?access_token="+access_token+"&next_openid=";
        String listResult = WebUtils.sendGet(getUserUrl);

        JSONObject jsonObject = JSONObject.parseObject(listResult);
        int total = jsonObject.getInteger("total");
        int count = jsonObject.getInteger("count");
        JSONArray jsonArray = (JSONArray) jsonObject.getJSONObject("data").get("openid");
        Iterator<Object> iterator = jsonArray.iterator();
        String innerUrl = null;
        JSONArray newJsonArray = new JSONArray();
        int i = 0;
        while (iterator.hasNext()) {
            String openid = (String) iterator.next();
            innerUrl = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
            String resUser = WebUtils.sendGet(innerUrl);
            JSONObject innerObj = JSONObject.parseObject(resUser);
            newJsonArray.add(i++, innerObj);
        }
        jsonObject.remove("data");
        jsonObject.put("datas",newJsonArray);
        return jsonObject.toJSONString();
    }
}
