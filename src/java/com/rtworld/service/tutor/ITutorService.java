package com.rtworld.service.tutor;

import com.rtworld.pojo.guidance.Tutor;

import java.util.List;

public interface ITutorService {
    //生成导师数据
    Integer insertTutor(Tutor tutor);
    //查询导师数据
    List<Tutor> searchTutor();
    //查询单个导师的数据
    Tutor searchOneTutor(int id);
}
