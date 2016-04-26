package com.fcs.user.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.fcs.common.util.WebUtils;
import com.fcs.user.service.GroupService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Lucare.Feng on 2016/4/25.
 */
@Service("groupService")
public class GroupServiceImpl implements GroupService{

    public String getGroupList(String access_token) {
        String url = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token="+access_token;
        return WebUtils.sendGet(url);
    }

    public String edit(int id, String name, String access_token) {
        String url = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token="+access_token;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", id);
        jsonObject.put("name", name);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("group", jsonObject);
        String res = WebUtils.sendPost(url, jsonObj.toJSONString());
        return res;
    }

    public String add(String name, String access_token) {
        String url = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token="+access_token;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("name", name);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("group", jsonObject);
        String res = WebUtils.sendPost(url, jsonObj.toJSONString());
        return res;
    }
}
