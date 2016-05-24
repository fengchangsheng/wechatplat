package com.fcs.admin.mapper;

import com.fcs.admin.model.Role;
import com.fcs.platform.mapper.SuperMapper;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
public interface RoleMapper extends SuperMapper<Role>{

    int addRoleAndPer(@Param("id") String id, @Param("roleId") String roleId, @Param("perId") String perId);

    Role getRoleByUser(String userId);

}
