package com.bbs.controller;

import com.bbs.pojo.Admin;
import com.bbs.pojo.User;
import com.bbs.service.UserService;
import com.bbs.service.adminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginCheck")
public class loginCheck extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    doPost(request, response);
  }
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException{
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password = request.getParameter("userpwd");
    UserService userService = new UserService();
    try {
      User user = userService.check(username, password);
      if (user != null) {
        request.setAttribute("user", user);
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("username_session", username);
        request.getRequestDispatcher("home.jsp").forward(request, response);
      }
      else {
        String info = "用户名或密码有误!";
        request.setAttribute("outputMessage", info);
        request.getRequestDispatcher("/info.jsp").forward(request, response);
      }
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}
