<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<%@ page import="java.net.URLEncoder" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%if(webuser==null){
	out.println(SysUtility.setAlertGo("用户尚未登录或登录超时，请重新登录","index.jsp"));
	return;
}else{
	if(webuser.getUSERNAME()==null || webuser.getUSERNAME().equals("")){
		out.println(SysUtility.setAlertGo("用户尚未登录或登录超时，请重新登录","index.jsp"));
		return;
	}
}
%>
<html>
<head>
<title>网上登记</title>
<script language="javascript">
function doSub(val){
	if(val=="1"){
		if(window.confirm("高新区名称将跳转到自主核名系统办理业务，是否跳转？")){
			document.form2.submit();
		}
	}else{
		document.form1.submit();
	}
}
</script>
</head>
<body style="text-align:center; margin:0; background-repeat:no-repeat;">
<%
String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
if(CDDL.equals("")){SysUtility.setAlertGo("参数传递错误！", "index.jsp");return;}
String flag0="",flag1="",flag2="",flag3="",flag4="",flagname0="",flagname1="",flagname2="",flagname3="",flagname4="";
if(CDDL.equals("0")){
	flagname0="名称登记";flagname1="名称预核申请";flagname2="名称调整申请";flagname3="名称延期申请";flagname4="名称变更申请";
	//by vincent
	//名称变更申请功能暂时去掉
	//2014.8.14
	
	flag0="1";flag1="10";flag2="11";flag3="12";flag4="13";
}else if(CDDL.equals("1")){
	flagname0="企业登记";flagname1="设立登记";flagname2="变更、备案登记";flagname3="注销登记";flagname4="备案登记";
	flag0="1";flag1="20";flag2="30";flag3="50";flag4="40";
}else if(CDDL.equals("2")){
	flagname0="个体登记";flagname1="设立登记";flagname2="变更登记";flagname3="注销登记";
	flag0="2";flag1="20";flag2="30";flag3="50";
}else if(CDDL.equals("3")){
	flagname0="合作社登记";flagname1="设立登记";flagname2="变更、备案登记";flagname3="注销登记";
	flag0="2";flag1="20";flag2="30";flag3="50";
}
%>
<form name="form2" action="http://218.57.139.23:7777/napout/jsp/nameapprovalout/ext/gologin.jsp" method="POST">
<input type="hidden" name="i" value="<%=webuser.getLOGINID() %>">
<input type="hidden" name="n" value="<%=URLEncoder.encode(webuser.getUSERNAME(),"GBK") %>">
<input type="hidden" name="tel" value="<%=webuser.getTEL() %>">
<input type="hidden" name="cn" value="<%=webuser.getCERNO() %>">

</form>

<form name="form1" action="ywdt.jsp" method="POST">
<input type="hidden" name="CDDL" value="<%=CDDL%>">
</form>
<%
	if("370200".equals(icms.getCURRENTUNIT())){
%>
<div style="position:relative; background-image:url(images/com/ywdb_qd.jpg); width:1350px; height:771px;background-position:center; background-repeat:no-repeat;">
<%}else{ %>
<div style="position:relative; background-image:url(images/com/ywdb_sd.jpg); width:1350px; height:771px;background-position:center; background-repeat:no-repeat;">
<%} %>
<div style="position:absolute; background-image:url(images/com/gsrw.png); width:160px; height:284px; cursor:pointer; left: 229px; top: 309px;"></div>

<div style="position:absolute;background-image:url(images/com/pt.png); top:375px; width:550px; height:120px; left: 435px; size:1px; cursor:pointer;"></div>

<div style="position:absolute; top:172px; height:21px; left: 455px; cursor:pointer;font-size:14px;color:#215CB8; font-weight:bolder;"><%=flagname0%></div>

<div style="position:absolute;left:0px">


<div style="position:absolute; top:276px; width:80px; height:131px; left: 550px; cursor:pointer; background-image:url(images/com/tmk.png);"></div>
<div style="position:absolute; top:288px; width:70px; height:70px; left: 557px; cursor:pointer; background-image:url(images/com/mctz.gif);" onclick="doSub('1')"></div>
<div style="position:absolute; top:362px; width:100px; height:21px; left: 542px; cursor:pointer;font-size:14px;color:red; font-weight:bolder;" onclick="doSub('1')">高新区企业入口</div>


<div style="position:absolute; top:276px; width:80px; height:131px; left: 770px; cursor:pointer; background-image:url(images/com/tmk.png);"></div>
<div style="position:absolute; top:288px; width:70px; height:70px; left: 779px; cursor:pointer; background-image:url(images/com/mcbg.gif);" onclick="doSub('2')"></div>
<div style="position:absolute; top:362px; width:100px; height:21px; left: 762px; cursor:pointer;font-size:14px;color:red; font-weight:bolder;" onclick="doSub('2')">非高新区企业入口</div>

<div style="position:absolute;background-image:url(images/com/fhsy.png); top:520px; width:51px; height:46px; left: 544px; cursor:pointer;" onclick="window.location.href='index.jsp'"></div>
<div style="position:absolute;top:570px; width:50px; height:46px; left: 544px; cursor:pointer; font-size:12px; color:#FFFFFF;" onclick="window.location.href='index.jsp'">返回首页</div>

<div style="position:absolute;background-image:url(images/com/loginout.png); top:520px; width:50px; height:50px; left: 609px; cursor:pointer;" onclick="if (window.confirm('确定退出企业网上工商系统吗?')){window.location.href='logout.jsp';}"></div>
<div style="position:absolute;top:570px; width:50px; height:50px; left: 609px; cursor:pointer; font-size:12px; color:#FFFFFF;" onclick="if (window.confirm('确定退出企业网上工商系统吗?')){window.location.href='logout.jsp';}">退出</div>

<div style="position:absolute;background-image:url(images/com/yhxx.png); top:520px; width:50px; height:50px; left: 674px; cursor:pointer;" onClick="window.open('usermodify/modify_main.jsp')"></div>
<div style="position:absolute; top:570px; width:50px; height:50px; left: 674px; cursor:pointer; font-size:12px; color:#FFFFFF;" onClick="window.open('usermodify/modify_main.jsp')">用户信息</div>

<div style="position:absolute;background-image:url(images/com/sybz.png); top:520px; width:50px; height:50px; left: 745px; cursor:pointer;" onclick="window.open('help/help.jsp')"></div>
<div style="position:absolute; top:570px; width:50px; height:50px; left: 745px; cursor:pointer; font-size:12px; color:#FFFFFF;" onclick="window.open('help/help.jsp')">使用帮助</div>

<div style="position:absolute;background-image:url(images/com/bljdcx.png); top:520px; width:50px; height:50px; left: 819px; cursor:pointer;" onclick="window.location.href='content.jsp'"></div>
<div style="position:absolute;top:570px; width:80px; height:50px; left: 805px; cursor:pointer; font-size:12px; color:#FFFFFF;" onclick="window.location.href='content.jsp'">办理进度查询</div>

<div style="position:absolute; top:707px; height:34px; left: 414px; cursor:pointer;">
<font color="#FFFFFF" style="font-size:14px; color:#FFFFFF;font-weight:bold">  主办单位：<%=PropertiesConfigUtil.getValue("deployregorg")%>
									&nbsp;技术支持：浪潮软件股份有限公司</font></div>
</div>
</body>
</html>
