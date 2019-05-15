package com.rtworld.dao.user;

import com.rtworld.pojo.user.HistoryJob;

public interface IHistoryJobDao {
    void saveMsg(HistoryJob historyJob);

    void updateMsg(HistoryJob historyJob);
}
