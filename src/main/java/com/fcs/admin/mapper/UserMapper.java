package com.fcs.admin.mapper;

import com.fcs.admin.model.User;
import com.fcs.admin.model.UserRole;
import com.fcs.platform.mapper.SuperMapper;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
public interface UserMapper extends SuperMapper<User>{

    User login(User user);

    int addAdminRole(UserRole userRole);

    int updateUserRole(@Param(value = "userid") String userid, @Param(value = "roleid") String roleid);
}
