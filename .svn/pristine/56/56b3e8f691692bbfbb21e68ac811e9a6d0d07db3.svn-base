<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.dbc.DbConnection"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<%
	webuser.validatePage(request.getRequestURI());//检查用户是否有权限访问该页面
	Page.init();
	String url="";
	if(icms.getCURRENTUNIT().equals("371500")){
		url=ContrInfo.getYxjkurl();
	}
%>
<html>
<head>
<title><%=PropertiesConfigUtil.getValue("deployregorg")%>网上服务平台</title>
<LINK href="css/icms.css" type="text/css" rel="stylesheet">
<style type="text/css">
.DIV_L {
	line-height: 30px;
	text-align: center;
	color: #000000;
	font-size: 9pt;
	cursor: pointer;
	width: 81px;
	height: 30px;
	background: transparent url(images/tab/tabbefore.png) no-repeat;
}

.DIV_L_ON {
	width: 81px;
	height: 30px;
	background: transparent url(images/tab/tabafter.png) no-repeat;
	line-height: 30px;
	text-align: center;
	color: #FFFFFF;
	font-size: 9pt;
	cursor: pointer;
}
</style>
<script language="javascript" src="support/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var nowActual="";
function body_load(){
	var mc_td=document.getElementById("mc_td");
	var qy_td=document.getElementById("qy_td");
	var hzs_td=document.getElementById("hzs_td");
	var gth_td=document.getElementById("gth_td");
	var gqdj_td=document.getElementById("gqdj_td");	
	var hwgg_td=document.getElementById("hwgg_td");
	var dcdy_td=document.getElementById("dcdy_td");	
	var business_td=document.getElementById("business_td");	
	var ggdj_td=document.getElementById("ggdj_td");	
	
	if(mc_td!=null && mc_td!=undefined){
		document.getElementById("mc_table").style.display="";
		mc_td.className="DIV_L_ON";
		nowActual="mc";
		return ;
	}
	if(qy_td!=null && qy_td!=undefined){
		document.getElementById("qy_table").style.display="";
		qy_td.className="DIV_L_ON";
		nowActual="qy";
		return ;
	}
	if(hzs_td!=null && hzs_td!=undefined){
		document.getElementById("hzs_table").style.display="";
		hzs_td.className="DIV_L_ON";
		nowActual="hzs";
		return ;
	}
	if(gqdj_td!=null && gqdj_td!=undefined){
		document.getElementById("gqdj_table").style.display="";
		dcdy_td.className="DIV_L_ON";
		nowActual="gqdj";
		return ;
	}
	if(gth_td!=null && gth_td!=undefined){
		document.getElementById("gth_table").style.display="";
		gth_td.className="DIV_L_ON";
		nowActual="gth";
		return ;
	}
	if(hwgg_td!=null && hwgg_td!=undefined){
		document.getElementById("hwgg_table").style.display="";
		hwgg_td.className="DIV_L_ON";
		nowActual="hwgg";
		return ;
	}
	if(dcdy_td!=null && dcdy_td!=undefined){
		document.getElementById("dcdy_table").style.display="";
		dcdy_td.className="DIV_L_ON";
		nowActual="dcdy";
		return ;
	}
	if(ggdj_td!=null && ggdj_td!=undefined){
		document.getElementById("ggdj_table").style.display="";
		business_td.className="DIV_L_ON";
		nowActual="ggdj_td";
		return ;
	}
	if(business_td!=null && business_td!=undefined){
		document.getElementById("business_table").style.display="";
		business_td.className="DIV_L_ON";
		nowActual="business";
		return ;
	}
}
function doChange(lx){
	if(lx==nowActual){
		return;
	}
	document.getElementById(lx+"_td").className="DIV_L_ON";	
	document.getElementById(nowActual+"_td").className="DIV_L";
	document.getElementById(lx+"_table").style.display="";
	document.getElementById(nowActual+"_table").style.display="none";
	nowActual=lx;
}

