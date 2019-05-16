package com.rtworld.pojo;


import java.io.Serializable;

public class Authority implements Serializable {

  private int id;
  private String authorityname;
  private String description;

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
}
