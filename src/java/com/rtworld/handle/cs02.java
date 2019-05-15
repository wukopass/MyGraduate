package com.rtworld.handle;

import com.rtworld.pojo.user.RtUser;
import com.rtworld.service.Ics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("cs")
public class cs02 {
    @Autowired
    private Ics ics;

    /*@Operation*/
    @RequestMapping("css.do")
    public ModelAndView cs(){
        ModelAndView mv = new ModelAndView("forward:/index.jsp");
        System.out.println("进来了cs");

        ics.cs(new RtUser());

        return mv;
    }
}
