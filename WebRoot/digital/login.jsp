<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<%@ page import="java.util.*"%>
	<head>
		<title></title>
<style type="text/css">
body {
font-family: 宋体;
font-size: 9pt;
background-color: white;
}
input{
font-size: 9pt;
font-family: 宋体; 
color:black;
padding-left: 2px;
}
table {
font-family: 宋体;
border-collapse: collapse;
}

td {
font-size: 9pt;
border-color:#A1C3E7;
line-height: 25px;
border-left-style: none;
border-left-width: medium;
border-top-style: none;
border-top-width: medium;
}
a {font-family: 宋体;font-size: 9pt;text-decoration: none;line-height: 15pt;color: #000066;}
a:link {color: #000066;padding-left: 2px;}
a:visited {color: #000066;padding-left: 2px;}
a:hover {color:red;padding-left: 2px;}
.title_css {
   background-image:url(images/title.jpg);
   background-repeat:repeat-x;
   font-size:12pt;
   font-family: 宋体;
   color:#000080; 
   font-weight: bold;
}
</style>
</head>
<body>
<%
	//取年检年份
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR) - 1;
%>
<script type="text/javascript">
function openPass(){
	 var url="resetPassWord.jsp";
	 var iWidth=350; //窗口宽度         
	 var iHeight=400;//窗口高度           
	 var iTop=(window.screen.height-iHeight)/2;           
	 var iLeft=(window.screen.width-iWidth)/2;           
	 window.showModalDialog(url,window,"dialogHeight: "+iHeight+"px; dialogWidth: "+iWidth+"px;     dialogTop: "+iTop+"; dialogLeft: "+iLeft+"; resizable: no; status: no;scroll:no");  
}
function login(){
	form1.submit();
}
</script>
<br/><br/>
<form name="form1" action="login_action.jsp" method="post">
<table width="981px" height="95%" align="center">
<tr>
<td height="83px" style="background-image:url(images/banner.jpg);"></td></tr>
  <tr>  
    <td align="center" style=" background-image:url(images/abg.GIF);background-repeat:repeat-x;" valign="top">
		<table width="981px" cellpadding="4" cellspacing="4">  
		  <tr>
			<td align="center" valign="middle" width="300px">
	<table width="270px"><tr><td>	
	<div style="position:relative;">
	<img src="images/login.png" />
	
	<div style="position:absolute; width:90px; height:32px; left: 10px; top: 70px;">  
	  <font style="font-size:15px; color:#626262">用 户 名：</font>
	 </div>
	
	<div style="position:absolute; width:90px; height:32px; left: 10px; top: 110px;">  
	  <font style="font-size:15px; color:#626262">密 &nbsp; 码：</font>
	 </div>
	 
	
	 
	 <div style="position:absolute; width:150px; height:26px; left: 85px; top: 70px;">
       <input type="text" id="QYMC" name="QYMC" onkeypress="return focusNext(this.form, 'PASSWORD', event)" style="width:149px;"/>
</div>
 <div style="position:absolute; width:150px; height:26px; left: 85px; top: 110px;">
   <input type="password" id="PASSWORD" name="PASSWORD" onKeyPress="return submitViaEnter(event)" style="width:149px;"/>
 </div>
 

 
  <div style="position:absolute; width:89px; height:32px; left: 25px; top: 160px;cursor:hand;">
  <img src="images/dl.png"id="logsub" onClick="login()"/></div>
 
  <div style="position:absolute; width:89px; height:32px; left: 140px; top: 160px;cursor:hand;">
  <img src="images/qx.png" onClick="form1.reset()"/></div>
  
  <div style="position:absolute; width:130px; height:32px; left: 80px; top: 270px;">  
  <a href="#" onclick='openPass()' style="cursor:hand;font-size:14px; color:#626262" >忘记密码</a>
  <a href="regist_main.jsp" style="cursor:hand;font-size:14px; color:#626262" >注册</a>
  
  </div
  
	</div>
	</td></tr>
	</table>
	</td>
    <td  align="center" width="656px" bgcolor="#FFFFFF">

		<table width="95%" bgcolor="#FFFFFF" style="border:solid;border-color:#A1C3E7;border-width:1px;">
		<tr>
		<td class="title_css" align="left">
		&nbsp;&nbsp;须 知：</td>
		</tr>
		<tr>
		<td align="left">
&nbsp;&nbsp;&nbsp;&nbsp;1.第一次申请数字证书的用户需要首先注册用户，用户注册功能在用户登录窗口的下面。 <br>
&nbsp;&nbsp;&nbsp;&nbsp;2.用户注册完成后，需要登录系统，填写完整申请企业的信息，上传印章信息，证书类型等必填项，确认无误后点击提交。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.用户登录系统查看证书审核状态，如果填写申请信息不规范会被驳回，审核通过后可以领取证书。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.如果用户忘记密码，可以通过用户注册时填写的问题及答案找回密码，找回密码功能在登录窗口的下方。</td>
		<tr>
		<td style="height: 20px;">
		</td>
		</tr>
		</table>
		<div style="height:20px;">
		
		</div>
		<table width="95%" bgcolor="#FFFFFF" style="border:solid;border-color:#A1C3E7;border-width:1px;">		
		<tr>
		<td class="title_css" align="left">
		&nbsp;&nbsp;相 关 说 明：</td>
		</tr><tr>	
			<td align="left">
				<a href="usermesage.doc" target="_blank"><font style="font-size:13px;">
				&nbsp;&nbsp;&nbsp;&nbsp;数字证书用户协议</font></a>			
			</td>
		</tr>		
		<tr>
		<td style="height: 20px;">
		</td>
		</tr>						
		</table>

	</td>
	<td width="25px">
	
	</td>
  </tr>
 
</table>

		
	</td>
  </tr>
</table>
</form>
</body>
</html>
