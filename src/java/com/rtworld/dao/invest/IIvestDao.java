package com.rtworld.dao.invest;

import com.rtworld.pojo.demand.Lable;
import com.rtworld.pojo.quanInvest.*;

import java.util.List;

public interface IIvestDao {


    //保存主表
    void saveInvest(invest invest);
    //多表插入，保存城市
    void saveCity(investVsCity in);

    void insertCityByid(int id);

    void saveIndustry(investVsIndustry in);
    //单选的阶段
    List<period> selectAllPeriod();
    //多选的标签:
    List<Lable> selectAllLable();

    List<City> selectAllCity();
     //多选行业表
    List<String> selectAllindustry();
     //查表
    List<invest> findInvest(invest invest);

    invest getInvestById(int id);

    List<String> getIndustryById(int id);
}
