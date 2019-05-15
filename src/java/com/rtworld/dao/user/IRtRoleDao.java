package com.rtworld.dao.user;

import com.rtworld.pojo.user.RtRole;

import java.util.List;

public interface IRtRoleDao {
    List<RtRole> getRoles();
    RtRole getRole(Integer userId);

    void deleteOneById(Integer id);
}