function checkMoreInfo(SIGN,OPENO,OPETYPE,ENTTYPE,CDDL){
	document.form1.SIGN.value=SIGN;
	document.form1.OPENO.value=OPENO;
	document.form1.OPETYPE.value=OPETYPE;
	document.form1.ENTTYPE.value=ENTTYPE;
	document.form1.CDDL.value=CDDL;
	document.form1.submit();
}
function doDel(CDDL,OPENO){
	window.location.href="web/doDel.jsp?CDDL="+CDDL+"&OPENO="+OPENO;
}
//保存邮递信息
function showEmsMess(OPENO){
	var url = "web/addEmsMess.jsp?OPENO="+OPENO;
    var tmp=window.showModalDialog(url,window,"dialogHeight=330px;dialogWidth=300px;status:yes;scroll:yes;resizable:no;center:yes");
}
function LcYx(LX,OPENO,PRIPID,OPETYPE){
	var url="<%=url%>";
	if(url==""){
		alert("请配置影像档案接口的url连接！");
		return;
	}
	var altitem="";
	var bgcs="";
	if(OPETYPE=="30"){
		var htmlobj=$.ajax({url:"web/qydj_bgnr.jsp?OPENO="+OPENO,async:false});
	    var altitem=htmlobj.responseText;
	    altitem=altitem.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'');
	    bgcs="&ALTITEM="+altitem;
	}
	var pripidcs="";
	if(PRIPID==null || PRIPID=="null" || PRIPID==""){
		pripidcs="&PRIPID=";
	}else{
		pripidcs="&PRIPID="+PRIPID;
	}
	var loginid="<%=webuser.getLOGINID()%>";
	window.open(url+"?OPENO="+OPENO+pripidcs+"&OPETYPE="+OPETYPE+bgcs+"&UNAME="+loginid);
}
</script>
</head>
<body style="margin: 0px" onload="body_load()">
<form method="post" name="form1" action="main.jsp">
		<input type="hidden" id="SIGN" name="SIGN"> <input
			type="hidden" id="CDDL" name="CDDL"> <input type="hidden"
			id="OPENO" name="OPENO"> <input type="hidden" id="STATUS"
			name="STATUS"> <input type="hidden" id="OPETYPE"
			name="OPETYPE"> <input type="hidden" id="ENTTYPE"
			name="ENTTYPE"> <input type="hidden" id="PRIPID"
			name="PRIPID"> <input type="hidden" name="STEP" value="3">
	</form>
	<%
		DbConnection db = new DbConnection();
		ResultSet rs = db
				.executeQuery("select CDDL,count(*) as cou from QYDJ_YWSB_SQ where loginid='"
						+ webuser.getLOGINID()
						+ "' group by CDDL order by CDDL");
		String mc_td = "";
		String qy_td = "";
		String hzs_td = "";
		String gt_td = "";
		String gqdj_td = "";
		String hwgg_td = "";
		String dcdy_td = "";
		String ggdj_td = "";
		String business_td = "";
		int num = 0;
		while (rs.next()) {
			String CDDL = rs.getString("CDDL");
			if (CDDL == null) {
				CDDL = "";
			}
			//System.out.println("☆:"+CDDL);
			if (CDDL.equals("0")) {
				mc_td = "<td id='mc_td' class='DIV_L' onclick=\"doChange('mc')\">名称申请业务</td>";
				num += rs.getInt("cou");
			}
			if (CDDL.equals("1")) {
				qy_td = "<td id='qy_td' class='DIV_L' onclick=\"doChange('qy')\">企业登记业务</td>";
				num += rs.getInt("cou");
			}
			if (CDDL.equals("2")) {
				gt_td = "<td id='gth_td' class='DIV_L' onclick=\"doChange('gth')\">个体户登记</td>";
				num += rs.getInt("cou");
			}
			if (CDDL.equals("3")) {
				hzs_td = "<td id='hzs_td' class='DIV_L' onclick=\"doChange('hzs')\">合作社登记</td>";
				num += rs.getInt("cou");
			}
			if (CDDL.equals("4")) {
				gqdj_td = "<td id='gqdj_td' class='DIV_L' onclick=\"doChange('gqdj')\">股权出质</td>";
				num += rs.getInt("cou");
			}
			if (CDDL.equals("5")) {
				hwgg_td = "<td id='hwgg_td' class='DIV_L' onclick=\"doChange('hwgg')\">户外广告登记</td>";
				num += rs.getInt("cou");
			}
			if (CDDL.equals("6")) {
				dcdy_td = "<td id='dcdy_td' class='DIV_L' onclick=\"doChange('dcdy')\">动产抵押登记</td>";
				num += rs.getInt("cou");
			}
			if (CDDL.equals("9")) {
				ggdj_td = "<td id='ggdj_td' class='DIV_L' onclick=\"doChange('ggdj')\">广告发布登记</td>";
				num += rs.getInt("cou");
			}
			if (CDDL.equals("11")) {
				business_td = "<td id='business_td' class='DIV_L' onclick=\"doChange('business')\">亮照备案申请</td>";
				num += rs.getInt("cou");
			}
		}
		Page.setNUM(num);
		PageShow pageshow = new PageShow();
	%>
	<%@include file="top.inc"%>

	<table width="100%" cellspacing="0" cellpadding="0"
		style="background-image:url(images/main/currpostitleBG.jpg);background-repeat:repeat-x;height:27px;">
		<tr>
			<td width="60%">&nbsp;&nbsp;<img
				src="images/main/nowlocation.png" /> &nbsp;&nbsp;<font
				color="#1E90FF">当 前 位 置 : </font><font style="color:#AA0219;">
					已 办 业 务 查 询</font>
			</td>
			<td width="30%" align="right"><img src="images/main/nowuser.png" />&nbsp;&nbsp;<font
				color="#1E90FF">当前用户 : <%=webuser.getUSERNAME()%></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="10%"></td>
		</tr>
	</table>


	<br />
	<table border="0" style="border-style:none">
		<tr>
			<%
				out.println(mc_td + qy_td + hzs_td + gt_td + gqdj_td + hwgg_td
						+ dcdy_td+ggdj_td+business_td);
			%>
		</tr>
	</table>


	<%
		if (!mc_td.equals("")) {
			rs = db.executeQuery("select a.TRAMARK,a.ENTNAME,a.ENTNAME1,a.ENTNAME2,a.ENTNAME3,a.ENTTYPE,a.ENTCLASS,a.PREREGORG,to_char(a.APDATE,'yyyy-mm-dd') as APPDATE,b.status AS STATUS,a.OPENO,a.OPETYPE from MCGL_JBXX_SQ a,QYDJ_YWSB_SQ b where a.openo = b.openo AND a.loginid='"
					+ webuser.getLOGINID() + "' ORDER BY appdate DESC");
	%>
	<%--名称申请 mc--%>
	<table width="99%" border="1" id="mc_table">
		<tr class="yxsm">
			<td align='center' nowrap>申请名称</td>
			<td align='center' nowrap>申请号</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center'>操作</td>
		</tr>
		<%
			while (rs.next()) {
					String ENTTYPE = (null == rs.getString("ENTTYPE") ? "" : rs
							.getString("ENTTYPE"));
					//String SENTTYPE=icms.getSysRemark("ENTTYPE",ENTTYPE);
					String OPENO = (null == rs.getString("OPENO") ? "" : rs
							.getString("OPENO"));
					String ENTNAME = (null == rs.getString("ENTNAME") ? "" : rs
							.getString("ENTNAME"));
					String ENTNAME1 = (null == rs.getString("ENTNAME1") ? "" : rs
							.getString("ENTNAME1"));
					String ENTNAME2 = (null == rs.getString("ENTNAME2") ? "" : rs
							.getString("ENTNAME2"));
					String ENTNAME3 = (null == rs.getString("ENTNAME3") ? "" : rs
							.getString("ENTNAME3"));
					String STATUS = (null == rs.getString("STATUS") ? "" : rs
							.getString("STATUS"));
					String OPETYPE = (null == rs.getString("OPETYPE") ? "" : rs
							.getString("OPETYPE"));
					String ENTCLASS = (null == rs.getString("ENTCLASS") ? ""
							: rs.getString("ENTCLASS"));
					String TRAMARK = (null == rs.getString("TRAMARK") ? "0" : rs
							.getString("TRAMARK"));
					if (ENTCLASS == null) {
						System.out.println("网上名称申请-申请业务类型为null！");
						return;
					}
					String SENTTYPE = icms.getSysRemark("ENTTYPE", ENTTYPE);

					String name = "";
					char index = 'a';
						index = TRAMARK.charAt(0);

						//设置是哪个名称被审批通过
						switch (index) {
						case '0': {
							name = ENTNAME;
							break;
						}
						case '1': {
							name = ENTNAME1;
							break;
						}
						case '2': {
							name = ENTNAME2;
							break;
						}
						case '3': {
							name = ENTNAME3;
							break;
						}
						default:
							name = ENTNAME;
						}
		%>
		<tr>
			<td><%=name%></td>
			<td><%=OPENO%></td>
			<td><%=icms.getSysDm("OPETYPE", OPETYPE)%></td>
			<td><%=rs.getString("APPDATE")%></td>
			<td><%=icms.getSysDm("WSTATUS", STATUS)%></td>
			<td align="center">
				<%
					out.println(pageshow.getMCButton(STATUS, OPENO, OPETYPE,
									ENTCLASS, SENTTYPE, "0"));
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>

	<%
		}
		if (!qy_td.equals("")) {
			rs = db.executeQuery("select a.PRIPID,a.ENTNAME,a.ENTTYPE,a.OPETYPE,a.REGORG,to_char(a.APPDATE,'yyyy-mm-dd') as APPDATE,b.status AS STATUS,a.OPENO,a.REGNO from QYDJ_JBXX_SQ a, QYDJ_YWSB_SQ b where a.openo = b.openo AND a.loginid='"
					+ webuser.getLOGINID()
					+ "' and a.entclass !='6' ORDER BY appdate DESC");
	%>
	<%-- 企业登记 qy--%>
	<table width="99%" border="1" id="qy_table" style="display:none">
		<tr class="yxsm">
			<td align='center' nowrap>企业名称</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center'>操作</td>
		</tr>
		<%
			while (rs.next()) {
					String ENTTYPE = rs.getString("ENTTYPE");
					String SENTTYPE = icms.getSysRemark("ENTTYPE", ENTTYPE);
					String OPENO = rs.getString("OPENO");
					String ENTNAME = rs.getString("ENTNAME");
					String STATUS = rs.getString("STATUS");
					String OPETYPE = rs.getString("OPETYPE");
					String PRIPID = rs.getString("PRIPID");
		%>
		<tr>
			<td><%=ENTNAME%></td>
			<td><%=icms.getSysDm("OPETYPE", OPETYPE)%></td>
			<td><%=rs.getString("APPDATE")%></td>
			<td><%=icms.getSysDm("WSTATUS", STATUS)%></td>
			<td align="center">
				<%
					out.println(pageshow.getButton(STATUS, OPENO, OPETYPE,
									SENTTYPE, "1"));
				%>
				<%
				if(icms.getCURRENTUNIT().equals("371500") && (STATUS.equals("2")||STATUS.equals("4")||STATUS.equals("6")) && SENTTYPE.equals("GS")){
				%>
				<a href='#' onclick="LcYx('1','<%=OPENO%>','<%=PRIPID %>','<%=OPETYPE %>')"><img border=0 src='images/icon/icon_edit.gif'></img>上传/查看材料</a>
				<%
				}
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
		if (!hzs_td.equals("")) {
			rs = db.executeQuery("select a.PRIPID,a.ENTNAME,a.ENTTYPE,a.OPETYPE,a.REGORG,to_char(a.APPDATE,'yyyy-mm-dd') as APPDATE,b.STATUS,a.OPENO,a.REGNO from QYDJ_JBXX_SQ a, QYDJ_YWSB_SQ b where a.openo = b.openo AND a.loginid='"
					+ webuser.getLOGINID()
					+ "' and a.entclass ='6'  ORDER BY appdate DESC");
	%>
	<%-- 合作社登记 hzs--%>
	<table width="99%" border="1" id="hzs_table" style="display:none">
		<tr class="yxsm">
			<td align='center' nowrap>合作社名称</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center'>操作</td>
		</tr>
		<%
			while (rs.next()) {
					String ENTTYPE = rs.getString("ENTTYPE");
					String SENTTYPE = icms.getSysRemark("ENTTYPE", ENTTYPE);
					String OPENO = rs.getString("OPENO");
					String ENTNAME = rs.getString("ENTNAME");
					String STATUS = rs.getString("STATUS");
					String OPETYPE = rs.getString("OPETYPE");
					String REGNO = rs.getString("REGNO");
					String PRIPID= rs.getString("PRIPID");
		%>
		<tr>
			<td><%=ENTNAME%></td>
			<td><%=icms.getSysDm("OPETYPE", OPETYPE)%></td>
			<td><%=rs.getString("APPDATE")%></td>
			<td><%=icms.getSysDm("WSTATUS", STATUS)%></td>
			<td align="center">
				<%
					out.println(pageshow.getButton(STATUS, OPENO, OPETYPE,
									SENTTYPE, "3"));
				%>
				<%
				if(icms.getCURRENTUNIT().equals("371500") && (STATUS.equals("2")||STATUS.equals("4")||STATUS.equals("6")) ){
				%>
				<a href='#' onclick="LcYx('1','<%=OPENO%>','<%=PRIPID %>','<%=OPETYPE %>')"><img border=0 src='images/icon/icon_edit.gif'></img>上传/查看材料</a>
				<%
				}
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
		if (!gt_td.equals("")) {
			rs = db.executeQuery("select a.traname as ENTNAME, '9999' AS ENTTYPE, a.OPETYPE, a.REGORG, to_char(a.APPDATE,'yyyy-mm-dd') as APPDATE, b.STATUS, a.OPENO, a.REGNO FROM gtdj_jbxx_sq a,QYDJ_YWSB_SQ b WHERE a.openo = b.openo AND a.loginid ='"
					+ webuser.getLOGINID() + "'  ORDER BY appdate DESC");
	%>
	<%-- 个体户登记 gth--%>
	<table width="99%" border="1" id="gth_table" style="display:none">
		<tr class="yxsm">
			<td align='center' nowrap>字号名称</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center'>操作</td>
		</tr>
		<%
			while (rs.next()) {
					String OPETYPE = rs.getString("OPETYPE");
					String OPENO = rs.getString("OPENO");
					String ENTNAME = rs.getString("ENTNAME");
					String STATUS = rs.getString("STATUS");
					String REGNO = rs.getString("REGNO");
		%>
		<tr>
			<td><%=ENTNAME%></td>
			<td><%=icms.getSysDm("OPETYPE", OPETYPE)%></td>
			<td><%=rs.getString("APPDATE")%></td>
			<td><%=icms.getSysDm("WSTATUS", STATUS)%></td>
			<td align="center">
				<%
					out.println(pageshow.getButton(STATUS, OPENO, OPETYPE,
									"GT", "2"));
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
		if (!gqdj_td.equals("")) {
			rs = db.executeQuery("select ENTNAME,OPETYPE, REGORG, to_char(APPRDATE,'yyyy-mm-dd') as APPRDATE, STATUS, OPENO from gqdj_jbxx_sq WHERE loginid='"
					+ webuser.getLOGINID() + "'  ORDER BY apprdate DESC");
	%>
	<%-- 股权出质登记 gqdj--%>
	<table width="99%" border="1" id="gqdj_table" style="display:none">
		<tr class="yxsm">
			<td align='center' nowrap>企业名称</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center'>操作</td>
		</tr>
		<%
			while (rs.next()) {
					String OPETYPE = rs.getString("OPETYPE");
					String OPENO = rs.getString("OPENO");
					String ENTNAME = rs.getString("ENTNAME");
					String STATUS = rs.getString("STATUS");
					//String ADREGCNO=rs.getString("ADREGCNO");
		%>
		<tr>
			<td><%=ENTNAME%></td>
			<td><%=icms.getSysDm("OPETYPE", OPETYPE)%></td>
			<td><%=rs.getString("APPRDATE")%></td>
			<td><%=icms.getSysDm("WSTATUS", STATUS)%></td>
			<td align="center">
				<%
					out.println(pageshow.getButton(STATUS, OPENO, OPETYPE,
									"GQDJ", "4"));
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
		if (!hwgg_td.equals("")) {
			rs = db.executeQuery("select ADNAME,'户外广告'as ENTTYPE,OPETYPE, REGORG, to_char(APPDATE,'yyyy-mm-dd') as APPDATE, STATUS, OPENO,ADREGCNO from hwgg_jbxx_sq WHERE loginid='"
					+ webuser.getLOGINID() + "'  ORDER BY appdate DESC");
	%>
	<%-- 户外广告登记 hwgg--%>
	<table width="99%" border="1" id="hwgg_table" style="display:none">
		<tr>
			<td align='center' nowrap>广告名称</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center' nowrap>操作</td>
		</tr>
		<%
			while (rs.next()) {
					String OPETYPE = rs.getString("OPETYPE");
					String OPENO = rs.getString("OPENO");
					String ADNAME = rs.getString("ADNAME");
					String STATUS = rs.getString("STATUS");
					String ADREGCNO = rs.getString("ADREGCNO");
		%>
		<tr>
			<td><%=ADNAME%></td>
			<td><%=icms.getSysDm("OPETYPE", OPETYPE)%></td>
			<td><%=rs.getString("APPDATE")%></td>
			<td><%=icms.getSysDm("WSTATUS", STATUS)%></td>
			<td align="center">
				<%
					out.println(pageshow.getButton(STATUS, OPENO, OPETYPE,
									"HWGG", "5"));
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
		if (!dcdy_td.equals("")) {
			rs = db.executeQuery("select MORTGAGORTYPE,MORCONTNAME,MORTGAGO,MORE,OPETYPE,REGORG,to_char(APPDATE,'yyyy-mm-dd') as APPDATE,STATUS,OPENO,MORCONTNO from dcdy_jbxx_sq where loginid='"
					+ webuser.getLOGINID() + "' order by appdate desc");
	%>
	<%-- 动产抵押登记 dcdy--%>
	<table width="99%" border="1" id="dcdy_table" style="display:none">
		<tr>
			<td align='center' nowrap>抵押人</td>
			<td align='center' nowrap>抵押权人</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center' nowrap>操作</td>
		</tr>
		<%
			while (rs.next()) {
					String OPETYPE = rs.getString("OPETYPE");
					String MORTGAGO = rs.getString("MORTGAGO");
					String MORE = rs.getString("MORE");
					String OPENO = rs.getString("OPENO");
					String STATUS = rs.getString("STATUS");
					String MORTGAGOTYPE = rs.getString("MORTGAGORTYPE");
					String cddl="";
					if("0".equals(MORTGAGOTYPE)){
						cddl="61";
					}else if("1".equals(MORTGAGOTYPE)){
						cddl="62";
					}else{
						cddl="63";
					}
		%>
		<tr>
			<td><%=MORTGAGO%></td>
			<td><%=MORE%></td>
			<td><%=icms.getSysDm("OPETYPE", OPETYPE)%></td>
			<td><%=rs.getString("APPDATE")%></td>
			<td><%=icms.getSysDm("WSTATUS", STATUS)%></td>
			<td align="center">
				<%
					out.println(pageshow.getButton(STATUS, OPENO, OPETYPE,
									"DCDY", cddl));
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>	
<!-- 	广告发布登记 -->

<%
		}
		if (!ggdj_td.equals("")) {
			rs = db.executeQuery("SELECT* FROM ( SELECT G.ID,G.ENTNAME,Q.ENTTYPE,G.LEREP,G.PROCESSSTATE, G.SLDATE,G.APPRDATE,G.S_EXT_TIMESTAMP,Q.STATUS AS WSTATUS, Q.OPETYPE,TO_CHAR(Q.APPDATE,'yyyy-MM-dd') AS APPDATE FROM GGFB_SQXX G, QYDJ_YWSB_SQ Q WHERE Q.OPENO = G.ID AND Q.LOGINID = '"+webuser.getLOGINID()+"'"+
					" UNION ALL SELECT Q.OPENO ID, Q.ENTNAME,Q.ENTTYPE, Q.LEREP, B.PROCESSSTATE,  B.SLDATE, B.APPRDATE,B.S_EXT_TIMESTAMP, Q.STATUS AS WSTATUS, Q.OPETYPE ,TO_CHAR(Q.APPDATE,'yyyy-MM-dd') AS APPDATE FROM GGFB_BG_MTB B, QYDJ_YWSB_SQ Q WHERE Q.OPENO = B.OPENO AND Q.LOGINID = '"+webuser.getLOGINID()+"'"+
					" UNION ALL SELECT Z.ID, Q.ENTNAME,Q.ENTTYPE, Q.LEREP, Z.PROCESSSTATE,  Z.SLDATE, Z.APPRDATE,Z.S_EXT_TIMESTAMP, Q.STATUS AS WSTATUS, Q.OPETYPE ,TO_CHAR(Q.APPDATE,'yyyy-MM-dd') AS APPDATE FROM GGFB_ZXXX Z, QYDJ_YWSB_SQ Q WHERE Q.OPENO = Z.ID AND Q.LOGINID = '"+webuser.getLOGINID()+"' ) ORDER BY APPDATE DESC");
	%>
	<table width="99%" border="1" id="ggdj_table" style="display:none">
		<tr>
			<td align='center' nowrap>单位名称</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center' nowrap>操作</td>
		</tr>
		<%
			while (rs.next()) {
				String entName = rs.getString("ENTNAME");
				String appDate = rs.getString("APPDATE");
				String wStatus = rs.getString("WSTATUS");
				String opeType = rs.getString("OPETYPE");
		%>
		<tr>
			<td><%=entName%></td>
			<td><%=SysUtility.doPreProcess(appDate)%></td>
			<td><%=icms.getSysDm("OPETYPE", opeType)%></td>
			<td><%=icms.getSysDm("WSTATUS", wStatus)%></td>
			<td>
			<%
				out.println(pageshow.getGgdjButton(wStatus, rs.getString("ID"), rs.getString("OPETYPE"), rs.getString("ENTTYPE")));
			%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	
	<%
		}
		if (!business_td.equals("")) {
			rs = db.executeQuery("select ENTNAME,OPETYPE,BANUM,TYPE,LLR,to_char(APPDATE,'yyyy-mm-dd') as APPDATE,STATUS,OPENO from business_baxx_sq where loginid='"
					+ webuser.getLOGINID() + "' order by appdate desc");
	%>
	<%-- 亮照备案申请 business--%>
	<table width="99%" border="1" id="business_table" style="display:none">
		<tr>
			<td align='center' nowrap>企业名称</td>
			<td align='center' nowrap>联络人</td>
			<td align='center' nowrap>登记业务</td>
			<td align='center' nowrap>填报日期</td>
			<td align='center' nowrap>办理状态</td>
			<td align='center' nowrap>操作</td>
		</tr>
		<%
			while (rs.next()) {
					String OPETYPE = rs.getString("OPETYPE");
					String ENTNAME = rs.getString("ENTNAME");
					String LLR = rs.getString("LLR");
					String OPENO = rs.getString("OPENO");
					String STATUS = rs.getString("STATUS");
		%>
		<tr>
			<td><%=ENTNAME%></td>
			<td><%=LLR%></td>
			<td><%=icms.getSysDm("OPETYPE", OPETYPE)%></td>
			<td><%=rs.getString("APPDATE")%></td>
			<td><%=icms.getSysDm("WSTATUS", STATUS)%></td>
			<td align="center">
				<%
					out.println(pageshow.getButton(STATUS, OPENO, OPETYPE,
									"business", "11"));
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
		if (qy_td.equals("") && hzs_td.equals("") && gt_td.equals("")
				&& hwgg_td.equals("") && dcdy_td.equals("")
				&& mc_td.equals("") && gqdj_td.equals("")&& business_td.equals("")) {
	%>
	<br />
	<table width="650px" border="1" id="no_table" align="center">
		<tr
			style="background-image:url(images/main/ywbltitleBG.jpg);background-repeat:repeat-x;"
			height="25px">
			<td>
			<font style="font-size:16px" color="red"> <strong>系统提示：</strong>
			</font>
			</td>
		</tr>
		<tr bgcolor="#F6F9FF">
			<td style="font-size:14px;" height="80px">&nbsp;&nbsp;
				您当前尚未办理任何业务！<br /> &nbsp;&nbsp; 请点击 <span
				onclick="window.location.href='index.jsp'"
				style="cursor:pointer;color:blue"
				onmouseout="this.style.color='blue'"
				onmouseover="this.style.color='red'"> 返回首页 </span>，选择您需要申办的业务。然后根据提示填写相应的信息！
			</td>
		</tr>
	</table>
	<%
		}
	%>

	<%@include file="bottom.inc"%>
	<%
		rs.close();
		db.close();
	%>
</body>
</html>