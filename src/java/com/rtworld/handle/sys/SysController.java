package com.rtworld.handle.sys;


import com.rtworld.pojo.MemberUser;
import com.rtworld.service.personmessage.IUserService;
import com.rtworld.service.sys.ISysService;
import com.rtworld.util.Cons;
import com.rtworld.util.Page;
import com.rtworld.vo.RegisterVO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@RequestMapping("/sys")
@Controller
public class SysController {
    @Autowired
    private ISysService sysService;
    @Autowired
    private IUserService userService;


    @RequestMapping("/login.do")
    public ModelAndView loginAndRegister(HttpServletRequest request,String username,String password) {
        ModelAndView model= new ModelAndView();
        HttpSession session = request.getSession();
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        String error = null;
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            error = "用户名不存在";
        } catch (IncorrectCredentialsException e) {
            error = "密码错误";
        } catch (ExcessiveAttemptsException e) {
            // TODO: handle exception
            error = "登录失败多次，账户锁定10分钟";
        } catch (AuthenticationException e) {
            // 其他错误，比如锁定，如果想单独处理请单独catch处理
            error = "其它错误登录异常：" + e.getMessage();
        }
        if (error != null) {// 出错了，返回登录页面
            //request.setAttribute("error", error);
             model.addObject("error",error);
             model.setViewName("login");
             return  model;
        } else {// 登录成功,找出用户所有的信息
            MemberUser memberUser = userService.findUser(username);
            memberUser.setLoginState(1);
            session.setAttribute("memberUser",memberUser);
            //model.setViewName("mainMenu");
            return new ModelAndView("redirect:/Quan/mainMenu.jsp");
        }
    }
    @RequestMapping("/register.do")
    @ResponseBody
    public ModelAndView Register(RegisterVO vo,HttpServletResponse response) throws IOException, InterruptedException {
      ModelAndView model = new ModelAndView();
      String username = vo.getUsername();
      String mail = vo.getMail();
      //验证是否有效
      int count = userService.registerValid(username,mail);
      //验证没问题的话开始注册业务
      if(count == Cons.SUCCESS_REGISTER){
          userService.registerUser(vo);
          model.addObject(Cons.CODE,count);
          Thread.currentThread().sleep(1000);
          model.setViewName("login");
          return  model;
      }else{
          model.addObject(Cons.CODE,count);
          Thread.currentThread().sleep(1000);
          model.setViewName("register");
          return  model;
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


















