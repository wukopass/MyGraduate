package com.rtworld.pojo.guidance;

import java.util.List;

public class Tutor {
    //导师id
    private Integer id;
    //导师姓名
    private String name;
    //导师所在公司
    private String company;
    //导师职务
    private String job;
    //导师简介
    private String introduction;
    //导师从业经验
    private Integer experience;
    //个性签名
    private String signature;
    //导师点评收费
    private String charge;
    //导师头像图片路径
    private String photo;
    //导师成功案例
    private List<SuccessCase> successCases;
    //导师擅长领域
    private List<String> goodFields;
    //导师擅长阶段
    private String[] projectStages;

    public String[] getProjectStages() {
        return projectStages;
    }

    public void setProjectStages(String[] projectStages) {
        this.projectStages = projectStages;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public List<String> getGoodFields() {
        return goodFields;
    }

    public void setGoodFields(List<String> goodFields) {
        this.goodFields = goodFields;
    }

    public List<SuccessCase> getSuccessCases() {
        return successCases;
    }

    public void setSuccessCases(List<SuccessCase> successCases) {
        this.successCases = successCases;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }
}
