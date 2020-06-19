<%--
  Created by IntelliJ IDEA.
  User: zyc
  Date: 2020/6/17
  Time: 22:49
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
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

</script>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <form class="layui-form layui-form-pane" action="/admin/borrowcardmanagement.save" id="frm-reg" >
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline layer-inputs">
                    <label class="layui-form-label">${username}</label>
                </div>
                <div class="layui-form-mid layui-word-aux">借阅者姓名</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否挂失</label>
                <div class="layui-input-inline layer-inputs">
                    <select name="ifloss" id="ifloss" lay-filter="pid">
                        <option value="0" selected="selected">正常</option>
                        <option value="1">挂失</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">请选择是否挂失</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">信誉积分</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="number" oninput="this.value=this.value.length>2?this.value.substr(0,2):this.value;" name="credit" id="credit" value=50 placeholder="请输入信誉积分" class="layui-input">
                </div>
                <div class="layui-form-midf layui-word-aux">请输入信誉积分</div>
            </div>
            <div class="layui-form-item" style="margin-left: 50px;">
                <input type="hidden" name="id" id="id" value="${id}">
                <button class="layui-btn" id="execute" type="submit" onclick="closeWin()"><i class="layui-icon layui-icon-form"></i>保存</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<script src="../lib/zyclib/jquery-3.4.1.min.js"></script>
<script src="../lib/zyclib/layui/layui.js"></script>
<script src="../lib/zyclib/admin.js"></script>
