package com.rtworld.service.personmessage;

import com.rtworld.pojo.user.RealMsg;
import com.rtworld.pojo.user.RtUser;
import com.rtworld.pojo.user.RtUserEx;

import java.util.List;

public interface IUserService {
    RtUser selectRtUserMessage(int id);
    RtUser selectRtUserAllMessage(int id);
    public Integer updatePasswordById(RtUser rtUser);
    public Integer insertRealMsg(RealMsg realMsg);
    public Integer updateMailState(RtUserEx rtUserEx);
}
