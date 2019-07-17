package com.rtworld.pojo;


import java.io.Serializable;

public class Company  implements Serializable {

  private int companyid;
  private String isn;
  private String kind;
  private String introduce;
  private Integer baby;

  public long getCompanyid() {
    return companyid;
  }

  public void setCompanyid(int companyid) {
    this.companyid = companyid;
  }


  public String getIsn() {
    return isn;
  }

  public void setIsn(String isn) {
    this.isn = isn;
  }


  public String getKind() {
    return kind;
  }

  public void setKind(String kind) {
    this.kind = kind;
  }


  public String getIntroduce() {
    return introduce;
  }

  public void setIntroduce(String introduce) {
    this.introduce = introduce;
  }

}
