<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<%@ page import="java.net.URLEncoder" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%if(webuser==null){
	out.println(SysUtility.setAlertGo("�û���δ��¼���¼��ʱ�������µ�¼","index.jsp"));
	return;
}else{
	if(webuser.getUSERNAME()==null || webuser.getUSERNAME().equals("")){
		out.println(SysUtility.setAlertGo("�û���δ��¼���¼��ʱ�������µ�¼","index.jsp"));
		return;
	}
}
%>
<html>
<head>
<title>���ϵǼ�</title>
<script language="javascript">
function doSub(val){
        document.getElementById("CDDL").value = val;
		document.form1.submit();
}
</script>
</head>
<body style="text-align:center; margin:0; background-repeat:no-repeat;">
<%
String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
if(CDDL.equals("")){SysUtility.setAlertGo("�������ݴ���", "index.jsp");return;}
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

<div style="position:absolute; top:172px; height:21px; left: 455px; cursor:pointer;font-size:14px;color:#215CB8; font-weight:bolder;">������Ѻ�Ǽ�</div>

<div style="position:absolute;left:0px">


<div style="position:absolute; top:276px; width:80px; height:131px; left: 552px; cursor:pointer; background-image:url(images/com/tmk.png);"></div>
<div style="position:absolute; top:288px; width:70px; height:70px; left: 558px; cursor:pointer; background-image:url(images/com/mcyh.gif);" onclick="doSub('61')"></div>
<div style="position:absolute; top:362px; width:70px; height:21px; left: 559px; cursor:pointer;font-size:14px;color:red;  font-weight:bolder;" onclick="doSub('61')">��ҵ���</div>


<div style="position:absolute; top:276px; width:80px; height:131px; left: 680px; cursor:pointer; background-image:url(images/com/tmk.png);"></div>
<div style="position:absolute; top:288px; width:70px; height:70px; left: 682px; cursor:pointer; background-image:url(images/com/mctz.gif);" onclick="doSub('62')"></div>
<div style="position:absolute; top:362px; width:70px; height:21px; left: 683px; cursor:pointer;font-size:14px;color:red;  font-weight:bolder;" onclick="doSub('62')">���幤�̻����</div>


<div style="position:absolute; top:276px; width:80px; height:131px; left: 800px; cursor:pointer; background-image:url(images/com/tmk.png);"></div>
<div style="position:absolute; top:288px; width:70px; height:70px; left: 802px; cursor:pointer; background-image:url(images/com/mcyq.gif);" onclick="doSub('63')"></div>
<div style="position:absolute; top:362px; width:70px; height:21px; left: 803px; cursor:pointer;font-size:14px;color:red;  font-weight:bolder;" onclick="doSub('63')">ũ��������Ӫ�����</div>

<div style="position:absolute;background-image:url(images/com/fhsy.png); top:520px; width:51px; height:46px; left: 544px; cursor:pointer;" onclick="window.location.href='index.jsp'"></div>
<div style="position:absolute;top:570px; width:50px; height:46px; left: 544px; cursor:pointer; font-size:12px; color:#FFFFFF;" onclick="window.location.href='index.jsp'">������ҳ</div>

<div style="position:absolute;background-image:url(images/com/loginout.png); top:520px; width:50px; height:50px; left: 609px; cursor:pointer;" onclick="if (window.confirm('ȷ���˳���ҵ���Ϲ���ϵͳ��?')){window.location.href='logout.jsp';}"></div>
<div style="position:absolute;top:570px; width:50px; height:50px; left: 609px; cursor:pointer; font-size:12px; color:#FFFFFF;" onclick="if (window.confirm('ȷ���˳���ҵ���Ϲ���ϵͳ��?')){window.location.href='logout.jsp';}">�˳�</div>

<div style="position:absolute;background-image:url(images/com/yhxx.png); top:520px; width:50px; height:50px; left: 674px; cursor:pointer;" onClick="window.open('usermodify/modify_main.jsp')"></div>
<div style="position:absolute; top:570px; width:50px; height:50px; left: 674px; cursor:pointer; font-size:12px; color:#FFFFFF;" onClick="window.open('usermodify/modify_main.jsp')">�û���Ϣ</div>

<div style="position:absolute;background-image:url(images/com/sybz.png); top:520px; width:50px; height:50px; left: 745px; cursor:pointer;" onclick="window.open('help/help.jsp')"></div>
<div style="position:absolute; top:570px; width:50px; height:50px; left: 745px; cursor:pointer; font-size:12px; color:#FFFFFF;" onclick="window.open('help/help.jsp')">ʹ�ð���</div>

<div style="position:absolute;background-image:url(images/com/bljdcx.png); top:520px; width:50px; height:50px; left: 819px; cursor:pointer;" onclick="window.location.href='content.jsp'"></div>
<div style="position:absolute;top:570px; width:80px; height:50px; left: 805px; cursor:pointer; font-size:12px; color:#FFFFFF;" onclick="window.location.href='content.jsp'">������Ȳ�ѯ</div>

<div style="position:absolute; top:707px; height:34px; left: 414px; cursor:pointer;">
<font color="#FFFFFF" style="font-size:14px; color:#FFFFFF;font-weight:bold">  ���쵥λ��<%=PropertiesConfigUtil.getValue("deployregorg")%>
									&nbsp;����֧�֣��˳�����ɷ����޹�˾</font></div>
</div>
</body>
</html>
