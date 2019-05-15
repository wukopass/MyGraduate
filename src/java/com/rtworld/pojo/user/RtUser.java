package com.rtworld.pojo.user;

import com.rtworld.pojo.Base;

import java.io.Serializable;

public class RtUser extends Base implements Serializable {
    //用户id
    private Integer id;
    //用户姓名
    private String rtUserName;
    //用户密码
    private String rtPassword;
    //用户电话
    private String tel;
    //公司名称
    private String companyName;
    //头像地址
    private String rtfaceimg;
    //邮箱
    private String mail;
    //盐
    private String salt;
    //是否登入
    private Character isLogin;
    //邀请码
    private String inviteCode;
    //额外信息
    private RtUserEx rtUserEx;
    //用户角色
    private RtRole rtRole;
    //真实信息
    private RealMsg realMsg;
    //额外的信息
    private AdditionMessage additionmessage;

    public RealMsg getRealMsg() {
        return realMsg;
    }

    public void setRealMsg(RealMsg realMsg) {
        this.realMsg = realMsg;
    }

    public String getRtUserName() {
        return rtUserName;
    }

    public void setRtUserName(String rtUserName) {
        this.rtUserName = rtUserName;
    }

    public String getRtPassword() {
        return rtPassword;
    }

    public void setRtPassword(String rtPassword) {
        this.rtPassword = rtPassword;
    }

    public Character getIsLogin() {
        return isLogin;
    }

    public void setIsLogin(Character isLogin) {
        this.isLogin = isLogin;
    }

    public String getInviteCode() {
        return inviteCode;
    }

    public void setInviteCode(String inviteCode) {
        this.inviteCode = inviteCode;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getRtfaceimg() {
        return rtfaceimg;
    }

    public void setRtfaceimg(String rtfaceimg) {
        this.rtfaceimg = rtfaceimg;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public RtUserEx getRtUserEx() {
        return rtUserEx;
    }

    public void setRtUserEx(RtUserEx rtUserEx) {
        this.rtUserEx = rtUserEx;
    }
    public RtRole getRtRole() {
        return rtRole;
    }

    public void setRtRole(RtRole rtRole) {
        this.rtRole = rtRole;
    }

    public AdditionMessage getAdditionmessage() {
        return additionmessage;
    }

    public void setAdditionmessage(AdditionMessage additionmessage) {
        this.additionmessage = additionmessage;
    }
}
