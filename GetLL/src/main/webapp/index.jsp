<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link href="css/css.css" rel="stylesheet" type="text/css">

    <link href="css/my.css" rel="stylesheet" type="text/css">

    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/flat-ui.min.css" rel="stylesheet">


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <!-- 响应式设计 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>流量汇自动管家</title>

    <link rel="apple-touch-icon-precomposed" sizes="512x512" href="image/icon.png">
    <link rel="shortcut icon" href="image/icon.png">
</head>


<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">流量汇管家</a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                        兑换流量
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" id="convertList"></ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        兑换短信
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" id="convertSmsList"></ul>
                </li>

                <li><a href="javascript:;" id="bt_zhuanzeng" onclick="locationPage('/transferGifts.jsp')">转赠</a></li>
                <li><a href="#" id="bt_mingxi" onclick="locationPage('/scoreDetails.jsp')">流量币明细</a></li>
                <li><a href="#" id="bt_comment" onclick="locationPage('/comment.jsp')">留言</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" onclick="javascript:logoutSystem();" id="logoutSystem">注销</a></li>
            </ul>
        </div>
    </div>
    <!--todo: 没有加入立即摇奖功能-->
</nav>

<div class="container">



    <!--
    &lt;!&ndash; 登录框 &ndash;&gt;
<div class="pop hideme" id="loginContent">
    <div class="pop_title">请先输入手机号</div>
    <div class="pop_cont">
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="30%" align="right">手机号码</td>
                <td width="70%"><input type="text" id="mobile" name="mobile"/></td>
            </tr>
            <tr id="passwordContent" class="hideme">
                <td align="right">动态密码</td>
                <td>
                    <input type="text" class="pop_cinput" id="password" name="password"/>
                    <a href="javascript:;" id="getPassword">免费获取动态密码</a>
                    <a href="javascript:;" id="sendStatus" style="display:none;">已发送(<span
                            id="seconds" style="display:inline;">0</span>秒)</a>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><a href="javascript:;" id="loginDo" class="pop_ca">确认</a></td>
            </tr>
        </table>
        <span id="message"></span>
    </div>
</div>-->

    <div id="personInfo">
        <!-- 个人信息 -->
        <div class="jumbotron">
            <div>
                <h2>您好，亲爱的
                    <span id="userMobile">&nbsp;</span>
                    <small id="userNick"></small>
                </h2>
            </div>

            <div class="row">
                <!-- 个人详情 -->
                <div class="col-xs-12">
                    <div><!--style="text-align:left"-->
                        帐户余额：<span id="credit">&nbsp;</span><img src="image/mb.png" width="25" height="23">
                    </div>

                    <div>
                        今日收益：<span class="yellowfont" id="todayCredit">0.0</span>流量币
                    </div>

                    <!--未领取的流量币 -->
                    <div class="hideme" id="receiveDiv">
                        <span class="yellowfont" id="totalCredit">?</span>流量币未领
                        <span class="but_lingqu" onclick="javascript:location.href='/receiveFlowScore.jsp'">领取</span>
                    </div>

                    <div>
                        有效期：<span id="leavesDay">&nbsp;</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- 流量图标 -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <!--图表-->
                <div class="jiafengge"><span class="line" style="color:#F33">流量图表</span></div>

                <div class="myaccount_chart">
                    <div id="tipDiv" style="padding-bottom:5px;"></div>
                    <div id="ReportDiv"></div>
                    <div class="tishi2">计费数据有延时，仅供参考，请以月结数据为准。</div>
                </div>
            </div>


            <div class="col-xs-12 col-sm-6 col-md-4">
                <!--明细-->
                <div id="listDiv"></div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4">
                <!--套餐详情-->
                <div class="col-xs-12">
                    <div class="jiafengge"><span class="line" style="color:#F33">温馨提醒</span></div>

                    <p>本月总流量<span id="TotalFlowDiv">0</span>MB</p>

                    <p>剩余流量<span id="LeftFlowDiv">0</span>MB</p>

                    <p>距结算日<span id="distanceDays">0</span>天</p>

                    <p>日均可用<span id="dayNum">0</span>MB</p>
                </div>

                <!-- todo:会引发错误，暂时关闭该功能-->
                <!--<button class="btn button" id="btShakeNow" type="button" onclick="this.blur()">立即摇奖</button>-->

            </div>
        </div>

    </div>

    <!-- 临时模板 -->
    <div id="jiaitem_tmp" class="hideme">
        <li><a href="javascript:;" id="convert_#id#">#prizeName#</a></li>
    </div>

    <div id="jiaitem_tmp_sms" class="hideme">
        <li><a href="javascript:;" id="convert_#id#">#prizeName#(需#nowLostCredit#流量币)</a></li>
    </div>

    <!-- 兑换申请表单 -->
    <form action="/score" method="POST" name="flowScoreCfPage" id="flowScoreCfPage" class='hide'>
        <input type="text" value="flowScoreCfPage" name="redirect"/>
        <input type="text" value="" name="productType_n" id="productType"/>
        <input type="text" value="" name="id_n" id="id"/>
        <input type="text" value="" name="gc_n" id="gc"/>
        <input type="text" value="" name="pn_n" id="pn"/>
        <input type="text" value="" name="nc_n" id="nc"/>
    </form>


    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <script type="text/javascript" src="js/eventMan.js"></script>
    <script type="text/javascript" src="js/tip.js"></script>
    <script type="text/javascript" src="js/score.js"></script>
    <script type="text/javascript" src="js/flowScore.js"></script>
    <script type="text/javascript" src="js/highcharts.js"></script>
    <script type="text/javascript" src="js/common.js"></script>


    <script>
        eventMan.checkLogin(function () {
            if (eventMan.isLogin()) {

                $("#personInfo").show();

                $("#userMobile").html(eventMan.loginMobile_);

                if (eventMan.nickName_ != null && eventMan.nickName_ != "") {
                    $("#userNick").html(eventMan.nickName_);
                }

                // 显示个人积分
                score.showMyScore(function () {
                    // 获得套餐详情, 包括绘制饼状图
                    flowScore.getTotalFlow(function () {
                        // 显示 兑换列表
                        score.showConvertList(function () {
                            // 未领取的流量币信息
                            flowScore.getFlowScoreTransferGiftsInfo();
                        });
                    });
                });
            }
        }, function () {
            // 验证登录失败
            locationPage("/login.jsp")
        });
    </script>



</div>

<jsp:include page="foot.html"></jsp:include>


</body>
</html>