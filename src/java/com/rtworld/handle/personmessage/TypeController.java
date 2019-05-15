package com.rtworld.handle.personmessage;


import com.rtworld.pojo.util.CoopType;
import com.rtworld.pojo.util.Industry;
import com.rtworld.pojo.util.InvestType;
import com.rtworld.pojo.util.UserAndType;
import com.rtworld.service.personmessage.ITypeService;
import com.rtworld.util.conf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("type")
public class TypeController {

    @Autowired
    private ITypeService typeService;
   /* conf.USERID*/
    @RequestMapping("MyCoopTypeMessage.do")
    @ResponseBody
    public List<CoopType> getMyCoopTypeMessage(){
        List<CoopType> list = null;
        list = typeService.selectUserCoop();
        return list;
    }
    @RequestMapping("MyIndustryMessage.do")
    @ResponseBody
    public List<Industry> getMyIndustryMessage(){
        List<Industry> list = null;
        list = typeService.selectUserIndustry();
        return list;
    }
    @RequestMapping("MyInvestTypeMessage.do")
    @ResponseBody
    public List<InvestType> getMyInvestTypeMessage(){
        List<InvestType> list = null;
        list = typeService.selectUserInvestType();
        return list;
    }
    @RequestMapping("EditUserHZ.do")
    @ResponseBody
    public int EditUserHZ(String MyInvestTypeMessageRZ,String MyIndustryMessageHZ){
        UserAndType userAndType = new UserAndType();
        userAndType.setId(conf.USERID);
        userAndType.setChooseType("HZ");
        typeService.EditUserHZ(userAndType,MyInvestTypeMessageRZ,MyIndustryMessageHZ);
        return 1;
    }
    @RequestMapping("EditUserRZ.do")
    @ResponseBody
    public int EditUserRZ(String MyInvestTypeMessageRZ){
        UserAndType userAndType = new UserAndType();
        userAndType.setId(conf.USERID);
        userAndType.setChooseType("RZ");
        typeService.EditUserRZ(userAndType,MyInvestTypeMessageRZ);
        return 1;
    }
    @RequestMapping("EditUserTZ.do")
    @ResponseBody
    public int EditUserTZ(String MyIndustryMessageTZ,String MyInvestTypeMessageTZ){
        UserAndType userAndType = new UserAndType();
        userAndType.setId(conf.USERID);
        userAndType.setChooseType("TZ");
        typeService.EditUserTZ(userAndType,MyInvestTypeMessageTZ,MyIndustryMessageTZ);
        return 1;
    }
    @RequestMapping("MyTypeId.do")
    @ResponseBody
    public List<UserAndType> MyTypeId(UserAndType userAndType){
        userAndType.setId(conf.USERID);
        return typeService.selectMyTypeId(userAndType);
    }

}
