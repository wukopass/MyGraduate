package com.rtworld.dao.user;



import com.rtworld.pojo.Role;

import java.util.List;

public interface IRoleDao {
    List<Role> getRoles();
    Role getRole(Integer userId);

    void deleteOneById(Integer id);
}
