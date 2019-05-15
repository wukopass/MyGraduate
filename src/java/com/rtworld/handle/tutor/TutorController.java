package com.rtworld.handle.tutor;

import com.rtworld.pojo.guidance.Tutor;
import com.rtworld.service.tutor.ITutorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/tutor")
public class TutorController  {
    @Autowired
    private ITutorService tutorService;

    @RequestMapping("/search.do")
    public ModelAndView searchTutor(){
        ModelAndView mv = new ModelAndView("tutor/guidance");
        List<Tutor> list = null;
        list = tutorService.searchTutor();
        mv.addObject("tutor",list);
        return mv;
    }

    @RequestMapping("/searchOne.do")
    public ModelAndView searchOneTutor(int id){
        ModelAndView mv = new ModelAndView("tutor/tutordata");
        Tutor tutor = null;
        tutor = tutorService.searchOneTutor(id);
        mv.addObject(tutor);
        return mv;
    }
}
