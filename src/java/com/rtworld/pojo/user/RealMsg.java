package com.rtworld.pojo.user;

import com.rtworld.pojo.Base;

import java.io.Serializable;

public class RealMsg extends Base implements Serializable {
    //id
    private Integer id;
    //用户id
    private String realName;
    //身份证号码
    private String identity;
    //身份正面路径
    private String frontCardImg;
    //身份证反面路径
    private String backCardImg;
    //手持照片路径
    private String handCardImg;
    //是否认证
    private Character isCertify;
    //审核状态
    private Character isChecking;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getFrontCardImg() {
        return frontCardImg;
    }

    public void setFrontCardImg(String frontCardImg) {
        this.frontCardImg = frontCardImg;
    }

    public String getBackCardImg() {
        return backCardImg;
    }

    public void setBackCardImg(String backCardImg) {
        this.backCardImg = backCardImg;
    }

    public String getHandCardImg() {
        return handCardImg;
    }

    public void setHandCardImg(String handCardImg) {
        this.handCardImg = handCardImg;
    }

    public Character getIsCertify() {
        return isCertify;
    }

    public void setIsCertify(Character isCertify) {
        this.isCertify = isCertify;
    }

    public Character getIsChecking() {
        return isChecking;
    }

    public void setIsChecking(Character isChecking) {
        this.isChecking = isChecking;
    }
}
