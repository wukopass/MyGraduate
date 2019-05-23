package com.rtworld.dao.user;

import com.rtworld.pojo.Authority;

import java.util.List;

public interface IAuthorityDao {
    List<Authority> getPermissionsById(int userid);

}
