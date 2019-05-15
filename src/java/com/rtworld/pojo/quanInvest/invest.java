package com.rtworld.pojo.quanInvest;

import com.rtworld.pojo.Base;
import com.rtworld.pojo.project;

import java.sql.Timestamp;
import java.util.List;

public class invest extends project {
    //17个字段，六个一对多

    private  String pmessagetype;
    private List<Integer> pcity;
    private  String pmoney;
    private List<Integer> pindustry;
    private  String city;
    private List<String> industry;

    public List<String> getIndustry() {
        return industry;
    }

    public void setIndustry(List<String> industry) {
        this.industry = industry;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public List<Integer> getPindustry() {
        return pindustry;
    }

    public void setPindustry(List<Integer> pindustry) {
        this.pindustry = pindustry;
    }

    private  investVsIndustry investVsIndustry;

    public com.rtworld.pojo.quanInvest.investVsIndustry getInvestVsIndustry() {
        return investVsIndustry;
    }

    public void setInvestVsIndustry(com.rtworld.pojo.quanInvest.investVsIndustry investVsIndustry) {
        this.investVsIndustry = investVsIndustry;
    }



    private String pstage;
    private Timestamp ptime;
    private String pincome;
    private List<String> pstaff;
    private  List<String> plable;
    private   String ptype;
    private  String pcompname;
    private  String pspot;
    private  List<String> pimage;
    private  List<String>  pfile;
    //构造函数
    private String pstarttime;
    private String pendtime;
    private  String ptimestate;
    private String  ppstate;
    //文件是否有效，可看
    private Integer fileView;
    public Integer getFileView() {
        return fileView;
    }

    public void setFileView(Integer fileView) {
        this.fileView = fileView;
    }

    public String getPstarttime() {
        return pstarttime;
    }

    public void setPstarttime(String pstarttime) {
        this.pstarttime = pstarttime;
    }

    public String getPendtime() {
        return pendtime;
    }

    public void setPendtime(String pendtime) {
        this.pendtime = pendtime;
    }

    public String getPtimestate() {
        return ptimestate;
    }

    public void setPtimestate(String ptimestate) {
        this.ptimestate = ptimestate;
    }

    public String getPpstate() {
        return ppstate;
    }

    public void setPpstate(String ppstate) {
        this.ppstate = ppstate;
    }

    public List<Integer> getPcity() {
        return pcity;
    }

    public void setPcity(List<Integer> pcity) {
        this.pcity = pcity;
    }


    public String getPmessagetype() {
        return pmessagetype;
    }

    public void setPmessagetype(String pmessagetype) {
        this.pmessagetype = pmessagetype;
    }





    public String getPmoney() {
        return pmoney;
    }

    public void setPmoney(String pmoney) {
        this.pmoney = pmoney;
    }



    public String getPstage() {
        return pstage;
    }

    public void setPstage(String pstage) {
        this.pstage = pstage;
    }

    public Timestamp getPtime() {
        return ptime;
    }

    public void setPtime(Timestamp ptime) {
        this.ptime = ptime;
    }

    public String getPincome() {
        return pincome;
    }

    public void setPincome(String pincome) {
        this.pincome = pincome;
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

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
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

    public static void main(String[] args) {
        invest a=new invest();
        System.out.println(a.getCreateTime());
    }
}
