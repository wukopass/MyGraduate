package com.rtworld.pojo.user;

import java.io.Serializable;

public class RtRole implements Serializable {
    //id
    private Integer id;
    //角色名
    private String rtRoleName;
    //描述
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRtRoleName() {
        return rtRoleName;
    }

    public void setRtRoleName(String rtRoleName) {
        this.rtRoleName = rtRoleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
