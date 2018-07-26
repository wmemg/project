package com.cug.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cug.ssm.mapper.ChangeMapper;
import com.cug.ssm.po.Change;
import com.cug.ssm.services.ChangeService;

public class ChangeServiceImpl implements ChangeService {
	
	
	@Autowired
	private ChangeMapper changeMapper;

	public List<Change> serachChange(String stuId) {
		return changeMapper.serachChange(stuId);
	}

	public Change selectByPrimaryKey(String stuId) {
		return changeMapper.selectByPrimaryKey(stuId);
	}

	public List<Change> serachChangeAll() {
		return changeMapper.serachChangeAll();
	}

	public List<Change> serachChangeClassAll(String changeClass) {
		return changeMapper.serachChangeClassAll(changeClass);
	}

	public int deleteByPrimaryKey(String stuId) {
		return changeMapper.deleteByPrimaryKey(stuId);
	}

	public void insertNewChangeClass(Change change) {
		changeMapper.insertNewChangeClass(change);
	}

	public List<Change> serachChangeSchoolAll(String changeSchool) {
		return changeMapper.serachChangeSchoolAll(changeSchool);
	}

	public List<Change> reEntrySchoolAll(String reEntrySchool) {
		return changeMapper.reEntrySchoolAll(reEntrySchool);
	}

	public List<Change> stopSchoolAll(String stopSchool) {
		return changeMapper.stopSchoolAll(stopSchool);
	}

	public List<Change> leaveSchoolAll(String stopSchool) {
		return changeMapper.leaveSchoolAll(stopSchool);
	}

	public int updateByPrimaryKeySelective(Change record) {
		return changeMapper.updateByPrimaryKeySelective(record);
	}

	public int insert(Change record) {
		return changeMapper.updateByPrimaryKeySelective(record);
	}
	

	
}
