<%--
  Created by IntelliJ IDEA.
  User: zyc
  Date: 2020/6/2
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Borrow_Card page</title>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/faqscript.js"></script>

    <link rel="stylesheet" href="../lib/zyclib/layui.css" media="all">
    <link rel="stylesheet" href="../lib/zyclib/admin.css" media="all">

</head>
<body>
<div >
    <script type="text/javascript">
        function reg(){
            location.href="borrowcard.b2reg";
        }
        function del(bstatus){
            location.href="borrowcard.del";
        }
        function cancel(user_account){
            location.href="borrowcard.cancel?user_account="+user_account;
        }
        function rpl(uid,bstatus){
            if(bstatus == 0) {
                /*使status=1 挂失成功*/
                alert("挂失成功！");
                location.href="borrowcard.b0rpl?user_account="+uid;
            }
            else if(bstatus == 1) {
                alert("您的借阅卡已挂失，请勿重复挂失！");
            }
        }
    </script>

    <div class="layui-card-body">
        <table class="layui-table layui-form">
            <thead>
            <tr>
                <th>借阅号</th>
                <th>姓名</th>
                <th>开卡时间</th>
                <th>过期时间</th>
                <th>是否挂失</th>
                <th>信誉值</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${borrowCard}" var="b">
                <tr>
                    <td>${b.bid} </td>
                    <td>${b.uname}</td>
                    <td>${b.start_time}</td>
                    <td>${b.end_time}</td>
                    <td>${b.bstatusname}</td>
                    <td>${b.credit}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tbody>
            <c:if test="${flag==1}">
                <a class="layui-btn layui-btn-sm layui-btn-warm copy" title="挂失" href="javascript:rpl('${user_account}','${status}');">挂失</a>
                <a class="layui-btn layui-btn-sm layui-btn-danger" title="注销" href="javascript:del('${status}');">注销</a>
            </c:if>
            <c:if test="${flag==0}">
                <a class="layui-btn layui-btn-sm layui-btn-normal"  title="注册" href="javascript:reg();">注册</a>
            </c:if>
            <c:if test="${flag==2}">
                <a class="layui-btn layui-btn-sm layui-btn-warm copy" title="取消挂失" href="javascript:cancel('${user_account}','${status}');">取消挂失</a>
                <a class="layui-btn layui-btn-sm layui-btn-danger" title="注销" href="javascript:del('${status}');">注销</a>
            </c:if>
            </tbody>


        </table>
    </div>


</div>

</body>
</html>
<script src="../lib/zyclib/jquery-3.4.1.min.js"></script>
<script src="../lib/zyclib/layui.js"></script>
<script src="../lib/zyclib/admin.js"></script>