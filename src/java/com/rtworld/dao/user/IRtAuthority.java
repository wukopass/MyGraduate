package com.rtworld.dao.user;

import com.rtworld.pojo.user.RtAuthority;

import java.util.List;

public interface IRtAuthority {
    List<RtAuthority> getPermissionsById(Integer id);
}
