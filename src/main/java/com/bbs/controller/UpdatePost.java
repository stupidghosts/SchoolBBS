package com.bbs.controller;

import com.bbs.pojo.Post;
import com.bbs.service.PostService;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UpdatePost")
public class UpdatePost extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        HttpSession session = request.getSession();
        String author = (String) session.getAttribute("username_session");
        String type = request.getParameter("type");
        String content = request.getParameter("content");
        Post post = new Post();
        post.setId(Integer.parseInt(id));
        post.setTitle(title);
        post.setAuthor(author);
        post.setPostType(type);
        post.setContent(content);
        if (id == null || id.isEmpty()) {
            String info = "参数缺失，请检查输入";
            request.setAttribute("outputMessage", info);
            request.getRequestDispatcher("/info.jsp").forward(request, response);
            return;
        }
        try {
            PostService postService = new PostService();
            postService.updatePost(post);
            request.setAttribute("post", post);
            System.out.println("post update success");
            request.getRequestDispatcher("/mine.jsp").forward(request, response);
            return;
        }
        catch (Exception e) {
            e.printStackTrace();
            String info = "参数错误，请检查输入";
            request.setAttribute("outputMessage", info);
            request.getRequestDispatcher("/info.jsp").forward(request, response);
            return;
        }
    }
}
