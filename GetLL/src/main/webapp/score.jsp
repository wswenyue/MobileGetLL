<%--
  Created by IntelliJ IDEA.
  User: tan
  Date: 14-8-19
  Time: 下午8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/css.css" rel="stylesheet" type="text/css">

    <link href="css/my.css" rel="stylesheet" type="text/css">

    <link rel="apple-touch-icon-precomposed" sizes="512x512" href="image/icon.png">
    <link rel="shortcut icon" href="image/icon.png">

    <title>兑换</title>

    <style>
        .pwd {font-size:12px;}
        .mask {
            display: none;
            position: absolute;
            top: 0px;
            width: 100%;
            height: 120%;
            line-height: 100%;
            background: none repeat scroll 0% 0% #000;
            opacity: 0.5;
            z-index: 101;
        }
    </style>
</head>
<body>

<div class="jia_layout">
    <div id="myaccount_mingxi_shouzhi">
        <div class="jia_nav2">
            <a href="/index.html"><div class="jia_back"><img src="/image/go_back.png" width="21" height="19" align="absmiddle" /> 返回</div></a>
        </div>
    </div>

    <div class="zhuanzeng_layout">
        <div class="zhuanzeng_title" id="confirmDiv">使用${nc_n}流量币兑换${pn_n}。</div>
        <div class="zhuanzeng_title" id="pwdDiv">
            <div class="zhuanzeng_title2">动态密码：</div>
            <div class="zhuanzeng_inputbg2">
                <label>
                    <input type="text" id="passwordExchangeFlow" name="passwordExchangeFlow" class="pop_cinput zhuanzeng_input1" />
                </label>
            </div>
            <div class="zhuanzeng_title3">
                <%--// 获取密码--%>
                <a href="javascript:;" id="getPasswordExchangeFlow" class="pwd" >免费获取动态密码</a>
                <a href="javascript:;" id="sendStatusExchangeFlow" class="zhuanzeng_input_text" style="display:none;">已发送(<span id="secondsExchangeFlow" style="display:inline;">0</span>秒)</a>
            </div>
        </div>
        <div class="lingqu_list">
            <div class="zhuanzeng_but" onclick="exchangeFun();" id="exchangeButDiv"><a href="javascript:;">确认</a></div>
            <div class="zhuanzeng_but hideme" onclick="javascript:location.href='/';"  id="yesButDiv"><a href="javascript:;">知道了</a></div>
            <div class="zhuanzeng_but hideme" onclick="javascript:location.href='/';"  id="shakeTimeDiv"><a href="javascript:;">现在去摇奖</a></div>
            <div class="zhuanzeng_but hideme" onclick="javascript:location.href='/';"  id="tigerTimeDiv"><a href="javascript:;">现在去玩幸运投</a></div>
            <div class="redfont" id="messageExchangeFlow"></div>
        </div>
        <div height="1143"><br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/></div>
    </div>


    <div id="mask" class="mask hideme"></div>
    <div id="buying_tip" class="hideme" style="z-index: 101;color:#fff;text-align:center;position: absolute;">我们正在努力处理中，请稍候！</div>


</div>


<script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript" src="js/eventMan.js"></script>
<script type="text/javascript" src="js/score.js"></script>

<script>
    var $mask = $("#mask");
    var $buyingTip = $("#buying_tip");
    initBuyingTip();

    var productType = "${productType_n}";
    var nowLostCredit = "${nc_n}";
    var prizeName = "${pn_n}";
    var giveCreditStr = "${gc_n}";


    //密码
    $("#getPasswordExchangeFlow").unbind("click");
    $("#getPasswordExchangeFlow").bind("click",function(){
        eventMan.getPassword2("ExchangeFlow",true);
    });

    // 输入事件:动态密码
    var passwordExchangeFlow = $("#passwordExchangeFlow");
    passwordExchangeFlow.keyup(function() {
        $("#messageExchangeFlow").html("");
    });

    //兑换确认方法
    function exchangeFun(){
        //验证码的验证
        var password = $.trim(passwordExchangeFlow.val());

        if (!password) {
            $("#messageExchangeFlow").html("密码不能为空");
            return;
        }

        var id="${id_n}";

        showBuyingTip();

        $.post(score.exchangePrizePath_, {exchangeID: id, type:"ExchangeFlow","password":$("#passwordExchangeFlow").val()}, function(data) {

            hideBuyingTip();
            var message = "兑换请求已提交，兑换结果请稍后以短信为准。";

            if(productType == "6" ){
                message = "兑换成功！已为您增加"+prizeName+"，游戏机会当日有效，快去<a href='/'>摇奖</a>吧。";
            }
            if(productType == "9" ){
                message = "兑换成功！已为您增加"+prizeName+"，快去<a href='/portal/app/tiger.jsp'>玩幸运投</a>吧。";
            }
            if (data.status != "ok") {
                if (data.code == "50006") {
                    message = "流量币不足";
                } else if (data.code == "50007") {
                    message = "奖品不存在";
                } else {
                    alert(data.message);
                    return;
                }
            }
            $("#confirmDiv").html(message);
            $("#pwdDiv").hide();
            $("#exchangeButDiv").hide();
            if(productType=="6"){
                $("#shakeTimeDiv").show();
                $("#tigerTimeDiv").hide();
                $("#yesButDiv").hide();
            }else if(productType=="9"){
                $("#tigerTimeDiv").show();
                $("#shakeTimeDiv").hide();
                $("#yesButDiv").hide();
            }else{
                $("#yesButDiv").show();
            }
        }, "json");
    }

    function initBuyingTip() {
        var $screen = $(".jia_layout");
        $mask.css({"line-height":$screen.height() + "px",height:window.height,width:window.width});
        $buyingTip.css({"line-height":$screen.height() + "px",height:window.height,width:$screen.width()});
    }

    function showBuyingTip() {
        $buyingTip.css({top : $(window).scrollTop()});
        $mask.css({top : $(window).scrollTop()});
        $mask.show();
        $buyingTip.show();
        $("html").css({overflow:"hidden"});
        window.ontouchmove = function(e){
            e.defaultPrevented && e.defaultPrevented();
            e.returnValue=false;
            e.stopPropagation && e.stopPropagation();
            return false;
        };
    }

    function hideBuyingTip() {
        $mask.hide();
        $buyingTip.hide();
        $("html").css({overflow:"auto"});
        window.ontouchmove = null;
    }

</script>

</body>
</html>