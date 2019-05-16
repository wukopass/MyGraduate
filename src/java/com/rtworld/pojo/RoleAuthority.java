package com.rtworld.pojo;


import java.io.Serializable;

public class RoleAuthority implements Serializable {

  private long roleid;
  private long authorityid;


  public long getRoleid() {
    return roleid;
  }

  public void setRoleid(long roleid) {
    this.roleid = roleid;
  }


  public long getAuthorityid() {
    return authorityid;
  }

  public void setAuthorityid(long authorityid) {
    this.authorityid = authorityid;
  }

}
