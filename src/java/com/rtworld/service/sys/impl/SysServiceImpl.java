package com.rtworld.service.sys.impl;

import com.rtworld.dao.user.*;
import com.rtworld.pojo.Authority;
import com.rtworld.pojo.MemberUser;
import com.rtworld.pojo.Role;
import com.rtworld.service.sys.ISysService;
import com.rtworld.util.Page;
import com.rtworld.util.conf;
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
    private IUserDao rtUserDao;
    @Autowired
    private IRoleDao rtRoleDao;
    @Autowired
    private IAuthority authorityDao;



    public void init(Page<MemberUser> page) {
        page.setCounts(rtUserDao.selectCountByPage(page));
        page.setBeans(rtUserDao.selectRtUsersByRtUser(page));
        for (MemberUser user : page.getBeans()) {
            user.setRole(rtRoleDao.getRole(user.getUserid()));
        }
    }

    @Override
    public List<Role> getRoles() {
        return rtRoleDao.getRoles();
    }

   @Transactional
    public void toBeUnValid( MemberUser rtUser) {
        rtUserDao.setEffective(rtUser);
    }

    public  MemberUser getOneUser( MemberUser  memberUser) {
        return rtUserDao.selectRtUserById( memberUser.getUserid());
    }

    @Override
    public void setRoleToRtUser(MemberUser rtUser) {
        rtUser.setRole(rtRoleDao.getRole(rtUser.getUserid()));
    }


    public MemberUser msgCheck(MemberUser rtUser) {
        rtUser = rtUserDao.selectRtUserById(rtUser.getUserid());
        rtUserDao.changeRole(rtUser);
       // rtUserDao.changeCompanyName(rtUser);
        rtUser.setRole(rtRoleDao.getRole(rtUser.getUserid()));
        //rtUser.setRealMsg(realMsgDao.selectRealMsgById(rtUser.getId()));
        return rtUser;
    }

    @Override
    public void deleteAllMsg(MemberUser rtUser) {
        rtRoleDao.deleteOneById(rtUser.getUserid());
        rtUserDao.deleteOneById(rtUser.getUserid());
    }
    public void updateEXMsg(MemberUser rtUser) {
        //更新修改 角色 邮箱 公司名称
        rtUserDao.updateMC(rtUser);
        rtUserDao.updateRole(rtUser);
    }

    public MemberUser queryUserByTel(String tel) {
        MemberUser  rtUser = rtUserDao.selectRtUserByTel(tel);
        if (rtUser == null){
            rtUserDao.addMembetUser(tel);
            rtUserDao.addRole(rtUser.getUserid());
        }else {
            rtUser.setRole(rtRoleDao.getRole(rtUser.getUserid()));
        }
        conf.USERID = rtUser.getUserid();
        return rtUser;
    }

    @Override
    public Set<String> findRolesByUserId(Integer id) {
        Role rtRoles = rtRoleDao.getRole(id);
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
    public MemberUser getOneByTel(String tel) {
        return rtUserDao.selectRtUserByTel(tel);
    }

    @Override
    public void setMsgById(MemberUser rtUser) {
        rtUserDao.saveRtUser(rtUser);
        rtUserDao.changeUser(rtUser);
        rtUser.setRole(rtRoleDao.getRole(rtUser.getUserid()));
    }
}
