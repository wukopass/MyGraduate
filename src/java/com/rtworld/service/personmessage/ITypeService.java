package com.rtworld.service.personmessage;

import com.rtworld.pojo.util.CoopType;
import com.rtworld.pojo.util.Industry;
import com.rtworld.pojo.util.InvestType;
import com.rtworld.pojo.util.UserAndType;

import java.util.List;

public interface ITypeService {
    //查看我的偏好合作信息
    public List<CoopType> selectUserCoop();
    public List<Industry> selectUserIndustry();
    public List<InvestType> selectUserInvestType();

    public void EditUserHZ(UserAndType userAndType, String str1, String str2);
    public void EditUserRZ(UserAndType userAndType,String str1);
    public void EditUserTZ(UserAndType userAndType,String str1,String str2);

    public List<UserAndType> selectMyTypeId(UserAndType userAndType);
}
