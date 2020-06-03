<%--
  Created by IntelliJ IDEA.
  User: zyc
  Date: 2020/5/31
  Time: 0:25
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
<script type="text/javascript">
    function del(id){
        if(confirm("是否归还？")){
            open("myborrowing.do?id="+id,"_self");
        }
    }
    function update(id){
        if(confirm("是否续期？")){
            open("myborrowing.update?id="+id,"_self");
        }
    }
</script>
<div >
    <table >
        <thead>
        <tr>
            <td style="width: 200px;">书名</td>
            <td style="width: 200px;">借阅时间</td>
            <td style="width: 200px;">归还时间</td>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${myborrowing}" var="b">
            <tr>
                <td>${b.name} </td>
                <td>${b.start_time}</td>
                <td>${b.end_time}</td>
                <td>
                    <a href="javascript:del('${b.id}');">归还</a>
                    <a href="javascript:update('${b.id}');">续期</a>
                    <%--<a href="javascript:location.href='index?cmd=query&id=${r.sid}'">详情</a>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
