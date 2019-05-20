package com.rtworld.service.personmessage;

import com.rtworld.pojo.Mail;
import com.rtworld.pojo.MemberUser;
import com.rtworld.vo.RegisterVO;

public interface IUserService {
    MemberUser selectRtUserMessage(int id);
    MemberUser selectRtUserAllMessage(int id);
    public Integer updatePasswordById(MemberUser rtUser);

    int registerValid(String username, String mail);

    void registerUser(RegisterVO vo);

    MemberUser findUser(String username);

    MemberUser findUserById(int userid);


}
