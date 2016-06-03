package com.fcs.wechat.service;

/**
 * Created by Lucare.Feng on 2016/6/3.
 */
public interface MaterialService {

    String getTuwen(String access_token);

    String getDetail(String access_token,String media_id);
}
