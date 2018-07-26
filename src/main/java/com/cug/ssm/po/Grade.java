package com.cug.ssm.po;

public class Grade extends GradeKey {
    private String stuName;

    private String stuClassid;

    private Float grade;

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getStuClassid() {
        return stuClassid;
    }

    public void setStuClassid(String stuClassid) {
        this.stuClassid = stuClassid == null ? null : stuClassid.trim();
    }

    public Float getGrade() {
        return grade;
    }

    public void setGrade(Float grade) {
        this.grade = grade;
    }
}