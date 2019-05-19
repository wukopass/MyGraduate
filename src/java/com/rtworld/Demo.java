package com.rtworld;

import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import redis.clients.jedis.Jedis;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Demo {
     //测试redis的连接
    public static void main(String[]args) throws Exception {
        Properties prop = new Properties();
        prop.setProperty("mail.host","smtp.qq.com");
        prop.setProperty("mail.transport.protocol","smtps");
        prop.setProperty("mail.smtp.auth","true");
        Session session = Session.getInstance(prop);
        session.setDebug(true);
        Transport ts = session.getTransport();
        try {
            //使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器。
            // 用户名和密码都通过验证之后才能够正常发送邮件给收件
            ts.connect("smtp.qq.com","1379028478@qq.com","ciivowuabfssjbca");
            //ts.connect("smtp.qq.com","1379028478@qq.com","wumymail258");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        Message message = createSimpleMail(session);
        ts.sendMessage(message,message.getAllRecipients());
        ts.close();

    }
    public static MimeMessage createSimpleMail(Session session)
            throws Exception {
          //创建邮件对象
            MimeMessage message = new MimeMessage(session);
          //指明邮件的发件人
           message.setFrom(new InternetAddress("1379028478@qq.com"));
         //指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
           message.setRecipient(Message.RecipientType.TO, new InternetAddress("1379028478@qq.com"));
          //邮件的标题
           message.setSubject("只包含文本的简单邮件");
            //邮件的文本内容
           message.setContent("你好帅啊，万瑜！", "text/html;charset=UTF-8");
         //返回创建好的邮件对象
           return message;
           }

}
