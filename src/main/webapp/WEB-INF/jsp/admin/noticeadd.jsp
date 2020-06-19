<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/6/16
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>
        后台管理系统
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
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">

        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show">
                <form class="layui-form layui-form-pane" action="">

                    <div class="layui-form-item">
                        <label class="layui-form-label">作者: </label>
                        <div class="layui-input-inline">
                            <input type="number" readonly="true" class="layui-input" name="user_account" value="${user.user_account}"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">公告结束日期</label>
                        <div class="layui-input-inline">
                            <input type="datetime-local" class="layui-input" name="end_time" placeholder="yyyy-MM-dd HH:mm:ss">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>公告内容
                        </label>
                        <div class="layui-input-block">
                            <input  placeholder="此处填写公告内容" name="content"></input>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit="" lay-filter="*">
                            保存
                        </button>
                    </div>
                </form>
                <div style="height:100px;"></div>
            </div>


        </div>
    </div>
</div>
<script src="../lib/layui/layui.js" charset="utf-8"></script>
<script src="../js/x-layui.js" charset="utf-8"></script>

<script>
    layui.use(['element','layer','form'], function(){
        $ = layui.jquery;//jquery
        lement = layui.element();//面包导航
        layer = layui.layer;//弹出层
        form = layui.form();

        //监听提交
        form.on('submit(*)', function(data){
            var data = data.field;
            console.log(JSON.stringify(data));
            $.ajax({
                type:"POST",
                url:"/admin/noticeadd_r",
                data:JSON.stringify(data),
                dataType:"json",
                contentType: "application/json",
                success:function (data) {
                    if(data.status==1){
                        alert("success");
                        setTimeout(function(){
                            window.parent.location.reload();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        },1000);
                        return false;
                    }else{
                        alert("failed");
                        //layer.msg(data.info,{icon:5,time:2000});
                        return false;
                    }
                }
            });
            return false;
        });

    })
</script>

</body>
</html>
