<%@page import="com.macrosoft.icms.ems.WEB_USER_EXPRESS"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_CFG"%>
<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<jsp:useBean id="QYDJ_YWSB" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" />
<jsp:useBean id="MCGL_JBXX" scope="page"
	class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ" />
<jsp:useBean id="ONLINE_ORDER_RECODER" scope="page"
	class="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER" />
<jsp:useBean id="ONLINE_ORDER_CFG" scope="page"
	class="com.macrosoft.icms.bean.ONLINE_ORDER_CFG" />

<html>
	<head>
		<!--media=print 这个属性可以在打印时有效-->
		<style media="print">
.Noprint {
	display: none;
}

.PageNext {
	page-break-after: always;
}
</style>
		<script type="text/javascript">
function showEmsMess(OPENO){
	var url = "../web/addEmsMess.jsp?OPENO="+OPENO;
    var tmp=window.showModalDialog(url,window,"dialogHeight=500px;dialogWidth=500px;status:yes;scroll:yes;resizable:no;center:yes");
    if(tmp!=undefined){
    	window.location.reload();	
    }
}
function doYy(OPENO,OPETYPE,ENTCLASS){
	var tmp=window.showModalDialog("../wsyy/wsyy_qyxz.jsp?OPENO="+OPENO+"&STATUS=2&OPETYPE="+OPETYPE+"&ENTCLASS="+ENTCLASS+"&YYTYPE=2",window,"dialogHeight=560px;dialogWidth=610px;status:yes;scroll:yes;resizable:no;center:yes");
    if(tmp!=undefined){
    	window.location.reload();	
    }
}
</script>
		<title>企业设立登记预审通知书</title>


		<%
			String OPENO = SysUtility.doPreProcess(request
					.getParameter("OPENO"));
			String STATUS = SysUtility.doPreProcess(request
					.getParameter("STATUS"));
			String OPETYPE = SysUtility.doPreProcess(request
					.getParameter("OPETYPE"));
			String sENTTYPE = SysUtility.doPreProcess(request
					.getParameter("ENTTYPE"));

			String tzsInfo = "本通知书及名称预先核准申请书";
			if (OPETYPE.equals("13")) {
				tzsInfo = "本通知书及名称变更核准申请书";
			}
			QYDJ_YWSB.setOPENO(OPENO);
			QYDJ_YWSB.doSelect();
			String regorg = QYDJ_YWSB.getREGORG();
			//String dz = icms.getSysDm("REGORG",regorg);
			String dz = QYDJ_YWSB.getCLBSDD();
			String YW = icms.getSysDm("OPETYPE", OPETYPE);
			System.out.println(webuser.getUSERNAME());

			MCGL_JBXX.setOPENO(OPENO);
			MCGL_JBXX.doSelect();
			String zhNum = MCGL_JBXX.getTRAMARK();
			String name = "";
			char index = 'a';

			if (zhNum == null || zhNum.equals("")) {
				System.out.println("网上名称申请——审核通过后未标识通过的申请名称！");
			} else {
				index = zhNum.charAt(0);
			}
			switch (index) {
			case '0': {
				name = MCGL_JBXX.getENTNAME();
				break;
			}
			case '1': {
				name = MCGL_JBXX.getENTNAME1();
				break;
			}
			case '2': {
				name = MCGL_JBXX.getENTNAME2();
				break;
			}
			case '3': {
				name = MCGL_JBXX.getENTNAME3();
				break;
			}
			default:
				name = MCGL_JBXX.getENTNAME();
			}
		%>
	</head>
	<body>

		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<caption>
				<font size="4pt"><p align="center"><%=YW%>预审通知书
					</p>
			</caption>
			<tr>
				<td width="100%" colspan="2" align="left" class='lc2'>
					<br />
					<font size="2"><%=webuser.getUSERNAME()%></font> 你好：
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;你的申请号
					<font size="3"><%=OPENO%></font> 的网上<%=YW%>申请，
					<font size="3"><%=name%> </font>的名称预审
					<%
 	if (STATUS.equals("2") || STATUS.equals("4"))//预审通过
 	{
 %>
					<font color="#FF0000">已通过</font>，请于
					<font color="#FF0000"><%=icms.getSysDm("DATEINFO", "0")%>个工作日</font>内携带
					<%=SysSystem.toUnderlineStr(tzsInfo, "center", 30)%>
					以及下列提交材料到 &nbsp;<%=SysSystem.toUnderlineStr(dz, "center", 30)%>，办理相关手续。
					<%
						}
						if (STATUS.equals("3"))//预审驳回
						{
					%>
					<font color="#FF0000">你的申请号为 <font color="#FF0000"><%=OPENO%></font>
						的网上<%=YW%>申请，预审被驳回</font>，请根据预审意见重新修改后，重新提交申请。
					<%
						}
					%>
				</td>
			</tr>
			<%
				if (!STATUS.equals("4")) {
			%>
			<tr>
				<td class='lc1'>
					预审名称
				</td>
				<td class='lc2'><%=name%>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td class='lc1'>
					预审结果
				</td>
				<td class='lc2'>
					<%
						if (STATUS.equals("2") || STATUS.equals("4")) {
							out.print("预审通过");
						} else {
							out.print("预审驳回");
						}
					%>
				</td>
			</tr>
			<tr>
				<td class='lc1'>
					预审意见
				</td>
				<td class='lc2'>
					<%
						String APPROPIN = QYDJ_YWSB.getAPPROPIN();
						if (!APPROPIN.equals("")) {
							out.println(APPROPIN.replaceAll("&b", "<br/>"));
						}
					%>
				</td>
			</tr>
			<tr>
				<td class='lc1'>
					提交材料
				</td>
				<td class='lc2'>
					<%
						String SUBDOC = QYDJ_YWSB.getSUBDOC();
						if (!SUBDOC.equals("")) {
							out.println(SUBDOC.replaceAll("&b", "<br/>"));
						}
					%>
				</td>
			</tr>
			<tr>
				<td class='lc1' width="20%">
					预审日期
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getAPPRDATE()%></td>
			</tr>
			<tr>
				<td class='lc1' width="20%">
					预审人员
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getAPPRPER()%></td>
			</tr>
			<%--tr>
		<td  class='lc1' width="20%">咨询电话</td>		
		<td  class='lc2' ><%=QYDJ_YWSB.getGSJTEL() %></td>
	</tr--%>
			<tr>
				<td class='lc1' width="20%">
					备 &nbsp; 注
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getREGORGN()%>
				</td>
			</tr>

			<tr>
				<td width="100%" align="center" colspan="2" class="fc">
					<INPUT name="print" type=button value="打 印"
						onClick="window.focus();window.print();" class="NOPRINT">
					<INPUT name="close" type=button value="关 闭"
						onClick="javascript:window.close();" class="NOPRINT">
				</td>
			</tr>
		</table>
		<br />
		<%
			boolean hasYY = false;
			boolean hasKD = false;
			boolean CANYY = false;
			boolean CANKD = false;
			List<ONLINE_ORDER_CFG> listCfg = ONLINE_ORDER_CFG
					.getList("WHERE t.regorg='"
							+ QYDJ_YWSB.getREGORG()
							+ "' and INSTR(t.businesstype,'1') > 0");
			List<ONLINE_ORDER_RECODER> listRecords = null;
			if (listCfg.size() > 0) {
				hasYY = true;
			}
			if (hasYY) {
				ONLINE_ORDER_RECODER.setOPENO(OPENO);
				ONLINE_ORDER_RECODER.doSelect();
				if(ONLINE_ORDER_RECODER.getISCHECKIN().equals("0")){
					if(ONLINE_ORDER_RECODER.getOVERDUETIME()< icms.getSysDm("WSDJ_CFG","YYYQCS")){
						CANYY = true;
					}
				}
			}
			int num = QYDJ_YWSB.getColumnValueBySql("select count(*) from com_param_cfg t where param='WSDJKDFW' and t.constrains1='"
							+ QYDJ_YWSB.getREGORG() + "' and t.paramvalue='1'");
			if (num > 0) {
				hasKD = true;
			}
			if (hasKD) {
				WEB_USER_EXPRESS mes = new WEB_USER_EXPRESS();
				mes.doSelectBySql("SELECT * FROM WEB_USER_EXPRESS WHERE OPENO='"
								+ OPENO + "'");
				if (!mes.getOPENO().equals("")) {
					CANKD = true;
				}
			}
			if (IFYY) {
					String sYYSXW = "";
					if (yyhm.getYYSXW().equals("1")) {
						sYYSXW = "9:00~9:59";
					} else if (yyhm.getYYSXW().equals("2")) {
						sYYSXW = "10:00~10:59";
					} else if (yyhm.getYYSXW().equals("3")) {
						sYYSXW = "11:00~11:59";
					} else if (yyhm.getYYSXW().equals("4")) {
						sYYSXW = "1:30~2:29";
					} else if (yyhm.getYYSXW().equals("5")) {
						sYYSXW = "2:30~3:29";
					} else if (yyhm.getYYSXW().equals("6")) {
						sYYSXW = "3:30~4:29";
					} else if (yyhm.getYYSXW().equals("7")) {
						sYYSXW = "4:30~5:29";
					}
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
				<td class="lc2">

					<%
						out.println("&nbsp;&nbsp;&nbsp;&nbsp;您已经进行了网上预约，预约时间："
										+ yyhm.getYYSJ() + " " + sYYSXW + "，预约号："
										+ yyhm.getYYNO());
								boolean sfyq = !yyhm.checkDateAfterToday(yyhm.getYYSJ());
								if (sfyq) {
					%>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;您的预约已过期，您可以选择
					<a href='#'
						onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>')">
						<img border=0 src='../images/icon/icon_edit.gif' alt='逾期预约'>逾期预约</a>
					<%
						}
					%>
				</td>
			</tr>
		</table>
		<%
			}
				if (IFKD) {
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
				<td class="lc2">
					&nbsp;&nbsp;&nbsp;&nbsp;您已经选择了快递服务，快递信息如下
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;联系人：<%=mes.getNAME()%><br />
					&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<%=mes.getTEL()%><br />
					&nbsp;&nbsp;&nbsp;&nbsp;联系地址：<%=mes.getADDRESS()%>
				</td>
			</tr>
		</table>
		<%
			}
				if (!IFYY && !IFKD) {
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580" class="NOPRINT">
			<tr>
				<td class="lc2">
					<font color="red">说明：</font>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;您可以根据需要，选择相关服务
					<br />
					<%
						if (YY) {
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;选择
					<a href='#'
						onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>')">
						<img border=0 src='../images/icon/icon_edit.gif' alt='网上预约'>网上预约</a>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;通过网上预约，可以节省您来现场工商局大厅具体业务的时间。
					<br />
					<%
						}
					%>
					<%
						if (KD) {
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;选择
					<a href='#' onclick="showEmsMess('<%=OPENO%>')"><img border=0
							src='../images/icon/ems.gif' alt='快递服务'>快递服务</a>。
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;通过快递服务，您可以将申请材料送达工商机关，业务办理完成后会将材料通过快递的方式寄送(到付)你处。
					<br />
					<%
						}
								if (YY && KD) {
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;网上预约、快递服务只能选择一项。
					<%
						}
					%>
				</td>
			</tr>
		</table>
		<%
			}
			}
		%>
	</body>
</html>
<%
	dbc.close();
%>