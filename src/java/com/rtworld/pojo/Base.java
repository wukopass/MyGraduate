package com.rtworld.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Base implements Serializable {
    /*创建时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    /*最近一次更新时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date updateTime;
    /*创建人*/
    private String createRtUser;
    /*最近一次更新人*/
    private String updateRtUser;
    /*是否有效*/
    private Character isEffective;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getCreateRtUser() {
        return createRtUser;
    }

    public void setCreateRtUser(String createRtUser) {
        this.createRtUser = createRtUser;
    }

    public String getUpdateRtUser() {
        return updateRtUser;
    }

    public void setUpdateRtUser(String updateRtUser) {
        this.updateRtUser = updateRtUser;
    }

    public Character getIsEffective() {
        return isEffective;
    }

    public void setIsEffective(Character isEffective) {
        this.isEffective = isEffective;
    }

    @Override
    public String toString() {
        return "Base{" +
                "createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", createRtUser='" + createRtUser + '\'' +
                ", updateRtUser='" + updateRtUser + '\'' +
                ", isEffective=" + isEffective +
                '}';
    }
}
