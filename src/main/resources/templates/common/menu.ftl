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
                                    <strong class="font-bold">小二后台</strong>
                                </span>
                            </span>
                    </a>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope"><a href="${request.contextPath}/xiaoer/logout">登出</a></span>
                </li>
                <li id="quota_apply" class="">
                    <a href="javascript:void(0)">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">小二惠花</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/private/credit/amount')">授信额度</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/private/idCard/ocr')">身份证OCR</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/private/face/living')">人脸活体识别</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/private/auth/item')">授权数据</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/private/user/info')">个人信息</a>
                        </li>
                    </ul>
                    <li class="line dk"></li>
                </li>
                <li id="import" class="">
                    <a href="javascript:void(0)">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">进件信息</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/import/index')">申请信息</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/import/auditInfo/index')">审核信息</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/pay/index')">支付信息</a>
                            <!--<a class="J_menuItem" href="javascript:getPage('${request.contextPath}/repay/index')">还款信息</a>-->
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/pay/bind/index')">绑卡信息</a>
                        </li>
                    </ul>
                <li class="line dk"></li>
                </li>
                <li id="config" class="">
                    <a href="javascript:void(0)">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">配置信息</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/config/index')">修改配置</a>
                        </li>
                    </ul>
                <li class="line dk"></li>
                <li id="esbMessage" class="">
                    <a href="javascript:void(0)">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">ESB消息</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/esb/xh/index')">小二发送的ESB消息</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/esb/fk/index')">风控发送的ESB消息</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/esb/send/msg/json/index')">发送ESB消息</a>
                        </li>
                    </ul>
                <li class="line dk"></li>
                </li>
                <li id="emergency" class="">
                    <a href="javascript:void(0)">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">异常处理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/emergency/auditStatus/index')">更新审核状态</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/emergency/pay/index')">支付异常</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/emergency/unbind/bank/index')">解绑银行卡</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/notify/index')">下发三方消息</a>
                            <!--<a class="J_menuItem" href="javascript:getPage('${request.contextPath}/emergency/release/key/index')">解锁</a>-->
                        </li>
                    </ul>
                    <li class="line dk"></li>
                </li>
                <li id="ufile_pic" class="">
                    <a href="javascript:void(0)">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">Ufile文件</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/ufile/picture/index')">查看图片</a>
                            <a class="J_menuItem" href="javascript:getPage('${request.contextPath}/ufile/pdf/index')">查看PDF</a>
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
