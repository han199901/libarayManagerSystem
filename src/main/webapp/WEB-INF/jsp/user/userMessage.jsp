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
            font-family: 'trebuchet MS', 'Lucida sans', Arial;
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
    <link href="../css/style1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery1.min.js"></script>
    <script type="text/javascript" src="../js/register.js"></script>
    <script type="text/javascript">
        function UserUDOnClicked() {
            var user = {};
            user['password'] = $("input[name='password']").val();
            user['name'] = $("input[name='name']").val();
            user['phone_number'] = $("input[name='phone_number']").val();
            user['user_account'] = ${sessionScope.user.user_account};
            user['email'] = $("input[name='email']").val();
            user['description'] = $("input[name='description']").val();
            $.ajax({
                type: "POST",
                url: "/user/userMessage/ud",
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
<h2>个人信息</h2>
<hr>
<table class="zebra">
    <hr>
    <thead>
    <tr>
        <th>详情</th>
        <th> </th>
    </tr>
    </thead>
    <c:forEach items="${userMessage}" var="num">
        <tr>
            <td>您的账户</td>
            <td>${num.user_account}</td>
        </tr>
        <tr>
            <td>您的用户名</td>
            <td>${num.name}</td>
        </tr>
        <tr>
            <td>你的电话号码</td>
            <td>${num.phone_number}</td>
        </tr>
        <tr>
            <td>您的邮箱</td>
            <td>${num.email}</td>
        </tr>
        <tr>
            <td>您的个性签名</td>
            <td>${num.description}</td>
        </tr>
    </c:forEach>
    <tr>
        <td></td>
        <td><button type="button" onclick="dianwo()">修改</button></td>
        <div class="zhezhao" id='zhezhao'>
            <div class="tankuang">
                <div id="header">
                    <span>修改信息</span>
                    <div id="header-right" onclick="hidder()">x</div>
                </div>
                <div>
                    <div class="aui-register-form-item">
                        <input type="text" name="password" placeholder="密码" class="txt01 f-r3 required" >
                        <input type="text" name="name" placeholder="用户名" class="txt01 f-r3 required" >
                        <input type="text" name="phone_number" placeholder="手机号" class="txt03 f-r3 required" >
                        <label class="focus valid"></label>
                        <input type="text" name="email" placeholder="邮箱" class="txt03 f-r3 required" >
                        <input type="text" name="description" placeholder="个人简介">
                        <label class="focus valid"></label>
                        <input id="a" type="button" value="保存" onclick="UserUDOnClicked()"/>
                    </div>
                </div>
            </div>
        </div>

    </tr>
</table>
<script type="text/javascript">
    document.getElementById('zhezhao').style.display="none";
    function dianwo(){
        document.getElementById('zhezhao').style.display="";
    }
    function hidder(){
        document.getElementById('zhezhao').style.display="none";
    }
</script>
</body>
</html>
