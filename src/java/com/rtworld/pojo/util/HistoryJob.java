package com.rtworld.pojo.util;

import com.rtworld.pojo.Base;

import java.io.Serializable;

public class HistoryJob extends Base implements Serializable {
    //任职Id int（auto-increment）
    private Integer id;
    //用户id int
    private Integer userId;
    //公司名 varchar
    private String companyName;
    //部门
    private String department;
    //职务
    private String jobName;
    //名片照片路径
    private String cardImg;
    //审核状态
    private Character msgChecking;
    //工作时间 varchar
    private String workTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getCardImg() {
        return cardImg;
    }

    public void setCardImg(String cardImg) {
        this.cardImg = cardImg;
    }

    public Character getMsgChecking() {
        return msgChecking;
    }

    public void setMsgChecking(Character msgChecking) {
        this.msgChecking = msgChecking;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }
}
