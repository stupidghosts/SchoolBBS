
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Info</title>
    <link rel="stylesheet" href="css/info.css" />
    <link rel="icon" href="images/error.png" type="image/x-icon" />
</head>
<body>
<%--<h1><%=request.getAttribute("outputMessage")%></h1>--%>
<%
    String outputMessage = (String) request.getAttribute("outputMessage");
    if (outputMessage == null) {
        outputMessage = "操作失败";
    }
%>
<div class="bk">
    <div class="box">
        <div style="font-size: larger"><%=outputMessage%></div>
        <a href="publish.html" style="font-size: larger;color: black;opacity: 0.7">返回重新输入</a>
        <img src="images/cry.png" alt=""style="width: 20%;height: 25%;opacity: 0.5;border-radius:30%">
    </div>
</div>
<h1></h1>
</body>
</html>
