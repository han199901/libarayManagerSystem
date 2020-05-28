<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/5/26
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>
        Dashboard
    </title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" href="../css/x-admin.css" media="all" />
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css" media="all" />
</head>
<body>
<style type="text/css">
    legend { display: block; width:100px; border-bottom:0px; font-family: "Microsoft YaHei","Helvetica Neue";}
    legend a{ color:#666;} legend a:hover{ text-decoration:none;}
    .layui-table{ font-family: "Microsoft YaHei","Helvetica Neue";}
</style>
<div class="x-body">
    <div class="row">
        <div class="col-xs-6 col-sm-4 col-md-2">
            <section class="panel bgys">
                <div class="symbol bgcolor-blue ">
                    <i class="fa iconfont"></i>

                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="登录次数"><i class="iconfont " data-icon=""></i> <h1 id="total_users">${login_times}</h1> </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="登录次数"> <i class="iconfont " data-icon=""></i><span>登录次数</span></a>
                </div>
            </section>


        </div>
        <div class="col-xs-6 col-sm-4 col-md-2 ">
            <section class="panel bgys">
                <div class="symbol bgcolor-commred">
                    <i class="fa fa-handshake-o"></i>
                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="愿望次数"> <i class="iconfont " data-icon=""></i> <h1 id="totoal_links">${hope_times}</h1> </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="愿望次数"> <i class="iconfont " data-icon=""></i><span>愿望次数</span></a>
                </div>
            </section>

        </div>
        <div class="col-xs-6 col-sm-4 col-md-2 ">
            <section class="panel bgys">
                <div class="symbol bgcolor-dark-green">
                    <i class="fa  iconfont"></i>
                </div>

                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="历史阅览"> <i class="iconfont " data-icon=""></i> <h1 id="total_books">${borrow_times}</h1> </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="历史阅览"> <i class="iconfont " data-icon=""></i><span>历史阅览</span></a>
                </div>

            </section>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-2 ">
            <section class="panel bgys">
                <div class="symbol bgcolor-yellow-green">
                    <i class="fa fa-cubes iconfont"></i>
                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="公告总数"> <i class="iconfont " data-icon=""></i> <h1 id="total_notices">${notice_num}</h1> </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="公告总数"> <i class="iconfont " data-icon=""></i><span>公告总数</span></a>
                </div>
            </section>
        </div>

    </div>
    <fieldset class="layui-elem-field layui-field-title site-title">
        <legend><a name="default">借阅数据统计</a></legend>
    </fieldset>
    <!--相关统计-->
    <div class="row">
        <div class="col-sm-4">
            <section class="panel">
                <div class="panel-heading">
                    书籍类型占比
                </div>
                <div class="panel-body">
                    <div class="echarts" id="area" style="height:300px; height:350px"></div>
                </div>
            </section>
        </div>
        <div class="col-sm-4">
            <section class="panel">
                <div class="panel-heading">
                    借阅年度统计
                </div>
                <div class="panel-body">
                    <div class="echarts" id="years" style="height:300px; height:350px"></div>
                </div>
            </section>
        </div>
    </div>
</div>

<script src="../lib/layui/layui.js" charset="utf-8"></script>
<script src="../js/echarts.min.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    // 指定图表的配置项和数据
    var myChart = echarts.init(document.getElementById('area'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '分类文章数据统计',
            subtext: '文章总数',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        itemStyle: {

            normal: {

                //好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，

                color: function(params) {

                    // build a color map as your need.

                    var colorList = [

                        '#f36f8a','#B5C334','#FCCE10','#E87C25','#27727B',

                        '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',

                        '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'

                    ];

                    return colorList[params.dataIndex]

                },

                //以下为是否显示，显示位置和显示格式的设置了

                label: {

                    show: true,

                    position: 'top',

//                             formatter: '{c}'

                    formatter: '{b}\n{c}'

                }

            }

        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: [<c:forEach items="${read_type}" var="type">'${type.name}', </c:forEach>]
        },
        series: [{
            name: '文章总数',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [
                <c:forEach items="${read_type}" var="type">
                    {value: ${type.count}, name: '${type.name}'} ,
                </c:forEach>
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('years'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '文章年度统计',
            x: 'center'
        },
        //color: ['#3398DB'],

        tooltip: {
            trigger: 'axis',
            axisPointer: { // 坐标轴指示器，坐标轴触发有效
                type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            data: [<c:forEach items="${months_read_num}" var="num">
                '${num.months}月',
                </c:forEach>],
            axisTick: {
                alignWithLabel: true
            }
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [{
            name: '发布量',
            itemStyle: {

                normal: {

                    //好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，

                    color: function(params) {

                        // build a color map as your need.

                        var colorList = [

                            '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',

                            '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',

                            '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'

                        ];

                        return colorList[params.dataIndex]

                    },

                    //以下为是否显示，显示位置和显示格式的设置了

                    label: {

                        show: true,

                        position: 'top',

//                             formatter: '{c}'

                        formatter: '{c}\n{b}'

                    }

                }

            },
            type: 'bar',
            barWidth: '60%',
            data: [<c:forEach items="${months_read_num}" var="num">
                '${num.count}',
            </c:forEach>]
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>
