package com.bbs.controller;

import com.bbs.service.CommentService;
import com.bbs.service.PostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminDeletePost")
public class adminDeletePost extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String redirect = request.getParameter("redirectPage");
        if (id == null || id.isEmpty()) {
            String info = "参数缺失，请检查输入";
            request.setAttribute("outputMessage", info);
            request.getRequestDispatcher("/info.jsp").forward(request, response);
            return;
        }
        try {
            int postId = Integer.parseInt(id);
            PostService postService = new PostService();
            CommentService commentService = new CommentService();
            if (commentService.findCommentsByPostId(postId) != null){
                for(int i = 0; i < commentService.findCommentsByPostId(postId).size(); i++){
                    commentService.removeCommentById(commentService.findCommentsByPostId(postId).get(i).getId());
                }
            }
            postService.removePost(postId);
            response.sendRedirect(redirect);
        }
        catch (Exception e) {
            e.printStackTrace();
            String info = "删除失败";
            request.setAttribute("outputMessage", info);
            request.getRequestDispatcher("/info.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
