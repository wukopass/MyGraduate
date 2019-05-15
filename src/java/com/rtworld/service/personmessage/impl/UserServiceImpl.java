package com.rtworld.service.personmessage.impl;

import com.rtworld.dao.user.IRealMsgDao;
import com.rtworld.dao.user.IRtUserDao;
import com.rtworld.dao.user.IRtUserExDao;
import com.rtworld.pojo.user.RealMsg;
import com.rtworld.pojo.user.RtUser;
import com.rtworld.pojo.user.RtUserEx;
import com.rtworld.service.personmessage.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IRtUserDao rtUserDao;
    @Autowired
    private IRtUserExDao rtUserExDao;
    @Autowired
    private IRealMsgDao realMsgDao;
    @Override
    public RtUser selectRtUserMessage(int id) {
        RtUser rt = null;
        rt = rtUserDao.selectRtUserById(id);
        return rt;
    }

    @Override
    public RtUser selectRtUserAllMessage(int id) {
        RtUser rt = null;
        rt = rtUserDao.selectRtUserById(id);
        rt.setRtUserEx(rtUserExDao.selectRtUserExById(id));
        return rt;
    }

    public Integer updatePasswordById(RtUser rtUser){
        return rtUserDao.updatePasswordById(rtUser);
    }

    public Integer insertRealMsg(RealMsg realMsg){
        realMsgDao.deleteOneById(realMsg.getId());
        realMsgDao.insertRealMsg(realMsg);
        RtUserEx rtUserEx = new RtUserEx();
        rtUserEx.setUserId(realMsg.getId());
        rtUserEx.setPriMsgState('1');
        rtUserExDao.updatepriMsgState(rtUserEx);
        return 1;
    }
    public Integer updateMailState(RtUserEx rtUserEx){
        return rtUserExDao.updateMailState(rtUserEx);
    }
}
