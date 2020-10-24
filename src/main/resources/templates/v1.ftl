<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <script type="text/javascript" src="/static/js/jquery.min.js" ></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="/static/js/jquery-ui-1.10.4.min.js" ></script>
    <script type="text/javascript" src="/static/js/content.js" ></script>
    <!-- 日期插件 -->
    <script type="text/javascript" src="/static/js/plugins/layer/laydate/laydate.js"></script>
    <!-- bootstrap table -->
    <script type="text/javascript" src="/static/js/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript" src="/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <link href="/static/js/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <!--menu-->
    <script type="text/javascript" src="/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="/static/js/hAdmin.js"></script>

    <script type="text/javascript" src="/static/js/emergency.js"></script>

    <!--一些常用的函数-->
    <script type="text/javascript" src="/static/js/common.js"></script>

    <link href="/static/css/animate.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/login.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/main.css" rel="stylesheet">
    <link href="/static/css/patton/patton.css" rel="stylesheet">
    <link href="/static/css/emergency.css" rel="stylesheet">
    <link href="/static/css/jquery-ui.css" rel="stylesheet">
    <link href="/static/css/canvas.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg pace-done" style="overflow:hidden">
    <div id="wrapper" class="backstage-right">
        <!-- 左侧菜单 -->
        <nav class="navbar-default navbar-static-side backstage-left-menu" role="navigation">
            <div class="slimScrollDiv backstage-left-menu" style="position: relative; width: auto; height: 100%;">
                <div class="sidebar-collapse" style="width: auto; height: 100%;">
                    <ul id="side-menu" class="nav">
                        <li class="nav-header">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="clear">
                            <span class="block m-t-xs" style="font-size:20px;">
                                <i class="fa fa-area-chart"></i>
                                    <strong class="font-bold">监管平台</strong>
                                </span>
                            </span>
                            </a>
                        </li>
                        <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                            <span class="ng-scope"><a href="/logout">登出</a></span>
                        </li>
                        <li id="quota_apply" class="">
                            <a href="javascript:void(0)">
                                <i class="fa fa fa-bar-chart-o"></i>
                                <span class="nav-label">任务</span>
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a class="J_menuItem" href="javascript:getPage('/page')">任务查询</a>
                                    <a class="J_menuItem" href="javascript:getPage('/private/idCard/ocr')">测试2</a>
                                    <a class="J_menuItem" href="javascript:getPage('/private/face/living')">测试3</a>
                                    <a class="J_menuItem" href="javascript:getPage('/private/auth/item')">测试4</a>
                                    <a class="J_menuItem" href="javascript:getPage('/private/user/info')">测试5</a>
                                </li>
                            </ul>
                        <li class="line dk"></li>
                        </li>
                        <li id="import" class="">
                            <a href="javascript:void(0)">
                                <i class="fa fa fa-bar-chart-o"></i>
                                <span class="nav-label">配置</span>
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a class="J_menuItem" href="javascript:getPage('/page')">页面示例</a>
                                    <a class="J_menuItem" href="javascript:getPage('/import/auditInfo/index')">信息2</a>
                                    <a class="J_menuItem" href="javascript:getPage('/pay/index')">信息3</a>
                                    <!--<a class="J_menuItem" href="javascript:getPage('/repay/index')">还款信息</a>-->
                                    <a class="J_menuItem" href="javascript:getPage('/pay/bind/index')">信息4</a>
                                </li>
                            </ul>
                        <li class="line dk"></li>
                        </li>
                        <li id="config" class="">
                            <a href="javascript:void(0)">
                                <i class="fa fa fa-bar-chart-o"></i>
                                <span class="nav-label">监控</span>
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a class="J_menuItem" href="javascript:getPage('/curvedata')">监控数据</a>
                                </li>
                            </ul>
                        <li class="line dk"></li>
                        </li>

                    </ul>
                </div>
                <div class="slimScrollBar" style="background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 4px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 398.668px;"></div>
                <div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.9; z-index: 90; right: 1px;"></div>
            </div>
        </nav>
        <div id="page-wrapper" class="gray-bg dashbard-1">
            欢迎使用监管后台
        </div>
    </div>
</body>
<script type="text/javascript">
    function getPage(url) {
        $.ajax({
            method: "post",
            url: url,
            data: {},
            success: function(data) {
                $("#page-wrapper").empty();
                $("#page-wrapper").html(data);
            }
        })
    }
</script>
