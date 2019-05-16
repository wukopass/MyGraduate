package com.rtworld.pojo;


import java.io.Serializable;

public class UserRole implements Serializable {

  private long roleid;
  private long userid;


  public long getRoleid() {
    return roleid;
  }

  public void setRoleid(long roleid) {
    this.roleid = roleid;
  }


  public long getUserid() {
    return userid;
  }

  public void setUserid(long userid) {
    this.userid = userid;
  }

}
