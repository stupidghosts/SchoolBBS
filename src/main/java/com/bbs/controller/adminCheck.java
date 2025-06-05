package com.bbs.controller;

import com.bbs.pojo.Admin;
import com.bbs.service.adminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminCheck")
public class adminCheck extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        String adminName = request.getParameter("adminName");
        String adminPassword = request.getParameter("adminPassword");
        adminService adminService = new adminService();
        try {
            Admin admin = adminService.checkAdmin(adminName, adminPassword);
            if (admin != null) {
                request.getRequestDispatcher("admin_index.html").forward(request, response);
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
