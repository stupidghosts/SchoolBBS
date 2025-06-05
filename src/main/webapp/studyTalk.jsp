<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bbs.service.PostService" %>
<%@ page import="com.bbs.pojo.Post" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
    <meta name="author" content="rogepi" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/universal.css" />
    <link rel="stylesheet" href="css/search.css" />
    <title>校园贴吧</title>
    <link rel="icon" href="images/index.png" type="image/x-icon" />
</head>
<body>
<div class="header">
    <h1>学习讨论</h1>
    <p>Everything happens for a reason</p>
</div>

<div class="topnav">
    <ul>
        <li><a href="javascript:history.back(-1)">返回</a></li>
        <li><a href="home.jsp">首页</a></li>
        <li><a href="mine.jsp">我的</a></li>
        <li><a href="publish.html">发帖</a></li>
        <li><a href="about.jsp">个人资料</a></li>
        <li><a href="search.jsp">搜索</a></li>
        <li><a href="smile.html">退出登录</a></li>
    </ul>
</div>
<%
    PostService postService = new PostService();
    List<Post> posts = null;
    try {
        posts = postService.findAllPostByType("学习讨论");
    } catch (Exception e) {
        e.printStackTrace();
    }
    // 显示结果
    if (posts != null && !posts.isEmpty()) {
%>
<div class="row">
    <div class="card search-results">
        <ul>
            <%
                for (Post post : posts) {
            %>
            <li>
                <a href="post.jsp?id=<%= post.getId() %>"><%= post.getTitle() %></a>
                <p>作者：<%= post.getAuthor() %></p>
                <p>类型：<%= post.getPostType() %></p>
                <p>时间：<%= post.getDate() %></p>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</div>
<%
} else {
%>
<div class="row">
    <div class="card no-results">
        <h3>没有找到相关帖子</h3>
    </div>
</div>
<%
    }
%>

</body>
</html>