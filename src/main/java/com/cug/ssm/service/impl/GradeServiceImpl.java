package com.cug.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cug.ssm.mapper.GradeMapper;
import com.cug.ssm.other.Page;
import com.cug.ssm.po.Grade;
import com.cug.ssm.po.GradeKey;
import com.cug.ssm.services.GradeService;

public class GradeServiceImpl implements GradeService {
	@Autowired
	private GradeMapper gradeMapper;

	public int getGradetTotal() {
		return gradeMapper.getGradetTotal();
	}

	public List<Grade> selectGradeListByCourse(String courseId) {
		return gradeMapper.selectGradeListByCourse(courseId);
	}

	public List<Grade> selectGradeListByID(String stuId) {
		return gradeMapper.selectGradeListByID(stuId);
	}

	public List<Grade> selectGradeList(Page page) {
		return gradeMapper.selectGradeList(page);
	}

	public List<Grade> selectGradeListByClass(String stuId) {
		return gradeMapper.selectGradeListByClass(stuId);
	}

	public Grade selectByPrimaryKey(GradeKey key) {
		return gradeMapper.selectByPrimaryKey(key);
	}

	public int deleteByPrimaryKey(GradeKey key) {
		return gradeMapper.deleteByPrimaryKey(key);
	}

	public int deleteByStuId(String stuId) {
		return gradeMapper.deleteByStuId(stuId);
	}

	public int insert(Grade record) {
		return gradeMapper.insert(record);
	}
}
