package com.rtworld.service.impl;

import com.rtworld.dao.IAuthorityDao;
import com.rtworld.pojo.Authority;
import com.rtworld.service.IAuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AuthoriryImpl implements IAuthorityService {
    @Autowired
    private IAuthorityDao authorityDao;
    @Override
    public List<Authority> getAllAuthorities() {
        return authorityDao.getAllAuthirities();
    }
}
