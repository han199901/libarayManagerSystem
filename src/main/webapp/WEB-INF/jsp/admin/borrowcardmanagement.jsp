<%--
  Created by IntelliJ IDEA.
  User: zyc
  Date: 2020/6/15
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Borrow_Card_Management page</title>
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
    <link rel="stylesheet" href="../lib/zyclib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../lib/zyclib/admin.css" media="all">
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
                                    <th>借阅号</th>
                                    <th>姓名</th>
                                    <th>开卡时间</th>
                                    <th>过期时间</th>
                                    <th>是否挂失</th>
                                    <th>信誉值</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${borrowCard}" var="b">
                                    <tr>
                                        <td>${b.index}</td>
                                        <td>${b.uname}</td>
                                        <td>${b.start_time}</td>
                                        <td>${b.end_time}</td>
                                        <c:if test="${b.bstatus == 0}">
                                            <td><span class="tag tag-success">${b.bstatusname}</span></td>
                                        </c:if>
                                        <c:if test="${b.bstatus == 1}">
                                            <td><span class="tag tag-warning">${b.bstatusname}</span></td>
                                        </c:if>
                                        <td>${b.credit}</td>
                                        <td>
                                            <a class="layui-btn layui-btn-sm layui-btn-normal" title="编辑" onclick="execute_open('编辑借阅证', 'changeborrowcard?id=${b.bcid}', 1000, 500)" href="javascript:;">编辑</a>
                                            <a class="layui-btn layui-btn-sm layui-btn-danger" title="删除" onclick="execute_del(this, '${b.uindex}', 'borrowcardmanagement.del')" href="javascript:;">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                    <tr>
                                        <a class="layui-btn layui-btn-sm layui-btn-normal" title="新建" onclick="execute_open('新建借阅证', 'addborrowcard', 1000, 500)" href="javascript:;">新建</a>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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

<script src="../lib/zyclib/layui/layui.js" charset="utf-8"></script>
<script src="../lib/zyclib/jquery-3.4.1.min.js"></script>
<script src="../lib/zyclib/admin.js"></script>
</body>
</html>
