package com.rtworld.handle;

import com.alibaba.fastjson.JSONObject;
import com.rtworld.pojo.Mail;
import com.rtworld.pojo.Role;
import com.rtworld.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/role")
@Controller
public class RoleController {
    @Autowired
    private IRoleService roleService;
    @RequestMapping("/select.do")
    @ResponseBody
    public  String ListRole(){
        List<Role> role = roleService.getAllRoles();
        JSONObject obj = new JSONObject();
        obj.put("data",role);
        return obj.toJSONString();
    }

}
