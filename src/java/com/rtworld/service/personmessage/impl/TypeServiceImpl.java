package com.rtworld.service.personmessage.impl;

import com.rtworld.dao.util.ICoopTypeDao;
import com.rtworld.dao.util.IIndustryDao;
import com.rtworld.dao.util.IInvestTypeDao;
import com.rtworld.dao.util.IUserAndTypeDao;
import com.rtworld.pojo.util.CoopType;
import com.rtworld.pojo.util.Industry;
import com.rtworld.pojo.util.InvestType;
import com.rtworld.pojo.util.UserAndType;
import com.rtworld.service.personmessage.ITypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TypeServiceImpl implements ITypeService {

    @Autowired
    private ICoopTypeDao coopTypeDao;
    @Autowired
    private IInvestTypeDao investTypeDao;
    @Autowired
    private IIndustryDao industryDao;
    @Autowired
    private IUserAndTypeDao userAndTypeDao;

    public List<CoopType> selectUserCoop(){
        List<CoopType> list = null;
        list = coopTypeDao.selectAllCoopType();
        return list;
    }

    public List<Industry> selectUserIndustry(){
        List<Industry> list = null;
        list = industryDao.selectAllIndustry();
        return list;
    }

    public List<InvestType> selectUserInvestType(){
        List<InvestType> list = null;
        list = investTypeDao.selectAllInvestTypeDao();
        return list;
    }

    public void EditUserHZ(UserAndType userAndType,String str1,String str2){
        userAndTypeDao.deleteUserAndTypeById(userAndType);
        String arr[] = str1.split(",");
        String arr2[] = str2.split(",");
        userAndType.setMessageType("coopType");
        for (String s : arr) {
            if(!"".equals(s.trim())){
                userAndType.setTypeId(Integer.parseInt(s.trim()));
                userAndTypeDao.insertUserAndType(userAndType);
            }
        }
        userAndType.setMessageType("industry");
        for (String s : arr2) {
            if(!"".equals(s.trim())){
                userAndType.setTypeId(Integer.parseInt(s.trim()));
                userAndTypeDao.insertUserAndType(userAndType);
            }
        }
    }
    public void EditUserRZ(UserAndType userAndType,String str1){
        userAndTypeDao.deleteUserAndTypeById(userAndType);
        String arr[] = str1.split(",");
        userAndType.setMessageType("investType");
        for (String s : arr) {
            if(!"".equals(s.trim())){
                userAndType.setTypeId(Integer.parseInt(s.trim()));
                userAndTypeDao.insertUserAndType(userAndType);
            }
        }

    }
    public void EditUserTZ(UserAndType userAndType,String str1,String str2){
        userAndTypeDao.deleteUserAndTypeById(userAndType);
        String arr[] = str1.split(",");
        String arr2[] = str2.split(",");
        userAndType.setMessageType("investType");
        for (String s : arr) {
            if(!"".equals(s.trim())){
                userAndType.setTypeId(Integer.parseInt(s.trim()));
                userAndTypeDao.insertUserAndType(userAndType);
            }
        }
        userAndType.setMessageType("industry");
        for (String s : arr2) {
            if(!"".equals(s.trim())){
                userAndType.setTypeId(Integer.parseInt(s.trim()));
                userAndTypeDao.insertUserAndType(userAndType);
            }
        }
    }

    public List<UserAndType> selectMyTypeId(UserAndType userAndType){
        return userAndTypeDao.selectAllTypeIdByType(userAndType);
    }

}
