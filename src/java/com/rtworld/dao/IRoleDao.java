package com.rtworld.dao;
import com.rtworld.pojo.Role;

import java.util.List;

public interface IRoleDao {
    List<Role> getAllRoles();
    Role getRole(Integer userId);
    void deleteOneById(Integer id);
    List<Role> findRolesByUserId(int userid);
}
