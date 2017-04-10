<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.Random" %>
<html>
  <head>
    <title>网上登记</title>
   <style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:256px;
	height:325px;
	z-index:1;
	left: 34px;
	top: 232px;
	background-image:url(images/login/login.png);
}
#Layer2 {
	position:absolute;
	width:624px;
	height:426px;
	z-index:2;
	left: 311px;
	top: 110px;	
}
#Layer3 {
	position:absolute;
	width:217px;
	height:38px;
	z-index:3;
	left: 46px;
	top: 135px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
   </style>
<script  language="javascript">
  function login(){
     var loginId = document.userLogin.LOGINID.value;
     var passWord = document.userLogin.PASSWORD.value;
     var yzm=document.userLogin.YZCODE.value;
     if(loginId==null||loginId==''){
        alert("用户名不能为空！");
        document.userLogin.LOGINID.focus();
        return;
     }
     else if(passWord==null||passWord==''){
        alert("密码不能为空！");
        document.userLogin.PASSWORD.focus();
        return;
     }else if(yzm==""){
     	alert("验证码不能为空");
     	document.userLogin.YZCODE.focus();
     	return;
     }     
     userLogin.submit();
   }
   function focusNext(form, elemName, evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode :
	   ((evt.which) ? evt.which : evt.keyCode);
    if (charCode == 13 || charCode == 3) {
	   form.elements[elemName].focus();
	   return false;
    }
    return true;
	}
	function submitViaEnter(evt,Location) {
	evt = (evt) ? evt : event;
	var target = (evt.target) ? evt.target : evt.srcElement;
	var form = target.form;
	var charCode = (evt.charCode) ? evt.charCode :
	   ((evt.which) ? evt.which : evt.keyCode);
	if (charCode == 13 || charCode == 3) {
		document.userLogin.logsub.onclick();
		return false;
	}
	return true;
	}
	function body_load(){
		
	}
</script>
</head>
<body style="text-align:center; margin:0; background-repeat:no-repeat;" onload="body_load()">
<%
Random random = new Random();
String a=String.valueOf(random.nextInt(10));
String b=String.valueOf(random.nextInt(10));
String c=String.valueOf(random.nextInt(10));
String d=String.valueOf(random.nextInt(10));
String abcd=a+""+b+""+c+""+d;
String sabcd=a+" "+b+" "+c+" "+d;
String CDDL=request.getParameter("CDDL");
%>
<table height="100%"><tr><td align="center" valign="middle">
<div style="position:relative;background-image:url(images/login/background.jpg); width:980px; height:600px; background-position:center; background-repeat:no-repeat">
<div id="Layer1">
<form name="userLogin" method="POST" action="web/djlogin_action.jsp" target="editframe">
<input type="hidden" name="CJLX" value="0">
<input type="hidden" name="CDDL" value="<%=CDDL%>">
<input type="hidden" name="abcd" id="abcd" value="<%=abcd%>">
 <div style="position:absolute; width:150px; height:26px; left: 85px; top: 74px;">
 <input type="text" id="LOGINID" name="LOGINID" onKeyPress="return focusNext(this.form, 'PASSWORD', event)" style="width:149px;border:none; height:20px; background-color:#D3D3D3"/>
 </div>
 <div style="position:absolute; width:150px; height:26px; left: 85px; top: 114px;">
 <input type="password" id="PASSWORD" name="PASSWORD" onKeyPress="return focusNext(this.form, 'YZCODE', event)" style="width:149px;border:none; height:20px; background-color:#D3D3D3"/>
 </div>
 
 <div style="position:absolute; width:70px; height:26px; left: 85px; top: 154px;">
 <input type="text" id="YZCODE" name="YZCODE" onKeyPress="return submitViaEnter(event)"style="width:70px;border:none; height:20px; background-color:#D3D3D3"/>
 </div>
 
 <div style="position:absolute; width:70px; height:26px; left: 162px; top: 154px;background-image:url(images/code.gif);padding:0 2px 0 2px; height:26px; line-height:26px;">
 <font><STRONG><%=sabcd%></STRONG></font>  
 </div>

  <div style="position:absolute; width:89px; height:32px; left: 24px; top: 202px;">
  <img src="images/login/dl.png"id="logsub" onClick="login()"/></div>
 
  <div style="position:absolute; width:89px; height:32px; left: 142px; top: 202px;">
  <img src="images/login/qx.png" onClick="userLogin.reset()"/></div>
  
   <div style="position:absolute; width:150px; height:32px; left: 54px; top: 275px;">
  <a href="userregist/regist_pre.jsp" style="cursor:hand;font-size:14px; color:#626262" target='_blank'>注 册</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="usermodify/modify_pwd1.jsp?flag=1" style="cursor:hand;font-size:14px; color:#626262" target='_blank'>忘记密码</a>
  </div>
 </form>
</div>  
<div id="Layer2">
<img src="images/login/link.png" border="0" usemap="#Map" />
<map name="Map">
<area shape="poly" coords="184,437,27,438,12,388,8,327,146,330,154,389" target="_blank" onFocus="this.blur()" href="http://wsnj.zbgs.net:800/gongshang/businessnavi.swf">
<area shape="poly" coords="5,321,143,325,147,283,166,228,57,157,20,233" target="_blank" onFocus="this.blur()" href="djbg/djbg.jsp">
<area shape="poly" coords="56,152,169,223,256,155,206,32,119,83" target="_blank" onFocus="this.blur()" href="djzcbwbd/djzcbwbd.jsp">
<area shape="poly" coords="261,152,211,30,318,8,434,30,385,153,329,145" target="_blank" onFocus="this.blur()" href="djnotice/qydjnotice.jsp">
<area shape="poly" coords="396,154,444,31,526,75,591,154,476,224" target="_blank" onFocus="this.blur()" href="qzspsx/qzspsx.jsp">
<area shape="poly" coords="481,233,595,161,629,233,639,320,505,323,499,280" target="_blank" onFocus="this.blur()" href="help/help.jsp">
<area shape="poly" coords="504,328,640,328,628,431,474,432" target="_blank" onFocus="this.blur()" href="http://wsnj.zbgs.net:800/gongshang/">
</map></div>
<div id="Layer3" align="center">
<font style="text-align:center; font-size:14px; color:#FFFFFF">
<%=new java.text.SimpleDateFormat("yyyy 年 MM 月 dd 日").format(new java.sql.Date(new java.util.Date().getTime()))%>
<br> 
<br>
欢 迎 进 入 网 上 登 记 系 统</font>
</div>
</div>
</td></tr></table>
<iframe height="0" width="100" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0"></iframe>
</body>
</html>