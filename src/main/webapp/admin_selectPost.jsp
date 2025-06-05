<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bbs.service.PostService" %>
<%@ page import="com.bbs.pojo.Post" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>帖子管理</title>
    <link rel="stylesheet" href="css/admin.css">
    <link rel="icon" href="images/postManage.png" type="image/x-icon" />
</head>
<body>
    <h1>帖子管理</h1>
    <button onclick="location.href='admin_index.html'" style="position: absolute;right: 390px">返回管理页</button>
    <!-- 显示所有帖子 -->
    <h2>帖子列表</h2>
    <table id="postsTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>内容</th>
                <th>作者</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <%
                PostService postService = new PostService();
                List<Post> posts = postService.findAllPost();
                for (Post post : posts) {
            %>
            <tr>
                <td><%= post.getId() %></td>
                <td><%= post.getTitle() %></td>
                <td><%= post.getContent() %></td>
                <td><%= post.getAuthor() %></td>
                <td>
                    <form action="adminDeletePost" method="post">
                        <input type="hidden" name="redirectPage" value="admin_selectPost.jsp">
                        <input type="hidden" name="id" value="<%= post.getId() %>">
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