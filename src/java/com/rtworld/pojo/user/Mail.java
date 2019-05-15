package com.rtworld.pojo.user;

import com.rtworld.pojo.Base;

import java.io.Serializable;

public class Mail extends Base implements Serializable {
    //邮件Id
    private Integer id;
    //标题
    private String title;
    //内容
    private String context;
    //是否已读
    private Character isRead;
    //发送人id
    private Integer senderId;
    //接收方id
    private  Integer reciverId;

    //发送人name
    private String sendName;
    //接收人name
    private String reciverName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Character getIsRead() {
        return isRead;
    }

    public void setIsRead(Character isRead) {
        this.isRead = isRead;
    }

    public Integer getSenderId() {
        return senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    public Integer getReciverId() {
        return reciverId;
    }

    public void setReciverId(Integer reciverId) {
        this.reciverId = reciverId;
    }

    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName;
    }

    public String getReciverName() {
        return reciverName;
    }

    public void setReciverName(String reciverName) {
        this.reciverName = reciverName;
    }
}
