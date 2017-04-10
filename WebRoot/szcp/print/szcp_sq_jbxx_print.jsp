<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SZCP_SQ_JBXX" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JBXX" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" src="<%=request.getContextPath() %>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath() %>/szcp/css/print.css" type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath() %>/szcp/css/NoPrint.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ҵ������Ϣ</title>
</head>
<body onload="init()" style="margin-top: 0; margin-bottom: 0">
	<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
		id="wb" name="wb" width="0"></OBJECT>
	<%
String REG_NO = request.getParameter("REG_NO");
String YEAR =request.getParameter("YEAR");
String CerNO = request.getParameter("CerNO");
SZCP_SQ_JBXX.doSelect(REG_NO,YEAR,CerNO);
String v = request.getParameter("sv");
//��ҵ��ģ 
		String ent_scale_Type = SZCP_SQ_JBXX.getENT_SCALE_TYPE();
		String entScaleStr = "";
		 if(ent_scale_Type== null || "".equals(ent_scale_Type)) {
			entScaleStr = SZCP_SQ_JBXX.queryALLENT_SCALE_TYPE();
		}else {
			entScaleStr = SZCP_SQ_JBXX.queryENT_SCALE_TYPE_Name_Print(ent_scale_Type);
		}

		// ������ҵ����
			String local_industry_Type = SZCP_SQ_JBXX.getLOCAL_INDUSTRY_TYPE();
			String localIndustryStr = "";
 			if(local_industry_Type == null || "".equals(local_industry_Type)) {
				localIndustryStr = SZCP_SQ_JBXX.queryALLLOCAL_INDUSTRY_TYPE_NAME();
			}else {
				localIndustryStr = SZCP_SQ_JBXX.queryLOCAL_INDUSTRY_TYPE_NAME_Print(local_industry_Type);
			} 
			//ְ��
			String postCode = SZCP_SQ_JBXX.getLIAI_POS_CODE();
			String postCodeStr = "";
			if (postCode == null || "".equals(postCode)) {
				// ���������ֵ�����
				postCodeStr = SZCP_SQ_JBXX.queryALLPOSTCODENAME();
			} else {
				// ����code��ѯ�����ֵ�
				postCodeStr = SZCP_SQ_JBXX.queryPostCodeName_Print(postCode);
			}
			//��ѯ���б��ͻ���370100200195319
			SZCP_SQ_JBXX.queryReportOrgNo(REG_NO,YEAR);
