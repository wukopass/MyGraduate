package com.rtworld.pojo.demand;

import com.rtworld.pojo.Base;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class Cooperation extends DemandBase {

    private String cooperationType;//合作类型
    private List<Integer> resourcesType;//资源类型
    private String industryType;//行业类型
    private String tip;//合作描述
    private List<String> types;
    private List<String> myLable;

    public Cooperation() {
    }

    public Cooperation(String cooperationType, List<Integer> resourcesType, String industryType, String tip) {

        this.cooperationType = cooperationType;
        this.resourcesType = resourcesType;
        this.industryType = industryType;
        this.tip = tip;

    }

    public List<String> getMyLable() {
        return myLable;
    }

    public void setMyLable(List<String> myLable) {
        this.myLable = myLable;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    public String getCooperationType() {
        return cooperationType;
    }

    public void setCooperationType(String cooperationType) {
        this.cooperationType = cooperationType;
    }


    public List<Integer> getResourcesType() {
        return resourcesType;
    }

    public void setResourcesType(List<Integer> resourcesType) {
        this.resourcesType = resourcesType;
    }

    public String getIndustryType() {
        return industryType;
    }

    public void setIndustryType(String industryType) {
        this.industryType = industryType;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

}
