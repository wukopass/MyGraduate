package com.rtworld.handle;

import com.rtworld.pojo.Mail;
import com.rtworld.service.ISysService;
import com.rtworld.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
@RequestMapping("/hello")
@Controller
public class testMail {
    @Autowired
    private ISysService sysService;

    @RequestMapping("/hello.do")
    public int insertMail(Mail mail){
        mail.setSendid(13);
        mail.setTitle("测试");
        mail.setContent("这是心得呼唤");
        mail.setReceiverid(13);
        mail.setIsread(0);
        mail.setIseffective(0);
        mail.setCreatetime(StringUtils.fmtDateToStr24(new Date()));
        int success = sysService.sendMail(mail);
        return  success;
    }

}
