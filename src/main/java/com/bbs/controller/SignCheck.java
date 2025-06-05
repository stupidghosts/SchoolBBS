package com.bbs.controller;

import com.bbs.pojo.User;
import com.bbs.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SignCheck")
public class SignCheck extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws IOException,ServletException {
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String userpwd = request.getParameter("userpwd");
    String reuserpwd = request.getParameter("reuserpwd");
    String sex = request.getParameter("sex");
    /*String username =" ";
    String userpwd =" ";
    String reuserpwd =" ";*/
    if (username == null || userpwd == null || reuserpwd == null || sex == null || sex.isEmpty()
            || username.isEmpty() || userpwd.isEmpty() || reuserpwd.isEmpty()) {
      String info = "参数缺失，请检查输入";
      request.setAttribute("outputMessage", info);
      request.getRequestDispatcher("/register.jsp").forward(request, response);
      return;
    }
    if(!(sex.equals("男") || sex.equals("女"))){
      String info = "性别只能为男或女！请检查输入";
      request.setAttribute("outputMessage", info);
      request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
    if(username.contains(" ")|| userpwd.contains(" ")|| reuserpwd.contains(" ")){
      String info = "输入不能包含空格！请检查输入";
      request.setAttribute("outputMessage", info);
      request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    if (!userpwd.equals(reuserpwd)) {
      String info = "两次输入的密码不一致";
      request.setAttribute("outputMessage", info);
      request.getRequestDispatcher("/register.jsp").forward(request, response);
      return;
    }

    UserService userService = new UserService();
    try {
      if (userService.checkName(username)) { // 检查用户名是否已存在
        String info = "用户名已存在";
        request.setAttribute("outputMessage", info);
        request.getRequestDispatcher("/register.jsp").forward(request, response);
      }
      else {
        User user = new User();
        user.setUsername(username);
        user.setPassword(userpwd);
        user.setSex(sex);
        userService.insertUser(user);
        response.sendRedirect(request.getContextPath() + "/index.html"); // 保留重定向到静态资源
      }
    } catch (Exception e) {
      e.printStackTrace();
      String info = "系统繁忙，请稍后再试";
      request.setAttribute("outputMessage", info);
      request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws IOException, ServletException {
    doPost(request, response);
  }
}
