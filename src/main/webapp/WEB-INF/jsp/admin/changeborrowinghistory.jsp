<%--
  Created by IntelliJ IDEA.
  User: zyc
  Date: 2020/6/13
  Time: 22:17
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
<div class="layui-fluid">
    <div class="layui-col-md12">
        <form class="layui-form layui-form-pane" action="/admin/changeborrowinghistory.save" id="frm-reg" >
            <div class="layui-form-item">
                <label class="layui-form-label">借阅者</label>
                <div class="layui-input-inline layer-inputs">
                    <select name="username" id="username" lay-filter="pid">
                        <%--<select name="name2" class="inputselect">--%>
                        <c:forEach items="${username}" var="r">
                            <c:if test="${r.name==info.name}">
                                <option  value="${r.name}" selected="selected">${r.name}</option>
                            </c:if>
                            <c:if test="${r.name!=info.name}">
                                <option  value="${r.name}">${r.name}</option>
                            </c:if>
                        </c:forEach>
                            <%--</select>--%>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">请选择借阅者姓名</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">借阅书名</label>
                <div class="layui-input-inline layer-inputs">
                    <select name="bookname" id="bookname" lay-filter="pid">
                        <%--<select name="name2" class="inputselect">--%>
                        <c:forEach items="${bookname}" var="r">
                            <c:if test="${r.name==info.name}">
                                <option  value="${r.name}" selected="selected">${r.name}</option>
                            </c:if>
                            <c:if test="${r.name!=info.name}">
                                <option  value="${r.name}">${r.name}</option>
                            </c:if>
                        </c:forEach>
                        <%--</select>--%>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">请选择借阅书名</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否超时</label>
                <div class="layui-input-inline layer-inputs">
                    <select name="ifovertime" id="ifovertime" lay-filter="pid">
                    <option value="0" selected="selected">未归还</option>
                    <option value="1">已归还</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">请选择是否超时</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">超时天数</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="number" oninput="this.value=this.value.length>3?this.value.substr(0,3):this.value;" name="overtime" id="overtime" value=0 placeholder="请输入超时天数" class="layui-input">
                </div>
                <div class="layui-form-midf layui-word-aux">请输入超时天数</div>
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