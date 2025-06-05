package com.bbs.service;

import com.bbs.mapper.CommentMapper;
import com.bbs.mapper.PostMapper;
import com.bbs.pojo.Comment;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.util.List;

public class CommentService implements CommentMapper{
    public void createComment(Comment comment) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        commentMapper.createComment(comment);
        sqlSession.commit();
    }
    public void removeCommentById(int id) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        commentMapper.removeCommentById(id);
        sqlSession.commit();
    }
    public Comment findCommentById(int id) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        Comment comment= commentMapper.findCommentById(id);
        sqlSession.commit();
        return comment;
    }
    public List<Comment> findCommentByAuthor(String author) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        List<Comment> comments= commentMapper.findCommentByAuthor(author);
        sqlSession.commit();
        return comments;
    }
    public List<Comment> findCommentByPostId (int id) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        List<Comment> comments= commentMapper.findCommentByPostId(id);
        sqlSession.commit();
        return comments;
    }
    public List<Comment> findCommentsByPostId (int id) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        List<Comment> comment= commentMapper.findCommentsByPostId(id);
        sqlSession.commit();
        return comment;
    }
    public List<Comment> findCommentAll() throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        List<Comment> comments= commentMapper.findCommentAll();
        sqlSession.commit();
        return comments;
    }
    public void updateComment(Comment comment) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
        commentMapper.updateComment(comment);
        sqlSession.commit();
    }
    public int findPostIdByCommentId(int id) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建CommentMapper对象
        CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
       int postId= commentMapper.findPostIdByCommentId(id);
       sqlSession.commit();
       return postId;
    }
}
