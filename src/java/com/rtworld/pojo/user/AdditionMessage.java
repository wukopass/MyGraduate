package com.rtworld.pojo.user;

import java.io.Serializable;

public class AdditionMessage implements Serializable {
    //未读的邮箱数
    private Integer notRead;
    //我的项目数
    private Integer myProject;
    //谁看过项目
    private Integer otherPeople;
    //站内信息数量
    private Integer sysMessage;

    public Integer getNotRead() {
        return notRead;
    }

    public void setNotRead(Integer notRead) {
        this.notRead = notRead;
    }

    public Integer getMyProject() {
        return myProject;
    }

    public void setMyProject(Integer myProject) {
        this.myProject = myProject;
    }

    public Integer getOtherPeople() {
        return otherPeople;
    }

    public void setOtherPeople(Integer otherPeople) {
        this.otherPeople = otherPeople;
    }

    public Integer getSysMessage() {
        return sysMessage;
    }

    public void setSysMessage(Integer sysMessage) {
        this.sysMessage = sysMessage;
    }
}
