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
		<!--media=print ������Կ����ڴ�ӡʱ��Ч-->
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
		<title>��ҵ�����Ǽ�Ԥ��֪ͨ��</title>


		<%
			String OPENO = SysUtility.doPreProcess(request
					.getParameter("OPENO"));
			String STATUS = SysUtility.doPreProcess(request
					.getParameter("STATUS"));
			String OPETYPE = SysUtility.doPreProcess(request
					.getParameter("OPETYPE"));
			String sENTTYPE = SysUtility.doPreProcess(request
					.getParameter("ENTTYPE"));

			String tzsInfo = "��֪ͨ�鼰����Ԥ�Ⱥ�׼������";
			if (OPETYPE.equals("13")) {
				tzsInfo = "��֪ͨ�鼰���Ʊ����׼������";
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
				System.out.println("�����������롪�����ͨ����δ��ʶͨ�����������ƣ�");
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
				<font size="4pt"><p align="center"><%=YW%>Ԥ��֪ͨ��
					</p>
			</caption>
			<tr>
				<td width="100%" colspan="2" align="left" class='lc2'>
					<br />
					<font size="2"><%=webuser.getUSERNAME()%></font> ��ã�
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;��������
					<font size="3"><%=OPENO%></font> ������<%=YW%>���룬
					<font size="3"><%=name%> </font>������Ԥ��
					<%
 	if (STATUS.equals("2") || STATUS.equals("4"))//Ԥ��ͨ��
 	{
 %>
					<font color="#FF0000">��ͨ��</font>������
					<font color="#FF0000"><%=icms.getSysDm("DATEINFO", "0")%>��������</font>��Я��
					<%=SysSystem.toUnderlineStr(tzsInfo, "center", 30)%>
					�Լ������ύ���ϵ� &nbsp;<%=SysSystem.toUnderlineStr(dz, "center", 30)%>���������������
					<%
						}
						if (STATUS.equals("3"))//Ԥ�󲵻�
						{
					%>
					<font color="#FF0000">��������Ϊ <font color="#FF0000"><%=OPENO%></font>
						������<%=YW%>���룬Ԥ�󱻲���</font>�������Ԥ����������޸ĺ������ύ���롣
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
					Ԥ������
				</td>
				<td class='lc2'><%=name%>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td class='lc1'>
					Ԥ����
				</td>
				<td class='lc2'>
					<%
						if (STATUS.equals("2") || STATUS.equals("4")) {
							out.print("Ԥ��ͨ��");
						} else {
							out.print("Ԥ�󲵻�");
						}
					%>
				</td>
			</tr>
			<tr>
				<td class='lc1'>
					Ԥ�����
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
					�ύ����
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
					Ԥ������
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getAPPRDATE()%></td>
			</tr>
			<tr>
				<td class='lc1' width="20%">
					Ԥ����Ա
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getAPPRPER()%></td>
			</tr>
			<%--tr>
		<td  class='lc1' width="20%">��ѯ�绰</td>		
		<td  class='lc2' ><%=QYDJ_YWSB.getGSJTEL() %></td>
	</tr--%>
			<tr>
				<td class='lc1' width="20%">
					�� &nbsp; ע
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getREGORGN()%>
				</td>
			</tr>

			<tr>
				<td width="100%" align="center" colspan="2" class="fc">
					<INPUT name="print" type=button value="�� ӡ"
						onClick="window.focus();window.print();" class="NOPRINT">
					<INPUT name="close" type=button value="�� ��"
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
						out.println("&nbsp;&nbsp;&nbsp;&nbsp;���Ѿ�����������ԤԼ��ԤԼʱ�䣺"
										+ yyhm.getYYSJ() + " " + sYYSXW + "��ԤԼ�ţ�"
										+ yyhm.getYYNO());
								boolean sfyq = !yyhm.checkDateAfterToday(yyhm.getYYSJ());
								if (sfyq) {
					%>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;����ԤԼ�ѹ��ڣ�������ѡ��
					<a href='#'
						onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>')">
						<img border=0 src='../images/icon/icon_edit.gif' alt='����ԤԼ'>����ԤԼ</a>
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
					&nbsp;&nbsp;&nbsp;&nbsp;���Ѿ�ѡ���˿�ݷ��񣬿����Ϣ����
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;��ϵ�ˣ�<%=mes.getNAME()%><br />
					&nbsp;&nbsp;&nbsp;&nbsp;��ϵ�绰��<%=mes.getTEL()%><br />
					&nbsp;&nbsp;&nbsp;&nbsp;��ϵ��ַ��<%=mes.getADDRESS()%>
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
					<font color="red">˵����</font>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;�����Ը�����Ҫ��ѡ����ط���
					<br />
					<%
						if (YY) {
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;ѡ��
					<a href='#'
						onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>')">
						<img border=0 src='../images/icon/icon_edit.gif' alt='����ԤԼ'>����ԤԼ</a>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;ͨ������ԤԼ�����Խ�ʡ�����ֳ����ִ̾�������ҵ���ʱ�䡣
					<br />
					<%
						}
					%>
					<%
						if (KD) {
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;ѡ��
					<a href='#' onclick="showEmsMess('<%=OPENO%>')"><img border=0
							src='../images/icon/ems.gif' alt='��ݷ���'>��ݷ���</a>��
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;ͨ����ݷ��������Խ���������ʹ﹤�̻��أ�ҵ�������ɺ�Ὣ����ͨ����ݵķ�ʽ����(����)�㴦��
					<br />
					<%
						}
								if (YY && KD) {
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;����ԤԼ����ݷ���ֻ��ѡ��һ�
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