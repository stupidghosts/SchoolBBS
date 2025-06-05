
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html lang="zh-CN">

<head>
  <meta charset="utf-8" />
  <meta name="author" content="rogepi" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/universal.css" />
  <link rel="stylesheet" href="css/home_login.css" />
  <title>校园贴吧</title>
  <link rel="icon" href="images/index.png" type="image/x-icon" />
</head>

<body>
<div class="header">
  <h1>校园贴吧</h1>
  <p>Everything happens for a reason</p>
</div>

<div class="topnav">
  <ul>
    <li><a href="home.jsp">首页</a></li>
    <li><a href="mine.jsp">我的</a></li>
    <li><a href="publish.html">发帖</a></li>
    <li><a href="about.jsp">个人资料</a></li>
    <li><a href="search.jsp">搜索</a></li>
    <li><a href="home_login.jsp">退出登录</a></li>
  </ul>
</div>

<div class="row">
  <div class="card">
    <h3>当前登录</h3>
    <br>
    <h2><%=session.getAttribute("username_session")%>, 欢迎您</h2>
    <button onclick="window.location.href='./index.html'">登出</button>
  </div>
</div>
<div class="footer">
  <h2>Nothing Is Impossible</h2>
</div>

</body>
</html>
