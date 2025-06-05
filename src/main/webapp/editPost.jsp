<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bbs.service.PostService" %>
<%@ page import="com.bbs.pojo.Post" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
    <meta name="author" content="rogepi" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/universal.css" />
    <title>校园贴吧</title>
    <link rel="icon" href="images/postManage.png" type="image/x-icon" />
    <link rel="stylesheet" href="css/editPost.css">
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
    <div class="card">
        <h3>编辑帖子</h3>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            PostService postService = new PostService();
            Post post = null;
            try {
                post = postService.findPostById(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (post != null) {
        %>
        <form action="UpdatePost" method="post">
            <input type="hidden" name="id" value="<%= post.getId() %>">
            <div class="form-group">
                <label for="title">标题：</label>
                <input type="text" id="title" name="title" value="<%= post.getTitle() %>" required>
            </div>
            <div class="form-group">
                <label for="content">内容：</label>
                <textarea id="content" name="content" rows="10" required><%= post.getContent() %></textarea>
            </div>
            <div class="form-group">
                <label for="type">类型：</label>
                <select id="type" name="type">
                    <option value="学习讨论" <%= "学习讨论".equals(post.getPostType()) ? "selected" : "" %>>学习讨论</option>
                    <option value="校园生活" <%= "校园生活".equals(post.getPostType()) ? "selected" : "" %>>校园生活</option>
                    <option value="表白墙" <%= "表白墙".equals(post.getPostType()) ? "selected" : "" %>>表白墙</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">保存更改</button>
            </div>
        </form>
        <%
            } else {
        %>
        <p>帖子不存在或已被删除。</p>
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