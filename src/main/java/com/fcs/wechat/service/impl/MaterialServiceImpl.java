package com.fcs.wechat.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.fcs.common.util.WebUtils;
import com.fcs.wechat.service.MaterialService;
import org.springframework.stereotype.Service;

/**
 * Created by Lucare.Feng on 2016/6/3.
 */
@Service("materialService")
public class MaterialServiceImpl implements MaterialService {
    @Override
    public String getTuwen(String access_token) {
        String url = "https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token="+access_token;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("type", "news");
        jsonObject.put("offset", "0");
        jsonObject.put("count", "10");
        return WebUtils.sendPost(url,jsonObject.toJSONString());
    }

    @Override
    public String getDetail(String access_token,String media_id) {
        String url = "https://api.weixin.qq.com/cgi-bin/material/get_material?access_token="+access_token;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("media_id", media_id);
        return WebUtils.sendPost(url,jsonObject.toJSONString());
    }
}
