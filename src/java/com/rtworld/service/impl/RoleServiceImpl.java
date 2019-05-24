package com.rtworld.service.impl;

import com.rtworld.dao.IRoleDao;
import com.rtworld.pojo.Role;
import com.rtworld.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;
    @Override
    public List<Role> getAllRoles() {
        return roleDao.getAllRoles();
    }
}
