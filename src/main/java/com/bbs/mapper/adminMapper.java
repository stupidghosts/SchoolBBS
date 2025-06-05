package com.bbs.mapper;


import com.bbs.pojo.Admin;

public interface adminMapper {
    Admin checkAdmin(String username, String password) throws Exception;
}
