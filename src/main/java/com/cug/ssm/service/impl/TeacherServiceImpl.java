package com.cug.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.cug.ssm.mapper.TeacherMapper;
import com.cug.ssm.po.Teacher;
import com.cug.ssm.services.TeacherService;

public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherMapper teacherMapper;

	public Teacher selectByPrimaryKey(String teacherId) {
		return null;
	}

	public int deleteByPrimaryKey(String teacherId) {
		return 0;
	}

}
