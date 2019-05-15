package com.rtworld.service.investService;

import com.rtworld.dao.invest.IIvestDao;
import com.rtworld.pojo.demand.Lable;
import com.rtworld.pojo.quanInvest.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class InvestServiceImpl implements  IInvestService{
    @Autowired
    private IIvestDao iIvestDao;

    @Override
    public void baibai() {




    }

    @Override
    @Transactional
    public int saveInvest(invest invest) {
        //invest invest1= iIvestDao.queryBypname(invest.getPname());
        iIvestDao.saveInvest(invest);
        System.out.println("刚插入的id是:"+invest.getId());
        //刚插入的id,
        Integer pid=invest.getId();
        List<Integer> city =invest.getPcity();
        //插入一对多的城市
        if(city!=null) {
            for (Integer o : city) {
                System.out.println("插入的城市id为:"+o);
            }
            //保存数据到中间表;城市表不变
            for (Integer o : city) {
                if(o!=null) {
                    iIvestDao.saveCity(new investVsCity(pid, o));
                }
            }
        }
        //插入一对多的行业
        List<Integer> industrys=invest.getPindustry();
        if(industrys!=null) {
            for (Integer industry : industrys) {
                if (industry!=null) {
                    iIvestDao.saveIndustry(new investVsIndustry(pid,industry));
                }
            }
        }
        return 1;

    }

    @Override
    public List<period> selectAllPeriod() {
      return iIvestDao.selectAllPeriod();
    }

    @Override
    public List<Lable> selectAllLable() {
         return  iIvestDao.selectAllLable();
    }

    @Override
    public List<City> selectAllCity() {
         return  iIvestDao.selectAllCity();
    }

    @Override
    public List<String> selectAllindustry() {
        return  iIvestDao.selectAllindustry();
    }

    @Override
    public List<invest> findInvest(invest invest) {
        return  iIvestDao.findInvest(invest);
    }

    @Override
    public invest getInvestById(int id) {
        return  iIvestDao.getInvestById(id);
    }

    @Override
    public List<String> getIndustryByid(int id) {
        return  iIvestDao.getIndustryById(id);
    }


}
