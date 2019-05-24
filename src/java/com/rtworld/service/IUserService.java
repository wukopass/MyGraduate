package com.rtworld.service;

import com.rtworld.pojo.Mail;
import com.rtworld.pojo.MemberUser;
import com.rtworld.pojo.Role;
import com.rtworld.vo.RegisterVO;

import java.util.List;

public interface IUserService {
    MemberUser selectRtUserMessage(int id);
    MemberUser selectRtUserAllMessage(int id);
    public Integer updatePasswordById(MemberUser rtUser);

    int registerValid(String username, String mail);

    void registerUser(RegisterVO vo);

    MemberUser findUser(String username);

    List<MemberUser> queryUserByVo();

    void deletUserByUserId(int userid);
    //角色下拉框
    List<Role> selectAllUserRole();

    MemberUser grantAuth(int userid);
}
