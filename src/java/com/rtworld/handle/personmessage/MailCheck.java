package com.rtworld.handle.personmessage;

import com.rtworld.service.personmessage.IUserService;
import com.rtworld.util.conf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

@RequestMapping("Mail")
@Controller
public class MailCheck{
    @Autowired
    private IUserService userService;
    @RequestMapping("sendMail.do")
    @ResponseBody
    public int sendMail(String email){
        email = "357491282@qq.com";
        //String token=Encrypt.md5(email+pwd+time);
        String token="huangboling";
        String id= UUID.randomUUID().toString();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        StringBuffer sb=new StringBuffer("<div style=\"width:660px;overflow:hidden;border-bottom:1px solid #bdbdbe;\"><div style=\"height:52px;overflow:hidden;border:1px solid #464c51;background:#353b3f url(http://www.lofter.com/rsc/img/email/hdbg.png);\"><a href=\"http://www.lofter.com?mail=qbclickbynoticemail_20120626_01\" target=\"_blank\" style=\"display:block;width:144px;height:34px;margin:10px 0 0 20px;overflow:hidden;text-indent:-2000px;background:url(http://www.lofter.com/rsc/img/email/logo.png) no-repeat;\">LOFTER</a></div>"+"<div style=\"padding:24px 20px;\">您好，"+email+"<br/><br/>融投\"专注兴趣、分享创作\"的轻博客产品，旨在为\"热爱记录生活、追求时尚品质、崇尚自由空间\"的你，打造一个全新而定展示平台！<br/><br/>请点击下面链接激活账号，24小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
        sb.append("<a href=\"http://localhost:8088/Mail/reciver.do?op=activate&id=");
        sb.append(id);
        sb.append("&token=");
        sb.append(token);
        sb.append("\">http://localhost:8088/Mail/reciver.do?op=activate&id=");
        sb.append(id);
        sb.append("&token=");
        sb.append(token);
        sb.append("</a>"+"<br/>如果以上链接无法点击，请把上面网页地址复制到浏览器地址栏中打开<br/><br/><br/><br/>"+sdf.format(new Date())+ "</div></div>" );

        //发送邮件
        send(email, sb.toString());
      /*  RtUserEx rtUserEx = new RtUserEx();
        rtUserEx.setUserId(conf.USERID);
        rtUserEx.setMailState('0');
        rtUserEx.setMailCode(token);
        userService.updateMailState(rtUserEx);*/
        return 1;
    }
    public static final String HOST = "smtp.163.com";
    public static final String FROM = "18816406854@163.com";//发件人的email
    public static final String PWD = "357491282tl";//发件人密码
    /**
     * 获取Session
     * @return
     */
    private static Session getSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);//设置服务器地址
//        props.put("mail.store.protocol" , PROTOCOL);//设置协议
//        props.put("mail.smtp.port", PORT);//设置端口
        props.put("mail.smtp.auth" , "true");

        Authenticator authenticator = new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PWD);
            }

        };
        Session session = Session.getDefaultInstance(props , authenticator);

        return session;
    }
    public void send(String toEmail , String content) {
        Session session = getSession();
        try {
            //  System.out.println("--send--"+content);
            // Instantiate a message
            Message msg = new MimeMessage(session);

            //Set message attributes
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress[] address = {new InternetAddress(toEmail)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject("账号激活邮件");
            msg.setSentDate(new Date());
            msg.setContent(content , "text/html;charset=utf-8");

            //Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
    @RequestMapping("reciver.do")
    @ResponseBody
    public String reciver(String token,String id,String op){
       /* RtUserEx rtUserEx = new RtUserEx();
        rtUserEx.setUserId(conf.USERID);
        rtUserEx.setMailState('1');
        rtUserEx.setMailCode(token);
        userService.updateMailState(rtUserEx);*/
        return "邮件验证成功：";
    }

}
