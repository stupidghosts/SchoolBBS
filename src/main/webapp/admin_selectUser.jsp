<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bbs.service.UserService" %>
<%@ page import="com.bbs.pojo.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <link rel="stylesheet" href="css/admin.css">
    <link rel="icon" href="images/userManage.png" type="image/x-icon" />
</head>
<body style="position: absolute">
    <h1>用户管理</h1>
    <button onclick="location.href='admin_index.html'" style="position: absolute;right: 390px">返回管理页</button>
    <!-- 显示所有用户 -->
    <h2>用户列表</h2>
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
                        <input type="hidden" name="redirectPage" value="admin_selectUser.jsp">
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