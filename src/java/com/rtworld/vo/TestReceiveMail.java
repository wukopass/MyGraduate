package com.rtworld.vo;

import javax.mail.*;
import java.io.IOException;
import java.util.Properties;

public class TestReceiveMail {

    public static void main(String[] args) throws MessagingException, IOException {
              String pop3Server = "pop.qq.com";
              String protocol = "pop3s";
              String username = "1379028478@qq.com";
              String password = "ciivowuabfssjbca"; // QQ邮箱的SMTP的授权码，什么是授权码，它又是如何设置？
              Properties props = new Properties();
              props.setProperty("mail.store.protocol", protocol); // 使用的协议（JavaMail规范要求）
              props.setProperty("mail.pop3.host", pop3Server);// 发件人的邮箱的 SMTP服务器地址
             // 获取连接
             Session session = Session.getDefaultInstance(props);
             session.setDebug(true);
              // 获取Store对象
              Store store = session.getStore(protocol);
             store.connect(pop3Server, username, password); // POP3服务器的登陆认证
             // 通过POP3协议获得Store对象调用这个方法时，邮件夹名称只能指定为"INBOX"
             Folder folder = store.getFolder("inbox");// 获得用户的邮件帐户
              folder.open(Folder.READ_WRITE); // 设置对邮件帐户的访问权限
        System.err.println("未读邮件数: " + folder.getUnreadMessageCount());
        System.out.println("删除邮件数: " + folder.getDeletedMessageCount());
        System.out.println("新邮件: " + folder.getNewMessageCount());
        // 获得收件箱中的邮件总数
        System.out.println("邮件总数: " + folder.getMessageCount());
        Message[] messages = folder.getMessages();// 得到邮箱帐户中的所有邮件
       // System.err.println(messages[0].getContent());
        messages[2].writeTo(System.out);
        for (Message message : messages) {
                       String subject = message.getSubject();// 获得邮件主题
                     Address from = (Address) message.getFrom()[0];// 获得发送者地址
                      System.out.println("邮件的内容为：");
                     message.writeTo(System.out);// 输出邮件内容到控制台
                    }
                folder.close(false);// 关闭邮件夹对象
                store.close(); // 关闭连接对象
    }
}
