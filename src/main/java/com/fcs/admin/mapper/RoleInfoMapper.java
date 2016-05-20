package com.fcs.admin.mapper;

import com.fcs.admin.model.RoleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
public interface RoleInfoMapper {

    public List<RoleInfo> getRoleList();

    int addRole(RoleInfo roleInfo);

    int addRoleAndPer(@Param("id") String id, @Param("roleId") String roleId, @Param("perId") String perId);
}
