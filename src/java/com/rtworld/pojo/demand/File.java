package com.rtworld.pojo.demand;

public class File {
    private int cid;
    private String src;

    public File() {
    }

    public File(int cid, String src) {
        this.cid = cid;
        this.src = src;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }
}
