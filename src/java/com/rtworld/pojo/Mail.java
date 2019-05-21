package com.rtworld.pojo;


import java.io.Serializable;
import java.sql.Timestamp;

public class Mail  extends Base implements Serializable {

  private int id;
  private String title;
  private String content;
  private int isread;
  private int sendid;
  private int receiverid;
  private String createtime;
  private int iseffective;
  private String sendName;
  private String receiveName;

  public String getSendName() {
    return sendName;
  }

  public void setSendName(String sendName) {
    this.sendName = sendName;
  }

  public String getReceiveName() {
    return receiveName;
  }

  public void setReceiveName(String receiveName) {
    this.receiveName = receiveName;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getIsread() {
    return isread;
  }

  public void setIsread(int isread) {
    this.isread = isread;
  }

  public int getSendid() {
    return sendid;
  }

  public void setSendid(int sendid) {
    this.sendid = sendid;
  }

  public int getReceiverid() {
    return receiverid;
  }

  public void setReceiverid(int receiverid) {
    this.receiverid = receiverid;
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

  @Override
  public String toString() {
    return "Mail{" +
            "id=" + id +
            ", title='" + title + '\'' +
            ", content='" + content + '\'' +
            ", isread=" + isread +
            ", sendid=" + sendid +
            ", receiverid=" + receiverid +
            ", createtime='" + createtime + '\'' +
            ", iseffective=" + iseffective +
            ", sendName='" + sendName + '\'' +
            ", receiveName='" + receiveName + '\'' +
            '}';
  }
}
