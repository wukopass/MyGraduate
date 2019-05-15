package com.rtworld.pojo.demand;

import java.util.List;

public class Asset extends DemandBase {
    private String assetType;//资产类型
    private int evaluationMin;//最小估值
    private int evaluationMax;//最大估值
    private int priceMin;//最小交易额
    private int priceMax;//最大交易额
    private String range;//转让范围
    private String tip;//资产描述
    private List<String> myLable;

    public List<String> getMyLable() {
        return myLable;
    }

    public void setMyLable(List<String> myLable) {
        this.myLable = myLable;
    }

    public String getAssetType() {
        return assetType;
    }

    public void setAssetType(String assetType) {
        this.assetType = assetType;
    }

    public int getEvaluationMin() {
        return evaluationMin;
    }

    public void setEvaluationMin(int evaluationMin) {
        this.evaluationMin = evaluationMin;
    }

    public int getEvaluationMax() {
        return evaluationMax;
    }

    public void setEvaluationMax(int evaluationMax) {
        this.evaluationMax = evaluationMax;
    }

    public int getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(int priceMin) {
        this.priceMin = priceMin;
    }

    public int getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(int priceMax) {
        this.priceMax = priceMax;
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }
}
