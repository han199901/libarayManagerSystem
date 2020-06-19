<%--
  Created by IntelliJ IDEA.
  User: zyc
  Date: 2020/6/19
  Time: 12:50
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
<div class="layui-fluid">
    <div class="layui-col-md12">
        <form class="layui-form layui-form-pane" action="/admin/addborrowcard.save" id="frm-reg" >
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">书本编号</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.index}</label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">书名</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.bname}</label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">分类</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.btname}</label>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">简介</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.description}</label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">作者</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.author}</label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">ISBN</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.ISBN}</label>
                </div>
            </div>
        </div>
        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.statusname}</label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出版商</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.publish}</label>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">位置</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.locate}</label>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">价格</label>
                <div class="layui-input-inline layer-inputs">
                    <label>${book.price}</label>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
</body>
</html>
<script src="../lib/zyclib/jquery-3.4.1.min.js"></script>
<script src="../lib/zyclib/layui/layui.js"></script>
<script src="../lib/zyclib/admin.js"></script>


