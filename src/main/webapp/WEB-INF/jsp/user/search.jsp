
<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/5/30
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>搜索</title>

    <link rel="stylesheet" type="text/css" href="../css/search-default.css" />

    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../css/search-form.css" />
    <link rel="stylesheet" type="text/css" href="../plugins/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript">
        function borrow(index) {
            <c:if test="${empty sessionScope.user}">
            alert("请登录账号");
            </c:if>
            <c:if test="${not empty sessionScope.user}">
            var data={
                'user_account':"${sessionScope.user.user_account}",
                'book_index':index
            }
            $.ajax({
                type: "POST",//方法类型
                data: JSON.stringify(data),
                dataType: "json",//预期服务器返回的数据类型
                url: "borrowbook",//url
                contentType: "application/json",
                success: function (result) {

                    $("#dd"+data.book_index).html("<button class='button' disabled=ture>不可借</button>");
                },
                error: function () {
                    alert("借阅失败，请重试！");
                }
            });
            </c:if>
        }
    </script>

</head>
<body>

<form onSubmit="submitFn(this, event);">
    <img id="search-img" src="../images/search.gif" />
    <div class="search-button-line">
        <div class="search-box">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="请输入关键词" />
                    <button class="search-icon" onClick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onClick="searchToggle(this, event);"></span>
            </div>
        </div>
    </div>
</form>
<table class="result-container table">

</table>


<script type="text/javascript">

    function searchToggle(obj, evt){
        var container = $(obj).closest('.search-wrapper');

        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
            // clear and hide result container when we press close
            container.find('.result-container').fadeOut(100, function(){$(this).empty();});
        }
    }

    function submitFn(obj, evt){
        value = $('.search-input').val().trim();
        if(!value.length){
            _html = "关键词不能为空。";
            $('.result-container').html(_html);
            $('.result-container').fadeIn(100);
        }
        else{
            url = "../search?bookName="+value;
            $.getJSON(url,function(json){
                var _html = "<tr><th>书名</th><th>描述</th><th>出版社</th><th>喜欢人数</th><th>状态</th></tr>"
                $.each(json,function (i,val) {
                    _html += ("<tr><td>"+val.name+"</td>"+"<td>"+val.description+"</td>"+"<td>"+val.publish+"</td>"+"<td>"+val.like+"</td>");
                    if(val.status=='1')
                        _html += ("<td id='dd"+val.index+"'><button class='button' onclick='borrow("+val.index+")'>可借</button></td>");
                    else
                        _html += ("<td><button class='button' disabled=ture>不可借</button></td></tr>");
                });
                $('.result-container').html(_html);
                $('.result-container').fadeIn(100);
            });
        }
        evt.preventDefault();
    }

</script>

</body>
</html>
