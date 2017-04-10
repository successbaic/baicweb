<%@ page errorPage="../error.jsp"%>
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>工商局网上注册</title>
</head>
<body leftmargin="0" topmargin="0">
<%	
	String LOGINID=request.getParameter("LOGINID");
	String type=request.getParameter("type");
%>
<form name="bbrules" method="post">
<table style="margin-top: 20px;" width="800" border="0" cellpadding="0" cellspacing="0" align="center">
<caption style="font-size: 20px;">网上登记系统使用协议</caption>
	<tr> 
    <td align="center" class=tc> 今天是： 
		<script language="JavaScript">

		var enabled = 0; today = new Date();
		var day; var date;
		if(today.getDay()==0) day = " 星期日"
		if(today.getDay()==1) day = " 星期一"
		if(today.getDay()==2) day = " 星期二"
		if(today.getDay()==3) day = " 星期三"
		if(today.getDay()==4) day = " 星期四"
		if(today.getDay()==5) day = " 星期五"
		if(today.getDay()==6) day = " 星期六"
		document.fgColor = "000000";
		date = (today.getFullYear()) + "年" + (today.getMonth() + 1 ) + "月" + today.getDate() + "日" + day +"";
		document.write(date);
		var LOGINID="<%=LOGINID%>";
		var type="<%=type%>";
		</script>

  </td>
</tr>
  <tr>
    <td align=center class=lc1>
	<textarea rows="25" name="Declare" cols="100" readOnly style="font-size: 16px;">
                    
    欢迎您的加入，请您认真阅读以下条款并自觉按照以下条款注册新用户：

一、您已阅读过相关的名称或者登记业务相关的法律法规，确知享有的权利和义务。
二、您承诺所填报的信息齐全、真实、准确、合法，且代表全体股东的意思表示，并能在规定的期限递交与网上申请信息一致或者符合填报要求的名称或登记材料。
三、您应保证申请、修改操作已经取得新设立的全体股东的书面授权，并无侵犯他人的合法权益。
四、您同意登记机关在审查回复网上申请时，有权对登记事项进行修改；并同意网上申请一经登记机关核准，原则上您不再对申请内容提出更改。
五、本网站对本协议进行修改和对网上注册系统进行更新时，可以不预先通知。
六、因不可抗力丢失、泄露填报信息、校验密码或者导致填报信息错乱时，本网站不负任何责任。
七、证件号码请填写您的真实身份证号，长度为15位或者18位。
八、用户名请填写您的真实姓名。
九、请留下您的真实联系电话，方便联系。
十、请妥善保存您设置的密码，每次登录本系统都会用到。
    对于不按照上述要求注册的用户，系统管理人员保留删除的权利，后果请用户自负。
</textarea>	
</td>
</tr>
<tr>
  <td  class=fc style="text-align: center;">
	  <input name="but_accept" type="button" value="接 受" class="button" onClick="GoReg()">
	  <input type="button" name="button" value="不接受" class="button" onClick="javascript:window.close();">
  </td>
	  
</tr>
</table>    
</form>

<body leftmargin="0" topmargin="0">

<script  language="javascript">
function GoReg()
{
	this.location="regist_main.jsp?YWLX=1&LOGINID="+LOGINID+"&type="+type;
}
function timelimit() {
	var secs = 6;
	var wait = secs * 1000;
	document.bbrules.but_accept.value = "接 受(" + secs + ")";
	document.bbrules.but_accept.disabled = true;
	for(i = 1; i <= secs; i++) {
					window.setTimeout("update(" + i + ")", i * 1000);
	}
	window.setTimeout("timer()", wait);
}
function update(num, value) {
	var secs = 6;
	var wait = secs * 1000;
	if(num == (wait/1000)) {
		document.bbrules.but_accept.value = "接 受";
	} else {
			printnr = (wait / 1000)-num;
			document.bbrules.but_accept.value = "接 受(" + printnr + ")";
	}
}
function timer() {
		document.bbrules.but_accept.disabled = false;
		document.bbrules.but_accept.value = "接 受";
}
</script>
</body>
</html>
