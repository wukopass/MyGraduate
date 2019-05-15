package com.rtworld.pojo.demand;

public class CoopToCoopType {
    private int cid;
    private int ctid;
    private String type;

    public CoopToCoopType() {
    }

    public CoopToCoopType(int cid, int ctid) {
        this.cid = cid;
        this.ctid = ctid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCtid() {
        return ctid;
    }

    public void setCtid(int ctid) {
        this.ctid = ctid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
