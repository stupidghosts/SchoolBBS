<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bbs.service.CommentService" %>
<%@ page import="com.bbs.pojo.Comment" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>评论管理</title>
    <link rel="stylesheet" href="css/admin.css">
    <link rel="icon" href="images/comment.png" type="image/x-icon" />
</head>
<body style="position: absolute">
<h1>评论管理</h1>
<button onclick="location.href='admin_index.html'" style="position: absolute;right: 390px">返回管理页</button>
<!-- 显示所有评论 -->
<h2>评论列表</h2>
<table id="commentsTable">
    <thead>
    <tr>
        <th>ID</th>
        <th>内容</th>
        <th>作者</th>
        <th>帖子ID</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        CommentService commentService = new CommentService();
        List<Comment> comments = commentService.findCommentAll();
        for (Comment comment : comments) {
            comment.setPost_id(commentService.findPostIdByCommentId(comment.getId()));
    %>
    <tr>
        <td><%= comment.getId() %></td>
        <td><%= comment.getContent() %></td>
        <td><%= comment.getAuthor() %></td>
        <td><%= comment.getPost_id() %></td>
        <td>
            <form action="adminDeleteComment" method="post">
                <input type="hidden" name="redirectPage" value="admin_selectComment.jsp">
                <input type="hidden" name="id" value="<%= comment.getId() %>">
                <button type="submit">删除</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>