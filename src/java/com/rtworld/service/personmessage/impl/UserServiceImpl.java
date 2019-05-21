package com.rtworld.service.personmessage.impl;


import com.rtworld.dao.user.IUserDao;

import com.rtworld.pojo.Mail;
import com.rtworld.pojo.MemberUser;
import com.rtworld.service.personmessage.IUserService;
import com.rtworld.util.Cons;
import com.rtworld.util.StringUtils;
import com.rtworld.vo.RegisterVO;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public MemberUser selectRtUserMessage(int id) {
       MemberUser  rt = null;
        rt = userDao.selectUserById(id);
        return rt;
    }

    @Override
    public MemberUser selectRtUserAllMessage(int id) {
        MemberUser rt = null;
        rt = userDao.selectUserById(id);
        return rt;
    }

    public Integer updatePasswordById(MemberUser rtUser){
        return userDao.updatePasswordById(rtUser);
    }

    @Override
    public int registerValid(String username, String mail) {
        int  userValid = userDao.checkUsernameValid(username);
        int  mailValid = userDao.checkMailValid(mail);
        if(userValid > 0){
            return Cons.ERROR_REPEAT_USERNAME;
        }else if(mailValid > 0){
            return  Cons.ERROR_REPEAT_MAIL;
        }else{
            return  Cons.SUCCESS_REGISTER;
        }
    }

    @Override
    public void registerUser(RegisterVO vo) {
         MemberUser memberUser  = new MemberUser();
         memberUser.setUsername(vo.getUsername());
         //得到加密后的密码和盐
         List<String> myList = passWord(vo.getUsername(),vo.getPassword());
         String password = myList.get(0);
         String salt = myList.get(1);
         memberUser.setPassword(password);
         memberUser.setTel(vo.getTel());
         memberUser.setMail(vo.getMail());
         memberUser.setIseffective(1);
         //设置两个半时间
         memberUser.setCreatetime(StringUtils.fmtDateToStr24(new Date()));
         memberUser.setUpdatetime(StringUtils.fmtDateToStr24(new Date()));
         memberUser.setSalt(salt);
         int success =  userDao.adddUser(memberUser);
         if(success == 1 ){
             System.err.println("success");
         }
    }

    @Override
    public MemberUser findUser(String username) {
        return userDao.findUserByUserName(username);
    }

    @Override
    public MemberUser findUserById(int userid) {
        return userDao.finduserById(userid);
    }

    //加密算法返回加密后的密码和盐保存到数据库,5.17(done)
    protected  List<String> passWord(String username, String password){
        String algorithmName = "md5";
        String salt1 = username;
        int hashIterations = 3;
        String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
        SimpleHash hash = new SimpleHash(algorithmName, password,
                salt1+salt2 , hashIterations);
        String encodedPassword = hash.toHex();
        List encoded = new ArrayList();
        encoded.add(0,encodedPassword);
        encoded.add(1,salt2);
        System.out.println(encodedPassword);
        System.out.println(salt2);
        return  encoded;
    }


}
