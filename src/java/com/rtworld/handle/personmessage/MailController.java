package com.rtworld.handle.personmessage;

import com.rtworld.pojo.Mail;
import com.rtworld.pojo.MemberUser;
import com.rtworld.service.personmessage.IMailService;
import com.rtworld.service.personmessage.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@RequestMapping("/mail")
@Controller
public class MailController {

    @Autowired
    private  IMailService mailService;



    /**
     *
     *
     * @param senderMailId
     * @param receiverMailId
     * @param content
     * @return
     * @throws Exception
     */
    @RequestMapping("/sendMail.do")
    public ModelAndView sendMail(int senderMailId,int receiverMailId,String content){

        mailService.sendMail(receiverMailId,content);
        mailService.insertMail(senderMailId,receiverMailId,content);
        return new ModelAndView("");
    }


}
