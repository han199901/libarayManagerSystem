<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/6/3
  Time: 7:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <title>Leaderboard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link type="text/css" rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">


</head>
<body>
<ul class="list-group" style="max-width: 50%">
    <c:forEach items="${likeList}" var="entry">
        <li class="list-group-item">
                ${entry.name}

            <span class="badge badge-secondary" style="background-color: transparent;color: #31b0d5;float: right;">
                    <svg class="bi bi-heart-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                         xmlns="http://www.w3.org/2000/svg"><path style="color: red" fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
                    ${entry.like}
            </span>

        </li>
    </c:forEach>

</ul>
</body>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/popper.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.bundle.js"></script>
</html>
