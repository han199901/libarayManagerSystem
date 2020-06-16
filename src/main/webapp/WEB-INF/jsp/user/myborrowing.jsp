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
<link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="../plugins/dropify/css/dropify.min.css">
<link rel="stylesheet" href="../plugins/summernote/dist/summernote.css"/>
<link rel="stylesheet" href="../plugins/sweetalert/sweetalert.css">

<!-- Core css -->
<link rel="stylesheet" href="../css/style.min.css"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>My_Borrow page</title>
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
    <div class="tab-pane active" id="Student-all">

        <div class="table-responsive card">
            <table class="table table-hover table-vcenter table-striped mb-0 text-nowrap">
                <thead>
                <tr>
                    <th>书名</th>
                    <th></th>
                    <th>借阅时间</th>
                    <th>归还时间</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${myborrowing}" var="b">
                <tr>
                    <td class="w60">
                        <img class="avatar" src="../assets/images/xs/avatar1.jpg" alt="">
                    </td>
                    <td><span class="font-16">${b.name}</span></td>
                    <td>${b.start_time}</td>
                    <td>${b.end_time}</td>
                    <c:if test="${flag == 1}">
                    <td>

                        <button type="button" class="btn btn-icon btn-sm" title="Renew" onclick="javascript:update('${b.id}');" value="续期"><i class="fa fa-plus"></i></button>
                        <button type="button" class="btn btn-icon btn-sm" title="ReturnBook" onclick="javascript:del('${b.id}');" value="归还"><i class="fa fa-circle-thin"> 归还</i></button>
                    </td>
                    </c:if>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
