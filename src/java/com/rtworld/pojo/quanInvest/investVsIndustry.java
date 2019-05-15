package com.rtworld.pojo.quanInvest;

import java.util.List;

public class investVsIndustry {

    private  Integer pid;
    private  Integer inid;

    public investVsIndustry(Integer pid, Integer inid) {
        this.pid = pid;
        this.inid = inid;
    }

    //一对多，多的属性放在多这边
    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getInid() {
        return inid;
    }

    public void setInid(Integer inid) {
        this.inid = inid;
    }
}
