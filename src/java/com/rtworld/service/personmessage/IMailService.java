package com.rtworld.service.personmessage;

import com.rtworld.pojo.Mail;


import java.util.List;

public interface IMailService {
    //得到我的所有的接收的邮箱信息
    List<Mail> getMyReciveridMails(int id);
    //得到我的所有的发送邮箱信息
    List<Mail> getMySendMails(int id);
    //得到我的所有的已读邮箱信息
    List<Mail> getMyReciveridReadMails(int id);
    //得到我的所有的未读邮箱信息
    List<Mail> getMyReciveridNotReadMails(int id);
    //通过id 返回邮件具体信息
    Mail selectMailById(int id);
    //邮件的生成
    Integer insertMail(Mail mail);
    //邮件的删除
    Integer deleteMailById(int id);
    //得到我的站内消息
    List<Mail> getMySysMails(int id);

    //未读信息的数量
    public Integer getNotReadMailsCount(int id);
    //得到我的项目总量
    public Integer getMyCountProject(int id);
    //得到我的站内信息总量
    public Integer getMySysCountProject(int id);
    //得到看我的项目总人数
    public Integer getLookMyProject(int id);


}
