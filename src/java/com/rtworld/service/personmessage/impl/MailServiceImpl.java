package com.rtworld.service.personmessage.impl;

import com.rtworld.dao.user.IMailDao;
import com.rtworld.dao.user.IRtUserDao;
import com.rtworld.pojo.user.AdditionMessage;
import com.rtworld.pojo.user.Mail;
import com.rtworld.pojo.user.RtUser;
import com.rtworld.service.personmessage.IMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;
import java.util.List;
@Transactional
@Service
public class MailServiceImpl implements IMailService {

    @Autowired
    private IMailDao mailDao;

    @Autowired
    private IRtUserDao rtUserDao;

    @Override
    public List<Mail> getMyReciveridMails(int id) {
        List<Mail> list = null;
        list = mailDao.selectMailsByReciverId(id);
        setrtUserName(list);
        return list;
    }

    @Override
    public List<Mail> getMySendMails(int id) {
        List<Mail> list = null;
        list = mailDao.selectMailsBySenderId(id);
        setrtUserName(list);
        return list;
    }

    @Override
    public List<Mail> getMyReciveridReadMails(int id) {
        return null;
    }

    @Override
    public List<Mail> getMyReciveridNotReadMails(int id) {
        List<Mail> list = null;
        list = mailDao.selectNotReadMails(id);
        return list;
    }

    @Override
    public Mail selectMailById(int id) {
        Mail mail = null;
        mail = mailDao.selectMailById(id);
        if("0".equals(mail.getIsRead()+"")){
            mailDao.readMail(id);
        }
        return mail;
    }


    @Override
    public Integer insertMail(Mail mail) {
        if(mail == null){
            return -1;
        }
        int i = mailDao.insertMail(mail);
        return i;
    }

    @Override
    public Integer deleteMailById(int id) {
        int i = mailDao.deleteMailById(id);
        return i;
    }

    @Override
    public List<Mail> getMySysMails(int id) {
        List<Mail> list = null;
        list = mailDao.selectMySysMails(id);
        setrtUserName(list);
        return list;
    }

    public Integer getNotReadMailsCount(int id){
        Integer i = 0;
        i = mailDao.selectCountNotMails(id);
        return  i;
    }

    public Integer getMyCountProject(int id){
        int i = 0;
        return i;
    }

    public Integer getMySysCountProject(int id){
        int i = 0;
        return i;
    }

    public Integer getLookMyProject(int id){
        int i = 0;
        return i;
    }

    public void setAdditionMessage(RtUser rtUser){
        AdditionMessage additionMessage = new AdditionMessage();
        additionMessage.setMyProject(getMyCountProject(rtUser.getId()));
        additionMessage.setNotRead(getNotReadMailsCount(rtUser.getId()));
        additionMessage.setOtherPeople(getLookMyProject(rtUser.getId()));
        additionMessage.setSysMessage(getMySysCountProject(rtUser.getId()));
        rtUser.setAdditionmessage(additionMessage);
    }

    public void setrtUserName(List<Mail> list){
        for (Mail mail : list) {
            mail.setSendName(rtUserDao.selectRtUserById(mail.getSenderId()).getRtUserName());
            mail.setReciverName(rtUserDao.selectRtUserById(mail.getReciverId()).getRtUserName());
        }
    }
}
