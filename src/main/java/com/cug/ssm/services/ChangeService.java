package com.cug.ssm.services;

import java.util.List;

import com.cug.ssm.po.Change;

public interface ChangeService {
	 public List<Change> serachChange(String stuId);
	 Change selectByPrimaryKey(String stuId);
	 public List<Change> serachChangeAll();
	 public List<Change> serachChangeClassAll(String changeClass);
	 int deleteByPrimaryKey(String stuId);
	 public void insertNewChangeClass(Change change);
	 public List<Change> serachChangeSchoolAll(String changeSchool);
	 public List<Change> reEntrySchoolAll(String reEntrySchool);
	 public List<Change> stopSchoolAll(String stopSchool);
	 public List<Change> leaveSchoolAll(String stopSchool);
	 public int updateByPrimaryKeySelective(Change record);
	 public int insert(Change record);
}
