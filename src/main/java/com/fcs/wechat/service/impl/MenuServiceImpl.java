package com.fcs.wechat.service.impl;

import com.fcs.common.util.WebUtils;
import com.fcs.wechat.service.MenuService;
import org.springframework.stereotype.Service;

/**
 * Created by Lucare.Feng on 2016/6/6.
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Override
    public String getConfig(String token) {
        String url = "https://api.weixin.qq.com/cgi-bin/get_current_selfmenu_info?access_token="+token;
        return WebUtils.sendGet(url);
    }
}
