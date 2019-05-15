package com.rtworld.service.demand.impl;

import com.rtworld.dao.IAssetDao;
import com.rtworld.dao.ICooperationDao;
import com.rtworld.dao.IStockDao;
import com.rtworld.pojo.demand.*;
import com.rtworld.pojo.user.RtUser;
import com.rtworld.service.demand.IDemandService;
import com.rtworld.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DemandService implements IDemandService {

    @Autowired
    private ICooperationDao cooperationDao;
    @Autowired
    private IAssetDao assetDao;

    @Autowired
    private IStockDao stockDao;

    public int saveCoop(Cooperation cooperation) {
        cooperationDao.saveCooperation(cooperation);
        String date=StringUtils.fmtDateToStr24(cooperation.getCreateTime());
        int id=cooperationDao.queryCooperationId(date);
        List<Integer> list=cooperation.getResourcesType();
        if(list!=null) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i) != null) {
                    cooperationDao.saveResourceType(new CoopToCoopType(id, list.get(i)));
                }
            }
        }



        List<Integer> lables=cooperation.getLable();
        if(lables!=null) {
            for (int i = 0; i < lables.size(); i++) {
                if (lables.get(i) != null) {
                    cooperationDao.saveLable(new CoopToLable(id, lables.get(i)));
                }
            }
        }

        List<String> images=cooperation.getImages();
        if(images!=null) {
            for (int i = 0; i < images.size(); i++) {
                if (images.get(i) != null) {
                    cooperationDao.saveImage(new Image(id, images.get(i)));
                }
            }
        }
        List<String> files=cooperation.getFiles();
        if(files!=null) {
            for (int i = 0; i < files.size(); i++) {
                if (files.get(i) != null) {
                    cooperationDao.saveFile(new File(id, files.get(i)));
                }
            }
        }

        return id;
    }


    public void saveAsset(Asset asset) {
        assetDao.saveAsset(asset);
        String date=StringUtils.fmtDateToStr24(asset.getCreateTime());
        int id=assetDao.queryAssetId(date);

        List<Integer> lables=asset.getLable();
        if(lables!=null) {
            for (int i = 0; i < lables.size(); i++) {
                if (lables.get(i) != null) {
                    assetDao.saveLable(new CoopToLable(id, lables.get(i)));
                }
            }
        }

        List<String> images=asset.getImages();
        if(images!=null) {
            for (int i = 0; i < images.size(); i++) {
                if (images.get(i) != null) {
                    assetDao.saveImage(new Image(id, images.get(i)));
                }
            }
        }
        List<String> files=asset.getFiles();
        if(files!=null) {
            for (int i = 0; i < files.size(); i++) {
                if (files.get(i) != null) {
                    assetDao.saveFile(new File(id, files.get(i)));
                }
            }
        }
    }

    public void saveStock(Stock stock) {
        stockDao.saveStock(stock);
        String date=StringUtils.fmtDateToStr24(stock.getCreateTime());
        int id=stockDao.queryStockId(date);

        List<Integer> lables=stock.getLable();
        if(lables!=null) {
            for (int i = 0; i < lables.size(); i++) {
                if (lables.get(i) != null) {
                    stockDao.saveLable(new CoopToLable(id, lables.get(i)));
                }
            }
        }

        List<String> images=stock.getImages();
        if(images!=null) {
            for (int i = 0; i < images.size(); i++) {
                if (images.get(i) != null) {
                    stockDao.saveImage(new Image(id, images.get(i)));
                }
            }
        }
        List<String> files=stock.getFiles();
        if(files!=null) {
            for (int i = 0; i < files.size(); i++) {
                if (files.get(i) != null) {
                    stockDao.saveFile(new File(id, files.get(i)));
                }
            }
        }
    }

    public List<String> getAllCity(){
        return cooperationDao.getAllCity();
    }

    public List<CoopType> getAllCoopTypes(){
        return cooperationDao.getAllCoopTypes();
    }

    public List<Industry> getAllIndustry(){
        return cooperationDao.getAllIndustry();
    }

    public List<Lable> getAllLable(){
        return cooperationDao.getAllLable();
    }

    public List<Cooperation> findCooperation(Cooperation cooperation){
        return cooperationDao.findCooperation(cooperation);
    }

    public Cooperation getCooperation(int id){
        return cooperationDao.getCooperation(id);
    }

    public List<String> getResourceTypeById(int id){
        return cooperationDao.getResourceTypeById(id);
    }

    public List<String> getLableById(int id){
        return cooperationDao.getLableById(id);
    }

    public RtUser getUserByName(String name){
        return cooperationDao.getUserByName(name);
    }

    public List<String> getAllAssetType(){
        return assetDao.getAllAssetType();
    }

    public List<Asset> findAsset(Asset asset){
        return assetDao.findAsset(asset);
    }

    public Asset getAssetById(int id){
        return assetDao.getAssetById(id);
    }

    public List<String> getAssetLableById(int id){
        return  assetDao.getAssetLableById(id);
    }

    public List<Stock> findStock(Stock stock){
        return  stockDao.findStock(stock);
    }

    public Stock getStockById(int id){
        return stockDao.getStockById(id);
    }

    public List<String> getStockLableById(int id){
        return  stockDao.getStockLableById(id);
    }

}
