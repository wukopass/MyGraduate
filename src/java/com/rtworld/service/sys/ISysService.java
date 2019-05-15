package com.rtworld.service.sys;

import com.rtworld.pojo.user.*;
import com.rtworld.util.Page;

import java.util.List;
import java.util.Set;

public interface ISysService {
    void init(Page<RtUser> page);

    List<RtRole> getRoles();

    RealMsg getRealMsg(RtUser rtUser);

    void updateRealMsg(Page<RtUser> page);

    void toBeUnValid(RtUser rtUser);

    RtUser getOneUser(RtUser rtUser);

    void setRoleToRtUser(RtUser rtUser);

    RtUser msgCheck(RtUser rtUser);

    void deleteAllMsg(RtUser rtUser);

    void updateEXMsg(RtUser rtUser, RtUserEx rtUserEx);

    RtUser queryUserByTel(String tel);

    Set<String> findRolesByUserId(Integer id);

    Set<String> findPermissionsByUserId(Integer id);

    void saveJob(HistoryJob historyJob);



    void updateRtUserEx(RtUser rtUser);

    RtUser getOneByTel(String tel);

    void setMsgById(RtUser rtUser, HistoryJob historyJob);
}
