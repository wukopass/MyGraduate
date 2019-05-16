package com.rtworld.service.personmessage;

import com.rtworld.pojo.MemberUser;
import java.util.List;

public interface IUserService {
    MemberUser selectRtUserMessage(int id);
    MemberUser selectRtUserAllMessage(int id);
    public Integer updatePasswordById(MemberUser rtUser);
}
