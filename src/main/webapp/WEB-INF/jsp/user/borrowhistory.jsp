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

    <!-- Bootstrap Core and vandor -->
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="../plugins/datatable/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatable/fixedeader/dataTables.fixedcolumns.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatable/fixedeader/dataTables.fixedheader.bootstrap4.min.css">

    <!-- Core css -->
    <link rel="stylesheet" href="../css/style.min.css"/>

</head>
<body>
    <div class="section-body mt-4">
        <div class="container-fluid">
            <div class="tab-content">
                <div class="tab-pane active" id="Library-all">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover js-basic-example dataTable table-striped table_custom border-style spacing5">
                                    <thead>
                                    <tr>
                                        <th>书名</th>
                                        <th>借阅时间</th>
                                        <th>归还时间</th>
                                        <th>是否超时</th>
                                        <th>超时时间</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${borrowHistory}" var="b">
                                    <tr>
                                        <td>${b.name}</td>
                                        <td>${b.start_time}</td>
                                        <td>${b.end_time}</td>
                                        <c:if test="${b.status == 1}">
                                            <td><span class="tag tag-success">已归还</span></td>
                                        </c:if>
                                        <c:if test="${b.status == 0}">
                                            <td><span class="tag tag-warning">未归还</span></td>
                                        </c:if>
                                        <td>${b.days}</td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<table >
        <thead>
        <tr>
            <td style="width: 200px;">书名</td>
            <td style="width: 200px;">借阅时间</td>
            <td style="width: 200px;">归还时间</td>
            <td style="width: 200px;">是否超时</td>
            <td style="width: 200px;">超时时间</td>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${borrowHistory}" var="b">
            <tr>
                <td>${b.name} </td>
                <td>${b.start_time}</td>
                <td>${b.end_time}</td>
                <td>${b.statusname}</td>
                <td>${b.days}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>--%>

    <!-- Start Main project js, jQuery, Bootstrap -->
    <script src="../bundles/lib.vendor.bundle.js"></script>

    <!-- Start Plugin Js -->
    <script src="../plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <script src="../bundles/dataTables.bundle.js"></script>
    <script src="../plugins/sweetalert/sweetalert.min.js"></script>

    <!-- Start project main js  and page js -->
    <script src="../js/core.js"></script>
    <script src="../js/page/dialogs.js"></script>
    <script src="../js/table/datatable.js"></script>
</body>
</html>
