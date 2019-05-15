package com.rtworld.handle.sys;


import com.rtworld.pojo.user.*;
import com.rtworld.service.personmessage.IUserService;
import com.rtworld.service.sys.ISysService;
import com.rtworld.util.Page;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
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
    @Autowired
    private RedisTemplate redisTemplate;
    @RequestMapping("/query.do")
    public ModelAndView queryUsers(Page<RtUser> page,RtUser rtUser) {
        List<RtRole> rtRoles = sysService.getRoles();

        page.setBean(rtUser);
        ModelAndView modelAndView = new ModelAndView();
        sysService.init(page);
        modelAndView.addObject("page",page);
        modelAndView.addObject("rtRoles",rtRoles);
        modelAndView.setViewName("system");
        return modelAndView;
    }
    @RequestMapping("/real.do")
    @ResponseBody
    public RealMsg queryRealMsg(RtUser rtUser){
        RealMsg realMsg =sysService.getRealMsg(rtUser);
        return realMsg;
    }
    @RequestMapping("/realMsg.do")
    public ModelAndView updateRealMsg(RealMsg realMsg,Page<RtUser> page,RtUser rtUser){
        ModelAndView modelAndView = new ModelAndView();
        List<RtRole> rtRoles = sysService.getRoles();
        rtUser.setRealMsg(realMsg);
        page.setBean(rtUser);
        sysService.updateRealMsg(page);
        sysService.init(page);
        modelAndView.addObject("page",page);
        modelAndView.addObject("rtRoles",rtRoles);
        modelAndView.setViewName("system");
        return modelAndView;
    }
    @RequestMapping("delete.do")
    public  ModelAndView delete(Page<RtUser> page,RtUser rtUser){
        ModelAndView modelAndView =new ModelAndView();
        List<RtRole> rtRoles = sysService.getRoles();
        page.setBean(rtUser);
        sysService.toBeUnValid(rtUser);
        sysService.init(page);
        modelAndView.setViewName("system");
        modelAndView.addObject("page",page);
        modelAndView.addObject("rtRoles",rtRoles);
        return modelAndView;
    }
    @RequestMapping("/getOne.do")
    public ModelAndView queryOne(RtUser rtUser){
        ModelAndView modelAndView = new ModelAndView();
        rtUser = sysService.getOneUser(rtUser);
        List<RtRole> rtRoles = sysService.getRoles();
        sysService.setRoleToRtUser(rtUser);
        modelAndView.addObject("rtUser",rtUser);
        modelAndView.addObject("rtRoles",rtRoles);
        modelAndView.setViewName("userEdit");
        return modelAndView;
    }
    @RequestMapping("/passEx.do")
    public ModelAndView passCode(RtUser rtUser,RtUserEx rtUserEx,Page<RtUser> page){
        ModelAndView modelAndView =new ModelAndView();
        List<RtRole> rtRoles = sysService.getRoles();
        rtUser.setRtUserEx(rtUserEx);
        rtUser = sysService.msgCheck(rtUser);
        sysService.init(page);
        modelAndView.addObject("rtUser",rtUser);
        modelAndView.addObject("rtRoles",rtRoles);
        modelAndView.addObject("page",page);
        modelAndView.addObject("msg","修改成功");
        modelAndView.setViewName("system");
        return modelAndView;
    }
    @RequestMapping("/emptyEx.do")
    public ModelAndView emptyEx(RtUser rtUser,RtUserEx rtUserEx,Page<RtUser> page){
        ModelAndView modelAndView = new ModelAndView();
        sysService.deleteAllMsg(rtUser);
        page.setBean(rtUser);
        sysService.init(page);
        modelAndView.addObject("psge",page);
        modelAndView.addObject("msg","用户信息已清空");
        modelAndView.setViewName("system");
        return modelAndView;
    }
    @RequestMapping("/updateEx.do")
    public ModelAndView updateEx(RtUser rtUser,RtRole rtRole,RtUserEx rtUserEx,Page<RtUser> page){
        ModelAndView modelAndView = new ModelAndView();
        rtUser.setRtUserEx(rtUserEx);
        rtUser.setRtRole(rtRole);
        sysService.updateEXMsg(rtUser,rtUserEx);
        page.setBean(rtUser);
        sysService.init(page);
        modelAndView.addObject("psge",page);
        modelAndView.addObject("msg","用户信息已更新");
        modelAndView.setViewName("system");
        return modelAndView;
    }
    @RequestMapping("/login.do")
    public ModelAndView loginAngRegister(HttpServletRequest request, RtUser rtUser, HistoryJob historyJob, RtUserEx rtUserEx){
        ModelAndView modelAndView = new ModelAndView();
       String tel = rtUser.getTel();
       //* Subject subject = SecurityUtils.getSubject();*//*
        //System.out.println("接收到的验证码为"+code);
        rtUser = sysService.queryUserByTel(rtUser.getTel());
            if (rtUser!=null){
                modelAndView.setViewName("forward:/index.jsp");
            }else{
                rtUser.setTel(tel);
                modelAndView.setViewName("register");
            }

        if (historyJob.getCompanyName()!=null){
            historyJob.setUserId(rtUser.getId());
            sysService.saveJob(historyJob);
            rtUserEx.setPriMsgState('1');
            rtUser.setRtUserEx(rtUserEx);
            sysService.updateRtUserEx(rtUser);
        }
        HttpSession session = request.getSession();
        //*redisTemplate.opsForSet().add("rtUser",rtUser);*//*
        session.setAttribute("rtUser",rtUser);
        modelAndView.addObject("rtUser",rtUser);
        modelAndView.setViewName("forward:/index.jsp");
        return modelAndView;
    }
    @RequestMapping("/getMsg.do")
    public ModelAndView getMsg(RtUser rtUser){
        ModelAndView modelAndView = new ModelAndView();
        String tel =rtUser.getTel();
        rtUser = sysService.queryUserByTel(rtUser.getTel());

       if(rtUser.getRtUserName()==null){
           rtUser.setTel(tel);
           modelAndView.setViewName("register");
       }else{
           modelAndView.setViewName("index");
       }
        modelAndView.addObject("rtUser",rtUser);

        return modelAndView;
    }
    @RequestMapping("/setName.do")
    public ModelAndView setName(RtUser rtUser,HistoryJob historyJob){
        ModelAndView modelAndView = new ModelAndView();
        historyJob.setUserId(rtUser.getId());
        sysService.setMsgById(rtUser,historyJob);
        return modelAndView;
    }
}
