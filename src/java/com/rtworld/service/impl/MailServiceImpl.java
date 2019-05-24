package com.rtworld.service.impl;

import com.rtworld.dao.IMailDao;
import com.rtworld.dao.IUserDao;
import com.rtworld.pojo.Mail;
import com.rtworld.service.IMailService;
import com.rtworld.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.List;
import java.util.Properties;

@Transactional
@Service
public class MailServiceImpl implements IMailService {
    public  static  final  String MAIL_HOST = "smtp.qq.com";
    public static final  String PROTOCOL = "smtps";
    public static final String MAIL_USER = "1379028478@qq.com";
    public static final String PASSWORD ="ciivowuabfssjbca";
    @Autowired
    private IMailDao mailDao;
    @Autowired
    private IUserDao userDao;
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
        if("0".equals(mail.getIsread()+"")){
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
    //得到信件的发送和接收名
    public void setrtUserName(List<Mail> list){
        for (Mail mail : list) {
            mail.setSendName(userDao.selectUserById(mail.getSendid()).getUsername());
            mail.setReceiveName(userDao.selectUserById(mail.getReceiverid()).getUsername());
        }
    }

    public String sendMail(int receiverMailId,String content) {
        Properties prop = new Properties();
        prop.setProperty("mail.host",MAIL_HOST);
        prop.setProperty("mail.transport.protocol",PROTOCOL);
        prop.setProperty("mail.smtp.auth","true");
        Session session = Session.getInstance(prop);
        session.setDebug(true);
        Transport ts = null;
        try {
            ts = session.getTransport();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        }
        try {
            //使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器。
            // 用户名和密码都通过验证之后才能够正常发送邮件给收件
            ts.connect(MAIL_HOST,MAIL_USER,PASSWORD);
            //ts.connect("smtp.qq.com","1379028478@qq.com","wumymail258");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        //得到收件人邮箱
        String  receiverMail = userDao.selectUserById(receiverMailId).getMail();
        Message message = null;
        try {
            message = createSimpleMail(session,content,receiverMail);
        } catch (Exception e) {
            e.printStackTrace();
            return "创建邮件失败";
        }
        try {
            ts.sendMessage(message,message.getAllRecipients());
        } catch (MessagingException e) {
            e.printStackTrace();
            return "发送邮件邮件异常";
        }
        try {
            ts.close();
        } catch (MessagingException e) {
            e.printStackTrace();
            return "关闭邮件异常";
        }
        return "success";
    }
   //数据库操作，插入邮件表
    @Override
    public int  insertMail(int senderMailId, int receiverMailId, String title,String content) {
        Mail mail = new Mail();
        mail.setSendid(senderMailId);
        mail.setTitle(title);
        mail.setContent(content);
        mail.setReceiverid(receiverMailId);
        mail.setIsread(0);
        mail.setIseffective(0);
        mail.setCreatetime(StringUtils.fmtDateToStr24(new Date()));
        int success = mailDao.insertMail(mail);
        return  success;
    }

    //创建邮件
    public static MimeMessage createSimpleMail(Session session, String content, String receiveMail)
            throws Exception {
        //创建邮件对象
        MimeMessage message = new MimeMessage(session);
        //指明邮件的发件人
        message.setFrom(new InternetAddress(MAIL_USER));
        //指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveMail));
        //邮件的标题
        message.setSubject("只包含文本的简单邮件");
        //邮件的文本内容
        message.setContent(content, "text/html;charset=UTF-8");
        //返回创建好的邮件对象
        return message;
    }
    
}
