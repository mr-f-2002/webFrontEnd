package com.example.projectfrontend2_2.DTO;


import java.sql.Date;

public class Attendance {


    java.util.Date date;


    Long classroomid;


    Long studentid;

    Boolean isPresent;

    public Attendance(Date date, Long classroomID, Long studentID, Boolean isPresent) {
        this.date = date;
        this.classroomid = classroomID;
        this.studentid = studentID;
        this.isPresent = isPresent;
    }

    public Date getDate() {
        return (Date) (Date) date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getClassroomid() {
        return classroomid;
    }

    public void setClassroomid(Long classroomID) {
        this.classroomid = classroomID;
    }

    public Long getStudentid() {
        return studentid;
    }

    public void setStudentid(Long studentid) {
        this.studentid = studentid;
    }

    public Boolean getPresent() {
        return isPresent;
    }

    public void setPresent(Boolean present) {
        isPresent = present;
    }
}
