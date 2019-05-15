package com.rtworld.service;

import com.rtworld.dao.user.IRtUserDao;
import com.rtworld.pojo.user.RtUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class cs implements Ics{
    @Autowired
    private IRtUserDao iRtUserDao;

    public void cs(RtUser rtUser){
        System.out.println(rtUser);
        int i = iRtUserDao.selectCount();
        rtUser = iRtUserDao.selectRtUserById(1);

    }
}
