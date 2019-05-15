package com.rtworld.dao;

import com.rtworld.pojo.demand.*;
import com.rtworld.pojo.user.RtUser;

import java.util.List;

public interface ICooperationDao {

    //获取coop表的ID
    int queryCooperationId(String date);
    //往coop表插入数据
    int saveCooperation(Cooperation cooperation);

    int saveResourceType(CoopToCoopType coopToCoopType);

    int saveLable(CoopToLable coopToLable);

    int saveImage(Image image);

    int saveFile(File file);

    Cooperation getCooperation(int id);
    List<String> getResourceTypeById(int id);
    List<String> getLableById(int id);
    RtUser getUserByName(String name);

    List<String> getAllCity();

    List<CoopType> getAllCoopTypes();

    List<Industry> getAllIndustry();

    List<Lable> getAllLable();

    List<Cooperation> findCooperation(Cooperation cooperation);


}
