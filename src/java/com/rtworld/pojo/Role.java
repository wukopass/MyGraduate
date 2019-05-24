package com.rtworld.pojo;


import java.io.Serializable;
public class  Role  implements Serializable {
  private int  roleid;
  private String rolename;
  private String description;
  public long getRoleid() {
    return roleid;
  }

  public void setRoleid(int roleid) {
    this.roleid = roleid;
  }

  public String getRolename() {
    return rolename;
  }
  public void setRolename(String rolename) {
    this.rolename = rolename;
  }
  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }

}
