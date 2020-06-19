<%--
  Created by IntelliJ IDEA.
  User: zyc
  Date: 2020/6/19
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../lib/zyclib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../lib/zyclib/admin.css" media="all">
</head>
<body>
<script>

    function closeWin(){
        window.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

</script>
<form class="layui-form" action="/admin/changebooks.save">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">书本编号</label>
            <div class="layui-input-inline">
                <input type="value" name="index" id="index"  autocomplete="off" class="layui-input" value="${book.index}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">书籍名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" id="name"  autocomplete="off" class="layui-input" value="${book.bname}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">书籍作者</label>
            <div class="layui-input-inline">
                <input type="text" name="author" id="author" autocomplete="off" class="layui-input" value="${book.author}">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">书籍简介</label>
        <div class="layui-input-block">
            <input type="text" name="description" id="description"   autocomplete="off" class="layui-input" value="${book.description}">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">书籍分类</label>
            <div class="layui-input-inline">
                <select name="type_index" id="type_index" lay-filter="pid">
                    <c:forEach items="${booktypes}" var="r">
                        <c:if test="${r.name==info.name}">
                            <option  value="${r.type_index}" selected="selected">${r.name}</option>
                        </c:if>
                        <c:if test="${r.name!=info.name}">
                            <option  value="${r.type_index}">${r.name}</option>
                        </c:if>
                    </c:forEach>
                    <%--</select>--%>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">ISBN</label>
            <div class="layui-input-inline">
                <input type="value" name="ISBN" id="ISBN"  autocomplete="off" class="layui-input" value="${book.ISBN}">
            </div>
        </div>
    </div>

    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="status" id="status" lay-filter="pid">
                    <option value="1" selected="selected">可借</option>
                    <option value="0">不可借</option>
                    <option value="2">废弃</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">出版商</label>
            <div class="layui-input-inline">
                <input type="text" name="publish" id="publish"  autocomplete="off" class="layui-input" value="${book.publish}">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">位置</label>
        <div class="layui-input-block">
            <input type="text" name="locate" id="locate" placeholder="" autocomplete="off" class="layui-input" value="${book.locate}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-inline">
            <input type="value" name="price" id="price"  placeholder="￥" autocomplete="off" class="layui-input" value="${book.price}">
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="hidden" name="id" id="id" value="${book.bid}">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" onclick="closeWin()">立即提交</button>
        </div>
    </div>
</form>
</body>
</html>
<script src="../lib/zyclib/jquery-3.4.1.min.js"></script>
<script src="../lib/zyclib/layui/layui.js"></script>
<script src="../lib/zyclib/admin.js"></script>
