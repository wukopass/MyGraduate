package com.rtworld.pojo.util;

import java.io.Serializable;

public class CoopType implements Serializable {
    //Id
    private Integer id;
    //用户偏好合作类型名
    private String typeName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
