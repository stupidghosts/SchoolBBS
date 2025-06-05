<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bbs.service.UserService" %>
<%@ page import="com.bbs.pojo.Post" %>
<%@ page import="com.bbs.pojo.Comment" %>
<%@ page import="com.bbs.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bbs.service.PostService" %>
<%@ page import="com.bbs.service.CommentService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理</title>
    <link rel="icon" href="images/admin.png" type="image/x-icon" />
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
    <h1>后台管理</h1>
    <button onclick="location.href='admin_index.html'" style="position: absolute;right: 390px">返回管理页</button>
    <!-- 显示所有帖子 -->
    <h2>帖子管理</h2>
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
                        <input type="hidden" name="redirectPage" value="admin.jsp">
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

    <!-- 显示所有评论 -->
    <h2>评论管理</h2>
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
                        <input type="hidden" name="redirectPage" value="admin.jsp">
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

    <!-- 显示所有用户 -->
    <h2>用户管理</h2>
    <table id="usersTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>性别</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <%
                UserService userService = new UserService();
                List<User> users = userService.selectAllUsers();
                for (User user : users) {
            %>
            <tr>
                <td><%= user.getUid() %></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getSex() %></td>
                <td>
                    <form action="adminResetPassword" method="post">
                        <input type="hidden" name="redirectPage" value="admin.jsp">
                        <input type="hidden" name="uid" value="<%= user.getUid() %>">
                        <input type="hidden" name="userName" value="<%= user.getUsername() %>">
                        <input type="hidden" name="sex" value="<%= user.getSex() %>">
                        <input type="text" name="newPassword" placeholder="输入新密码">
                        <button type="submit">重置密码</button>
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