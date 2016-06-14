package com.fcs.wechat.common;

/**
 * Created by Lucare.Feng on 2016/6/14.
 */
public interface IAccessTokenCache {

    // 默认超时时间7200秒 60秒用于程序执行误差
    final int DEFAULT_TIME_OUT = 7200 - 60;

    <T> T get(String key);

    void set(String key, Object value);

    void remove(String key);

}
