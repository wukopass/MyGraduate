package com.rtworld.service;

import com.rtworld.pojo.Authority;
import com.rtworld.pojo.Mail;
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
    //根据用户名找出用户
    MemberUser queryUserByUserName(String username);

    MemberUser queryUserByTel(String tel);

    Set<String> findRolesByUserId(Integer id);

     List<Authority> findPermissionsByUserId(int id);

    void setMsgById( MemberUser rtUser);
    //发送邮件
    int sendMail(Mail mail);
}
