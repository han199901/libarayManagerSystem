<%--
  Created by IntelliJ IDEA.
  User: Wangguangyu
  Date: 2020/6/1
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${userMessage}" var="num">
    您的编号${num.id}<br>
    您的账户${num.user_account}<br>
    您的用户名${num.name}<br>
    你的电话号码${num.phone}<br>
    您的邮箱${num.email}<br>
    您的个性签名${num.description}
</c:forEach>
</body>
</html>
