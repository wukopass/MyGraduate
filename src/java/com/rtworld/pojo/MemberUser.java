package com.rtworld.pojo;


import java.io.Serializable;
import java.util.List;

public class MemberUser implements Serializable {
  private Integer userid;
  private String username;
  private String password;
  private String tel;
  private String mail;
  private String createtime;
  private String updatetime;
  private int iseffective;
  private Role role;
  private List<Role> Roles;
  private List<Authority> Authorities;

  public List<Role> getRoles() {
    return Roles;
  }

  public void setRoles(List<Role> roles) {
    Roles = roles;
  }

  public List<Authority> getAuthorities() {
    return Authorities;
  }

  public void setAuthorities(List<Authority> authorities) {
    Authorities = authorities;
  }

  public int getLoginState() {
    return loginState;
  }

  private int loginState;

  //判断是不是被锁
  private Boolean locked = Boolean.FALSE;
  private String salt;
  public MemberUser() {
  }

  public MemberUser(String username, String password) {
    this.username = username;
    this.password = password;
  }
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
    return  salt;
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


  public int getIseffective() {
    return iseffective;
  }

  public void setIseffective(int iseffective) {
    this.iseffective = iseffective;
  }

  public String getCreatetime() {
    return createtime;
  }

  public void setCreatetime(String createtime) {
    this.createtime = createtime;
  }

  public String getUpdatetime() {
    return updatetime;
  }

  public void setUpdatetime(String updatetime) {
    this.updatetime = updatetime;
  }

  public void setUserid(Integer userid) {
    this.userid = userid;
  }

  public void setLoginState(int loginState) {
    this.loginState = loginState;
  }
}