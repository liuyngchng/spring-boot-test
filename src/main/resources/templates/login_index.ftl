<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>login</title>
    <script type="text/css" src="/css/bootstrap.min.css"></script>
    <#--<script type="text/javascript" src="/js/bootstrap.min.js"></script>-->
    <script type="application/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <style type="text/css">
        #footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 60px;/*脚部的高度*/
            /*background: #6cf;*/
            clear:both;
        }
    </style>
</head>
<body>
    <div style="padding: 100px 100px 10px;">
        <h2 align="center">

            <form method="post" action="/login" class="bs-example bs-example-form" role="form">


                <div class="input-group input-group-lg">
                    <span class="label label-default" style="font-family: 'Microsoft Sans Serif'">用户名:</span>
                    <input type="text" name="name" class="form-control" style="height: 20px;" placeholder="请输入用户名">
                </div><br>

                <div class="input-group input-group-lg">
                    <span class="label label-default" style="font-family: 'Microsoft Sans Serif'">密&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
                    <input type="password" name="password" class="form-control" style="height: 20px;" placeholder="请输入密码">
                </div><br>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"> </span>
                    <input type="submit" class="form-control" style="font-family: 'Microsoft Sans Serif'; font-size: 100%; height: 20px;" value="登&nbsp;&nbsp;录">
                </div><br>
               <div style="font-family: 'Microsoft Sans Serif'; color: #bd362f;">${data!"<br/>"}</div>
            </form>
        </h2>
    </div>
   <div id="footer" style="text-align: center">
       <a class="l-column-center" target="_blank" href="http://www.miitbeian.gov.cn/"> 京 ICP 备 19013129 号 </a>
   </div>
</body>
</html>