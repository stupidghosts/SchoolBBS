package com.bbs.controller;

import com.bbs.pojo.Post;
import com.bbs.service.PostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/PostWrite")
public class PostWrite extends HttpServlet {
@Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    HttpSession session = request.getSession();
    String author = (String) session.getAttribute("username_session");
    String type = request.getParameter("ntype");
    String content = request.getParameter("content");

    Post post = new Post();
    post.setTitle(title);
    post.setAuthor(author);
    post.setPostType(type);
    post.setContent(content);
    PostService postService = new PostService();
    try {
      postService.createPost(post);
      post = postService.findPostByTitle(title);
      response
          .getWriter()
          .print(
              "<script type=\"text/javascript\">\n"
                  + "window.location.href='post.jsp?id="+post.getId()+"'\n"
                  + "</script>");
    } catch (Exception e) {
      e.printStackTrace();
      String info = "文章录入失败,标题、类型不能为空";
      request.setAttribute("outputMessage",info);
      request.getRequestDispatcher("postErrorInfo.jsp").forward(request, response);
    }
}

@Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException,ServletException {
    doPost(request,response);
  }
}
