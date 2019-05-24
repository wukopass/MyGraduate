package com.rtworld.handle;

import com.alibaba.fastjson.JSONObject;
import com.rtworld.pojo.Authority;
import com.rtworld.pojo.Role;
import com.rtworld.service.IAuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@RequestMapping("/authority")
@Controller
public class AuthorityControllser {
    @Autowired
    private IAuthorityService authorityService;
    @RequestMapping("/select.do")
    @ResponseBody
    public  String ListRole(){
        List<Authority> authorities = authorityService.getAllAuthorities();
        JSONObject obj = new JSONObject();
        obj.put("data",authorities);
        return obj.toJSONString();
    }
}
