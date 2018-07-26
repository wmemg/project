package com.cug.ssm.services;

import com.cug.ssm.po.Course;

public interface CourseService {
	public Course selectByPrimaryKey(String courseId);
}
