package com.cug.ssm.mapper;

import java.util.List;

import com.cug.ssm.other.Page;
import com.cug.ssm.po.StudentBasicInfo;

public interface StudentBasicInfoMapper {
    int deleteByPrimaryKey(String stuId);

    int insert(StudentBasicInfo record);

    int insertSelective(StudentBasicInfo record);

    StudentBasicInfo selectByPrimaryKey(String stuId);

    int updateByPrimaryKeySelective(StudentBasicInfo record);

    int updateByPrimaryKey(StudentBasicInfo record);
    
    ///////////////////////////////////////////////////////////
    public List<StudentBasicInfo> selectStudentAll(Page page);
    public int getStudentTotal();
}