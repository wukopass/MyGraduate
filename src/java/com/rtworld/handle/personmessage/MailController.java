package com.rtworld.handle.personmessage;

import com.alibaba.fastjson.JSONObject;
import com.rtworld.pojo.Mail;
import com.rtworld.pojo.MemberUser;
import com.rtworld.service.personmessage.IMailService;
import com.rtworld.service.personmessage.IUserService;
import org.codehaus.jackson.map.util.JSONPObject;
import org.mortbay.util.ajax.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@RequestMapping("/mail")
@Controller
public class MailController {

    @Autowired
    private  IMailService mailService;
    /**
     * @param senderMailId
     * @param receiverMailId
     * @param content
     * @return
     * @throws Exception
     */
    @RequestMapping("/sendMail.do")
    public ModelAndView sendMail(int senderMailId,int receiverMailId,String title,String content){

        String success = mailService.sendMail(receiverMailId,content);
        int sqlSuccess = mailService.insertMail(senderMailId,receiverMailId,title,content);
        return new ModelAndView("");
    }
    @RequestMapping("/selectMail.do")
    @ResponseBody
    public String mail( int id){
        List<Mail> mail = mailService.getMySendMails(id);
       // String data = com.alibaba.fastjson.JSON.toJSONString(mail);
        JSONObject obj = new JSONObject();
        obj.put("data",mail);
        return obj.toJSONString();
    }


}
