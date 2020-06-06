<%--
  Created by IntelliJ IDEA.
  User: Wangguangyu
  Date: 2020/6/2
  Time: 16:07
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
    <link href="../css/style1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery1.min.js"></script>
    <script type="text/javascript" src="../js/register.js"></script>
    <script type="text/javascript">
        function HopeAddOnClicked() {
            var hope = {};
            hope['name'] = $("input[name='name']").val();
            hope['publish'] = $("input[name='publish']").val();
            hope['user_name'] = ${sessionScope.user.name};
            hope['user_account'] = ${sessionScope.user.user_account};

            hope['time'] = $("input[name='time']").val();
            hope['advice'] = $("input[name='advice']").val();
            hope['status'] = 1;
            $.ajax({
                type: "POST",
                url: "/user/myhopelist/add",
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
                alert("取消成功！");
                location.href="myhopelist.s?id="+id;
        }
    </script>
</head>
<body>
<h2>愿望清单</h2>
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
    <c:forEach items="${hopeList}" var="num">
        <c:if test="${num.status==1}">
    <tr>
        <td>${num.name}</td>
        <td>${num.publish}</td>
        <td>${num.user_name}</td>
        <td>${num.time}</td>
        <td>${num.advice}</td>
        <td><a href="javascript:und('${num.id}');">取消喜欢</a></td>
    </tr>
        </c:if>
    </c:forEach>
    <tr>
        <td></td>
        <td><button type="button" onclick="dianwo()">新增</button></td>
            <div class="zhezhao" id='zhezhao'>
                <div class="tankuang">
                    <div id="header">
                        <span>新增愿望</span>
                        <div id="header-right" onclick="hidder()">x</div>
                    </div>
                    <div>
                                        <div class="aui-register-form-item">
                                            <input type="text" name="name" placeholder="书籍名" class="txt01 f-r3 required" >
                                            <span class="aui-get-code btn btn-gray f-r3 f-ml5 f-size13" id="time_box" disabled style="display:none;"></span>
                                            <input type="text" name="publish" placeholder="出版社" class="txt03 f-r3 required" >
                                            <label class="focus valid"></label>
                                            <input type="datetime-local" name="time">
                                            <input type="text" name="advice" placeholder="喜欢的理由">
                                            <label class="focus valid"></label>
                                            <input type="button" value="新增" onclick="HopeAddOnClicked()"/>
                                        </div>
                    </div>
            </div>
            </div>
            <script type="text/javascript">
                document.getElementById('zhezhao').style.display="none";
                function dianwo(){
                    document.getElementById('zhezhao').style.display="";
                }
                function hidder(){
                    document.getElementById('zhezhao').style.display="none";
                }
            </script>
    </tr>
</table>
</body>
</html>
