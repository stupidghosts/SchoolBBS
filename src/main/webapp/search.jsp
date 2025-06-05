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
    <link rel="icon" href="images/search.png" type="image/x-icon" />
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
    <div class="searchCard">
        <h3>搜索帖子</h3>
        <form action="search.jsp" method="get" class="search-form">
            <input type="text" name="keyword" placeholder="请输入关键字" required>
            <button type="submit">搜索</button>
        </form>
    </div>
</div>
<%
    // 获取请求参数中的关键字
    String keyword = request.getParameter("keyword");
    if (keyword != null && !keyword.isEmpty()) {
        // 创建PostService实例
        PostService postService = new PostService();
        // 调用searchPosts方法获取搜索结果
        List<Post> searchResults = null;
        try {
            searchResults = postService.searchPosts(keyword);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 显示搜索结果
        if (searchResults != null && !searchResults.isEmpty()) {
%>
<div class="row">
    <div class="card search-results">
        <h3 style="color: white">搜索结果</h3>
        <ul>
            <%
                for (Post post : searchResults) {
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
    }
%>

<div class="footer">
    <h2>Nothing Is Impossible</h2>
</div>
</body>
</html>