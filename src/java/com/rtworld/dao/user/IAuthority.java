package com.rtworld.dao.user;

import com.rtworld.pojo.Authority;

import java.util.List;

public interface IAuthority {
    List<Authority> getPermissionsById(Integer id);
}
