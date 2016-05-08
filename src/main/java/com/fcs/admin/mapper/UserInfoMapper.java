package com.fcs.admin.mapper;

import com.fcs.admin.model.UserInfo;
import com.fcs.admin.model.UserRole;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
public interface UserInfoMapper {

    int deleteByPrimaryKey(String id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo login(UserInfo userInfo);

    UserInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    List<UserInfo> selectAll();

    int addAdminRole(UserRole userRole);
}
