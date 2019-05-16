package com.rtworld.handle.sys;


import com.rtworld.pojo.MemberUser;
import com.rtworld.service.personmessage.IUserService;
import com.rtworld.service.sys.ISysService;
import com.rtworld.util.Page;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
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
    @RequestMapping("/login.do")
    public String loginAndRegister(HttpServletRequest request,String username,String password) {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        String error = null;
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            error = "用户名/密码错误";
        } catch (IncorrectCredentialsException e) {
            error = "用户名/密码错误";
        } catch (ExcessiveAttemptsException e) {
            // TODO: handle exception
            error = "登录失败多次，账户锁定10分钟";
        } catch (AuthenticationException e) {
            // 其他错误，比如锁定，如果想单独处理请单独catch处理
            error = "其他错误：" + e.getMessage();
        }
        if (error != null) {// 出错了，返回登录页面
            request.setAttribute("error", error);
            return error;
        } else {// 登录成功

            //session.setAttribute("memberUser",memberUser);
            return "success";
        }
    }
        public static void main(String[] args) {
            String algorithmName = "md5";
            String username = "小吴";
            String password = "123456";
            String salt1 = username;
            int hashIterations = 3;
            String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
            SimpleHash hash = new SimpleHash(algorithmName, password,
                    salt1+salt2 , hashIterations);
            String encodedPassword = hash.toHex();
            System.out.println(encodedPassword);
            System.out.println(salt2);
        }

    }


















