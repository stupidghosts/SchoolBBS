<%@ page import="com.bbs.service.UserService" %>
<%@ page import="com.bbs.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8" />
  <meta name="author" content="rogepi" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/universal.css" />
  <link rel="stylesheet" href="css/about.css" />
  <title>校园贴吧</title>
  <link rel="icon" href="images/info.png" type="image/x-icon" />

</head>
<body>
<div class="header">
  <h1>个人信息</h1>
  <p>Everything happens for a reason</p>
</div>

<div class="topnav">
  <ul>
    <li><a href="home.jsp">首页</a></li>
    <li><a href="mine.jsp">我的</a></li>
    <li><a href="publish.html">发帖</a></li>
    <li><a href="about.jsp">个人资料</a></li>
    <li><a href="search.jsp">搜索</a></li>
    <li><a href="smile.html">退出登录</a></li>
  </ul>
</div>

<%
  String author = (String) session.getAttribute("username_session");
  UserService userService = new UserService();
  if (author != null) {
    try {
      User user =userService.findUserByName(author);
      request.setAttribute("user", user);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  int len = userService.findUserByName(author).getPassword().length();
  StringBuffer  sb = new StringBuffer();
  for(int i = 0; i < len; i++){
    sb.append("*");
  }
%>
<!-- 新增：个人页面信息展示 -->

<div class="row">
  <div class="card">
    <h3 style="text-align: center;">个人信息</h3>
    <br>
    <div class="profile">
          <div>用 户 名：&emsp;<%= userService.findUserByName(author).getUsername()%></div>
          <div>密&nbsp;&emsp;码:&emsp;&nbsp;<%=sb.toString()%></div>
          <div>性&nbsp;&emsp;别：&emsp;<%= userService.findSexById(userService.findUserByName(author).getUid())%></div>
          <div>注册时间：&emsp;<%= userService.findUserByName(author).getRtime()%></div>
      <button type="button" onclick="window.location.href='updateInfo.jsp'">修改个人资料</button>
    </div>
  </div>
</div>
<div class="footer">
  <h2>Nothing Is Impossible</h2>
</div>

</body>
</html>