package com.cug.ssm.po;

public class StudentBasicInfo {
    private String stuId;

    private String stuName;

    private String stuSex;

    private String stuAcademy;

    private String stuDept;

    private String stuClassid;

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId == null ? null : stuId.trim();
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex == null ? null : stuSex.trim();
    }

    public String getStuAcademy() {
        return stuAcademy;
    }

    public void setStuAcademy(String stuAcademy) {
        this.stuAcademy = stuAcademy == null ? null : stuAcademy.trim();
    }

    public String getStuDept() {
        return stuDept;
    }

    public void setStuDept(String stuDept) {
        this.stuDept = stuDept == null ? null : stuDept.trim();
    }

    public String getStuClassid() {
        return stuClassid;
    }

    public void setStuClassid(String stuClassid) {
        this.stuClassid = stuClassid == null ? null : stuClassid.trim();
    }
}