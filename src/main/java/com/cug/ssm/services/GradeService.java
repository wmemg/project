package com.cug.ssm.services;

import java.util.List;

import com.cug.ssm.other.Page;
import com.cug.ssm.po.Grade;
import com.cug.ssm.po.GradeKey;

public interface GradeService {
	public List<Grade>selectGradeListByID(String stuId);
    public int getGradetTotal();
    public List<Grade> selectGradeListByCourse(String  courseId);
    public List<Grade> selectGradeList(Page page);
    public List<Grade> selectGradeListByClass(String stuId);
    public Grade selectByPrimaryKey(GradeKey key);
    public int deleteByPrimaryKey(GradeKey key);
    public int deleteByStuId(String stuId);
    public   int insert(Grade record);
}
