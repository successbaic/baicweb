<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>���Ϲ���΢�ŷ���ƽ̨</title>
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
        <h1 class="page__title" style="width:100%;text-align:center;margin-top:40px;">������Ϣ</h1>
    </div>
    <div class="page__bd">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd">
                	<label class="weui-label">��ҵ����</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="ENTNAME" placeholder="��������ҵ����"/>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">����������</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="LEREP" placeholder="�����뷨��������">
                </div>
            </div>
            
			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">ס��</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="������ס��">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">������Ӫ��</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="������������Ӫ��">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">ע���ʱ�</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="������ע���ʱ�">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">��ϵ�绰</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="��������ϵ�绰">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">��������</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="��������������">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">������Ӫ��</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="������������Ӫ��">
                </div>
            </div>

			<div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">��Ӫ��Χ</label>
                </div>
                <div class="weui-cell__bd">
					<textarea class="weui-textarea" placeholder="�������ı�" rows="3"></textarea>
                    <!--div class="weui-textarea-counter"><span>0</span>/200</div-->
                </div>
            </div>
			
			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">��ҵ����</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="��������ҵ���͵�">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">������ʽ</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="������������ʽ">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">��Ǽǻ���</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="��������Ǽǻ���">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">��Ͻ��λ</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="�������Ͻ��λ">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">ִ�ո�����</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="������ִ�ո�����">
                </div>
            </div>

			 <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">Ӫҵ����</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" placeholder="������Ӫҵ����">
                </div>
            </div>




        </div>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:doSub();" id="showTooltips">ȷ��</a>
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