package com.rtworld.pojo.util;

import java.io.Serializable;

public class InvestType implements Serializable {
    //Id int
    private Integer id;
    //分类名字 varchar
    private String investName;
    //所属 是否属于第一级类别下的第二级类别
    private Character belonged;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInvestName() {
        return investName;
    }

    public void setInvestName(String investName) {
        this.investName = investName;
    }

    public Character getBelonged() {
        return belonged;
    }

    public void setBelonged(Character belonged) {
        this.belonged = belonged;
    }
}
