package com.rtworld.dao.util;

import com.rtworld.pojo.util.UserAndType;

import java.util.List;

public interface IUserAndTypeDao {
    Integer insertUserAndType(UserAndType userAndType);

    int deleteUserAndTypeById(UserAndType userAndType);

    List<UserAndType> selectAllTypeIdByType(UserAndType userAndType);
}
