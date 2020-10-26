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
                                    <a class="J_menuItem" href="javascript:getPage('/taskinfo')">任务查询</a>
                                    <a class="J_menuItem" href="javascript:getPage('/taskdetail')">任务详请</a>
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
                drawCurve();
            }
        })
    }

    function drawCurve(){

        var multiData = {values:[
                { value0:[
                        {x:"Jan",y:5},
                        {x:"Feb",y:5},
                        {x:"Mar",y:80},
                        {x:"Apr",y:10},
                        {x:"May",y:30},
                        {x:"Jun",y:30},
                        {x:"Jul",y:60},
                        {x:"Aug",y:10}
                    ]},
                { value1:[
                        {x:"Jan",y:50},
                        {x:"Feb",y:40},
                        {x:"Mar",y:60},
                        {x:"Apr",y:10},
                        {x:"May",y:20},
                        {x:"Jun",y:10},
                        {x:"Jul",y:40},
                        {x:"Aug",y:10}
                    ]}
            ]
        }//必须按照这个格式定义数据，关键字values value0 value1 ......
        /*
         *@param0: canvas 的id
         *@param1: json 数据
         *@param2: 坐标距离画布的间隙padding
         *@param3: 如果只有一条数据时数据的颜色，多条数据颜色随机
         *@param4: 点的颜色
         *@param5: 是否绘制背景线
         *@param6: 是否是多条数据
         */
        //先定义数据线的名字，再绘制数据
        lineChart.setKey(["2013","2014"]);
        lineChart.setData("canvas",multiData,60,"red","#333",true,true);
    }

    var lineChart= {
        keynames:[],//数据信息数组
        can:undefined,
        ctx:undefined,
        width:undefined,
        lineColor:undefined,
        dotColor:undefined,
        isBg:false,
        isMultiData:false,
        setData:function(canId,data,padding,lineColor,dotColor,isBg,isMultiData){
            this.lineColor = lineColor;
            this.dotColor = dotColor;
            this.can = document.getElementById(canId);
            this.ctx = this.can.getContext("2d");
            this.isBg = isBg;
            this.isMultiData = isMultiData;
            this.drawXY(data,0,padding,this.can);

        },
        isMultiData:function(data){
            if(data.values.length>1){
                this.isMultiData = true;
            }
        },//是否是多条数据线

        drawXY:function(data,key,padding,can){
            this.ctx.lineWidth="4";
            this.ctx.strokeStyle="black";
            this.ctx.font = 'italic 15px sans-serif';
            this.ctx.beginPath();
            this.ctx.moveTo(padding,0)
            this.ctx.lineTo(padding,can.height-padding);
            this.ctx.lineTo(can.width,can.height-padding);
            this.ctx.stroke();
            var perwidth = this.getPixel(data,key,can.width,padding);//x 轴每一个数据占据的宽度
            var maxY =  this.getMax(data,0,this.isMultiData);//获得Y轴上的最大值
            var yPixel = this.getYPixel(maxY,can.height,padding).pixel;
            var ycount = this.getYPixel(maxY,can.height,padding).ycount;
            for( var i=0,ptindex;i< data.values[key]["value"+key].length;i++ ){
                ptindex = i+1;
                var x_x = this.getCoordX(padding,perwidth,ptindex);
                var x_y = can.height-padding+20;
                this.ctx.fillText(data.values[key]["value"+key][i].x,x_x,x_y,perwidth);
            }
            this.ctx.textAlign = "right"//y轴文字靠右写
            this.ctx.textBaseline = "middle";//文字的中心线的调整
            for(var i=0;i< ycount/10;i++){
                this.ctx.fillText(i*10,padding-10,(ycount/10-i)*10*yPixel,perwidth);
            }
            if(this.isBg){
                var x =  padding;
                this.ctx.lineWidth="1";
                this.ctx.strokeStyle="#e8e8e8";
                for( var i=0;i< ycount/10;i++ ){
                    var y = (ycount/10-i)*10*yPixel;
                    this.ctx.moveTo(x,y);
                    this.ctx.lineTo(can.width,y);
                    this.ctx.stroke();
                }
            }//选择绘制背景线
            this.ctx.closePath();
            this.drawData(data,0,padding,perwidth,yPixel,this.isMultiData);
        },//绘制XY坐标 线 以及点

        drawData:function(data,key,padding,perwidth,yPixel,isMultiData,lineColor){
            if(!isMultiData){
                var keystr = "value"+key;
                this.ctx.beginPath();
                this.ctx.lineWidth="2";
                if(arguments[6]){
                    this.ctx.strokeStyle=lineColor;
                }else{
                    this.ctx.strokeStyle=this.lineColor;
                }
                var startX = this.getCoordX(padding,perwidth,0);
                var startY = this.getCoordY(padding,yPixel,data.values[key][keystr][0].y);
                this.ctx.beginPath();
                this.ctx.lineWidth="2";
                for( var i=0;i< data.values[key][keystr].length;i++ ){
                    var x = this.getCoordX(padding,perwidth,i+1);
                    var y = this.getCoordY(padding,yPixel,data.values[key][keystr][i].y);
                    this.ctx.lineTo(x,y);
                }
                this.ctx.stroke();
                this.ctx.closePath();
                /*下面绘制数据线上的点*/
                this.ctx.beginPath();
                this.ctx.fillStyle=this.dotColor;
                for( var i=0;i< data.values[key][keystr].length;i++ ){
                    var x = this.getCoordX(padding,perwidth,i+1);
                    var y = this.getCoordY(padding,yPixel,data.values[key][keystr][i].y);
                    this.ctx.moveTo(x,y);
                    this.ctx.arc(x,y,3,0,Math.PI*2,true);//绘制数据线上的点
                    this.ctx.fill();
                }
                this.ctx.closePath();
            }else{//如果是多条数据线
                for( var i=0;i< data.values.length;i++ ){
                    var color = "rgb("+parseInt(Math.random()*256)
                        +"," + parseInt(Math.random()*256)
                        +","+parseInt(Math.random()*256)+")";
                    lineChart.drawData(data,i,padding,perwidth,yPixel,false,color);
                    lineChart.drawKey(color,this.keynames[i],padding,i);
                }
            }
        },//绘制数据线和数据点
        getPixel:function(data,key,width,padding){
            var count = data.values[key]["value"+key].length;
            return (width-20-padding)/(count+(count-1)*1.5);
        },//宽度
        getCoordX:function(padding,perwidth,ptindex){//下标从1开始 不是从0开始
            return 2.5*perwidth*ptindex+padding+10-2*perwidth;
        },//横坐标X 随ptindex 获得
        getCoordY:function(padding,yPixel,value){
            var y = yPixel*value;
            return this.can.height-padding-y;
        },//纵坐标X 随ptindex 获得(注意 纵坐标的算法是倒着的因为原点在最上面)
        getYPixel:function(maxY,height,padding){
            var ycount = (parseInt(maxY/10)+1)*10+10;//y轴最大值
            return {pixel:(height-padding)/ycount,ycount:ycount};
        },//y轴的单位长度

        getMax:function(data,key,isMultiData){
            if(!isMultiData){
                var maxY = data.values[key]["value"+key][0].y;
                var length = data.values[key]["value"+key].length;
                var keystr = "value"+key;
                for( var i=1;i< length;i++ ){
                    if(maxY< data.values[key][keystr][i].y) maxY=data.values[key][keystr][i].y;
                }
                return maxY;//返回最大值 如果不是多数据
            }else{
                var maxarr=[];
                var count = data.values.length;//多条数据的数据长度
                for(var i=0;i< count;i++){
                    maxarr.push(lineChart.getMax(data,i,false));
                }
                var maxvalue = maxarr[0];
                for(var i=1;i< maxarr.length;i++){
                    maxvalue = (maxvalue< maxarr[i])?maxarr[i]:maxvalue;
                }
                return maxvalue;
            }//如果是多数据
        },

        setKey:function(keynames){//keynames 是数组
            for(var i=0;i< keynames.length;i++){
                this.keynames.push(keynames[i]);//存入数组中
            }
        },

        drawKey:function(color,keyname,padding,lineindex){
            var x = padding+10;
            var y = this.can.height - padding+20+13*(lineindex+1);
            this.ctx.beginPath();
            this.ctx.strokeStyle = color;
            this.ctx.font="10px";
            this.ctx.moveTo(x,y);
            this.ctx.lineTo(x+50,y);
            this.ctx.fillText(":"+keyname,x+80,y,30);
            this.ctx.stroke();
            this.ctx.closePath();
        }
    }
</script>
