<%@include file="jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<html>
<head>
<title>广告经营许可证资格检查</title>
<script language="javascript">
function funlogout()
{
	if (window.confirm("确定退出广告资格检查系统吗?"))
	{
		window.parent.location.href="ggxkzlogin.jsp";
	}
}
function doSub(){
	//document.getElementById("sbuimg").disabled=true;
	document.subForm.submit();
}

</script>
</head>
<body>
<table width="95%" height="100%" align="center" bgcolor="#D5E2EA">
<tr>
<td height="72px">
<form name="subForm" method="POST" action='ggxkz_ywsb_action.jsp' target="subframe">
<table width="98%" border="1" cellspacing="0" align="center" bgcolor="#FFFFFF">
<tr height="26px" style="background-image:url(images/main/currpostitleBG.jpg);background-repeat:repeat-x;">
<td colspan="4" style="border-right-style: none;border-right-width:none;">&nbsp;
<img src="images/main/nowlocation.png"/>&nbsp;&nbsp;<font color="#1E90FF">当 前 位 置 : 网 上 资 格 检 查 
</td>
<td colspan="2" style="border-left-style: none;border-left-width:none;">
<p align="center">
<img src="images/ggxkz/about1.gif" width="16" height="16"onmouseover="sybz.style.color='red'" onmouseout="sybz.style.color='black'" style="cursor:pointer" onclick="window.open('help.jsp','help','toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');"/>
<a id="sybz" onmouseover="this.style.color='red'" onmouseout="this.style.color='black'" style="cursor:pointer" onclick="window.open('help.jsp','help','toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');">使用帮助</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
<img src="images/ggxkz/logout.gif" width="16" height="16" onclick="funlogout()" onmouseover="tcxt.style.color='red'" onmouseout="tcxt.style.color='black'" style="cursor:pointer"/>
<a onclick="funlogout()" style="cursor:pointer" id="tcxt" onmouseover="this.style.color='red'" onmouseout="this.style.color='black'">退出系统</a>
</p>
</td>
</tr>
<tr>
<td class="lc1">广告许可证号：</td>
<td class="lc2"><%=GGGL_USER.getADBULICNO()%></td>
<td class="lc1">广告经营单位：</td>
<td class="lc2"><%=GGGL_USER.getADBUENT()%></td>
<td class="lc1">法定代表人：</td>
<td class="lc2"><%=GGGL_USER.getLEREP()%></td>
</tr>
<tr>
<td class="lc1">年检年度：</td>
<td class="lc2"><%=GGGL_USER.getINSYEAR()%></td>
<td class="lc1">年检状态：</td>
<td class="lc2">
<%
GGGL_JYDW_JBXX.setADBULICNO(GGGL_USER.getADBULICNO());
GGGL_JYDW_JBXX.setINSYEAR(GGGL_USER.getINSYEAR());
GGGL_JYDW_JBXX.doSelect();
String type=GGGL_JYDW_JBXX.getANCHETYPE();
if(type.equals("") ||type.equals("0")){
out.println("尚未提交");
}else if(type.equals("1")){
out.println("等待预审");
}else if(type.equals("2")){
out.println("预审通过");
}else if(type.equals("3")){
out.println("预审驳回");
}
%>
</td>
<td colspan="2" class="lc2">
&nbsp;
<%
if(type.equals("1") || type.equals("2")){

}else{
%>
<img src="images/ggxkz/tjxx.gif" style="cursor:pointer;" id="sbuimg" onclick="doSub()"/>
<%}%>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td align="center">
<iframe id="frmmain" name="main" width="98%" height="98%" scrolling="auto" frameborder="0" src="ww_ggxkz_control.jsp"></iframe>
</td>
</tr>
<tr height="28px">
<td style="background-image:url(images/main/bottom.jpg);" colspan="3"></td>
</tr>
</table>
<iframe height="0" width="0" name="subframe" src="" id="subframe" ></iframe> 
</body>
</html>