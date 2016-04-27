package com.fcs.statistics.service;

/**
 * Created by Lucare.Feng on 2016/4/27.
 */
public interface UserAnalysisService {

    String getUserSummary(String access_token);

    String getUserCumulate(String access_token);
}
