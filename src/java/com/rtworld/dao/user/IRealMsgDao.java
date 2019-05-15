package com.rtworld.dao.user;

import com.rtworld.pojo.user.RealMsg;
import com.rtworld.pojo.user.RtUserEx;

public interface IRealMsgDao {
    //查询对应id 的真实信息
    RealMsg selectRealMsgById(int id);
    //插入信息
    Integer insertRealMsg(RealMsg realMsg);

    void updateState(RealMsg realMsg);
    void getOutMsg(RealMsg realMsg);

    void deleteOneById(Integer id);

    void addMsg(Integer id);
}
