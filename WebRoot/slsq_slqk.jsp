<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="QYDJ_JBXX" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" />
<jsp:useBean id="GTDJ_JBXX" scope="page"
	class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ" />
<%@page import="com.macrosoft.icms.ems.WEB_USER_EXPRESS"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_CFG"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page import="com.macrosoft.icms.util.*"%>
<jsp:useBean id="QYDJ_YWSB" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" />
<jsp:useBean id="DCDY_JBXX" scope="page"
	class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ" />
<jsp:useBean id="ONLINE_ORDER_RECODER" scope="page"
	class="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER" />
<jsp:useBean id="ONLINE_ORDER_RECODER_LS" scope="page"
	class="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER_LS" />
<jsp:useBean id="ONLINE_ORDER_CFG" scope="page"
	class="com.macrosoft.icms.bean.ONLINE_ORDER_CFG" />
<jsp:useBean id="SYS_DMDZ" scope="page"
	class="com.macrosoft.icms.util.SYS_DMDZ" />
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
	var url = "web/addEmsMess.jsp?OPENO="+OPENO;
    var tmp=window.showModalDialog(url,window,"dialogHeight=500px;dialogWidth=500px;status:yes;scroll:yes;resizable:no;center:yes");
    if(tmp!=undefined){
    	window.location.reload();	
    }
}
//YYSTATUS ԤԼ״̬ 0��δԤԼ 1����ԤԼ 2��ԤԼ����
function doYy(OPENO,OPETYPE,ENTCLASS,YYSTATUS){
	var REGORG=document.getElementById("REGORG").value
	if(REGORG=="370100"){
		alert("�Ǽǻ����Ǽ����й��ֵ̾��ݲ�֧������ԤԼ���ܣ�");
		return;
	}
/*
	if(ENTCLASS == "5"||ENTCLASS == "6"){
		alert("ϵͳĿǰ�Ը����ũ��רҵ�����ṩԤԼ������Я����ز��ϵ���Ͻ�������������ҵ��");
		return;
	}
		*/
//YYSTATUS ԤԼ
	if(YYSTATUS == "1"){
		if(!window.confirm("����ԤԼ��ȡ����ǰԤԼ���Ƿ�ȷ����")){
			return;
		}
	}
	var yyUrl = "wsyy/wsyy_qyxz.jsp?OPENO="+OPENO+"&STATUS=2&OPETYPE="+OPETYPE+"&ENTCLASS="+ENTCLASS+"&YYTYPE=2&&YYSTATUS="+YYSTATUS;
	var tmp=window.showModalDialog(yyUrl,window,"dialogHeight=560px;dialogWidth=610px;status:no;scroll:yes;resizable:no;center:yes");
    if(tmp!=undefined){
    	window.location.reload();	
    }
}
</script>

	<%
		String OPENO = SysUtility.doPreProcess(request
				.getParameter("OPENO"));
		String STATUS = SysUtility.doPreProcess(request
				.getParameter("STATUS"));
		String OPETYPE = SysUtility.doPreProcess(request
				.getParameter("OPETYPE"));
		String sENTTYPE = SysUtility.doPreProcess(request
				.getParameter("ENTTYPE"));

		String LX = "��ҵ";
		String name = "";
		String regorg = "";
		String MORREGCNO="";
		if("DCDY".equals(sENTTYPE)){
			DCDY_JBXX.setOPENO(OPENO);
			DCDY_JBXX.doSelect();
			MORREGCNO=DCDY_JBXX.getMORREGCNO();
		}
		

		QYDJ_YWSB.setOPENO(OPENO);
		QYDJ_YWSB.doSelect();
		STATUS = QYDJ_YWSB.getSTATUS();
		name = QYDJ_YWSB.getENTNAME();
		regorg = QYDJ_YWSB.getREGORG();
		String YW = icms.getSysDm("OPETYPE", OPETYPE);
		String gtmc = "";
		if (sENTTYPE.equals("GT")) {
			GTDJ_JBXX.setOPENO(OPENO);
			GTDJ_JBXX.doSelect();
			//name=GTDJ_JBXX.getTRANAME();
			//regorg=GTDJ_JBXX.getREGORG();
			name = GTDJ_JBXX.getOPERNAME();
			LX = "���廧";
			gtmc = GTDJ_JBXX.getTRANAME().replaceAll("\\*","");
		} else {
			QYDJ_JBXX.setOPENO(OPENO);
			QYDJ_JBXX.doSelect();
			//name=QYDJ_JBXX.getENTNAME();
			//regorg=QYDJ_JBXX.getREGORG();
		}
		if (sENTTYPE.equals("HZS")) {
			LX = "ũ��רҵ������";
		}
		if (sENTTYPE.equals("HZSFZ")) {
			LX = "ũ��רҵ�������֧";
		}
		String title = LX+YW+"֪ͨ��";
		if("3".equals(STATUS)||"5".equals(STATUS)){
			title = "����֪ͨ��";
		}
		title = "ҵ�����֪ͨ��";
		boolean YY = false;//�Ƿ���ԤԼ����
		boolean KD = false;//�Ƿ��п���ݷ���
		boolean IFCANYY = false;//�Ƿ����ԤԼ
		//			boolean ifCanYqYy = false;//�Ƿ��������ԤԼ
		int yqcsMax = 0;//��������ԤԼ��������
		int yqTimes = 0;//�Ѿ����ڵĴ���
		boolean isInOrdering = false;//����ԤԼ��
		boolean IFKD = false;//�Ƿ��Ѿ������ݷ���
		boolean isYQ = false;//�Ƿ��Ѿ�����
		WEB_USER_EXPRESS mes = null;
		//����Ѿ�ͨ��
		if (STATUS.equals("2") || STATUS.equals("4") || STATUS.equals("7")
				|| STATUS.equals("8") || STATUS.equals("9")
				|| STATUS.equals("10")) {
			int num = QYDJ_YWSB
					.getColumnValueBySql("select count(*) from com_param_cfg t where param='WSDJKDFW' and t.constrains1='"
							+ QYDJ_YWSB.getREGORG()
							+ "' and t.paramvalue='1'");
			if (num > 0) {
				KD = true;
			}
			mes = new WEB_USER_EXPRESS();
			if (KD) {
				if (KD) {
					mes
							.doSelectBySql("SELECT * FROM WEB_USER_EXPRESS WHERE OPENO='"
									+ OPENO + "'");
					if (!mes.getOPENO().equals("")) {
						IFKD = true;
					}
				}
			}
			if (!IFKD) {

				//Ŀǰ����͹��̻�������ԤԼ����
				/*
				if ("5".equals(QYDJ_YWSB.getENTCLASS())
						|| "6".equals(QYDJ_YWSB.getENTCLASS())) {
					YY = false;
				} else {
					List<ONLINE_ORDER_CFG> listOrdercfg = ONLINE_ORDER_CFG
							.getList(" WHERE regorg='"
									+ QYDJ_YWSB.getREGORG()
									+ "' AND INSTR(businesstype,'2')>0 AND flag = '1'");
					if (listOrdercfg.size() > 0) {//��ѯ�õǼǻ����Ƿ���ԤԼ
						YY = true;
					}
				}
				*/
				List<ONLINE_ORDER_CFG> listOrdercfg = ONLINE_ORDER_CFG
							.getList(" WHERE regorg='"
									+ QYDJ_YWSB.getREGORG()
									+ "' AND INSTR(businesstype,'2')>0 AND flag = '1'");
					if (listOrdercfg.size() > 0) {//��ѯ�õǼǻ����Ƿ���ԤԼ
						YY = true;
					}
				if (YY) {//�����ԤԼ����
					ONLINE_ORDER_RECODER.setOPENO(OPENO);
					boolean hasYyRecoder = ONLINE_ORDER_RECODER.doCount();
					//�����ԤԼ��¼
					if (hasYyRecoder) {
						ONLINE_ORDER_RECODER.doSelect();
						//�Ƿ�����
						boolean isYQNow = DateUtils
								.checkDateAfterToday(ONLINE_ORDER_RECODER
										.getORDERDATE()
										+ " "
										+ ONLINE_ORDER_RECODER.getENDTIME());
						if (!isYQNow) {
							//����Ѿ����ڣ��򽫼�¼��������ƶ�����ʷ����
							BeanUtils.copyProperties(
									ONLINE_ORDER_RECODER_LS,
									ONLINE_ORDER_RECODER);
							//�������ʱ��
							ONLINE_ORDER_RECODER_LS
									.setRECORDERDATE(DateUtils
											.getTodayStr("yyyy-MM-dd HH:mm:ss"));
							//����ԤԼ�ļ�¼��״̬Ϊ����
							ONLINE_ORDER_RECODER_LS.setRECODERTYPE("10");
							//����¼��ӵ���ʷ����
							ONLINE_ORDER_RECODER_LS.doAdd();
							//����¼���еļ�¼ɾ��
							ONLINE_ORDER_RECODER.doDelete();
							//QYDJ_YWSB.setSTATUS("10");
							//QYDJ_YWSB.doModify();
							STATUS = "10";
						} else {
							//����ԤԼ��
							isInOrdering = true;
						}
					}
					try {
						//������ڴ���
						yqcsMax = Integer.parseInt(icms.getSysRemark(
								"WSDJ_CFG", "YYYQCS"));
						//�Ѿ����ڴ���
						yqTimes = ONLINE_ORDER_RECODER_LS.getYqTimes(OPENO);
						//��ѯ���һ�ε����ڼ�¼
						if (yqTimes > 0) {
							isYQ = true;
							ONLINE_ORDER_RECODER_LS = ONLINE_ORDER_RECODER_LS
									.getLastRecoder(OPENO);
						}
						//������ڴ���δ����������ڴ���(���ƺ�׼ͨ���������ڵ�״̬)����Լ�������ԤԼ
						if (yqcsMax <= yqTimes) {
							IFCANYY = false;
						} else {
							IFCANYY = true;
						}
					} catch (Exception e) {
						IFCANYY = false;
						e.printStackTrace();
					}

				}
			}
		}
	%>
	<title><%=title %></title>
	</head>
	<body>
	<input type="hidden" id="REGORG" name="REGORG" value="<%=QYDJ_YWSB.getREGORG()%>">
	<table border="0" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<caption style="text-align: center;">
				<font size="4pt"><%=title %>
			</caption>
			<tr>
				<td width="100%" colspan="2" align="left" class='lc2'><%=SysSystem.toUnderlineStr(name, "center", 30)%>:
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;�������ţ�<font size="2" style="font-weight: bolder;"><%if("DCDY".equals(sENTTYPE)){%><%=MORREGCNO%><%}else{ %><%=OPENO%><%} %></font> ������<%=YW%>����
					<%
					if("GT".equals(sENTTYPE)){
						out.print(",����Ϊ��"+gtmc);
					}
						
					%>
					<%
						if (STATUS.equals("2") || STATUS.equals("4"))//Ԥ��ͨ��
						{
							if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//ȫ�̵��ӻ��޸�1014
							%>
							<font color="#FF0000">
							����ͨ����</font>
							<%			
							}else{
							%>
							<font color="#FF0000">
							����ͨ����</font>������
							<font color="#FF0000">
							<%
							if(ONLINE_ORDER_RECODER.getSTARTTIME().equals("")){
							out.println("�߸�������");
							}else{
							out.println("ԤԼʱ��");
							}
							 %>
							</font>��Я����֪ͨ�鼰<%=YW%>�������Լ������ύ���ϵ�
							<font color="#FF0000"><%=QYDJ_YWSB.getCLBSDD()%></font>���������������
							<%
							}
						}
						if (STATUS.equals("3"))//Ԥ�󲵻�
						{
					%>
					<font color="#FF0000">�������ء�</font>�������Ԥ����������޸ĺ������ύ���롣
					<%
						} else if (STATUS.equals("7")) {//�Ѱ��
					%>
					<font color="#FF0000">���Ѿ���᡿</font>��
					<%
						} else if (STATUS.equals("8")) {//�Ѿ�ԤԼ
					%>
					<font color="#FF0000">���Ѿ�ԤԼ��������ԤԼʱ�䵽��������ҵ���������������޷��ٴ�ԤԼ��</font>��
					<%
						} else if (STATUS.equals("9")) {//�������ݷ���
							if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//ȫ�̵��ӻ��޸�1014
							%>
							<font color="#FF0000">���Ѿ������ݷ��񡿣������ĵȴ���</font>
							<%			
							}else{
							%>
							<font color="#FF0000">���Ѿ������ݷ��񡿣������ĵȴ���������������ѯ &nbsp;<%=icms.getSysRemark("WSDJ_CFG", "KDFWTEL")%>��</font>��
							<%
							}
						} else if (STATUS.equals("10")) {//�Ѳ���ԤԼ
					%>
					<font color="#FF0000">��ԤԼ�Ѿ����ڡ���</font>
					<%
						}
					%>
				</td>
				<br>

			</tr>
			</table>

		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			
			<tr>
				<td class='lc1'>
					�������
				</td>
				<td class='lc2'>
						<%
						if ("3".equals(STATUS)) {
							out.print("Ԥ�󲵻�");
						} else if("5".equals(STATUS)) {
							out.print("��׼����");
						}else{
							out.print("����ͨ��");
						}
					%>
				</td>
			</tr>
			<tr>
				<td class='lc1'>
					<%
						if ("3".equals(STATUS)||"5".equals(STATUS)) {
							out.println("����ԭ��");
						} else {
							out.println("�������");
						}
					%>
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getAPPROPIN().replaceAll("&b", "\n")%></td>
			</tr>
			<%
				String SUBDOC = QYDJ_YWSB.getSUBDOC();
				if (!SUBDOC.equals("")) {
					SUBDOC = SUBDOC.replaceAll("&b", "<br/>");
			%>
			<tr>
				<td class='lc1'>
					�ύ����
				</td>
				<td class='lc2'><%=SUBDOC%></td>
			</tr>
			<%
				}
				if (!QYDJ_YWSB.getCLBSDD().equals("")) {
			%>
			<tr>
				<td class='lc1'>
					���ϱ��͵�ַ
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getCLBSDD()%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td class='lc1' width="20%">
					<%
						if (STATUS.equals("3")) {
							out.println("��������");
						} else {
							out.println("��������");
						}
					%>
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getAPPRDATE()%></td>
			</tr>
			<%--tr>
				<td class='lc1' width="20%">
					�� &nbsp; ע
				</td>
				<td class='lc2'>
					<%
						if (!QYDJ_YWSB.getSTATUS().equals("3")) {
							//out.print("Ԥ����Ա���ţ�"+QYDJ_YWSB.getAPPRPID());
						}
					%>
				</td>
			</tr> --%>
			<%
			if(webuser.getXZQH().equals("3701")){
			 %>
			</table>
			
			
			<table border="0" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;������<br/>
&nbsp;&nbsp;&nbsp;&nbsp;��ҵ�����幤�̻������ϵǼ���һ������ʩ�����Ǿ���������Ϊ����֪ͨ�鲢������Ǽǻ�������������顢�����ĵǼ���Ϊ����Ӧ�����ձ�֪ͨ���Ҫ�����Ҿ���ʽ�ύ������ȫ�����Ϸ�����ʽ������������ϣ����Ҿ�����׼�󣬷�����ȡ��Ӫҵִ�ա���<br/>

&nbsp;&nbsp;&nbsp;&nbsp;��ע��<br/>
&nbsp;&nbsp;&nbsp;&nbsp;1.���ϵǼ�������Ϣ��Ԥ��ͨ��֮������1���£��������ϵǼ�������Ϣ���Զ������<br/>
&nbsp;&nbsp;&nbsp;&nbsp;2.Ԥ��ͨ���Ĺɶ��ᣨ���»ᡢ���»ᣩ���顢�³̣����Ҿ��ύʱ��Ӧ�����ɶ������¡����£�ǩ�֡����º󷽿���Ч��<br/>
&nbsp;&nbsp;&nbsp;&nbsp;3.���Ҿ��ύ�Ĳ����У���ӡ��Ӧ��ע������ԭ��һ�¡����ɹɶ���ָ������ί�д����ˣ��Ӹǹ��»�ǩ�֡�<br/>
&nbsp;&nbsp;&nbsp;&nbsp;4.����Ԥ��ϵ���Ҿֹ���Ϊ <%=QYDJ_YWSB.getAPPRPID() %> �Ĺ�����ԱԤ��<br>
				
			</td>
			</tr>
			<%} %>
			
			<tr>
		<%if(webuser.getXZQH().equals("3713")){ %>	
		<td  class='lc1' width="20%">�� &nbsp; ע</td>		
		<td  class='lc2' >
				<%
				//if(!QYDJ_YWSB.getSTATUS().equals("3")){
					out.print("Ԥ����Ա���ţ�"+QYDJ_YWSB.getAPPRPID());
				//}
				%>
			</td>
		</tr>
		<%} %>
			<tr>
				<td width="100%" align="center" colspan="2" class="fc">
				<%if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//ȫ�̵��ӻ��޸�1014
				%>	
					&nbsp;&nbsp;&nbsp;&nbsp;
				<%}else{ %>
					<INPUT name="print" type=button value="�� ӡ"
						onClick="window.focus();window.print();" class="NOPRINT">
					<INPUT name="close" type=button value="�� ��"
						onClick="javascript:window.close();" class="NOPRINT">
				<%} %>
				</td>
			</tr>
		</table>
		<br />
		<%
			if (isInOrdering) {
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
				<td class="lc2">

					<%
						out.println("&nbsp;&nbsp;&nbsp;&nbsp;���Ѿ�����������ԤԼ��ԤԼʱ�䣺"
									+ ONLINE_ORDER_RECODER.getORDERDATE()
									+ ONLINE_ORDER_RECODER.getSTARTTIME() + " "
									+ ONLINE_ORDER_RECODER.getENDTIME() + "��ԤԼ�ţ�"
									+ ONLINE_ORDER_RECODER.getORDERNO());
					%>
					�밴ʱЯ����ز��ϵ����ְ̾���ҵ���������Ԥ����ԤԼʱ���ڰ���������ѡ��
					<a href='#'
						onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>','1')">
						<img border=0 src='images/icon/icon_edit.gif' alt='����ԤԼ'>����ԤԼ</a>
				</td>
			</tr>
		</table>
		<%
			} else if (isYQ) {
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
				<td class="lc2">
					<%
						//out.println("&nbsp;&nbsp;&nbsp;&nbsp;���Ѿ�����������ԤԼ��ԤԼʱ�䣺" +
							//ONLINE_ORDER_RECODER_LS.getORDERDATE() +
							//ONLINE_ORDER_RECODER_LS.getSTARTTIME() + " " +
							//ONLINE_ORDER_RECODER_LS.getENDTIME() + "��ԤԼ�ţ�" +
							//ONLINE_ORDER_RECODER_LS.getORDERNO());
					%>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;����ԤԼ�ѹ��ڣ�ϵͳԤԼ����ԤԼ&nbsp;<%=yqcsMax%>&nbsp;�Σ���ǰ�Ѿ�����
					&nbsp;<%=yqTimes%>
					&nbsp;�Ρ�
					<%
						if (IFCANYY&&(!SYS_DMDZ.ifDzh(webuser.getXZQH()))) {//ȫ�̵��ӻ��޸�1014
					%>
						������ѡ��
						<a href='#'
							onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>','2')">
							<img border=0 src='images/icon/icon_edit.gif' alt='����ԤԼ'>����ԤԼ</a>
						<br />
					<%
						} else {
					%>
						������ѡ��ȥ���ְ̾���
					<%
						}
					%>
					<%
						if (KD) {
					%>
						<br />
						&nbsp;&nbsp;&nbsp;&nbsp;ѡ��
						<a href='#' onclick="showEmsMess('<%=OPENO%>')"><img border=0
								src='images/icon/ems.gif' alt='��ݷ���'>��ݷ���</a>��
						<br />
						<%if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//ȫ�̵��ӻ��޸�1014
						%>
						��ܰ��ʾ��<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;���ã��������д��ʵ�ʼĵ�ַ����������д�ʼĵ�ַ���嵽���ƺţ�
                         						���ǻ������ͨ�������ƿ���λ��������ʱ������λ�ʼĵ���Ӫҵִ�գ�<br/>
                        						�����ʼĺ�3-4�������ջ�δ�յ�����Ӫҵִ�գ��벦�򴰿���ѯ�绰��8191311ת8231��������ȡ��
						<%
						}else{
						%>
						&nbsp;&nbsp;&nbsp;&nbsp;ͨ����ݷ��������Խ���������ʹ﹤�̻��أ�ҵ�������ɺ�Ὣ����ͨ����ݵķ�ʽ����(����)�㴦��
						<%} %>
						<br />

					<%
						}
					%>
				</td>
			</tr>
		</table>
		<%
			} else if (IFKD) {
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
			} else if (YY || KD) {
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
						if (YY&&(!SYS_DMDZ.ifDzh(webuser.getXZQH()))) {//ȫ�̵��ӻ��޸�1014
					%>
						&nbsp;&nbsp;&nbsp;&nbsp;ѡ��
						<a href='#'
							onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>','0')">
							<img border=0 src='images/icon/icon_edit.gif' alt='����ԤԼ'>����ԤԼ</a>
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
								src='images/icon/ems.gif' alt='��ݷ���'>��ݷ���</a>��
						<br />
						<%if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//ȫ�̵��ӻ��޸�1014
						%>
						��ܰ��ʾ��<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;���ã��������д��ʵ�ʼĵ�ַ����������д�ʼĵ�ַ���嵽���ƺţ�
                         						���ǻ������ͨ�������ƿ���λ��������ʱ������λ�ʼĵ���Ӫҵִ�գ�
                         						�����ʼĺ�3-4�������ջ�δ�յ�����Ӫҵִ�գ��벦�򴰿���ѯ�绰��8191311ת8231��������ȡ��
						<%
						}else{
						%>
						&nbsp;&nbsp;&nbsp;&nbsp;ͨ����ݷ��������Խ���������ʹ﹤�̻��أ�ҵ�������ɺ�Ὣ����ͨ����ݵķ�ʽ����(����)�㴦��
						<%} %>
						<br />
					<%
						}
							if (isYQ && KD) {
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
		%>
	</body>
</html>
<%
	dbc.close();
%>