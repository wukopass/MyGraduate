package com.rtworld.dao.user;


import com.rtworld.pojo.user.RtUserEx;

public interface IRtUserExDao {
    //通过用户id查找普通用户的特有信息
    RtUserEx selectRtUserExById(int id);

    void msgChecked();

    void deleteOneById(Integer id);

    void addEx(Integer id);

    Integer updatepriMsgState(RtUserEx rtUserEx);

    Integer updateMailState(RtUserEx rtUserEx);

    void updateExMsg(RtUserEx rtUserEx);

    void updateJob(RtUserEx rtUserEx);
}
