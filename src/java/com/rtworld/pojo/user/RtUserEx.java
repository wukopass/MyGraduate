package com.rtworld.pojo.user;

import java.io.Serializable;

public class RtUserEx implements Serializable {
    //用户id
    private Integer userId;
    //邀请人id
    private Integer inviterId;
    //邮箱状态
    private Character mailState;
    //邮箱验证码
    private String mailCode;
    //个人信息认证状态
    private Character priMsgState;
    //企业认证状态
    private Character companyCertify;
    //企业公函路径
    private String companyImg;
    //金额
    private Double balance;
    //是否通过审核
    private Character msgChecking;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getInviterId() {
        return inviterId;
    }

    public void setInviterId(Integer inviterId) {
        this.inviterId = inviterId;
    }

    public Character getMailState() {
        return mailState;
    }

    public void setMailState(Character mailState) {
        this.mailState = mailState;
    }

    public String getMailCode() {
        return mailCode;
    }

    public void setMailCode(String mailCode) {
        this.mailCode = mailCode;
    }

    public Character getPriMsgState() {
        return priMsgState;
    }

    public void setPriMsgState(Character priMsgState) {
        this.priMsgState = priMsgState;
    }

    public Character getCompanyCertify() {
        return companyCertify;
    }

    public void setCompanyCertify(Character companyCertify) {
        this.companyCertify = companyCertify;
    }

    public String getCompanyImg() {
        return companyImg;
    }

    public void setCompanyImg(String companyImg) {
        this.companyImg = companyImg;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public Character getMsgChecking() {
        return msgChecking;
    }

    public void setMsgChecking(Character msgChecking) {
        this.msgChecking = msgChecking;
    }
}
