package com.rtworld.dao.user;

import com.rtworld.pojo.user.RtUser;
import com.rtworld.util.Page;

import java.util.List;

public interface IRtUserDao {
    //通过rtUser查找用户，
    RtUser selectRtUserByRtUser(RtUser rtUser);
    //通过id查找用户
    RtUser selectRtUserById(int id);
    //查看总数
    int selectCount();

    RtUser selectRtUser(RtUser rtUser);

    RtUser selectRtUserByRtId(RtUser rtUser);
    //找出符合条件的分页数据
    List<RtUser> selectRtUsersByRtUser(Page<RtUser> page);
    //符合条件信息数
    Integer selectCountByPage(Page<RtUser> page);

    void setEffective(RtUser rtUser);

    void deleteOneById(Integer id);

    RtUser selectRtUserByTel(String tel);

    void addRtUser(String tel);

    void addRole(Integer id);

    Integer updatePasswordById(RtUser rtUser);

    void updateRtUser(RtUser rtUser);

    void updateMC(RtUser rtUser);

    void updateRole(RtUser rtUser);
    void saveRtUser(RtUser rtUser);

    void updateRtUserName(RtUser rtUser);

    void changeUser(RtUser rtUser);

    void saveMail(RtUser rtUser);

    void changeRole(RtUser rtUser);

    void changeCompanyName(RtUser rtUser);
}
