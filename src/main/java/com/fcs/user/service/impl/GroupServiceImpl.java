package com.fcs.user.service.impl;

import com.fcs.common.util.WebUtils;
import com.fcs.user.service.GroupService;
import org.springframework.stereotype.Service;

/**
 * Created by Lucare.Feng on 2016/4/25.
 */
@Service("groupService")
public class GroupServiceImpl implements GroupService{

    public String getGroupList(String access_token) {
        String url = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token="+access_token;
        return WebUtils.sendGet(url);
    }
}
