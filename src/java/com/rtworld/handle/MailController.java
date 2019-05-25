package com.rtworld.handle;

import com.alibaba.fastjson.JSONObject;
import com.rtworld.pojo.Mail;
import com.rtworld.service.IMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping(value= "/mail",produces = "text/plain;charset=UTF-8")
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
        return new ModelAndView("writeNotes");
    }
    @RequestMapping("/selectMail.do")
    @ResponseBody
    public String mail( int id){
        List<Mail> mail = mailService.getMySendMails(id);
        JSONObject obj = new JSONObject();
        obj.put("data",mail);
        return obj.toJSONString();
    }


}
