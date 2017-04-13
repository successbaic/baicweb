<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>济南工商微信服务平台</title>
    <link rel="stylesheet" href="../example/example.css"/>
    <link rel="stylesheet" href="../style/weui.css"/>
	<script language="javascript" src="<%=request.getContextPath() %>/support/jquery-1.8.3.js"></script>
	<script language="javascript" src="../public/dsSave.js"></script>
	<script type="text/javascript">
	function doSub(){
		var data=$("#myform").serializeArray();
		var ret=doAjaxSub("QydjJbxxSqAction.do?method=Save",data);
		alert(ret);
	}
	</script>
</head>
<body ontouchstart>

<form name="myform" id="myform" action="WeiServletAction">
<input type="hidden" name="CLASSNAME" value="QydjJbxxSqAction">
<input type="hidden" name="METHODNAME" value="Save">
<div class="page">
    <div class="page__bd">
        <h1 class="page__title" style="width:100%;text-align:center;margin-top:40px;">基本信息</h1>
    </div>
    <div class="page__bd">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd">
                	<label class="weui-label">企业名称</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="ENTNAME" placeholder="请输入企业名称"/>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">法定代表人</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="LEREP" placeholder="请输入法定代表人">
                </div>
            </div>
            
			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">住所</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入住所">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">生产经营地</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入生产经营地">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">注册资本</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入注册资本">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">联系电话</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入联系电话">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">邮政编码</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入邮政编码">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">生产经营地</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入生产经营地">
                </div>
            </div>

			<div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">经营范围</label>
                </div>
                <div class="weui-cell__bd">
					<textarea class="weui-textarea" placeholder="请输入文本" rows="3"></textarea>
                    <!--div class="weui-textarea-counter"><span>0</span>/200</div-->
                </div>
            </div>
			
			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">企业类型</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入企业类型地">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">设立方式</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入设立方式">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">拟登记机关</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入拟登记机关">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">管辖单位</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入管辖单位">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">执照副本数</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入执照副本数">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">营业期限</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="请输入营业期限">
                </div>
            </div>




        </div>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:doSub();" id="showTooltips">确定</a>
        </div>
    </div>
    <div class="page__ft">
        <a href="javascript:home()"><img src="../example/images/icon_footer_link.png" /></a>
    </div>
</div>

</form>

    <script src="../example/zepto.min.js"></script>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>

<script type="text/javascript">
    $(function(){
        var $tooltips = $('.js_tooltips');

        $('#showTooltips').on('click', function(){
            if ($tooltips.css('display') != 'none') return;

            // toptips的fixed, 如果有`animation`, `position: fixed`不生效
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