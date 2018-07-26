package com.cug.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.cug.ssm.mapper.CourseMapper;
import com.cug.ssm.po.Course;
import com.cug.ssm.services.CourseService;

public class CourseServiceImpl implements CourseService {
	
	
	@Autowired
	private CourseMapper courseMapper;

	public Course selectByPrimaryKey(String courseId) {
		return courseMapper.selectByPrimaryKey(courseId);
	}

}
