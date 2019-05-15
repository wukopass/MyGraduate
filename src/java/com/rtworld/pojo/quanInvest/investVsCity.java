package com.rtworld.pojo.quanInvest;

public class investVsCity {
    private Integer pid;
    private  Integer pcid;


    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPcid() {
        return pcid;
    }

    public void setPcid(Integer pcid) {
        this.pcid = pcid;
    }

    public investVsCity(Integer pid, Integer pcid) {
        this.pid = pid;
        this.pcid = pcid;

    }
}
