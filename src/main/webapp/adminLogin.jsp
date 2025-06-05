<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
    <meta name="author" content="rogepi" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/universal.css" />
    <link rel="stylesheet" href="css/about.css" />
    <link rel="stylesheet" href="css/index.css" />
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
        <li><a href="#">首页</a></li>
        <li><a href="#">我的</a></li>
        <li><a href="#">发帖</a></li>
        <li><a href="#">个人资料</a></li>
        <li><a href="#">搜索</a></li>
        <li><a href="index.html">登录</a></li>
    </ul>
</div>

<div class="row">
    <div class="card">
        <h3>管理员登录</h3>
        <br>
        <div class="login">
            <form action="adminCheck" method="post">
                <br>
                <label>用户名：<input type="text" name="adminName"></label>
                <br><br>
                <label>密 码：<input type="password" name="adminPassword"></label>
                <br><br>
                <button type="submit">登录</button>
            </form>
        </div>
        <br>
        <a href="./index.html">返回用户登录</a>
    </div>
</div>

<div class="footer">
    <h2 style="color: black">Nothing Is Impossible</h2>
</div>

</body>

</html>