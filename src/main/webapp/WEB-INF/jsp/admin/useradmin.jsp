<%--
  Created by IntelliJ IDEA.
  User: Wangguangyu
  Date: 2020/6/19
  Time: 21:09
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
    <link href="../css/style1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery1.min.js"></script>
    <script type="text/javascript" src="../js/register.js"></script>
    <style>

        body {
            width: 1000px;
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
        function userAddOnClicked() {
            var hope = {};
            hope['name'] = $("input[name='name']").val();
            hope['publish'] = $("input[name='publish']").val();
            hope['user_name'] = "${sessionScope.user.name}";
            hope['user_account'] = "${sessionScope.user.user_account}";

            hope['time'] = $("input[name='time']").val();
            hope['advice'] = $("input[name='advice']").val();
            hope['status'] = 1;
            $.ajax({
                type: "POST",
                url: "/admin/useradmin/add",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(hope),
                success: function (data) {
                    alert('恭喜你！添加成功');
                    location.reload();
                },
                error: function (data) {
                    console.log("添加失败");
                    console.log(data);
                }
            });
        }
        function und(id) {
            alert("删除成功！");
            location.href="useradmin.s?id="+id;
        }
        window.onload= function(){
            document.getElementById("t").onclick = function() {
                document.getElementById("now").value = new Date().toLocaleString();
            };
        };
    </script>
</head>
<body>
<h2>所有用户</h2><button type="button" onclick="dianwo()">新增</button>
<hr>
<table class="zebra">
    <hr>
    <thead>
    <tr>
        <td>用户账号</td>
        <td>用户名</td>
        <td>用户类型</td>
        <td>favoicon</td>
        <td>手机号</td>
        <td>邮箱</td>
        <td>个性签名</td>
        <td>操作</td>
    </tr>
    </thead>
    <c:forEach items="${useradmin}" var="num">
        <c:if test="${num.status==1}">
            <tr>
                <td>${num.user_account}</td>
                <td>${num.name}</td>
                <c:if test="${num.type==1}">
                    <td>读者</td>
                </c:if>
                <c:if test="${num.type==0}">
                    <td>管理员</td>
                </c:if>
                <td>${num.favoicon}</td>
                <td>${num.phone_number}</td>
                <td>${num.email}</td>
                <td>${num.description}</td>
                <td><a href="javascript:und('${num.id}');">删除</a></td>
            </tr>
        </c:if>
    </c:forEach>
    <div class="zhezhao" id='zhezhao'>
        <div class="tankuang">
            <div id="header">
                <span>新增用户</span>
                <div id="header-right" onclick="hidder()">x</div>
            </div>
            <div>
                <div class="aui-register-form-item">
                    <input type="number" name="user_account" placeholder="用户账户" class="txt01 f-r3 required" >
                    <input type="text" name="password" placeholder="密码" class="txt01 f-r3 required" >
                    <input type="text" name="name" placeholder="用户名" class="txt03 f-r3 required" >
                    <select id="slList" onchange="selectShow()" class="txt03 f-r3 required">
                        <option value="0">管理员</option>
                        <option value="1">读者</option>
                    </select>
                    <input type="number" name="type" placeholder="用户类型"  id="txtShow" style="display:none" class="txt01 f-r3 required" >
                    <input type="text" name="favoicon" placeholder="favoicon" class="txt03 f-r3 required" >
                    <input type="number" name="phone_number" placeholder="手机号" class="txt03 f-r3 required" >
                    <input type="text" name="email" placeholder="邮箱" class="txt03 f-r3 required" >
                    <input type="text" name="description" placeholder="个性签名" class="txt03 f-r3 required" >
                    <input value="获取当前时间" type="reset" id="t" />
                    <input type="text" id="now" name="register_time" class="txt03 f-r3 required"/>
                    <input type="button" value="新增" onclick="userAddOnClicked()"/>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function selectShow(){
            document.getElementById("txtShow").value=document.getElementById("slList").value;
        }

        document.getElementById('zhezhao').style.display="none";
        function dianwo(){
            document.getElementById('zhezhao').style.display="";
        }
        function hidder(){
            document.getElementById('zhezhao').style.display="none";
        }
    </script>
</table>
</body>
</html>
