package com.bbs.controller;

import com.bbs.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminDeleteComment")
public class adminDeleteComment extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String redirect = request.getParameter("redirectPage");
        if (id == null || id.isEmpty()) {
            String info = "id为空";
            request.setAttribute("outputMessage", info);
            request.getRequestDispatcher("/info.jsp").forward(request, response);
            return;
        }
        try {
            CommentService commentService = new CommentService();
            commentService.removeCommentById(Integer.parseInt(id));
            request.getRequestDispatcher(redirect).forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
