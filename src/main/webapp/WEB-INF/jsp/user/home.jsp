<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/5/26
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="favicon.ico" type="image/x-icon"/>
    <title>Home</title>

    <!-- Bootstrap Core and vandor -->
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css"/>

    <!-- Plugins css -->
    <link rel="stylesheet" href="../plugins/summernote/dist/summernote.css"/>


    <!-- Core css -->
    <link rel="stylesheet" href="../css/style.min.css"/>
    <link rel="stylesheet" href="../css/index.css"/>
    <style type="text/css">
        body {
            margin: 0px;
        }

        .zhezhao {
            position: fixed;
            left: 0px;
            top: 0px;
            background: #000;
            width: 100%;
            height: 100%;
        }

        .tankuang {
            position: relative;
            background: #fff;
            width: 50%;
            height: 80%;
            border-radius: 5px;
            margin: 5% auto;
        }

        #header {
            height: 40px;
        }

        #header-right {
            position: absolute;
            width: 25px;
            height: 25px;
            border-radius: 5px;
            background: red;
            color: #fff;
            right: 5px;
            top: 5px;
            text-align: center;
        }
    </style>

    <style type="text/css">


    </style>
</head>

<body class="font-muli theme-cyan gradient">

<div id="main_content">
    <!-- Start Main top header -->
    <div id="header_top" class="header_top">
        <div class="container">
            <div class="hleft">
                <a class="header-brand" href="index.html"><i class="fa fa-graduation-cap brand-logo"></i></a>
                <div class="dropdown">
                    <a href="javascript:void(0)" class="nav-link icon menu_toggle"><i
                            class="fe fe-align-center"></i></a>
                    <a href="/blank" class="nav-link icon"><i class="fe fe-search" data-toggle="tooltip"
                                                              data-placement="right" title="Search..."></i></a>
                    <a href="javascript:void(0)" class="nav-link icon right_tab"><i class="fe fe-bell"></i></a>
                    <a href="javascript:void(0)" class="nav-link icon settingbar"><i class="fe fe-settings"></i></a>
                </div>
            </div>
            <div class="hright">
                <a href="login.html" class="nav-link icon settingbar"><i class="fe fe-power"></i></a>
            </div>
        </div>
    </div>
    <!-- Start Rightbar setting panel -->
    <div id="rightsidebar" class="right_sidebar">
        <a href="javascript:void(0)" class="p-3 settingbar float-right"><i class="fa fa-close"></i></a>
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#Settings" aria-expanded="true">Settings</a>
            </li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#activity"
                                    aria-expanded="false">Activity</a></li>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane vivify fadeIn active" id="Settings" aria-expanded="true">
                <div class="mb-4">
                    <h6 class="font-14 font-weight-bold text-muted">Theme Color</h6>
                    <ul class="choose-skin list-unstyled mb-0">
                        <li data-theme="azure">
                            <div class="azure"></div>
                        </li>
                        <li data-theme="indigo">
                            <div class="indigo"></div>
                        </li>
                        <li data-theme="purple">
                            <div class="purple"></div>
                        </li>
                        <li data-theme="orange">
                            <div class="orange"></div>
                        </li>
                        <li data-theme="green">
                            <div class="green"></div>
                        </li>
                        <li data-theme="cyan" class="active">
                            <div class="cyan"></div>
                        </li>
                        <li data-theme="blush">
                            <div class="blush"></div>
                        </li>
                        <li data-theme="white">
                            <div class="bg-white"></div>
                        </li>
                    </ul>
                </div>
                <div class="mb-4">
                    <h6 class="font-14 font-weight-bold text-muted">Font Style</h6>
                    <div class="custom-controls-stacked font_setting">
                        <label class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" name="font" value="font-muli" checked="">
                            <span class="custom-control-label">Muli Google Font</span>
                        </label>
                        <label class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" name="font" value="font-montserrat">
                            <span class="custom-control-label">Montserrat Google Font</span>
                        </label>
                        <label class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" name="font" value="font-poppins">
                            <span class="custom-control-label">Poppins Google Font</span>
                        </label>
                    </div>
                </div>
                <div>
                    <h6 class="font-14 font-weight-bold mt-4 text-muted">General Settings</h6>
                    <ul class="setting-list list-unstyled mt-1 setting_switch">
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Night Mode</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-darkmode">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Fix Navbar top</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-fixnavbar">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Header Dark</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-pageheader">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Min Sidebar Dark</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-min_sidebar">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Sidebar Dark</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-sidebar">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Icon Color</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-iconcolor">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Gradient Color</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-gradient" checked="">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Box Shadow</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-boxshadow">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">RTL Support</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-rtl">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                        <li>
                            <label class="custom-switch">
                                <span class="custom-switch-description">Box Layout</span>
                                <input type="checkbox" name="custom-switch-checkbox"
                                       class="custom-switch-input btn-boxlayout">
                                <span class="custom-switch-indicator"></span>
                            </label>
                        </li>
                    </ul>
                </div>
                <hr>
                <div class="form-group">
                    <label class="d-block">Storage <span class="float-right">77%</span></label>
                    <div class="progress progress-sm">
                        <div class="progress-bar" role="progressbar" aria-valuenow="77" aria-valuemin="0"
                             aria-valuemax="100" style="width: 77%;"></div>
                    </div>
                    <button type="button" class="btn btn-primary btn-block mt-3">Upgrade Storage</button>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane vivify fadeIn" id="activity" aria-expanded="false">
                <ul class="new_timeline mt-3">
                    <li>
                        <div class="bullet pink"></div>
                        <div class="time">11:00am</div>
                        <div class="desc">
                            <h3>Attendance</h3>
                            <h4>Computer Class</h4>
                        </div>
                    </li>
                    <li>
                        <div class="bullet pink"></div>
                        <div class="time">11:30am</div>
                        <div class="desc">
                            <h3>Added an interest</h3>
                            <h4>“Volunteer Activities”</h4>
                        </div>
                    </li>
                    <li>
                        <div class="bullet green"></div>
                        <div class="time">12:00pm</div>
                        <div class="desc">
                            <h3>Developer Team</h3>
                            <h4>Hangouts</h4>
                            <ul class="list-unstyled team-info margin-0 p-t-5">
                                <li><img src="../assets/images/xs/avatar1.jpg" alt="Avatar"></li>
                                <li><img src="../assets/images/xs/avatar2.jpg" alt="Avatar"></li>
                                <li><img src="../assets/images/xs/avatar3.jpg" alt="Avatar"></li>
                                <li><img src="../assets/images/xs/avatar4.jpg" alt="Avatar"></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="bullet green"></div>
                        <div class="time">2:00pm</div>
                        <div class="desc">
                            <h3>Responded to need</h3>
                            <a href="javascript:void(0)">“In-Kind Opportunity”</a>
                        </div>
                    </li>
                    <li>
                        <div class="bullet orange"></div>
                        <div class="time">1:30pm</div>
                        <div class="desc">
                            <h3>Lunch Break</h3>
                        </div>
                    </li>
                    <li>
                        <div class="bullet green"></div>
                        <div class="time">2:38pm</div>
                        <div class="desc">
                            <h3>Finish</h3>
                            <h4>Go to Home</h4>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Start Quick menu with more functio -->
    <div class="user_div">
        <ul class="nav nav-tabs">
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#righttab-Notice">公告</a></li>
        </ul>
        <div class="tab-content mt-3">
            <div class="tab-pane fade active show" id="righttab-Notice" role="tabpanel">
                <ul class="list-group" id="notice-list">
                    <c:forEach items="${notice}" var="notice">
                        <li class="list-group-item">
                                ${notice.content}
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!-- Start Main leftbar navigation -->
    <div id="left-sidebar" class="sidebar">
        <h5 class="brand-name">Welcome!<a href="javascript:void(0)" class="menu_option float-right"><i
                class="icon-grid font-16" data-toggle="tooltip" data-placement="left"
                title="Grid & List Toggle"></i></a></h5>
        <ul class="nav nav-tabs">
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#menu-uni">Library</a></li>
            <c:if test="${user.type==0}">
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#menu-admin">Admin</a></li>
            </c:if>
        </ul>
        <div class="tab-content mt-3">
            <div class="tab-pane fade show active" id="menu-uni" role="tabpanel">
                <nav class="sidebar-nav">
                    <ul class="metismenu">
                        <li class="g_heading">主要</li>
                        <li class="left-li active"><a class="J_menuItem" href="/user/dashboard"><i
                                class="fa fa-dashboard"></i><span>仪表盘</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/user/search"><i
                                class="fa fa-black-tie"></i><span>图书查询</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/user/myborrowing"><i
                                class="fa fa-user-circle-o"></i><span>我的借阅</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/user/credit"><i class="fa fa-users"></i><span>我的信用</span></a>
                        </li>
                        <li class="left-li"><a class="J_menuItem" href="/user/borrowcard"><i
                                class="fa fa-users"></i><span>我的借阅证</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/user/myhopelist"><i
                                class="fa fa-graduation-cap"></i><span>我的愿望</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/user/borrowhistory"><i
                                class="fa fa-book"></i><span>历史借阅</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/user/userMessage"><i
                                class="fa fa-bullhorn"></i><span>账号管理</span></a></li>
                        <li class="g_heading">其他</li>
                        <li class="left-li"><a class="J_menuItem" href="/user/leaderboard"><i
                                class="fa fa-calendar"></i><span>热门图书</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/user/calendar"><i class="fa fa-comments-o"></i><span>日程安排</span></a>
                        </li>
                        <li class="left-li"><a class="J_menuItem" href="/user/readingroom"><i
                                class="fa fa-address-book"></i><span>借阅室</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/user/faq"><i
                                class="fa fa-folder"></i><span>FAQ</span></a></li>
                    </ul>
                </nav>
            </div>
            <c:if test="${user.type==0}">
            <div class="tab-pane fade" id="menu-admin" role="tabpanel">
                <nav class="sidebar-nav">
                    <ul class="metismenu">
                        <li class="g_heading">用户管理</li>
                        <li class="left-li"><a class="J_menuItem" href="/blank"><i
                                class="fa fa-dashboard"></i><span>账号信息管理</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/blank"><i
                                class="fa fa-dashboard"></i><span>信用管理</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/admin/borrowinghistorymanagement"><i
                                class="fa fa-dashboard"></i><span>借阅历史记录管理</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/admin/borrowcardmanagement"><i
                                class="fa fa-dashboard"></i><span>借阅证管理</span></a></li>
                        <li class="g_heading">图书管理</li>
                        <li class="left-li"><a class="J_menuItem" href="/blank"><i
                                class="fa fa-dashboard"></i><span>图书种类管理</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/admin/booksmanagement"><i
                                class="fa fa-dashboard"></i><span>图书管理</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/blank"><i
                                class="fa fa-dashboard"></i><span>维护信息管理</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/blank"><i
                                class="fa fa-dashboard"></i><span>愿望管理</span></a></li>
                        <li class="g_heading">网站管理</li>
                        <li class="left-li"><a class="J_menuItem" href="/blank"><i
                                class="fa fa-dashboard"></i><span>公告管理</span></a></li>
                        <li class="left-li"><a class="J_menuItem" href="/blank"><i
                                class="fa fa-dashboard"></i><span>统计报表</span></a></li>
                    </ul>
                </nav>
            </div>
            </c:if>
        </div>
    </div>
    <!-- Start project content area -->
    <div class="page">
        <!-- Start Page header -->
        <div class="section-body" id="page_top">
            <div class="container-fluid">
                <div class="page-header">
                    <div class="left">
                    </div>
                    <div class="right">
                        <div class="notification d-flex">
                            <div class="dropdown d-flex">
                                <a class="nav-link icon d-none d-md-flex btn btn-default btn-icon ml-1"
                                   data-toggle="dropdown"><i class="fa fa-language"></i></a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                    <a class="dropdown-item" href="/blank"><img class="w20 mr-2"
                                                                                src="../assets/images/flags/us.svg"
                                                                                alt="">English</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="/blank"><img class="w20 mr-2"
                                                                                src="../assets/images/flags/es.svg"
                                                                                alt="">Spanish</a>
                                    <a class="dropdown-item" href="/blank"><img class="w20 mr-2"
                                                                                src="../assets/images/flags/jp.svg"
                                                                                alt="">japanese</a>
                                    <a class="dropdown-item" href="/blank"><img class="w20 mr-2"
                                                                                src="../assets/images/flags/bl.svg"
                                                                                alt="">France</a>
                                </div>
                            </div>
                            <div class="dropdown d-flex">
                                <a href="javascript:void(0)" class="chip ml-3" data-toggle="dropdown">
                                    <span class="avatar"
                                          style="background-image: url(../assets/images/xs/avatar5.jpg)"></span> George</a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                    <c:if test="${credit!=-1}">
                                      信誉等级：Lv.${credit}
                                    </c:if>
                                    <c:if test="${credit==-1}">
                                        信誉等级：无借阅卡
                                    </c:if>
									<div class="dropdown-item"><i class="dropdown-icon fe fe-user"></i>${rank.rank}</div>
                                    <a class="dropdown-item" onclick="dianwo()"><i class="dropdown-icon fe fe-user"></i>
                                        个人信息</a>
                                    <a class="dropdown-item" onclick="dianwo()"><i class="dropdown-icon fe fe-settings"></i>修改信息</a>
                                    <a class="dropdown-item" href="/blank"><span class="float-right"><span
                                            class="badge badge-primary">6</span></span><i
                                            class="dropdown-icon fa fa-bell"></i>系统消息</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="javascript:void(0)"><i
                                            class="dropdown-icon fe fe-help-circle"></i>帮助</a>
                                    <a class="dropdown-item" href="/blank"><i class="dropdown-icon fe fe-log-out"></i>退出账号</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="zhezhao" id='zhezhao'>
            <div class="tankuang">
                <div id="header" style="background: white">
                    <span>我的信息</span>
                    <div id="header-right" onclick="hidder()">x</div>
                </div>
                <div style="width: 100%;height: 100%">
                    <iframe src="userMessage" width="100%" height="100%" frameborder="1" scrolling="yes/no/auto">
                    </iframe>
                </div>
            </div>
        </div>
        <!-- Start Page title and tab -->
        <div class="section-body mt-4" style="height: 80%" ;>
            <div class="container-fluid" style="height: 100%">
                <iframe id="J_iframe" width="100%" height="100%" src="/user/dashboard" frameborder="0" scrolling="auto"
                        data-id="index_v1.html" seamless></iframe>
            </div>
        </div>
        <!-- Start main footer -->
        <div class="section-body">
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            Copyright © 2019 <a
                                href="https://themeforest.net/user/puffintheme/portfolio">PuffinTheme</a>.
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>

<!-- Start Main project js, jQuery, Bootstrap -->
<script src="../bundles/lib.vendor.bundle.js"></script>

<!-- Start all plugin js -->
<script src="../bundles/counterup.bundle.js"></script>
<script src="../bundles/apexcharts.bundle.js"></script>
<script src="../bundles/summernote.bundle.js"></script>

<!-- Start project main js  and page js -->
<script src="../js/core.js"></script>
<script src="../js/page/index.js"></script>
<script src="../js/page/summernote.js"></script>
<!-- my js -->
<script src="../js/index.js"></script>
<script type="text/javascript">
    document.getElementById('zhezhao').style.display = "none";

    function dianwo() {
        document.getElementById('zhezhao').style.display = "";
    }

    function hidder() {
        document.getElementById('zhezhao').style.display = "none";
    }

</script>
</body>
</html>

