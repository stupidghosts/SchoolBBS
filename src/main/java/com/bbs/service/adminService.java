package com.bbs.service;

import com.bbs.mapper.adminMapper;
import com.bbs.pojo.Admin;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class adminService implements adminMapper {
    public Admin checkAdmin(String adminName, String adminPassword) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建adminMapper对象
        adminMapper adminMapper = sqlSession.getMapper(adminMapper.class);
        Admin admin = adminMapper.checkAdmin(adminName, adminPassword);
        sqlSession.commit();
        return admin;
    }
}
