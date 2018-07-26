package com.cug.ssm.po;

public class Change {
    private String stuId;

    private String stuName;

    private String stuClassid;

    private String changeStatus;

    private String changeDes;

    private String date;

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

    public String getStuClassid() {
        return stuClassid;
    }

    public void setStuClassid(String stuClassid) {
        this.stuClassid = stuClassid == null ? null : stuClassid.trim();
    }

    public String getChangeStatus() {
        return changeStatus;
    }

    public void setChangeStatus(String changeStatus) {
        this.changeStatus = changeStatus == null ? null : changeStatus.trim();
    }

    public String getChangeDes() {
        return changeDes;
    }

    public void setChangeDes(String changeDes) {
        this.changeDes = changeDes == null ? null : changeDes.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }
}