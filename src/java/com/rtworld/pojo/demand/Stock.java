package com.rtworld.pojo.demand;

import java.util.List;

public class Stock extends DemandBase{
    private String industryType;//行业类型
    private String nature;//企业性质
    private String listedCompany;//上市公司
    private int evaluationMin;//最小估值
    private int evaluationMax;//最大估值
    private int price;//转让价格
    private int stockNum;//转让股数
    private String stockProportion;//占股比例
    private String companyTip;//企业简介
    private String statusTip;//标的运营状况
    private List<String> myLable;

    public List<String> getMyLable() {
        return myLable;
    }

    public void setMyLable(List<String> myLable) {
        this.myLable = myLable;
    }

    public String getIndustryType() {
        return industryType;
    }

    public void setIndustryType(String industryType) {
        this.industryType = industryType;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public String getListedCompany() {
        return listedCompany;
    }

    public void setListedCompany(String listedCompany) {
        this.listedCompany = listedCompany;
    }

    public int getEvaluationMin() {
        return evaluationMin;
    }

    public void setEvaluationMin(int evaluationMin) {
        this.evaluationMin = evaluationMin;
    }

    public int getEvaluationMax() {
        return evaluationMax;
    }

    public void setEvaluationMax(int evaluationMax) {
        this.evaluationMax = evaluationMax;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStockNum() {
        return stockNum;
    }

    public void setStockNum(int stockNum) {
        this.stockNum = stockNum;
    }

    public String getStockProportion() {
        return stockProportion;
    }

    public void setStockProportion(String stockProportion) {
        this.stockProportion = stockProportion;
    }

    public String getCompanyTip() {
        return companyTip;
    }

    public void setCompanyTip(String companyTip) {
        this.companyTip = companyTip;
    }

    public String getStatusTip() {
        return statusTip;
    }

    public void setStatusTip(String statusTip) {
        this.statusTip = statusTip;
    }
}
