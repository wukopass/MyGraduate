package com.rtworld.service.demand;

import com.rtworld.pojo.demand.*;
import com.rtworld.pojo.user.RtUser;

import java.util.List;

public interface IDemandService {
    int saveCoop(Cooperation cooperation);
    void saveAsset(Asset asset);
    void saveStock(Stock stock);
    List<String> getAllCity();
    List<CoopType> getAllCoopTypes();
    List<Industry> getAllIndustry();
    List<Lable> getAllLable();
    List<Cooperation> findCooperation(Cooperation cooperation);
    Cooperation getCooperation(int id);
    List<String> getResourceTypeById(int id);
    List<String> getLableById(int id);
    RtUser getUserByName(String name);
    List<String> getAllAssetType();
    List<Asset> findAsset(Asset asset);
    Asset getAssetById(int id);
    List<String> getAssetLableById(int id);
    List<Stock> findStock(Stock stock);
    Stock getStockById(int id);
    List<String> getStockLableById(int id);
}
