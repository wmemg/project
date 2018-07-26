package com.cug.ssm.services;

import java.util.List;

import com.cug.ssm.other.Page;
import com.cug.ssm.po.StudentBasicInfo;

public interface StudentBasicInfoService {
	public StudentBasicInfo selectByPrimaryKey(String stuId);
	public int deleteByPrimaryKey(String stuId);
	public int insert(StudentBasicInfo record);
	public int updateByPrimaryKey(StudentBasicInfo record);
	public List<StudentBasicInfo> selectStudentAll(Page page);
	public int getStudentTotal();
}
