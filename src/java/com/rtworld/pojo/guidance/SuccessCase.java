package com.rtworld.pojo.guidance;

import java.util.List;

public class SuccessCase {
    //案例id
    private Integer id;
    //案例介绍
    private String introduction;
    //案例图片路径
    private String trademark;

    public String getTrademark() {
        return trademark;
    }

    public void setTrademark(String trademark) {
        this.trademark = trademark;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}
