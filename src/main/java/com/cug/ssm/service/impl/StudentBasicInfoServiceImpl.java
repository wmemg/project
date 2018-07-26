package com.cug.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cug.ssm.mapper.StudentBasicInfoMapper;
import com.cug.ssm.other.Page;
import com.cug.ssm.po.StudentBasicInfo;
import com.cug.ssm.services.StudentBasicInfoService;

public class StudentBasicInfoServiceImpl implements StudentBasicInfoService{
	
	
	@Autowired
	private StudentBasicInfoMapper studentBasicInfoMapper;

	public StudentBasicInfo selectByPrimaryKey(String stuId) {
		return studentBasicInfoMapper.selectByPrimaryKey(stuId);
	}

	public int deleteByPrimaryKey(String stuId) {
		return studentBasicInfoMapper.deleteByPrimaryKey(stuId);
	}

	public int insert(StudentBasicInfo record) {
		return studentBasicInfoMapper.insert(record);
	}

	public int updateByPrimaryKey(StudentBasicInfo record) {
		return studentBasicInfoMapper.updateByPrimaryKey(record);
	}

	public List<StudentBasicInfo> selectStudentAll(Page page) {
		return studentBasicInfoMapper.selectStudentAll(page);
	}

	public int getStudentTotal() {
		return studentBasicInfoMapper.getStudentTotal();
	}

	
}
