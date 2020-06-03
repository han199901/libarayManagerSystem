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
    <title>Borrow_History page</title>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/faqscript.js"></script>

</head>
<body>
<div >
    <script type="text/javascript">
        function reg(uid,bstatus){
            if(bstatus == 0) {
                /*已拥有借阅卡不可注册*/
                alert("您已拥有借阅卡，请勿重复申请！");
            }
            else if (bstatus == 1) {
                /*使bstatus=1并注册*/
                alert("您的借阅卡注销成功，已为您再次申请！");
                location.href="borrowcard.b1reg?user_account="+uid;

            }
            else {
                /*bstatus=2或null时，直接注册*/
                alert("已为您申请借阅卡！");
                location.href="borrowcard.b2reg?user_account="+uid;
            }
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
            else if(bstatus == 2){
                alert("您的借阅卡已注销，无法挂失！");
            }
            else{
                alert("您还没有申请借阅卡！");
            }
        }
    </script>
    <table >
        <thead>
        <tr>
            <td style="width: 200px;">借阅号</td>
            <td style="width: 200px;">姓名</td>
            <td style="width: 200px;">开卡时间</td>
            <td style="width: 200px;">过期时间</td>
            <td style="width: 200px;">是否挂失</td>
            <td style="width: 200px;">信誉值</td>
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
        <tr>
            <a href="javascript:reg('${user_account}','${status}');">注册</a>
            <a href="javascript:rpl('${user_account}','${status}');">挂失</a>
        </tr>
    </table>
</div>

</body>
</html>
