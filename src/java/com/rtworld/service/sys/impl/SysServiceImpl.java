package com.rtworld.service.sys.impl;

import com.rtworld.dao.user.*;
import com.rtworld.pojo.Authority;
import com.rtworld.pojo.Mail;
import com.rtworld.pojo.MemberUser;
import com.rtworld.pojo.Role;
import com.rtworld.service.sys.ISysService;
import com.rtworld.util.Cons;
import com.rtworld.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Transactional
@Service
public class SysServiceImpl implements ISysService {
    @Autowired
    private IUserDao userDao;
    @Autowired
    private IRoleDao roleDao;
    @Autowired
    private IAuthority authorityDao;

    @Autowired
    private IMailDao mailDao;
    public void init(Page<MemberUser> page) {
        page.setCounts(userDao.selectCountByPage(page));
        page.setBeans(userDao.selectRtUsersByRtUser(page));
        for (MemberUser user : page.getBeans()) {
            user.setRole(roleDao.getRole(user.getUserid()));
        }
    }

    @Override
    public List<Role> getRoles() {
        return roleDao.getRoles();
    }

   @Transactional
    public void toBeUnValid( MemberUser rtUser) {
        userDao.setEffective(rtUser);
    }

    public  MemberUser getOneUser( MemberUser  memberUser) {
        return userDao.selectUserById( memberUser.getUserid());
    }

    @Override
    public void setRoleToRtUser(MemberUser rtUser) {
        rtUser.setRole(roleDao.getRole(rtUser.getUserid()));
    }


    public MemberUser msgCheck(MemberUser rtUser) {
        rtUser = userDao.selectUserById(rtUser.getUserid());
        userDao.changeRole(rtUser);
       // userDao.changeCompanyName(rtUser);
        rtUser.setRole(roleDao.getRole(rtUser.getUserid()));
        //rtUser.setRealMsg(realMsgDao.selectRealMsgById(rtUser.getId()));
        return rtUser;
    }

    @Override
    public void deleteAllMsg(MemberUser rtUser) {
        roleDao.deleteOneById(rtUser.getUserid());
        userDao.deleteOneById(rtUser.getUserid());
    }
    //根据用户名找用户
    @Override
    public MemberUser queryUserByUserName(String username) {
        return userDao.findUserByUserName(username);
    }

    public void updateEXMsg(MemberUser rtUser) {
        //更新修改 角色 邮箱 公司名称
        userDao.updateMC(rtUser);
        userDao.updateRole(rtUser);
    }

    public MemberUser queryUserByTel(String tel) {
        MemberUser  rtUser = userDao.selectRtUserByTel(tel);
        if (rtUser == null){
            userDao.addMembetUser(tel);
            userDao.addRole(rtUser.getUserid());
        }else {
            rtUser.setRole(roleDao.getRole(rtUser.getUserid()));
        }
        Cons.USERID = rtUser.getUserid();
        return rtUser;
    }

    @Override
    public Set<String> findRolesByUserId(Integer id) {
        Role rtRoles = roleDao.getRole(id);
        Set<String> role = new HashSet<>();
        role.add(rtRoles.getRolename());
        return role;
    }

    @Override
    public Set<String> findPermissionsByUserId(Integer id) {
        List<Authority> rtAuthority = authorityDao.getPermissionsById(id);
        Set<String> authoritys = new HashSet<>();
        for (Authority authority : rtAuthority) {
            authoritys.add(authority.getAuthorityname());
        }
        return authoritys;
    }



    @Override
    public void setMsgById(MemberUser rtUser) {
        userDao.saveRtUser(rtUser);
        userDao.changeUser(rtUser);
        rtUser.setRole(roleDao.getRole(rtUser.getUserid()));
    }

    @Override
    public int sendMail(Mail mail) {
        int sendId = mail.getSendid();
        int receiverId = mail.getReceiverid();
        String receiveMail = userDao.finduserById(receiverId).getMail();

        return 0;
    }
}
