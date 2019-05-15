package com.rtworld.pojo.demand;

import com.rtworld.pojo.Base;

import java.util.List;

public class DemandBase extends Base {
    private int id;
    private String projectName;//项目名
    private String company;//公司名
    private List<Integer> lable;//热门标签
    private String mesageType;//信息类型
    private List<String> images;//提供图片
    private List<String> files;//提供材料
    private int fileView;
    private String city;//所在地区

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public List<String> getFiles() {
        return files;
    }

    public void setFiles(List<String> files) {
        this.files = files;
    }

    public int getFileView() {
        return fileView;
    }

    public void setFileView(int fileView) {
        this.fileView = fileView;
    }

    public List<Integer> getLable() {
        return lable;
    }

    public void setLable(List<Integer> lable) {
        this.lable = lable;
    }

    public String getMesageType() {
        return mesageType;
    }

    public void setMesageType(String mesageType) {
        this.mesageType = mesageType;
    }
}
