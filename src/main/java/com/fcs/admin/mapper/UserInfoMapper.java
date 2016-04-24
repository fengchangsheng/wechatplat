package com.fcs.admin.mapper;

import com.fcs.admin.model.UserInfo;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
public interface UserInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    List<UserInfo> selectAll();
}
