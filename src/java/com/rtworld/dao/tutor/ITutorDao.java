package com.rtworld.dao.tutor;

import com.rtworld.pojo.guidance.GoodField;
import com.rtworld.pojo.guidance.SuccessCase;
import com.rtworld.pojo.guidance.Tutor;

import java.util.List;

public interface ITutorDao {
    //生成导师数据
    Integer insertTutor(Tutor tutor);
    //查询导师数据
    List<Tutor> searchTutor();
    //通过导师id查询成功的案例
    List<SuccessCase> selectCaseById(int id);
    //通过导师id查询擅长的领域
    List<String> selectFieldById(int id);
    //通过导师id查询导师的资料
    Tutor selectOneTutor(int id);
    //通过导师id查询擅长的阶段
    String[] selectStageById(int id);
}
