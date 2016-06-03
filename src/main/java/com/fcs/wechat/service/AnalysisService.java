package com.fcs.wechat.service;

/**
 * Created by Lucare.Feng on 2016/4/27.
 */
public interface AnalysisService {

    String getUserSummary(String access_token);

    String getUserCumulate(String access_token);
}
