package com.fcs.user.service;

import com.alibaba.fastjson.JSONObject;
import com.fcs.user.model.User;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/24.
 */
public interface UserService {

    String getUserList(String access_token);
}
