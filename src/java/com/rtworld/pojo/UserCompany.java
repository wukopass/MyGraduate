package com.rtworld.pojo;


import java.io.Serializable;

public class UserCompany implements Serializable {

  private long userid;
  private long companyid;


  public long getUserid() {
    return userid;
  }

  public void setUserid(long userid) {
    this.userid = userid;
  }


  public long getCompanyid() {
    return companyid;
  }

  public void setCompanyid(long companyid) {
    this.companyid = companyid;
  }

}