%>
	<!-- form�� -->
	<form name="form1" method="POST" action="szcp_sq_jbxx_action.jsp">
		<input class="noprint" type="hidden" name="CERNOHIDDEN"
			value="<%=CerNO%>"> <input class="noprint" type="hidden"
			name="EVALYEARHIDDEN" value="<%=YEAR%>"> <input
			class="noprint" type="hidden" name="ENTTYPEHIDDEN"
			value="<%=SZCP_SQ_JBXX.getENT_TYPE()%>"> <input
			class="noprint" type="hidden" name="LOCALORGNOHIDDEN"
			value="<%=SZCP_SQ_JBXX.getLOCAL_ORG_NO() %>"> <input
			class="noprint" type="hidden" name="DOMDISTRICTCODEHIDDEN"
			value="<%=SZCP_SQ_JBXX.getDOM_DISTRICT_CODE() %>"> <input
			class="noprint" type="hidden" name="LEGREPCERTTYPEHIDDEN"
			value="<%=SZCP_SQ_JBXX.getLEG_REP_CERT_TYPE()%>"> <input
			class="noprint" type="hidden" name="LEGREPCERTNOHIDDEN"
			value="<%=SZCP_SQ_JBXX.getLEG_REP_CERT_NO()%>"> <input
			class="noprint" type="hidden" name="GBINDUSTRYTYPEHIDDEN"
			value="<%=SZCP_SQ_JBXX.getGB_INDUSTRY_TYPE()%>">
		<div align="right" class="noprint">
			<input type=button name=button_print value="��ӡ"
				onclick="javascript:print()">
			<input type=button name=button_show value="��ӡԤ��"
				onclick="javascript:printpreview();">
		</div>
	</form>
	<table border="1" width="90%" align="center" bordercolor="#000000">
		<caption align="center">
			<b> <span style="font-size: 16pt"><center>��ҵ������Ϣ</center></b><br>
			<br>
		</caption>
		<tr>
			<td align='center' height=44 width="20%"colspan="2">��ҵ����</td>
			<td colspan="4" align='center'><%=SZCP_SQ_JBXX.getENT_NAME()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%"colspan="2">��ҵ��ַ</td>
			<td colspan="4" align='center'><%=SZCP_SQ_JBXX.getWEBSITE_DESC()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%" rowspan="2">��ҵע������</td>
			<td align='center' height=44  class="lc1"> ������ҵ</td>
			<td class="lc2" colspan="4">
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="1" disabled ="disabled" >�������ι�˾
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="2" disabled ="disabled">�ɷ����޹�˾�������У�
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="3" disabled ="disabled">�ɷ����޹�˾��δ���У�
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="4" disabled ="disabled">�ǹ�˾��ҵ����
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="5" disabled ="disabled">���˶�����ҵ
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="6" disabled ="disabled">�ϻ���ҵ
			</td>
		</tr>
		
		
		<tr>
			<td align='center' height=44 width="10%" class="lc1">����Ͷ����ҵ</td>
			<td class="lc2" colspan="4">
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="7" disabled ="disabled">���������ҵ
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="8" disabled ="disabled">���������ҵ
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="9" disabled ="disabled">���̶�����ҵ
			</td>
		</tr>
		<tr>
		<td align='center' height=44 width="20%">���ջ���</td>
			<td align='center'><%=SZCP_SQ_JBXX.queryLOCAL_ORG_NAME(SZCP_SQ_JBXX.getREGORG()) %></td>
			<td align='center' height=44 width="20%">���ͻ���</td>
			<td align='center' colspan="3" ><%=SZCP_SQ_JBXX.getReportName()%></td>
		<tr>
			<td align='center' height=44 width="20%">��ҵס��</td>
			<td align='center' colspan="5"><%=SZCP_SQ_JBXX.getADDR_DESC() %></td>
			
		</tr>
			
		<tr>
			<td align='center' height=44 width="20%">ע���</td>
			<td align='center'><%=SZCP_SQ_JBXX.getREG_NO() %></td>
			<td  align='center'>��֯��������</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getORG_CODE()%></td>
		</tr>
		
		<tr>
			<td  align='center' height=44 width="20%">ע���ʱ�</td>
			<td align='center' colspan="2">${SZCP_SQ_JBXX.REG_CAP_RMB_W}�������</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%">��������</td>
			<td align='center'><%=SZCP_SQ_JBXX.getEST_DATE()%></td>
			<td align='center'>��Ӫ����</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getOPER_TO_DATE()%></td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%">��������������</td>
			<td align='center' ><%=SZCP_SQ_JBXX.getLEG_REP_NAME()%></td>
			<td align='center'>��ҵ�̶��绰</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getTEL_NO()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">��Ӫҵ��������ҵ</td>
			<td align='center'><%=SZCP_SQ_JBXX.queryINDUSTRY_TYPE_CODE_Name(SZCP_SQ_JBXX
					.getGB_INDUSTRY_TYPE())%></td>
			<td align='center'>��ҵ��ģ</td>
			<td align='center' colspan="3"><%=entScaleStr%></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">������ҵ����</td>
			<td align='left' colspan="5"><%=localIndustryStr%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">��Ӫ��Χ</td>
			<td align='left' colspan="5"><%=SZCP_SQ_JBXX.getBUSI_SCOPE_DESC()%></td>
		</tr>
		<tr align='center' height=44 width="20%">
			<td align='center' height=44 width="20%" rowspan="2">��ְ��Ա</td>
			<td align="center" height=44 width="20%">������</td>

			<td align="center" height=44 width="20%">������Ա</td>

			<td align="center" height=44 width="20%">������Ա</td>

			<td align="center" height=44 width="20%" colspan="2">����</td>
		</tr>
		<tr align='center' height=44 width="20%">
			<td align="center"><%=SZCP_SQ_JBXX.getTOTAL_STAFF_QTY()%></td>
			<td align="center"><%=SZCP_SQ_JBXX.getMNG_STAFF_QTY()%></td>
			<td align="center"><%=SZCP_SQ_JBXX.getTECH_STAFF_QTY()%></td>
			<td align="center" colspan="2"><%=SZCP_SQ_JBXX.getTOTAL_STAFF_QTY()
					- SZCP_SQ_JBXX.getMNG_STAFF_QTY()
					- SZCP_SQ_JBXX.getTECH_STAFF_QTY()%></td>
		</tr>
		<tr height=44 >
			<td align='center' height=44 width="20%" rowspan="3">��ҵ��ϵ��</td>
			<td align='center'>����</td>
			<td align='center' ><%=SZCP_SQ_JBXX.getLIAI_NAME()%></td>
			<td align='center' width="10%">ְ��</td>
			<td align='center' ><%=SZCP_SQ_JBXX.getLIAI_POS_CODE()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">����</td>
			<td align='center'><%=SZCP_SQ_JBXX.getLIAI_FAX_NO()%></td>
			<td align='center' height=44 width="20%">��������</td>
			<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_EMAIL()%></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">�ƶ��绰</td>
			<td align='center'><%=SZCP_SQ_JBXX.getLIAI_MOBILE_NO()%></td>
			<td align='center' height=44 width="20%">�̶��绰</td>
			<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_TEL_NO()%></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
//radioĬ��ѡ��
function init(){
		var aValue = <%=SZCP_SQ_JBXX.getENT_TYPE() %>;
		var radio_oj = document.getElementsByName("ENT_TYPE");
		var r = <%= SZCP_SQ_JBXX.getENT_SCALE_TYPE()%>;
		var a = document.getElementsByName("ENT_SCALE_TYPE");
		change(radio_oj,aValue); //
		guimo(a,r);
	}

function change(radio_oj,aValue){//����һ������
	for(var i=0;i<radio_oj.length;i++) {//ѭ��
       if(radio_oj[i].value==aValue){  //�Ƚ�ֵ
	            radio_oj[i].checked=true; //�޸�ѡ��״̬
	            break; //ֹͣѭ��
		 }
	}
}
function guimo(radio_oj,aValue){//����һ������
	for(var i=0;i<radio_oj.length;i++) {//ѭ��
       if(radio_oj[i].value==aValue){  //�Ƚ�ֵ
	            radio_oj[i].checked=true; //�޸�ѡ��״̬
	            break; //ֹͣѭ��
		 }
	}
}
</script>
</html>