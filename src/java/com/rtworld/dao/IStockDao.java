package com.rtworld.dao;

import com.rtworld.pojo.demand.CoopToLable;
import com.rtworld.pojo.demand.File;
import com.rtworld.pojo.demand.Image;
import com.rtworld.pojo.demand.Stock;

import java.util.List;

public interface IStockDao {
    void saveStock(Stock stock);
    void saveLable(CoopToLable coopToLable);
    void saveImage(Image image);
    void saveFile(File file);
    int queryStockId(String date);
    List<Stock> findStock(Stock stock);
    Stock getStockById(int id);
    List<String> getStockLableById(int id);
}
