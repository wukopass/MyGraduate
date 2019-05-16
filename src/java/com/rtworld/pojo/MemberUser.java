package com.rtworld.pojo;


import java.io.Serializable;
import java.sql.Timestamp;

public class MemberUser implements Serializable {

  private int userid;
  private String username;
  private String password;
  private String tel;
  private String mail;
  private java.sql.Timestamp createtime;
  private java.sql.Timestamp updatetime;
  private int iseffective;
  private Role role;
  private int isLogin;
  private String salt;

  public int getIsLogin() {
    return isLogin;
  }

  public void setIsLogin(int isLogin) {
    this.isLogin = isLogin;
  }

  public String getSalt() {
    return salt;
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