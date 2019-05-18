package com.rtworld.handle.personmessage;

import com.rtworld.pojo.Base;
import com.rtworld.pojo.Mail;
import com.rtworld.pojo.MemberUser;
import com.rtworld.service.personmessage.IMailService;
import com.rtworld.service.personmessage.IUserService;
import com.rtworld.util.Cons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Time;
import java.util.List;

@Controller
@RequestMapping("/user")
public class RtUserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IMailService mailService;
    @RequestMapping("/select.do")
    public ModelAndView pageUser(HttpServletRequest request){
        return new ModelAndView();
    }
    @RequestMapping("myMessage.do")
    public ModelAndView rtUserMessage(){
        ModelAndView mv = new ModelAndView("personMessage/user_info");
        MemberUser rt = null;
        if(rt == null){
            rt = userService.selectRtUserAllMessage(Cons.USERID);
            rt = userService.selectRtUserMessage(Cons.USERID);
            System.out.println("我走了dao");
        }
        mv.addObject("RtUserAll",rt);
        return mv;
    }

    /**
     * 找到所有的 我发送的邮件
     * @param
     * @return
     */
    @RequestMapping("mySendMails.do")
    @ResponseBody
    public List<Mail> mySendMail(){ ;
        List<Mail> list = null;
        list = mailService.getMySendMails(Cons.USERID);
        return list;
    }

    /**
     * 更新用户密码
     * @param rtUser
     * @return
     */
    @RequestMapping("update_password.do")
    @ResponseBody
    public Integer  MyUpdatePassword(MemberUser rtUser){
        rtUser.setUserid(Cons.USERID);
        int i = userService.updatePasswordById(rtUser);
        return i;
    }

    /**
     * 邮件的详细信息
     * @param id
     * @return
     */
    @RequestMapping("MailMessage.do")
    public ModelAndView MailMessage(int id){
        ModelAndView mv = new ModelAndView("personMessage/SendEMail");
        Mail mail = new Mail();
        mail.setId(id);
        mail = mailService.selectMailById(id);
        mv.addObject("MailMessage",mail);
        mv.addObject("tip","ck");
        return mv;
    }

    /**
     * 所有未读的全部邮件
     * @param id
     * @return
     */
    @RequestMapping("myNotReadMail.do")
    public ModelAndView myNotReadMail(int id){
        ModelAndView mv = new ModelAndView("personMessage/RtUserMessage");
        List<Mail> list = null;
        list = mailService.getMyReciveridNotReadMails(id);
        mv.addObject("NotReadMail",list);
        return mv;
    }

    /**
     * 查到所有的邮件信息
     * @param
     * @return
     */
    @RequestMapping("myReciverMail.do")
    @ResponseBody
    public List<Mail> myReciverMail(){
        List<Mail> list = null;
        list = mailService.getMyReciveridMails(Cons.USERID);
        return list;
    }

    /**
     * 得到系统消息
     * @param
     * @return
     */
    @RequestMapping("MySysMails.do")
    @ResponseBody
    public List<Mail> MySysMails(){
        List<Mail> list = null;
        list = mailService.getMySysMails(Cons.USERID);
        return list;
    }
    //转接邮件jsp
    @RequestMapping("sendMail.do")
    public ModelAndView sendMAil(int id){
        ModelAndView mv = new ModelAndView("personMessage/SendEMail");
        System.out.println(id);
        mv.addObject("reciverID",id);
        return mv;
    }

    @RequestMapping("insertMail.do")
    public ModelAndView insertMail(Mail mail){
        ModelAndView mv = new ModelAndView("personMessage/SendEMail");
        mail.setSendid(Cons.USERID);
        mail.setIsread('0');
        setBase(mail);
        mailService.insertMail(mail);
        System.out.println(123);
        return mv;
    }


    public void setBase(Base base){
        base.setCreateTime(new Time(System.currentTimeMillis()));
        base.setUpdateTime(new Time(System.currentTimeMillis()));

    }

}
