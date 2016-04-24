package com.fcs.user.service.impl;

import com.fcs.common.util.WebUtils;
import com.fcs.user.model.User;
import com.fcs.user.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.fcs.common.util.WebUtils.sendGet;

/**
 * Created by Lucare.Feng on 2016/4/24.
 */
@Service("weUserService")
public class UserServiceImpl implements UserService{
    public String getUserList() {
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
        String result = WebUtils.sendGet(url);
        return result;
    }
}
