package com.rtworld.handle.sys;


import com.alibaba.fastjson.JSONObject;
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
import org.springframework.ui.Model;
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
            //用户被删除了没法登陆
            if(memberUser.getIseffective() == 0){
                error = "该用户无效，请联系管理员激活1379228478@qq.com";
                model.addObject("error",error);
                model.setViewName("login");
                return  model;
            }
            //前台判断用户的登录状态
            session.setAttribute("memberUser",memberUser);
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

    @RequestMapping("/logout.do")
    public ModelAndView loginOut(HttpServletRequest request)  {
        //注销session
        request.getSession().invalidate();
        //response.sendRedirect("/Quan/mainMenu.jsp");
        return new ModelAndView("redirect:/Quan/mainMenu.jsp");
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

    /**
     *用户进入后台的跳转
     * @param userid
     * @return
     */
   /* @RequestMapping("/redirect.do")
    public  ModelAndView redirect(int userid){
        ModelAndView myMv = new ModelAndView();
        myMv.addObject("userid",userid);
        myMv.setViewName("/backMenu");
        return myMv;
    }*/
    @RequestMapping("/backMenu.do")
    @ResponseBody
    public ModelAndView getBackMenuByUserId(int userid){
        ModelAndView mv = new ModelAndView();
        MemberUser user = null;
        user = userService.grantAuth(userid);
        mv.addObject("userBack",user);
        mv.setViewName("/backMenu");
        if(user == null){
            return  null;
        }
        return mv;
    }


}


















