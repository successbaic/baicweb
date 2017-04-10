<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.Random" %>
<html>
  <head>
    <title>网上登记</title>
<style type="text/css">
#yxsm {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
   line-height: 23px;
}
body {
font-family: 锟斤拷锟斤拷;
font-size: 11pt;
scrollbar-face-color: #BED8EB; 
scrollbar-shadow-color: #DDF8FF; 
scrollbar-highlight-color: #92C0D1; 
scrollbar-3dlight-color: #DDF8FF; 
scrollbar-darkshadow-color: #92C0D1; 
scrollbar-track-color:#BED8EB; 
scrollbar-arrow-color: #92C0D1;
}
img {
	vertical-align: middle; border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;
}
input{
font-size: 11pt;
font-family: 锟斤拷锟斤拷; 
color:black;
height: 24px;
padding-left: 2px;
}
.lc1 {background-color: #DAE9F3;line-height:25px;padding-left: 2px;padding-right: 2px;font-size:11pt;text-align: center;}
.lc2 {background-color: #F6F9FF;line-height:25px;padding-left: 2px;padding-right: 2px;font-size:11pt;text-align: left;}
td {
font-size: 11pt;
border-color:#A0A0A0;
line-height: 26px;
border-right-style: none;
border-right-width: medium;
border-top-style: none;
border-top-width: medium;
}
table {
font-family: 锟斤拷锟斤拷;
font-size: 11pt;
border-color:44AED5;
border-width: 1px;
border-collapse: collapse;
}
</style>
<script  language="javascript">
  function login(){
     var loginId = document.userLogin.LOGINID.value;
     var passWord = document.userLogin.PASSWORD.value;
     var yzm=document.userLogin.YZCODE.value;
     var abcd=document.userLogin.abcd.value;
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
     //userLogin.submit=window.open(this.href,'../index_action.jsp'); 
     //userLogin.submit();
     var ret=window.open('login_action.jsp?CDDL='+document.userLogin.CDDL.value+'&LOGINID='+loginId+'&PASSWORD='+passWord+'&YZCODE='+yzm+'&abcd='+abcd+'&CJLX='+document.getElementById("CJLX").value);
   	 window.location.reload();
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
</script>
</head>
<body>
<%
String CJLX=request.getParameter("CJLX");
if(CJLX==null || CJLX.equals("")){
 out.println("参数传递错误！");
 return;
}
String CJMC="企 业 登 记";
String CDDL="1";
if(CJLX.equals("GTDJ")){
	CJMC="个 体 户 登 记";CDDL="2";
}else if(CJLX.equals("HZS")){
	CJMC="农民专业合作社";CDDL="3";
}else if(CJLX.equals("HWGG")){
	CJMC="户外广告登记";
}else if(CJLX.equals("DCDY")){
	CJMC="动产抵押登记";
}else if(CJLX.equals("MCDJ")){
	CJMC="名称登记";CDDL="0";
}else if(CJLX.equals("GQCZ")){
	CJMC="股权出质";CDDL="4";
}

Random random = new Random();
String a=String.valueOf(random.nextInt(10));
String b=String.valueOf(random.nextInt(10));
String c=String.valueOf(random.nextInt(10));
String d=String.valueOf(random.nextInt(10));
String abcd=a+""+b+""+c+""+d;
String sabcd=a+" "+b+" "+c+" "+d;
%>
<form name="userLogin" method="get" action="../web/djlogin_action.jsp">

<input type="hidden" name="abcd" id="abcd" value="<%=abcd%>">
<table width="650px"  bgcolor="#D5E2EA" align="center"><tr><td valign="middle">
<br>
<input type="hidden" name="CJLX" id="CJLX" value="0">
<input type="hidden" name="CDDL" id="CDDL" value="<%=CDDL%>">
<table border="0" width="600px" align="center" height="72px" cellspacing="0">
<tr>
<td width="400px" style=" background-image:url(../images/main/top-left.jpg);"></td>
<td width="200px" style=" background-image:url(../images/main/top-center.jpg);"></td>
</tr>
</table>

<table border="0" width="600px" align="center" cellspacing="0">
	<tr style="background-image:url(../images/main/currpostitleBG.jpg);background-repeat:repeat-x;line-height: 23px;">
		<td>&nbsp;</td>
		<td>
		<img src="../images/main/nowlocation.png"/>&nbsp;&nbsp;
		<font color="#1E90FF">当 前 位 置 : 网 上 大 厅 > </font><font color="#8c0044"> <%=CJMC%> </font> 
		</td>
	</tr>
</table>
<br/>	
<table width="600px" align="center" border="1">
 <tr>
    <td id="yxsm" colspan="2">
    <p style="font-color: #000080;font-size: 11pt;font-weight: bold;">
    <font color=#000080>
    &nbsp;&nbsp;&nbsp;&nbsp;用户登陆信息
    </font>
    </p>
    </td>
  </tr>
 <tr>
<tr>
<td class="lc1" width="200px">用户名：</td>
<td class="lc2" width="400px">
<input type="text" id="LOGINID" name="LOGINID" onKeyPress="return focusNext(this.form, 'PASSWORD', event)"/>
</td>
</tr>

<tr>
<td class="lc1">密  码：</td>
<td class="lc2">
<input type="password" id="PASSWORD" name="PASSWORD" onKeyPress="return focusNext(this.form, 'YZCODE', event)"/>
</td>
</tr>

<tr>
<td class="lc1">验证码：</td>
<td class="lc2">
<input type="text" id="YZCODE" name="YZCODE" onKeyPress="return submitViaEnter(event)"style="width:70px;"/>

<div style="position:absolute; width:70px; height:26px; background-image:url(../images/code.gif);padding:0 2px 0 2px; height:26px; line-height:26px;">
 <font><STRONG><%=sabcd%></STRONG></font>  
 </div>
 
</td>
</tr>
</table>
<br/>
<table width="350px" align="center" >
<tr>
<td><input type="button" name="logsub" value="登  陆" onclick="login()"></td>
<td><input type="reset" value="重  置"></td>
</tr>
<tr>
<td colspan="4">
<br/>
如果您还没有注册用户，请先<a href="../userregist/regist_pre.jsp" target="_blank">注册信息</a><br/>
如果您忘记密码，请点击<a href="../usermodify/modify_pwd1.jsp?flag=1'" target="_blank">这里</a>
</td>
</tr>
</table>
<br>
</td></tr></table>
</form>
</body>
</html> 
