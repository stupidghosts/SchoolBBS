<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bbs.service.PostService" %>
<%@ page import="com.bbs.pojo.Post" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html lang="zh-CN">

<head>
  <meta http-equiv="Expires" content="0">
  <meta http-equiv="kiben" content="no-cache">
  <meta charset="utf-8" />
  <meta name="author" content="rogepi" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/universal.css" />
  <link rel="stylesheet" href="css/home.css" />
  <title>校园贴吧</title>
  <link rel="icon" href="images/index.png" type="image/x-icon" />
  <link rel="shortcut icon" href="images/index.png" type="image/x-icon" />
  <link rel="stylesheet" href="css/announcement.css" />
  <script src="js/announcement.js"></script>
</head>

<body>
<button id="showPopup" onclick="showPopup()">公告</button>
<div id="overlay">
  <div class="popup">
    <p class="popup_title">公告</p>
    <p class="popup_content">严禁出现不符合社会主义核心价值观的内容！</p>
    <div class="popup_btn">
      <button class="cancelBtn" onclick="hidePopup()">取消</button>
      <button class="confirmBtn" onclick="hidePopup()">确认</button>
    </div>
  </div>
</div>
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
    <li><a href="smile.html">退出登录</a></li>
  </ul>
</div>

<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <a href="biaoBai.jsp" style="text-decoration-line: none"><h3>表白墙</h3></a>
      <br>
      <%
        PostService postService = new PostService();
        List<Post> posts = null;
        try {
          posts = postService.findPostByType("表白墙");
        } catch (Exception e) {
          e.printStackTrace();
        }
        assert posts != null;
        for (Post post : posts) { %>
      <form action="./post.jsp" method="post" id="form<%=post.getId()%>">
        <label>
          <input type="text" name="id" value="<%=post.getId()%>">
        </label>
        <div class="posta"><a href="" onclick="document.getElementById('form<%=post.getId()%>').submit();return false;"><%=post.getTitle()%></a></div>
      </form>
      <%
        }
      %>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <a href="studyTalk.jsp" style="text-decoration-line: none"><h3>学习讨论</h3></a>
      <br>
      <%
        try {
          posts = postService.findPostByType("学习讨论");
        } catch (Exception e) {
          e.printStackTrace();
        }
        assert posts != null;
        for (Post post : posts) { %>
      <form action="./post.jsp" method="post" id="form<%=post.getId()%>">
        <label>
          <input type="text" name="id" value="<%=post.getId()%>">
        </label>
        <div class="posta"><a href="" onclick="document.getElementById('form<%=post.getId()%>').submit();return false;"><%=post.getTitle()%></a></div>
      </form>
      <%
        }
      %>
    </div>
    <div class="card">
      <a href="schoolLife.jsp" style="text-decoration-line: none"><h3>校园生活</h3></a>
      <br>
      <%
        try {
          posts = postService.findPostByType("校园生活");
        } catch (Exception e) {
          e.printStackTrace();
        }
        assert posts != null;
        for (Post post : posts) { %>
      <form action="./post.jsp" method="post" id="form<%=post.getId()%>">
        <label>
          <input type="text" name="id" value="<%=post.getId()%>">
        </label>
        <div class="posta"><a href="" onclick="document.getElementById('form<%=post.getId()%>').submit();return false;">
           <%=post.getTitle()%>
        </a></div>
      </form>
      <%
        }
      %>
    </div>
  </div>
</div>
</body>
