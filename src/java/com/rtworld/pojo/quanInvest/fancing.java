package com.rtworld.pojo.quanInvest;

import com.rtworld.pojo.Base;

import java.util.List;

public class fancing extends Base {
    //12字段，3个一对多
   private int id;                    //项目id
   private String  username;             // 项目发布人
   private String pname;              // 项目名称
   private String  pindustry;                  //所属行业
   private String pmoney;            //融资金额
   private List<String> pcity;                           //投资地区
    private String pfancetype;                       //融资方式
    private List<String> pstaff;                          //所需材料
    private List<String> plable;                          //热门标签
    private String pmesstype;                       //信息类型
    private  String pcompname;                       //公司名称
    private String  pspot;                            //项目亮点
    public  fancing(){


  }
    public fancing(int id, String username, String pname, String pindustry, String pmoney, List<String> pcity, String pfancetype, List<String> pstaff, List<String> plable, String pmesstype, String pcompname, String pspot, List<String> pimage, List<String> pfile) {
        this.id = id;
        this.username = username;
        this.pname = pname;
        this.pindustry = pindustry;
        this.pmoney = pmoney;
        this.pcity = pcity;
        this.pfancetype = pfancetype;
        this.pstaff = pstaff;
        this.plable = plable;
        this.pmesstype = pmesstype;
        this.pcompname = pcompname;
        this.pspot = pspot;
        this.pimage = pimage;
        this.pfile = pfile;
    }

    private List<String> pimage;                     // 图片

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPindustry() {
        return pindustry;
    }

    public void setPindustry(String pindustry) {
        this.pindustry = pindustry;
    }

    public String getPmoney() {
        return pmoney;
    }

    public void setPmoney(String pmoney) {
        this.pmoney = pmoney;
    }

    public List<String> getPcity() {
        return pcity;
    }

    public void setPcity(List<String> pcity) {
        this.pcity = pcity;
    }

    public String getPfancetype() {
        return pfancetype;
    }

    public void setPfancetype(String pfancetype) {
        this.pfancetype = pfancetype;
    }

    public List<String> getPstaff() {
        return pstaff;
    }

    public void setPstaff(List<String> pstaff) {
        this.pstaff = pstaff;
    }

    public List<String> getPlable() {
        return plable;
    }

    public void setPlable(List<String> plable) {
        this.plable = plable;
    }

    public String getPmesstype() {
        return pmesstype;
    }

    public void setPmesstype(String pmesstype) {
        this.pmesstype = pmesstype;
    }

    public String getPcompname() {
        return pcompname;
    }

    public void setPcompname(String pcompname) {
        this.pcompname = pcompname;
    }

    public String getPspot() {
        return pspot;
    }

    public void setPspot(String pspot) {
        this.pspot = pspot;
    }

    public List<String> getPimage() {
        return pimage;
    }

    public void setPimage(List<String> pimage) {
        this.pimage = pimage;
    }

    public List<String> getPfile() {
        return pfile;
    }

    public void setPfile(List<String> pfile) {
        this.pfile = pfile;
    }

    private List<String> pfile;                                  //附件


}
