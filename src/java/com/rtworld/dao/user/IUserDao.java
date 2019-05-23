package com.rtworld.dao.user;

import com.rtworld.pojo.Mail;
import com.rtworld.pojo.MemberUser;

import com.rtworld.util.Page;

import java.util.List;

public interface IUserDao {

    MemberUser selectRtUserByRtUser(MemberUser memberUser);
    //通过id查找用户
    MemberUser selectUserById(int id);
    //查看总数
    int selectCount();

    MemberUser selectMemberUser( MemberUser  memberUser);

    MemberUser selectRtUserByRtId( int id);
    //找出符合条件的分页数据
    List< MemberUser> selectRtUsersByRtUser(Page<MemberUser> page);
    //符合条件信息数
    Integer selectCountByPage(Page< MemberUser> page);

    void setEffective(MemberUser  memberUser);

    void deleteOneById(int id);

    MemberUser selectRtUserByTel(String tel);

    void addMembetUser(String tel);

    void addRole(Integer id);

    Integer updatePasswordById(MemberUser memberUser);

    void updateRtUser( MemberUser  memberUserr);

    void updateMC( MemberUser  memberUser);

    void updateRole( MemberUser memberUser);
    void saveRtUser( MemberUser  memberUser);

    void updateRtUserName (MemberUser  memberUser);

    void changeUser(MemberUser memberUser);

    void saveMail(MemberUser memberUser);

    void changeRole(MemberUser memberUser);

   //用户名查找用户
    MemberUser findUserByUserName(String username);
    //检查用户名和邮箱是不是有效 5.17
    int checkUsernameValid(String username);
    
    int checkMailValid(String mail);
    
    int adddUser(MemberUser memberUser);
    
    MemberUser finduserById(int userid);
    //用户管理的查找
    List<MemberUser> queryUserByVo();
}
