package com.rtworld.service.sys.impl;

import com.rtworld.dao.user.*;
import com.rtworld.pojo.user.*;
import com.rtworld.service.sys.ISysService;
import com.rtworld.util.Page;
import com.rtworld.util.conf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Transactional
@Service
public class SysServiceImpl implements ISysService {
    @Autowired
    private IRtUserDao rtUserDao;
    @Autowired
    private IRtRoleDao rtRoleDao;
    @Autowired
    private IRtUserExDao rtUserExDao;
    @Autowired
    private IRealMsgDao realMsgDao;
    @Autowired
    private IRtAuthority authorityDao;
    @Autowired
    private IHistoryJobDao historyJobDao;
    public void init(Page<RtUser> page) {
        page.setCounts(rtUserDao.selectCountByPage(page));
        page.setBeans(rtUserDao.selectRtUsersByRtUser(page));
        for (RtUser user : page.getBeans()) {
            user.setRtUserEx(rtUserExDao.selectRtUserExById(user.getId()));
            user.setRtRole(rtRoleDao.getRole(user.getId()));
            user.setRealMsg(realMsgDao.selectRealMsgById(user.getId()));
        }
    }

    @Override
    public List<RtRole> getRoles() {
        return rtRoleDao.getRoles();
    }


    public RealMsg getRealMsg(RtUser rtUser) {

        return realMsgDao.selectRealMsgById(rtUser.getId());
    }

    @Transactional
    public void updateRealMsg(Page<RtUser> page) {
        if(page.getBean().getRealMsg().getIsChecking() == '1'){
            realMsgDao.updateState(page.getBean().getRealMsg());
        }else{
            realMsgDao.getOutMsg(page.getBean().getRealMsg());
        }

    }

   @Transactional
    public void toBeUnValid(RtUser rtUser) {
        rtUserDao.setEffective(rtUser);
    }

    public RtUser getOneUser(RtUser rtUser) {
        return rtUserDao.selectRtUserById(rtUser.getId());
    }

    @Override
    public void setRoleToRtUser(RtUser rtUser) {
        rtUser.setRtRole(rtRoleDao.getRole(rtUser.getId()));
    }


    public RtUser msgCheck(RtUser rtUser) {
        rtUser = rtUserDao.selectRtUserById(rtUser.getId());
        rtUserDao.changeRole(rtUser);
        rtUserDao.changeCompanyName(rtUser);
        rtUser.setRtRole(rtRoleDao.getRole(rtUser.getId()));
        rtUser.setRealMsg(realMsgDao.selectRealMsgById(rtUser.getId()));
        return rtUser;
    }

    @Override
    public void deleteAllMsg(RtUser rtUser) {
        realMsgDao.deleteOneById(rtUser.getId());
        rtUserExDao.deleteOneById(rtUser.getId());
        rtRoleDao.deleteOneById(rtUser.getId());
        rtUserDao.deleteOneById(rtUser.getId());
    }

    @Override
    public void updateEXMsg(RtUser rtUser, RtUserEx rtUserEx) {
        //更新修改 角色 邮箱 公司名称
        rtUserDao.updateMC(rtUser);
        rtUserDao.updateRole(rtUser);
    }

    public RtUser queryUserByTel(String tel) {
        RtUser rtUser = rtUserDao.selectRtUserByTel(tel);
        if (rtUser == null){
            rtUserDao.addRtUser(tel);
            rtUserDao.addRole(rtUser.getId());
            rtUserExDao.addEx(rtUser.getId());
            realMsgDao.addMsg(rtUser.getId());
        }else {
            rtUser.setRtRole(rtRoleDao.getRole(rtUser.getId()));
        }
        conf.USERID = rtUser.getId();
        return rtUser;
    }

    @Override
    public Set<String> findRolesByUserId(Integer id) {
        RtRole rtRoles = rtRoleDao.getRole(id);
        Set<String> role = new HashSet<>();
        role.add(rtRoles.getRtRoleName());
        return role;
    }

    @Override
    public Set<String> findPermissionsByUserId(Integer id) {
        List<RtAuthority> rtAuthority = authorityDao.getPermissionsById(id);
        Set<String> authoritys = new HashSet<>();
        for (RtAuthority authority : rtAuthority) {
            authoritys.add(authority.getRtAuthorityName());
        }
        return authoritys;
    }


    public void saveJob(HistoryJob historyJob) {
        historyJobDao.saveMsg(historyJob);
    }



    public void updateRtUserEx(RtUser rtUser) {
        rtUserDao.updateRtUser(rtUser);
        rtUserExDao.updateExMsg(rtUser.getRtUserEx());
    }

    @Override
    public RtUser getOneByTel(String tel) {
        return rtUserDao.selectRtUserByTel(tel);
    }

    @Override
    public void setMsgById(RtUser rtUser, HistoryJob historyJob) {
        rtUserDao.saveRtUser(rtUser);
        rtUserDao.changeUser(rtUser);
        rtUser.setRtRole(rtRoleDao.getRole(rtUser.getId()));
        historyJobDao.updateMsg(historyJob);
    }
}
