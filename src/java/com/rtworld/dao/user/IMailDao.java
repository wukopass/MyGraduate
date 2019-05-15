package com.rtworld.dao.user;

import com.rtworld.pojo.user.Mail;

import java.util.List;

public interface IMailDao {
    //通过寄件人查询
    List<Mail> selectMailsBySenderId(int id);
    //通过收接收人查询
    List<Mail> selectMailsByReciverId(int id);
    //通过id查询邮件
    Mail selectMailById(int id);
    //查找我的新邮件
    List<Mail> selectNotReadMails(int id);
    //邮件的生成
    Integer insertMail(Mail mail);
    //邮件的删除
    Integer deleteMailById(int id);
    //读邮件
    Integer readMail(int id);
    //站内消息
    List<Mail> selectMySysMails(int id);
    //未读信息条数
    Integer selectCountNotMails(int id);
    //未读的系统信息
    Integer selectMySysCount(int id);
    //
}
