package com.rtworld.service.tutor.impl;

import com.rtworld.dao.tutor.ITutorDao;
import com.rtworld.pojo.guidance.GoodField;
import com.rtworld.pojo.guidance.SuccessCase;
import com.rtworld.pojo.guidance.Tutor;
import com.rtworld.service.tutor.ITutorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Transactional
@Service
public class TutorServiceImpl implements ITutorService {

    @Autowired
    private ITutorDao tutorDao;

    @Override
    public Integer insertTutor(Tutor tutor) {
        Integer res = tutorDao.insertTutor(tutor);
        return res;
    }

    @Override
    public List<Tutor> searchTutor() {
        List<Tutor> list = tutorDao.searchTutor();
        for (Tutor tutor : list) {
            List<SuccessCase> successCases = tutorDao.selectCaseById(tutor.getId());
            List<String> goodFields = tutorDao.selectFieldById(tutor.getId());
            tutor.setSuccessCases(successCases);
            tutor.setGoodFields(goodFields);
        }
        return list;
    }

    @Override
    public Tutor searchOneTutor(int id) {
        Tutor tutor = tutorDao.selectOneTutor(id);
        String[] stages = tutorDao.selectStageById(tutor.getId());
        List<SuccessCase> successCases = tutorDao.selectCaseById(tutor.getId());
        List<String> goodFields = tutorDao.selectFieldById(tutor.getId());
        tutor.setSuccessCases(successCases);
        tutor.setGoodFields(goodFields);
        tutor.setProjectStages(stages);
        return tutor;
    }
}
