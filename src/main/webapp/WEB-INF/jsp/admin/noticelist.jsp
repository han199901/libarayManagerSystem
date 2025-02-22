<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/6/15
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>
        文章类型
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../css/x-admin.css" media="all">
</head>
<body>
<div class="x-body">
    <xblock><%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button>--%>
        <button class="layui-btn" onclick="member_add('添加公告','noticeadd','800','600')"><i class="layui-icon">&#xe608;</i>添加</button>
        <%--<span class="x-right" style="line-height:40px">共有数据：<span class="layui-badge">66</span> 条</span>--%></xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                发布人
            </th>
            <th>
                内容简介
            </th>
            <th>
                加入时间
            </th>
            <th>
                结束时间
            </th>
            <th>
                操作
            </th>
        </tr>
        </thead>
        <tbody id="x-img">
        <c:forEach items="${notices}" var="notice">
            <tr>
                <th>${notice.user_account}</th>
                <th>${notice.content}</th>
                <th><fmt:formatDate value="${notice.start_time}" pattern="yyyy-MM-dd hh:mm:ss"/></th>
                <th><fmt:formatDate value="${notice.end_time}" pattern="yyyy-MM-dd hh:mm:ss"/></th>
                <td class="td-manage">
                    <a title="编辑" href="javascript:;" onclick="member_edit('编辑','noticeedit?id=${notice.id}','4','','510')"
                       class="ml-5" style="text-decoration:none">
                        <i class="layui-icon">&#xe642;</i>
                    </a>

                    <a title="删除" href="javascript:;" onclick="member_del(this,'${notice.id}')"
                       style="text-decoration:none">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<script src="../lib/layui/layui.js" charset="utf-8"></script>
<script src="../js/x-layui.js" charset="utf-8"></script>
<script>
    function formatTime(date) {
        /* 从Date对象（标准时间格式）返回对应数据 */
        var date = new Date(date);
        let year = date.getFullYear();
        let month = date.getMonth();
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();
        return year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second ;
    }
    layui.use(['laydate','element','laypage','layer'], function(){
        $ = layui.jquery;//jquery
        laydate = layui.laydate;//日期插件
        lement = layui.element();//面包导航
        laypage = layui.laypage;//分页
        layer = layui.layer;//弹出层

        //以上模块根据需要引入
        //以上模块根据需要引入
        layer.ready(function(){ //为了layer.ext.js加载完毕再执行
            layer.photos({
                photos: '#x-img'
                //,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
            });
        });

        laypage({
            cont: 'page'
            ,pages: 100
            ,first: 1
            ,last: 100
            ,prev: '<em><</em>'
            ,next: '<em>></em>'
        });

        var start = {
            min: laydate.now()
            ,max: '2099-06-16 23:59:59'
            ,istoday: false
            ,choose: function(datas){
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };

        var end = {
            min: laydate.now()
            ,max: '2099-06-16 23:59:59'
            ,istoday: false
            ,choose: function(datas){
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };

        document.getElementById('LAY_demorange_s').onclick = function(){
            start.elem = this;
            laydate(start);
        }
        document.getElementById('LAY_demorange_e').onclick = function(){
            end.elem = this
            laydate(end);
        }

    });

    //批量删除提交
    function delAll () {
        layer.confirm('确认要删除吗？',{icon:3,title:'提示信息'},function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
        });
    }
    /*用户-添加*/
    function member_add(title,url,w,h){
        x_admin_show(title,url,w,h);
    }
    /*用户-查看*/
    function member_show(title,url,id,w,h){
        x_admin_show(title,url,w,h);
    }

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //发异步把用户状态进行更改
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //发异步把用户状态进行更改
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!',{icon: 6,time:1000});
        });
    }
    // 用户-编辑
    function member_edit (title,url,id,w,h) {
        x_admin_show(title,url,w,h);
    }
    /*密码-修改*/
    function member_password(title,url,id,w,h){
        x_admin_show(title,url,w,h);
    }
    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',{icon:3,title:'提示信息'},function(index){
            //发异步删除数据
            $.ajax({
                type:"POST",
                url:"/admin/noticedel?id="+id,
                success:function (data) {
                    if(data.status==1){
                        setTimeout(function(){
                            $(obj).parents("tr").remove();
                            layer.msg('已删除!',{icon:1,time:1000});
                        },1000);
                        return false;
                    }else{
                        alert("failed");
                        return false;
                    }
                }
            });
            return false;
        });
    }
</script>

</body>
</html>
