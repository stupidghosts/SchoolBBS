package com.bbs.mapper;

import com.bbs.pojo.User;

import java.util.List;

public interface UserMapper {
    int insertUser(User user) throws Exception;
    int deleteUser(User user) throws Exception ;
    User selectUserById(int id) throws Exception;
    User findUserByName(String name) throws Exception;
    List<User> selectAllUsers() throws Exception;
    int updateUser(User user) throws Exception;
    User check(String username, String password) throws Exception;
    boolean checkName(String name) throws Exception;
    String findSexById(int id) throws Exception;
    int findIdByName(String name) throws Exception;
}
