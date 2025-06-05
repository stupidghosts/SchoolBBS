package com.bbs.controller;

import com.bbs.mapper.UserMapper;
import com.bbs.pojo.Comment;
import com.bbs.pojo.Post;
import com.bbs.pojo.User;
import com.bbs.service.CommentService;
import com.bbs.service.PostService;
import com.bbs.service.UserService;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateInfo")
public class UpdateInfo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String oldUsername = request.getParameter("oldName");
        String sex = request.getParameter("sex");
        String password = request.getParameter("password");
        String oldPassword = request.getParameter("oldPassword");
        User user = new User();
        user.setUsername(username);
        user.setSex(sex);

        try {
            // 加密密码
            user.setPassword(password);
            UserService userService = new UserService();

            // 检查用户名是否已存在（排除当前用户）
            if (!username.equals(oldUsername) && userService.checkName(username)) {
                request.setAttribute("outputMessage", "用户名已存在");
                request.getRequestDispatcher("/updateInfo.jsp").forward(request, response);
                return;
            }

            // 更新用户信息
            int id = userService.findIdByName(oldUsername);
            user.setUid(id);
            int updateResult = userService.updateUser(user);

            if (updateResult <= 0) {
                request.setAttribute("outputMessage", "更新失败");
                request.getRequestDispatcher("/info.jsp").forward(request, response);
                return;
            }

            // 更新帖子作者名
            PostService postService = new PostService();
            List<Post> posts = postService.findPostByAuthor(oldUsername);
            for (Post post : posts) {
                post.setAuthor(username);
                postService.updatePost(post);
            }

            // 更新评论作者名
            CommentService commentService = new CommentService();
            List<Comment> comments = commentService.findCommentByAuthor(oldUsername);
            if (comments != null && !comments.isEmpty()) {
                for (Comment comment : comments) {
                    int postId = commentService.findPostIdByCommentId(comment.getId());
                    comment.setPost_id(postId);
                    comment.setAuthor(username);
                    commentService.updateComment(comment);
                }
            }
            // 更新 session 中的用户名
            HttpSession session = request.getSession();
            session.setAttribute("username_session", username);
            if(!(username.equals(oldUsername) && password.equals(oldPassword))){
                request.getRequestDispatcher("/index.html").forward(request, response);
                return;
            }
            // 重定向到 index.html（绝对路径）
            response.sendRedirect(request.getContextPath() + "/about.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("outputMessage", "服务器错误：" + e.getMessage());
            request.getRequestDispatcher("/info.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}