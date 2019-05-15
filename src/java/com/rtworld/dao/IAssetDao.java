package com.rtworld.dao;

import com.rtworld.pojo.demand.Asset;
import com.rtworld.pojo.demand.CoopToLable;
import com.rtworld.pojo.demand.File;
import com.rtworld.pojo.demand.Image;
import com.rtworld.pojo.user.RtUser;

import java.awt.*;
import java.util.List;

public interface IAssetDao {
    List<String> getAllAssetType();
    void saveAsset(Asset asset);
    int queryAssetId(String date);
    void saveLable(CoopToLable coopToLable);
    void saveImage(Image image);
    void saveFile(File file);
    List<Asset> findAsset(Asset asset);
    Asset getAssetById(int id);
    List<String> getAssetLableById(int id);
}
