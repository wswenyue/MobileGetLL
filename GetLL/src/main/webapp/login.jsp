<%--
  Created by IntelliJ IDEA.
  User: tan
  Date: 14-10-2
  Time: 下午10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link href="css/css.css" rel="stylesheet" type="text/css">

    <link href="css/my.css" rel="stylesheet" type="text/css">

    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <!-- 响应式设计 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>流量汇自动管家-登录</title>

    <link rel="apple-touch-icon-precomposed" sizes="512x512" href="image/icon.png">
    <link rel="shortcut icon" href="image/icon.png">
</head>
<body>
<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:;">流量汇管家</a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#" id="bt_comment" onclick="locationPage('/comment.jsp')">留言</a></li>
            </ul>
        </div>
    </nav>

    <!-- 登录框 -->
    <div id="loginContent">
        <div class="row">
            <form action="login.action" method="post" class="form-horizontal">
                <div class="form-group">
                    <span id="message" class="col-sm-offset-2 col-sm-4" style="color: red;"></span>
                </div>

                <div class="form-group">
                    <label for="mobile" class="col-sm-2 control-label">手机号:</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="mobile" id="mobile" placeholder="请输入手机号">
                    </div>
                </div>

                <div class="form-group hideme" id="passwordContent">
                    <label for="password" class="col-sm-2 control-label">动态密码:</label>

                    <div class="col-sm-2">
                        <input type="text"  name="password" class="form-control" id="password" placeholder="请输入动态密码">
                    </div>

                    <a href="javascript:;" id="getPassword">免费获取动态密码</a>
                    <a href="javascript:;" id="sendStatus" class="hideme">已发送(<span
                            id="seconds" style="display:inline;">0</span>秒)</a>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-default" id="loginDo" onclick="this.blur();">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <script type="text/javascript" src="js/eventMan.js"></script>
    <script type="text/javascript" src="js/common.js"></script>

    <script>
        eventMan.checkLogin(function () {
            if (eventMan.isLogin()) {
                locationPage("/home.action")
            }
        });
    </script>


    <jsp:include page="foot.html"></jsp:include>


</div>

</body>
</html>
