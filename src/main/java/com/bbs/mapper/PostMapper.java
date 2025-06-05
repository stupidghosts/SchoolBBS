package com.bbs.mapper;

import com.bbs.pojo.Post;

import java.util.List;

public interface PostMapper {
    void createPost(Post post) throws Exception;
    void removePost(int id) throws Exception ;
    Post findPostById(int id) throws Exception;
    Post findPostByTitle(String Title) throws Exception;
    List<Post> searchPosts(String keyword) throws Exception;
    List<Post> findPostByAuthor (String author) throws Exception;
    List<Post> findPostByType (String type) throws Exception;
    List<Post> findAllPost() throws Exception;
    void updatePost(Post post) throws Exception;
    List<Post> findAllPostByType (String type) throws Exception;
}
