package com.rtworld.dao;

import com.rtworld.pojo.Authority;

import java.util.List;

public interface IAuthorityDao {
    List<Authority> getPermissionsById(int userid);
    //得到全部的权限信息
    List<Authority> getAllAuthirities();
}
