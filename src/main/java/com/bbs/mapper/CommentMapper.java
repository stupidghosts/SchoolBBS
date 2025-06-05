package com.bbs.mapper;

import com.bbs.pojo.Comment;
import com.bbs.pojo.Post;
import com.bbs.pojo.User;

import java.util.List;

public interface CommentMapper {
    void createComment(Comment comment) throws Exception;
    void removeCommentById(int id) throws Exception ;
    Comment findCommentById(int id) throws Exception;
    List<Comment> findCommentByAuthor(String author) throws Exception;
    List<Comment> findCommentByPostId (int id) throws Exception;
    List<Comment> findCommentAll() throws Exception;
    void updateComment(Comment comment) throws Exception;
    int findPostIdByCommentId(int id) throws Exception;
    List<Comment> findCommentsByPostId (int id) throws Exception;
}
