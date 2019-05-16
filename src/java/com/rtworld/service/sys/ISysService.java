package com.rtworld.service.sys;

import com.rtworld.pojo.MemberUser;
import com.rtworld.pojo.Role;
import com.rtworld.pojo.MemberUser.*;
import com.rtworld.util.Page;

import java.util.List;
import java.util.Set;

public interface ISysService {
    void init(Page<MemberUser> page);

    List<Role> getRoles();

    void toBeUnValid( MemberUser rtUser);

    MemberUser getOneUser( MemberUser rtUser);

    void setRoleToRtUser( MemberUser rtUser);

    MemberUser msgCheck( MemberUser rtUser);

    void deleteAllMsg( MemberUser rtUser);

    MemberUser queryUserByTel(String tel);

    Set<String> findRolesByUserId(Integer id);

    Set<String> findPermissionsByUserId(Integer id);

    MemberUser getOneByTel(String tel);

    void setMsgById( MemberUser rtUser);
}
