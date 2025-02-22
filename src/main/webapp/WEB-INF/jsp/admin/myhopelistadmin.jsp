<%--
  Created by IntelliJ IDEA.
  User: Wangguangyu
  Date: 2020/6/18
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">

        .zhezhao{
            position: fixed;
            left: 0px;
            top: 0px;
            background: #000;
            width: 100%;
            height: 100%;
            opacity: 0.9;
        }
        .tankuang{
            position: relative;
            background: #fff;
            width: 50%;
            height: 80%;
            border-radius: 5px;
            margin: 5% auto;
        }
        #header{
            height: 40px;
        }
        #header-right{
            position: absolute;
            width: 25px;
            height: 25px;
            border-radius: 5px;
            background: red;
            color: #fff;
            right: 5px;
            top: 5px;
            text-align: center;
        }
    </style>
    <style>

        body {
            width: 600px;
            margin: 40px auto;
            font-size: 14px;
            color: #444;
        }
        .zebra td, .zebra th {
            padding: 10px;
            border-bottom: 1px solid #f2f2f2;
        }

        .zebra tbody tr:nth-child(even) {
            background: #f5f5f5;
            -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
            -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;
            box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
        }

        .zebra th {
            text-align: left;
            text-shadow: 0 1px 0 rgba(255,255,255,.5);
            border-bottom: 1px solid #ccc;
            background-color: #eee;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5), to(#eee));
            background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
            background-image: -moz-linear-gradient(top, #f5f5f5, #eee);
            background-image: -ms-linear-gradient(top, #f5f5f5, #eee);
            background-image: -o-linear-gradient(top, #f5f5f5, #eee);
            background-image: linear-gradient(top, #f5f5f5, #eee);
        }

        .zebra th:first-child {
            -moz-border-radius: 6px 0 0 0;
            -webkit-border-radius: 6px 0 0 0;
            border-radius: 6px 0 0 0;
        }

        .zebra th:last-child {
            -moz-border-radius: 0 6px 0 0;
            -webkit-border-radius: 0 6px 0 0;
            border-radius: 0 6px 0 0;
        }

        .zebra th:only-child{
            -moz-border-radius: 6px 6px 0 0;
            -webkit-border-radius: 6px 6px 0 0;
            border-radius: 6px 6px 0 0;
        }

        .zebra tfoot td {
            border-bottom: 0;
            border-top: 1px solid #fff;
            background-color: #f1f1f1;
        }

        .zebra tfoot td:first-child {
            -moz-border-radius: 0 0 0 6px;
            -webkit-border-radius: 0 0 0 6px;
            border-radius: 0 0 0 6px;
        }

        .zebra tfoot td:last-child {
            -moz-border-radius: 0 0 6px 0;
            -webkit-border-radius: 0 0 6px 0;
            border-radius: 0 0 6px 0;
        }

        .zebra tfoot td:only-child{
            -moz-border-radius: 0 0 6px 6px;
            -webkit-border-radius: 0 0 6px 6px;
            border-radius: 0 0 6px 6px
        }

    </style>
    <script type="text/javascript">
        function und(id) {
            alert("审核成功！");
            location.href="myhopelistadmin.s?id="+id;
        }
    </script>
</head>
<body>
<h2>所有愿望</h2>
<hr>
<table class="zebra">
    <hr>
    <thead>
    <tr>
        <td>书籍姓名</td>
        <td>书籍出版社</td>
        <td>账户名称</td>
        <td>建立时间</td>
        <td>喜欢理由</td>
        <td>操作</td>
    </tr>
    </thead>
    <c:forEach items="${hopeListadmin}" var="num">
        <c:if test="${num.status==1}">
            <tr>
                <td>${num.name}</td>
                <td>${num.publish}</td>
                <td>${num.user_name}</td>
                <td>${num.time}</td>
                <td>${num.advice}</td>
                <td><a href="javascript:und('${num.id}');">审核</a></td>
            </tr>
        </c:if>
        <c:if test="${num.status==0}">
            <tr>
                <td>${num.name}</td>
                <td>${num.publish}</td>
                <td>${num.user_name}</td>
                <td>${num.time}</td>
                <td>${num.advice}</td>
                <td>审核通过</td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
