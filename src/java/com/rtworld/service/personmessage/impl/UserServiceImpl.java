package com.rtworld.service.personmessage.impl;


import com.rtworld.dao.user.IUserDao;

import com.rtworld.pojo.MemberUser;
import com.rtworld.service.personmessage.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao rtUserDao;

    @Override
    public MemberUser selectRtUserMessage(int id) {
       MemberUser  rt = null;
        rt = rtUserDao.selectRtUserById(id);
        return rt;
    }

    @Override
    public MemberUser selectRtUserAllMessage(int id) {
        MemberUser rt = null;
        rt = rtUserDao.selectRtUserById(id);
        //rt.setRtUserEx(rtUserExDao.selectRtUserExById(id));
        return rt;
    }

    public Integer updatePasswordById(MemberUser rtUser){
        return rtUserDao.updatePasswordById(rtUser);
    }



}
