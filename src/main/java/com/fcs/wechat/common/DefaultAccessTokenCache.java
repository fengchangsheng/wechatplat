package com.fcs.wechat.common;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by Lucare.Feng on 2016/6/14.
 * 默认保存到内存中
 */
public class DefaultAccessTokenCache implements IAccessTokenCache {

    static Map<String, Object> map = new ConcurrentHashMap<String, Object>();

    @Override
    public <T> T get(String key) {
        return (T) map.get(key);
    }

    @Override
    public void set(String key, Object value) {
        map.put(key, value);
    }

    @Override
    public void remove(String key) {
        map.remove(key);
    }
}
