package com.cug.ssm.services;

import com.cug.ssm.po.Teacher;

public interface TeacherService {
	public Teacher selectByPrimaryKey(String teacherId);
	public int deleteByPrimaryKey(String teacherId);
}
