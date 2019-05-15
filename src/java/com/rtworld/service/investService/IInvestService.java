package com.rtworld.service.investService;

import com.rtworld.pojo.demand.Lable;
import com.rtworld.pojo.quanInvest.City;
import com.rtworld.pojo.quanInvest.invest;
import com.rtworld.pojo.quanInvest.investVsIndustry;
import com.rtworld.pojo.quanInvest.period;

import java.util.List;

public interface IInvestService {
    void baibai();
    //保存用户发布的信息
    int saveInvest(invest invest);

    List<period> selectAllPeriod();

    List<Lable> selectAllLable();

    List<City> selectAllCity();

    List<String> selectAllindustry();

    List<invest> findInvest(invest invest);

    invest getInvestById(int id);
    //通过id来查出所有的行业
    List<String> getIndustryByid(int id);
}
