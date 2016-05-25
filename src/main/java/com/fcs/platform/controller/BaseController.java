package com.fcs.platform.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fcs.common.GlobalStatic;
import com.fcs.common.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Lucare on 2016/1/29.
 */
public class BaseController {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    public String getAccess_token(){
        return BaseHolder.access_token;
    }

    private static class BaseHolder{
        private static String access_token = getAccess_token();

        private static String getAccess_token(){
            StringBuilder url = new StringBuilder();
            url.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential");
            url.append("&appid=").append(GlobalStatic.APPID);
            url.append("&secret=").append(GlobalStatic.SECRET);
            String result = WebUtils.sendGet(url.toString());
            JSONObject json = JSON.parseObject(result);
            access_token = (String) json.get("access_token");
            return access_token;
        }
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        // DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        CustomDateEditor dateEditor = new CustomDateEditor(format, true);
        binder.registerCustomEditor(Date.class, dateEditor);

    }


}
