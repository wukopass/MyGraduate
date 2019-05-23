package com.rtworld.pojo;
public class Authority {
  private int id;
  private String authorityname;
  private String description;
  private int pid;
  private String url;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getAuthorityname() {
    return authorityname;
  }

  public void setAuthorityname(String authorityname) {
    this.authorityname = authorityname;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public int getPid() {
    return pid;
  }

  public void setPid(int pid) {
    this.pid = pid;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }
}