<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bbs.service.announcementService" %>
<%@ page import="com.bbs.pojo.Announcement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公告管理</title>
    <link rel="stylesheet" href="css/admin.css">
    <link rel="icon" href="images/admin.png" type="image/x-icon" />
    <style>
        /* 自定义公告列表样式 */
        .announcement-list {
            margin-top: 20px;
        }
        .announcement-item {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .announcement-item button {
            margin-left: 10px;
        }
        /* 新增公告发布表单样式 */
        .announcement-form {
            margin-bottom: 20px;
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.71);
            box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 4px 4px 0 rgba(0, 0, 0, 0.19);
        }
        .announcement-form input {
            padding: 8px;
            width: 80%;
            margin-right: 10px;
        }
        .announcement-form button {
            padding: 8px 16px;
            background-color: #235D3A;
            color: white;
            border: none;
            cursor: pointer;
        }
        /* 隐藏编辑和删除按钮 */
        .announcement-item .actions {
            display: none;
        }
        .announcement-item:hover .actions {
            display: block;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>公告管理</h1>
</div>

<div class="topnav">
    <a href="admin_selectUser.jsp">用户管理</a>
    <a href="admin_selectPost.jsp">帖子管理</a>
    <a href="admin_selectComment.jsp">评论管理</a>
    <a href="admin.jsp">查询所有</a>
    <a href="index.html">退出后台</a>
    <a href="announcement.jsp">公告管理</a>
</div>

<div class="content">
    <!-- 新增公告发布表单 -->
    <div class="card">
        <h2>发布新公告</h2>
        <div class="announcement-form">
            <form action="addAnnouncement" method="post">
                <input type="text" name="newAnnouncement" placeholder="请输入公告内容">
                <button type="submit">发布</button>
            </form>
        </div>
    </div>

    <!-- 公告列表 -->
    <div class="card">
        <h2>公告列表</h2>
        <div class="announcement-list" id="announcementList">
            <%
                // 获取公告
                announcementService announcementService = new announcementService();
                List<Announcement> announcements = announcementService.findAnnouncement();
                if (announcements == null) {
                    announcements = new ArrayList<>();
                    session.setAttribute("announcements", announcements);
                }

                // 处理发布新公告
                String newAnnouncement = request.getParameter("newAnnouncement");
                if (newAnnouncement != null && !newAnnouncement.trim().isEmpty()) {
                    Announcement  announcement = new Announcement();
                    announcement.setAnnouncement_content(newAnnouncement);
                    request.setAttribute("announcement", announcement);
                }

                // 显示公告列表
                for (Announcement announcement : announcements) {
            %>
            <div class="announcement-item">
                <span>公告<%= announcement.getAnnouncement_id()%></span>
                <div class="actions">
                    <form action="deleteAnnouncement" method="post">
                        <input type="hidden" name="announcementId" value="<%= announcement.getAnnouncement_id()%>">
                        <button type="submit">删除</button>
                    </form>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

</body>
</html>