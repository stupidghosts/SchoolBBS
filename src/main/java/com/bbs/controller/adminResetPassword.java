package com.bbs.controller;

import com.bbs.pojo.User;
import com.bbs.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminResetPassword")
public class adminResetPassword extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        doPost(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("userName");
        String password = request.getParameter("newPassword");
        String sex = request.getParameter("sex");
        String id = request.getParameter("uid");
        String redirect = request.getParameter("redirectPage");
        UserService userService = new UserService();
        if(username.equals("")){
            String info = "用户名不能为空";
            request.setAttribute("outputMessage", info);
            request.getRequestDispatcher("/info.jsp").forward(request, response);
        }
        try {
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setSex(sex);
            user.setUid(Integer.parseInt(id));
            int i = userService.updateUser(user);
            if (i > 0) {
                request.getRequestDispatcher(redirect).forward(request, response);
            } else {
                String info = "更新失败";
                request.setAttribute("outputMessage", info);
                request.getRequestDispatcher("/info.jsp").forward(request, response);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
