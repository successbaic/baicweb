<!DOCTYPE html>
<%@ page contentType="text/html; charset=GBK"%>
<html>
<head>
    <meta charset="GBK">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>���Ϲ���΢�ŷ���ƽ̨</title>
    <link rel="stylesheet" href="../example/example.css"/>
    <link rel="stylesheet" href="../style/weui.css"/>
</head>
<body ontouchstart>

<div class="page">
    <div class="page__bd">
        <h1 class="page__title" style="width:100%;text-align:center;margin-top:40px;">�û���¼</h1>
    </div>
    <div class="page__bd">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd">
                	<label class="weui-label">�û���</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" pattern="[0-9]*" placeholder="�������û���"/>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">����</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="tel" placeholder="����������">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                	<label class="weui-label">��֤��</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="��������֤��"/>
                </div>
                <div class="weui-cell__ft">
                    <img class="weui-vcode-img" src="imageAction.action"  onclick="this.src='imageAction.action?time='+(new Date()).getTime();"/>
                </div>
            </div>
        </div>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">ȷ��</a>
        </div>
    </div>
    <div class="page__ft">
        <a href="javascript:home()"><img src="../example/images/icon_footer_link.png" /></a>
    </div>
</div>

    <script src="../example/zepto.min.js"></script>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>

<script type="text/javascript">
    $(function(){
        var $tooltips = $('.js_tooltips');

        $('#showTooltips').on('click', function(){
            if ($tooltips.css('display') != 'none') return;

            // toptips��fixed, �����`animation`, `position: fixed`����Ч
            $('.page.cell').removeClass('slideIn');

            $tooltips.css('display', 'block');
            setTimeout(function () {
                $tooltips.css('display', 'none');
            }, 2000);
        });
    });
</script>
</body>
</html>