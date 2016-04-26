package com.fcs.user.service;

/**
 * Created by Lucare.Feng on 2016/4/25.
 */
public interface GroupService {
    String getGroupList(String access_token);

    String edit(int id, String name, String access_token);

    String add(String name, String access_token);

    String delete(int id, String access_token);
}
