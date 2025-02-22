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
        #header1{
            height: 40px;
        }
        #header-right1{
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
        .same{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            border: 0;
            height: 30px;
        }
        .div{
            width: 300px;
            height: 32px;
            border: solid 1px #000000;
        }
        .text{
            width: 80%;
            background-color: rgba(147, 147, 147, 0.44);
        }
        .btn{
            width: 20%;
            background-color: #59b3f3;
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
            var user = {};
            user['user_account'] = $("input[name='user_account']").val();
            user['password'] = $("input[name='password']").val();
            user['name'] = $("input[name='name']").val();
            user['type'] = $("input[name='type']").val();
            user['favoicon'] = 1;
            user['phone_number'] = $("input[name='phone_number']").val();
            user['email'] = $("input[name='email']").val();
            user['description'] = $("input[name='description']").val();
            user['status'] = 1;
            user['register_time'] = $("input[name='register_time']").val();
            $.ajax({
                type: "POST",
                url: "/admin/useradmin/add",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(user),
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
        $(document).ready(function () {
            var time = new Date();
            var day = ("0" + time.getDate()).slice(-2);
            var month = ("0" + (time.getMonth() + 1)).slice(-2);
            var today = time.getFullYear() + "-" + (month) + "-" + (day);
            $('#date_info').val(today);
        })

        function UserUDOnClicked(user_account) {
            var user = {};
            user['password'] = $("input[name='password1']").val();
            user['name'] = $("input[name='name1']").val();
            user['phone_number'] = $("input[name='phone_number1']").val();
            user['user_account'] = user_account;
            user['email'] = $("input[name='email1']").val();
            user['description'] = $("input[name='description1']").val();
            $.ajax({
                type: "POST",
                url: "/admin/useradmin/ud",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(user),
                success: function (data) {
                    if (data.code==1){
                        alert('恭喜你！修改成功');
                        location.reload();
                    } else {
                        alert('必须输入用户名和密码，其他项可选填！');
                    }
                },
                error: function (data) {
                    console.log("修改失败");
                    console.log(data);
                }
            });
        }
    </script>
</head>
<body>
<h2>所有用户<button type="button" onclick="dianwo()" style="font-size: medium">新增用户</button></h2>
<div class="same div">
<form action="#" method="POST">
    <div class="input-group">
            <input name="search" type="text" class="same text"><input type="submit" class="same btn">
    </div>
</form>
</div>
<hr>
<table class="zebra">
    <hr>
    <thead>
    <tr>
        <td>用户账号</td>
        <td>用户名</td>
        <td>用户类型</td>
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
                <c:if test="${num.phone_number!=0}">
                    <td>${num.phone_number}</td>
                </c:if>
                <c:if test="${num.phone_number==0}">
                    <td>待完善</td>
                </c:if>
                <c:if test="${num.email==''}">
                    <td>待完善</td>
                </c:if>
                <c:if test="${num.email!=''}">
                    <td>${num.email}</td>
                </c:if>
                <c:if test="${num.description==''}">
                    <td>待完善</td>
                </c:if>
                <c:if test="${num.description!=''}">
                    <td>${num.description}</td>
                </c:if>
                <td><a href="javascript:und('${num.id}');">删除</a></td>
                <td><button type="button" onclick="dianwo1(${num.user_account})">修改</button></td>
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
                    <input type="number" name="user_account" placeholder="用户账户" class="txt01 f-r3 required" required>
                    <input type="text" name="password" placeholder="密码" class="txt01 f-r3 required" required>
                    <input type="text" name="name" placeholder="用户名" class="txt03 f-r3 required" required>
                    <select id="slList" onchange="selectShow()" class="txt03 f-r3 required">
                        <option value="0">管理员</option>
                        <option value="1">读者</option>
                    </select>
                    <input type="number" name="type" placeholder="用户类型"  id="txtShow" style="display:none" class="txt01 f-r3 required" >
                    <input type="number" name="phone_number" placeholder="手机号" class="txt03 f-r3 required" >
                    <input type="text" name="email" placeholder="邮箱" class="txt03 f-r3 required" >
                    <input type="text" name="description" placeholder="个性签名" class="txt03 f-r3 required" >
                    <input type="date" id="date_info" name="register_time" class="txt03 f-r3 required" style="display:none"/>
                    <input type="button" value="新增" onclick="userAddOnClicked()"/>
                </div>
            </div>
        </div>
    </div>
    <div class="zhezhao" id='zhezhao1'>
        <div class="tankuang">
            <div id="header1">
                <span>修改信息</span>
                <div id="header-right1" onclick="hidder1()">x</div>
            </div>
            <div>
                <div class="aui-register-form-item" id="table4submit">
                    <input type="text" name="password1" placeholder="密码" class="txt01 f-r3 required" >
                    <input type="text" name="name1" placeholder="用户名" class="txt01 f-r3 required" >
                    <input type="text" name="phone_number1" placeholder="手机号" class="txt03 f-r3 required" >
                    <input type="text" name="email1" placeholder="邮箱" class="txt03 f-r3 required" >
                    <input type="text" name="description1" placeholder="个人简介">
                    <input id="a" type="button" value="保存"/>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function selectShow(){
            document.getElementById("txtShow").value=document.getElementById("slList").value;
        }

        document.getElementById('zhezhao').style.display="none";
        document.getElementById('zhezhao1').style.display="none";
        function dianwo(){
            document.getElementById('zhezhao').style.display="";
        }
        function hidder(){
            document.getElementById('zhezhao').style.display="none";
        }
        function dianwo1(user_account){
            document.getElementById('zhezhao1').style.display="";
            var st = document.getElementById("a");
            st.setAttribute("onclick","UserUDOnClicked("+user_account+")");
            document.getElementById('table4submit').appendChild(st)
        }
        function hidder1(){
            document.getElementById('zhezhao1').style.display="none";
        }
    </script>

</table>
</body>
</html>
