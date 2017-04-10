<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%
String SIGN=Page.getSIGN();
String OPENO=Page.getOPENO();
String CDDL=Page.getDL();
String OPETYPE="";
String REGNO="";
String XGBH="";
String DOMDISTRICT ="";
String XZQH=webuser.getXZQH();
if(!OPENO.equals("")){
	QYDJ_JBXX_SQ jbxx=new QYDJ_JBXX_SQ();
	jbxx.setOPENO(OPENO);
	jbxx.doSelect();
	REGNO=jbxx.getREGNO();
	XGBH=jbxx.getSPANAME();
	Page.setREGNO(REGNO);
	Page.setXGBH(XGBH);
	Page.setENTNAME(jbxx.getENTNAME());
	Page.setENTCLASS(jbxx.getENTCLASS());
	Page.setENTTYPE(icms.getSysRemark("ENTTYPE",jbxx.getENTTYPE()));
}
REGNO=Page.getREGNO();
XGBH=Page.getXGBH();
OPETYPE=Page.getOPETYPE();
%>
<html>
<head>
<title>守合同重信用企业申请</title>
<style>

</style>
<script type="text/javascript">
	var wait_time = 30; //设置秒数(单位秒) 
	var secs_time = 0;
	for (var i = 1; i <= wait_time; i++) {
		window.setTimeout("sTimer(" + i + ")", i * 1000);
	}
	function sTimer(num) {
		if (num == wait_time) {
			document.getElementById("reg_btn").value = " 下一步 ";
			document.getElementById("reg_btn").disabled = false;
		} else {
			secs_time = wait_time - num;
			document.getElementById("reg_btn").value = "请先下载“守合同重信用”企业公示申请书  (" + secs_time
					+ ")";
		}
	}

	function doSub() {
		window.location.href = "../szht_select.jsp";
	}
</script>
</head>
<BODY style="margin: 0px">
	<%@include file="top_szcp.inc"%>

	<table border='1' width='100%' align='center'>
		<tr>
		<td class=lc2 valign='top'>
		<font style='font-size:11pt;color:red;font-weight: bold'>
		&nbsp;&nbsp;温馨提示：
		</font>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请先下载“守合同重信用”企业公示申请书，经法定代表人签字和加盖企业公章，以及营业执照副本到住所地工商、市场监管部门提出申请,
		通过工商，市场监管部门申报资格预审后，工商、市场监管部门将企业的名单列入软件系统的预申报列表中，次日企业方可网上填报相关合同信用信息。详细了解请阅读页面左侧（辅助功能）相关链接。
		<br>
		<br>
		<br>
		点击下载<a href="worddoc/szcp_qygssqs.doc" target="_blank" color="red">“守合同重信用”企业公示申请书</a>
		</td></tr></table>
	
	<br>
	<CENTER style="text-align: right;">
		<input type="button" value="请先下载“守合同重信用”企业公示申请书 (0)" disabled="disabled"
			id="reg_btn" onclick="doSub()">
	</CENTER>
</body>
</html>