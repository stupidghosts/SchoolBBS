package com.bbs.pojo;

import java.sql.Date;

public class User {
    private int uid;
    private String name;
    private String passwd;
    private String sex;
    private java.sql.Date rtime;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return name;
    }

    public void setUsername(String username) {
        this.name = username;
    }

    public String getPassword() {
        return passwd;
    }

    public void setPassword(String passwd) {
        this.passwd = passwd;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getRtime() {
        return rtime;
    }

    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }
    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + name + '\'' +
                ", passwd='" + passwd + '\'' +
                ", sex='" + sex + '\'' +
                ", rtime=" + rtime +
                '}';
    }
}
