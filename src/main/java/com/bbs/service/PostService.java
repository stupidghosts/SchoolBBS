package com.bbs.service;

import com.bbs.mapper.PostMapper;
import com.bbs.mapper.UserMapper;
import com.bbs.pojo.Post;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.util.List;

public class PostService implements PostMapper{
    public void createPost(Post post) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        postMapper.createPost(post);
        sqlSession.commit();
    }
    public void removePost(int id) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        postMapper.removePost(id);
        sqlSession.commit();
    }
    public Post findPostById(int id) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        Post post = postMapper.findPostById(id);
        sqlSession.commit();
        return post;
    }
    public Post findPostByTitle(String Title) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        Post post = postMapper.findPostByTitle(Title);
        sqlSession.commit();
        return post;
    }
    public List<Post> findPostByAuthor (String author) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        List<Post> postList = postMapper.findPostByAuthor(author);
        sqlSession.commit();
        return postList;
    }
    public List<Post> findPostByType (String type) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        List<Post> postList = postMapper.findPostByType(type);
        sqlSession.commit();
        return postList;
    }
    public List<Post> findAllPost() throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        List<Post> postList = postMapper.findAllPost();
        sqlSession.commit();
        return postList;
    }
    public void updatePost(Post post) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        postMapper.updatePost(post);
        sqlSession.commit();
    }
    public List<Post> searchPosts(String keyword) throws Exception {
        // 读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        // 创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // 创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        // 创建postMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        List<Post> posts = postMapper.searchPosts(keyword); // 调用Mapper中的搜索方法
        sqlSession.commit();
        return posts;
    }
    public List<Post> findAllPostByType (String type) throws Exception{
        //读取配置文件
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        //创建会话工厂
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        //创建sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //准备执行sql语句
        //创建PostMapper对象
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        List<Post> postList = postMapper.findAllPostByType(type);
        sqlSession.commit();
        return postList;
    }
}
