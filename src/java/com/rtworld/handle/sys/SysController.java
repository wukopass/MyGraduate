package com.rtworld.handle.sys;


import com.rtworld.pojo.MemberUser;
import com.rtworld.service.personmessage.IUserService;
import com.rtworld.service.sys.ISysService;
import com.rtworld.util.Page;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import redis.clients.jedis.Jedis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

@RequestMapping("/sys")
@Controller
public class SysController {
    @Autowired
    private ISysService sysService;
    @Autowired
    private IUserService userService;
    @RequestMapping("/real.do")
    @ResponseBody
    public String hello(){
        MemberUser memberUser = userService.selectRtUserMessage(1);
        String aa = memberUser.toString();
        return  aa;

    }


}
