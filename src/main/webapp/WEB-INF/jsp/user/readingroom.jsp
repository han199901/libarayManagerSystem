
<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/6/1
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Reading Room</title>
    <link href="../css/seat.css" type="text/css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../js/layer-v3.0.3/layer/mobile/need/layer.css" rel="stylesheet" type="text/css" />
    <link href="../js/layer-v3.0.3/layer/mobile/need/layer.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/phone.js" ></script>
    <script type="text/javascript" src="../js/layer-v3.0.3/layer/mobile/layer.js"></script>
</head>
<body>
<div class="seat_show">
    <ul>
        <li>
            <i></i>
            <span>可借用</span>
        </li>
        <li>
            <i></i>
            <span>使用中</span>
        </li>
        <%--<li>
            <i></i>
            <span>已选中</span>
        </li>--%>
    </ul>
</div>

<div class="seat_choose">
    <div class="number" id="num"></div>
    <div class="seats" id="seats"></div>

</div>
<script>
    $(function(){
        var html='';
        html+='<ul class="touchs" id="touchs"><div class="screen">阅读室</div>';
        <c:forEach items="${seats}" var="seat">
        <c:if test="${seat.status == 1}">
        html+='<li>';
        </c:if>
        <c:if test="${seat.status == 0}">
        html+='<li class="selected">';
        </c:if>
        html+='<input disabled="disabled" type="checkbox" name=${seat.index} id="seat-${seat.index}" />';
        html+='<label for="seat-${seat.index}"></label>';
        html+='</li>';
        </c:forEach>
       /* for(var i=1; i<=49; i++){



            var selected = (i>13&&i<17 ? 'selected' : '');
            html+='<li class="'+selected+'">';
            html+='<input disabled="disabled" type="checkbox" name="seat-'+i+'" id="seat-'+i+'" />';
            html+='<label for="seat-'+i+'"></label>';
            html+='</li>';
        }
        */
        html+='<div class="crossnum" id="crossnum"></div></ul>';
        $('#seats').html(html);

        $('.selected').children('input').attr({'disabled':'disabled','checked':'checked'});


        $('.seats li input').on('click',function(){
            var checklen = $('.seats li').not('.selected').children('input:checked').length;

            if(checklen>2){
                popu('最多只能选择两个座位');
                return false;
            }
            else {
                /*var seat = {}
                $.ajax({
                    type: "POST",//方法类型
                    data: JSON.stringify(data),
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/check",//url
                    contentType: "application/json",
                    success: function (result) {
                        if (result.code == 1) {
                            location.href = "user/home";
                        } else {
                            $("#err_m").html("<p style=\"color:red\">用户名或密码错误</p>");
                        }
                    },
                    error: function () {
                        $("#err_m").html("<p style=\"color:red\">网络超时请重试</p>");
                    }
                });*/
                return true
            }
        });


        //公用弹出层
        function popu(content){
            layer.open({
                content: content
                ,skin: 'msg'
                ,time: 3
            });
        }


        var num='';
        num+='<ul>';
        for(var i=1; i<=7; i++){
            num+='<li>'+i+'</li>';
        }
        html+='</ul>';
        $('#num').html(num);

        var crossnum='';
        crossnum+='<ul>';
        for(var j=1; j<=7; j++){
            crossnum+='<li>'+j+'</li>';
        }
        html+='</ul>';
        $('#crossnum').html(crossnum);



    })
</script>
<%--推拽js--%>
<script>
    $(function(){
        var flag = false;
        var cur = {
            x:0,
            y:0
        }
        var nx,ny,dx,dy,x,y ;
        function down(){
            flag = true;
            var touch ;
            if(event.touches){
                touch = event.touches[0];
            }else {
                touch = event;
            }
            cur.x = touch.clientX;
            cur.y = touch.clientY;
            dx = div2.offsetLeft;
            dy = div2.offsetTop;
        }
        function move(){
            if(flag){
                var touch ;
                if(event.touches){
                    touch = event.touches[0];
                }else {
                    touch = event;
                }
                nx = touch.clientX - cur.x;
                ny = touch.clientY - cur.y;
                x = dx+nx;
                y = dy+ny;
                div2.style.left = x+"px";
                //div2.style.top = y +"px";


                //阻止页面的滑动默认事件
                document.addEventListener("touchmove",function(){
                    //event.preventDefault();
                },false);
            }
        }
        //鼠标释放时候的函数
        function end(){
            flag = false;
        }
        var div2 = document.getElementById("touchs");
        div2.addEventListener("mousedown",function(){
            down();
        },false);
        div2.addEventListener("touchstart",function(){
            down();
        },false)
        div2.addEventListener("mousemove",function(){
            move();
        },false);
        div2.addEventListener("touchmove",function(){
            move();
        },false)
        document.body.addEventListener("mouseup",function(){
            end();
        },false);
        div2.addEventListener("touchend",function(){
            end();
        },false);

    });
</script>
</body>
</html>
