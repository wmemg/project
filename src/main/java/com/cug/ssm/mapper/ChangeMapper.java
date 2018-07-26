package com.cug.ssm.mapper;

import java.util.List;

import com.cug.ssm.po.Change;

public interface ChangeMapper {
    int deleteByPrimaryKey(String stuId);

    int insert(Change record);

    int insertSelective(Change record);

    Change selectByPrimaryKey(String stuId);

    int updateByPrimaryKeySelective(Change record);

    int updateByPrimaryKey(Change record);
    
    
    
    /////////////////////////////////////////////////
    public List<Change> serachChange(String stuId);
    public List<Change> serachChangeAll();
    public List<Change> serachChangeClassAll(String changeClass);
    public void insertNewChangeClass(Change change);
    public List<Change> serachChangeSchoolAll(String changeSchool);
    public List<Change> reEntrySchoolAll(String reEntrySchool);
    public List<Change> stopSchoolAll(String stopSchool);
    public List<Change> leaveSchoolAll(String stopSchool);
    
}