package com.rtworld.pojo;


import java.io.Serializable;
import java.lang.reflect.Member;
import java.sql.Timestamp;

public class MemberUser implements Serializable {

  private Integer userid;
  private String username;
  private String password;
  private String tel;
  private String mail;
  private java.sql.Timestamp createtime;
  private java.sql.Timestamp updatetime;
  private int iseffective;
  private Role role;
  //判断是不是被锁
  private Boolean locked = Boolean.FALSE;
  private String salt;

  public Boolean getLocked() {
    return locked;
  }

  public void setLocked(Boolean locked) {
    this.locked = locked;
  }
  public boolean equals(Object o) {
    if (this == o)
      return true;
    if (o == null || getClass() != o.getClass())
      return false;
    MemberUser user = (MemberUser) o;
    if (userid != null ? !userid.equals(userid) : user.userid != null)
      return false;

    return true;
  }

  @Override
  public int hashCode() {
    return userid!= null ? userid.hashCode() : 0;
  }

  @Override
  public String toString() {
    return "MemberUser{" +
            "userid=" + userid +
            ", username='" + username + '\'' +
            ", password='" + password + '\'' +
            ", tel='" + tel + '\'' +
            ", mail='" + mail + '\'' +
            ", createtime=" + createtime +
            ", updatetime=" + updatetime +
            ", iseffective=" + iseffective +
            ", role=" + role +
            ", locked=" + locked +
            ", salt='" + salt + '\'' +
            '}';
  }

  //加盐处理
  public String getSalt() {
    return  username + salt;
  }

  public void setSalt(String salt) {
    this.salt = salt;
  }

  public Role getRole() {
    return role;
  }

  public void setRole(Role role) {
    this.role = role;
  }

  public int getUserid() {
    return userid;
  }

  public void setUserid(int userid) {
    this.userid = userid;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getMail() {
    return mail;
  }

  public void setMail(String mail) {
    this.mail = mail;
  }

  public Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Timestamp createtime) {
    this.createtime = createtime;
  }

  public Timestamp getUpdatetime() {
    return updatetime;
  }

  public void setUpdatetime(Timestamp updatetime) {
    this.updatetime = updatetime;
  }

  public int getIseffective() {
    return iseffective;
  }

  public void setIseffective(int iseffective) {
    this.iseffective = iseffective;
  }
}