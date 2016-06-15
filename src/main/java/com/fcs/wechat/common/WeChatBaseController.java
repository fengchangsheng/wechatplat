package com.fcs.wechat.common;

import com.fcs.common.GlobalStatic;
import com.fcs.common.util.RetryUtils;
import com.fcs.common.util.WebUtils;
import com.fcs.platform.controller.BaseController;
import java.util.concurrent.Callable;

/**
 * Created by Lucare.Feng on 2016/6/14.
 */
public class WeChatBaseController extends BaseController{

    private static String urlpre = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";

    // 利用 appId 与 accessToken 建立关联，支持多账户
    static IAccessTokenCache accessTokenCache = ApiConfigKit.getAccessTokenCache();

    public String getAccess_token(){
        return getAccessToken().getAccess_token();
    }

    public static AccessToken getAccessToken() {
        String appId = GlobalStatic.APPID;
        AccessToken result = accessTokenCache.get(appId);
        if (result != null && result.isAvailable())
            return result;

        refreshAccessToken();
        return accessTokenCache.get(appId);
    }

    private static void refreshAccessToken() {
        String appId = GlobalStatic.APPID;

        // 最多三次请求
        AccessToken result = RetryUtils.retryOnException(3, new Callable<AccessToken>() {

            @Override
            public AccessToken call() throws Exception {
                StringBuilder url = new StringBuilder();
                url.append(urlpre);
                url.append("&appid=").append(GlobalStatic.APPID);
                url.append("&secret=").append(GlobalStatic.SECRET);
                String json = WebUtils.sendGet(url.toString());
                return new AccessToken(json);
            }
        });

        // 三次请求如果仍然返回了不可用的 access token 仍然 put 进去，便于上层通过 AccessToken 中的属性判断底层的情况
        accessTokenCache.set(appId, result);
    }


}
