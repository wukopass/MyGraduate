package com.rtworld.pojo.user;

import java.io.Serializable;

public class RtAuthority implements Serializable {
    //id
    private Integer id;
    //角色名
    private String rtAuthorityName;
    //描述
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRtAuthorityName() {
        return rtAuthorityName;
    }

    public void setRtAuthorityName(String rtAuthorityName) {
        this.rtAuthorityName = rtAuthorityName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
