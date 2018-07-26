package com.cug.ssm.mapper;

import java.util.List;

import com.cug.ssm.other.Page;
import com.cug.ssm.po.Grade;
import com.cug.ssm.po.GradeKey;

public interface GradeMapper {
    int deleteByPrimaryKey(GradeKey key);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(GradeKey key);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
    
    
    
    ////////////////////////////////////////////////////////////
    //public List<Grade> selectGradeListByID(String stuId);
    public List<Grade>selectGradeListByID(String stuId);
    public int getGradetTotal();
    public List<Grade> selectGradeListByCourse(String  courseId);
    public List<Grade> selectGradeList(Page page);
    public List<Grade> selectGradeListByClass(String stuId);
    public int deleteByStuId(String stuId);
    
}