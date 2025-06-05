<%@ page import="com.bbs.service.PostService" %>
<%@ page import="com.bbs.pojo.Post" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html lang="zh-CN">

<head>
  <meta charset="utf-8" />
  <meta name="author" content="rogepi" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/universal.css" />
  <link rel="stylesheet" href="css/about.css" />
  <link rel="stylesheet" href="css/mine.css" />
  <title>校园贴吧</title>
  <link rel="icon" href="images/mine.png" type="image/x-icon" />
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
    <li><a href="smile.html">退出登录</a></li>
  </ul>
</div>

<div class="row">
  <div class="Mycard">
    <h3>我的贴子</h3>
    <br>
    <%
      String author = (String) session.getAttribute("username_session");
      PostService postService = new PostService();
      List<Post> posts = null;
      try {
        posts = postService.findPostByAuthor(author);
      } catch (Exception e) {
        e.printStackTrace();
      }
      assert posts != null;
      for (Post post : posts) { %>
    <form action="./post.jsp" method="post" id="form<%=post.getId()%>" style="display:flex;">
      <label>
        <input type="hidden" name="id" value="<%=post.getId()%>">
      </label>
      <div class="posta"style="float: left">
        <a href="" onclick="document.getElementById('form<%=post.getId()%>').submit();return false;"><%=post.getTitle()%></a>
      </div>
    </form>
    <!-- 删除和编辑按钮 -->
    <div class="post-actions">
      <form action="editPost.jsp" method="post" style="display: inline;">
        <input type="hidden" name="id" value="<%=post.getId()%>">
        <button class="action-btn edit-btn" type="submit">编辑</button>
      </form>
      <form action="DeletePost" method="post" style="display: inline;">
        <input type="hidden" name="id" value="<%=post.getId()%>">
        <button class="action-btn delete-btn" type="submit">删除</button>
      </form>
    </div>
    <%
      }
    %>
  </div>
</div>

<div class="footer">
  <h2>Nothing Is Impossible</h2>
</div>

</body>

</html>