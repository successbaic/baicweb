<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SZCP_SQ_JBXX" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JBXX" />
<jsp:useBean id="createHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>������Ϣ</title>
<link href="../szcp/css/print.css" rel="stylesheet" type="text/css"
	/ media="print">
</head>
<style>
#printa {  
	 background-image: url("../images/ly/next_page.png");
    background-repeat: no-repeat;
    color: #ffffff;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    height: 33px;
    line-height: 35px;
    text-align: center;
    width: 105px;
}

.jbxx a:link {
    color:#ffffff;
    text-decoration:none;
}
.jbxx a:visited {
    color:#ffffff;
    text-decoration:none;
}
.jbxx a:hover {
    color:#ffffff;
    text-decoration:none;
}
.jbxx a:active {
    color:#ffffff;
    text-decoration:none;
}
.jygl,.htgl,.htlx,.jyxy,.shxy,.shry,.xgzs {
	line-height: 30px;
	text-align: center;
	color: #000000;
	font-size: 9pt;
	cursor: pointer;
	width: 81px;
	height: 30px;
	background: transparent url(../images/tab/tabbefore.png) no-repeat;
	/*���ie��֧��background-size*/
	background-size :cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/tab/tabbefore.png',sizingMethod='scale');
	border: 0px solid black;
}

.jbxx {
	width: 81px;
	height: 30px;
	background: transparent url(../images/tab/tabafter.png) no-repeat;
	/*���ie��֧��background-size*/
	background-size :cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/tab/tabafter.png',sizingMethod='scale');
	line-height: 30px;
	text-align: center;
	color: #FFFFFF;
	font-size: 9pt;
	cursor: pointer;
    border: 0px solid black;
}

.jbxx a,.jygl a,.htgl a,.htlx a,.jyxy a,.shxy a,.shry a,.xgzs a{ position:relative; display:inline-block;}
.form1{
	margin: 0px;padding: 0px;
}
</style>
<body onload="init()" bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">

	<%@include file="top_szcp.inc"%>
	<% 
String REG_NO = request.getParameter("REG_NO");
String YEAR = request.getParameter("EVAL_YEAR");
String CerNO = request.getParameter("CerNO");
SZCP_SQ_JBXX.doSelect(REG_NO,YEAR,CerNO);
// ��ҵ��ģ 
String ent_scale_Type = SZCP_SQ_JBXX.getENT_SCALE_TYPE();
String entScaleStr = "";
if(ent_scale_Type== null || "".equals(ent_scale_Type)) {
	entScaleStr = SZCP_SQ_JBXX.queryALLENT_SCALE_TYPE();
}else {
	entScaleStr = SZCP_SQ_JBXX.queryENT_SCALE_TYPE_Name(ent_scale_Type);
}
// ������ҵ����
String local_industry_Type = SZCP_SQ_JBXX.getLOCAL_INDUSTRY_TYPE();
String localIndustryStr = "";
if(local_industry_Type == null || "".equals(local_industry_Type)) {
	localIndustryStr = SZCP_SQ_JBXX.queryALLLOCAL_INDUSTRY_TYPE_NAME();
}else {
	localIndustryStr = SZCP_SQ_JBXX.queryLOCAL_INDUSTRY_TYPE_NAME(local_industry_Type);
}
//��ѯ���б��ͻ���370100200195319
SZCP_SQ_JBXX.queryReportOrgNo(REG_NO,YEAR);

String postCode = SZCP_SQ_JBXX.getLIAI_POS_CODE();
String postCodeStr = "";
if(postCode == null || "".equals(postCode)) {
	// ���������ֵ�����
/* 	postCodeStr = SZCP_SQ_JBXX.queryALLPOSTCODENAME(); */
}else {
	// ����code��ѯ�����ֵ�
	postCodeStr = SZCP_SQ_JBXX.queryPostCodeName(postCode);
}
String sb = createHeaderUtil.createHeader(REG_NO,YEAR,CerNO,"1",SZCP_SQ_JBXX.getENT_NAME());
out.print(sb);
%>

	<!-- form�� -->
	<form class="form1" name="form1" method="POST" action="szcp_sq_jbxx_action.jsp">
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
			value="<%=SZCP_SQ_JBXX.getGB_INDUSTRY_TYPE()%>"><input
			class="noprint" type="hidden" name="REPORT_ORG_NO"
			value="<%=SZCP_SQ_JBXX.getReportOrgNo()%>"><input
			class="noprint" type="hidden" name="REGORGHIDDEN"
			value="<%=SZCP_SQ_JBXX.getREGORG()%>">
			
		<table border="1" width="100%" align="center" bordercolor="#000000">
		<td class="yxsm" colspan="5" align="center">
					<p style="font-color: #000080; font-size: 11pt; font-weight: bold;">

						<font color=#000080>������Ϣ</font>
					</p></td>
		<tr>
			<td align='center' height=44 width="10%"colspan="2" class="lc1">��ҵ����</td>
			<td colspan="3" ><input type="text" name="ENT_NAME" size="40"
					title="��ҵ(����)����" maxlength="50"
					value="<%=SZCP_SQ_JBXX.getENT_NAME()%>" readonly="readonly"
					style="background-color:silver;;"></input></td>
		</tr>
		<tr>
			<td align='center' height=44 colspan="2" class="lc1">��ҵ��ַ</td>
			<td colspan="3" ><input type="text"
					id="WEBSITE_DESC" name="WEBSITE_DESC" title="��ҵ��ַ" size="40"
					maxlength=20 value="<%=SZCP_SQ_JBXX.getWEBSITE_DESC()%>"></input></td>
		</tr>
		<tr>
			<td class="lc1" rowspan="2">��ҵע������</td>	
			<td align='center' height=44  class="lc1"> ������ҵ</td>
			<td class="lc2" colspan="4">
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="1">�������ι�˾
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="2">�ɷ����޹�˾�������У�
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="3">�ɷ����޹�˾��δ���У�
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="4">�ǹ�˾��ҵ����
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="5">���˶�����ҵ
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="6">�ϻ���ҵ
			</td>
		</tr>
		
		
		<tr>
			<td align='center' height=44 width="10%" class="lc1">����Ͷ����ҵ</td>
			<td class="lc2" colspan="4">
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="7">���������ҵ
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="8">���������ҵ
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="9">���̶�����ҵ
			</td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%" class="lc1">���ջ���</td>
			<td align='center'><input type="text" name="REGORG" id="REGORG"
					size="40" title="���ջ���" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.queryLOCAL_ORG_NAME(SZCP_SQ_JBXX.getREGORG()) %>"></input></td>
			<td  align='center' class="lc1">���ͻ���</td>
			<td align='center' colspan="2">
			<input type="text"
					id="REPORT_ORG_NO_NAME" name="REPORT_ORG_NO_NAME" title="���ͻ���" size="40"
					readonly="readonly"
					maxlength=20 value="<%=SZCP_SQ_JBXX.getReportName()%>"></input>
					</td>	
		<tr>
			<td align='center' height=44 width="20%" class="lc1">��ҵס��</td>
			<td  colspan="4"><input type="text" name="ADDR_DESC"
					id="ADDR_DESC" size="63" title="��ҵס��" maxlength=50
					readonly="readonly" style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getADDR_DESC() %>"></input></td>
			
		</tr>
			
		<tr>
			<td align='center' height=44 width="20%" class="lc1">ע���</td>
			<td align='center'><input type="text" name="REG_NO" id="REG_NO"
					size="40" title="ע���" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getREG_NO() %>"></input></td>
			<td  align='center' class="lc1">��֯��������</td>
			<td align='center' colspan="2"><input type="text" id="ORG_CODE"
					name="ORG_CODE" size="40" title="��֯��������" maxlength=30
					value="<%=SZCP_SQ_JBXX.getORG_CODE()%>"></input></td>
		</tr>
		
		<tr>
			<td  align='center' height=44 width="20%" class="lc1">ע���ʱ�</td>
			<td  colspan="6"><input type="text"
					name="REG_CAP_RMB_W" size="63" title="ע���ʱ�" maxlength=50
					readonly="readonly" style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getREG_CAP_RMB_W()%>"></input>��Ԫ</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" class="lc1">��������</td>
			<td align='center'><input type="text" name="EST_DATE" size="40"
					title="��������" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getEST_DATE()%>"></input></td>
			<td align='center' class="lc1">��Ӫ����</td>
			<td align='center' colspan="2"><input type="text"
					name="OPER_TO_DATE" size="40" title="��Ӫ����" maxlength=50
					readonly="readonly" style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getOPER_TO_DATE()%>"></input></td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" class="lc1">����������</td>
			<td height=44 width="10%" >
					<table border="0">
						<tr>
							<td  height=44 width="45" >����</td>
							<td><input type="text" name="LEG_REP_NAME"
					 title="��������������" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getLEG_REP_NAME()%>"></input></td>
						</tr>
					</table>
			</td>
			<td align='center' class="lc1">�̶��绰</td>
			<td align='center' colspan="2"><input type="text" name="TEL_NO"
					size="40" title="��ҵ�̶��绰" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getTEL_NO()%>"></td>
		</tr>
		<tr>
			<td align='center' class="lc1">��ҵ��ģ</td>
			<td align='center' colspan="4">
				<input type="radio" name="ENT_SCALE_TYPE" id="ENT_SCALE_TYPE" value="1">����</input>&nbsp;&nbsp;
				<input type="radio" name="ENT_SCALE_TYPE" id="ENT_SCALE_TYPE" value="2">����</input>&nbsp;&nbsp;
				<input type="radio" name="ENT_SCALE_TYPE" id="ENT_SCALE_TYPE" value="3">С��</input>&nbsp;&nbsp;
				<input type="radio" name="ENT_SCALE_TYPE" id="ENT_SCALE_TYPE" value="4">΢��</input>&nbsp;&nbsp; 
			</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" class="lc1">��Ӫ��Χ</td>
			<td  colspan="4"><textarea rows="8" cols="106"
						readonly="readonly" style="background-color:silver;overflow-y:hidden;"
						id="BUSI_SCOPE_DESC" name="BUSI_SCOPE_DESC" title="��Ӫ��Χ"><%= SZCP_SQ_JBXX.getBUSI_SCOPE_DESC()%></textarea></td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" class="lc1">��Ӫҵ��������ҵ</td>
			<td align='center'><input type="text" name="GB_INDUSTRY_TYPE"
					size="40" title="��Ӫҵ��������ҵ" maxlength=50 readonly="readonly"
					style="background-color:silver;;" disblank
					value="<%=SZCP_SQ_JBXX.queryINDUSTRY_TYPE_CODE_Name(SZCP_SQ_JBXX.getGB_INDUSTRY_TYPE()) %>"></td>
		
			<td align='center' height=44 width="20%" class="lc1">������ҵ����</td>
			<td align='center' colspan="4">
						<select  name="LOCAL_INDUSTRY_TYPE"
							id="LOCAL_INDUSTRY_TYPE" title="������ҵ����" >
							<option value=''>��ѡ��</option>
							<%=localIndustryStr%>
						</select>
					</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" rowspan="2" class="lc1">��ְ��Ա</td>
			<td align="center" height=44 width="20%" class="lc1">������</td>

			<td align="center" height=44 width="20%" class="lc1">������Ա</td>

			<td align="center" height=44 width="20%" class="lc1">������Ա</td>

			<td align="center" height=44 width="20%" class="lc1">����</td>
		</tr>
		<tr height=44>
			<td align="center"><input type="text"
					style="text-align: center;" name="TOTAL_STAFF_QTY"
					id="TOTAL_STAFF_QTY" size="15" title="������" maxlength=10
					value="<%=SZCP_SQ_JBXX.getTOTAL_STAFF_QTY() %>" onblur="getTOTAL_STAFF_QTY()" >
			</td>
			<td align="center"><input type="text"
					style="text-align: center;" name="MNG_STAFF_QTY" id="MNG_STAFF_QTY"
					size="15" title="������Ա" maxlength=10
					value="<%=SZCP_SQ_JBXX.getMNG_STAFF_QTY() %>" onblur="getMNG_STAFF_QTY()"> 
			</td>
			<td align="center"><input type="text"
					style="text-align: center; " name="TECH_STAFF_QTY"
					id="TECH_STAFF_QTY" size="15" title="������Ա" maxlength=10
					value="<%=SZCP_SQ_JBXX.getTECH_STAFF_QTY()%>"  onblur="getTech_Staff_Qty()">
			</td>
			<td align="center"><input type="text"
					readonly="readonly" style="text-align: center; "
					style="background-color:silver;;" name="OTHER_STAFF_QTY"
					id="OTHER_STAFF_QTY" size="15" title="����" maxlength=10
					value="<%=SZCP_SQ_JBXX.getTOTAL_STAFF_QTY()-SZCP_SQ_JBXX.getMNG_STAFF_QTY()-SZCP_SQ_JBXX.getTECH_STAFF_QTY() %>">
			</td>
		</tr>
		<tr height=44>
			<td align='center'  width="20%" rowspan="3"class="lc1">��ҵ��ϵ��</td>
			<td align='center' class="lc1">����</td>
			<td align='center'><input type="text" name="LIAI_NAME"
					id="LIAI_NAME"  title="����" maxlength=4
					value="<%=SZCP_SQ_JBXX.getLIAI_NAME()%>"></td>
			<td align='center' class="lc1">ְ��</td>
			<td align='center' ><input type="text"
					style="text-align: center; " name="LIAI_POS_CODE"
					id="LIAI_POS_CODE"  title="������Ա" maxlength=15
					value="<%=SZCP_SQ_JBXX.getLIAI_POS_CODE()%>">
			</td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%" class="lc1">����</td>
			<td align='center'><input type="text" id="LIAI_FAX_NO"
					name="LIAI_FAX_NO"  title="����" maxlength=20
					value="<%=SZCP_SQ_JBXX.getLIAI_FAX_NO()%>"></td>
			<td align='center' height=44 width="20%" class="lc1">��������</td>
			<td align='center'><input type="text" id="LIAI_EMAIL" onblur="checkmail()"
					name="LIAI_EMAIL"  title="��������" maxlength=50
					value="<%=SZCP_SQ_JBXX.getLIAI_EMAIL()%>"></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%" class="lc1">�ƶ��绰</td>
			<td align='center'><input type="text" id="LIAI_MOBILE_NO"
					name="LIAI_MOBILE_NO"  title="�ƶ��绰" maxlength=15
					value="<%=SZCP_SQ_JBXX.getLIAI_MOBILE_NO()%>"></td>
			<td align='center' height=44 width="20%" class="lc1">�̶��绰</td>
			<td align='center'><input type="text" id="LIAI_TEL_NO"
					name="LIAI_TEL_NO"  title="�̶��绰" maxlength=15
					value="<%=SZCP_SQ_JBXX.getLIAI_TEL_NO() %>"></td>
		</tr>
	</table>
		<br>
		<CENTER class="noprint">
			<div class="subImgs" style="display:inline"><a id="printa" ondragstart="return false"
				href="print/szcp_sq_jbxx_print.jsp?REG_NO=<%=REG_NO%>&YEAR=<%=YEAR %>"
				target="_blank" >��ӡ��ҳ</a></div>
			<div class="subImgs" style="display:inline" onclick="checkError()">��һҳ</div>
		</CENTER>
		
		
	</form>
	<%@include file="../bottom.inc"%>
	<script type="text/javascript">
	function jbxx(){
		
	}
	//��̬����a href
	function selected(v){
		var url = document.getElementById('printa').href
		document.getElementById('printa').href=url+"&sv="+v;
	}
	
	function szhyfl(v){
	}
	function getTech_Staff_Qty() {
		var totalStaffQty = $("#TOTAL_STAFF_QTY").val(); 
		var mngStaffQty = $("#MNG_STAFF_QTY").val();
		var techStaffQty =  $("#TECH_STAFF_QTY").val();
		$("#OTHER_STAFF_QTY").val( totalStaffQty-mngStaffQty-techStaffQty);
		var otherStaffQty = $("#OTHER_STAFF_QTY").val();
		if(otherStaffQty < 0) {
			$("#OTHER_STAFF_QTY").val(0);
		}
	}
	function getMNG_STAFF_QTY(){
		var totalStaffQty = $("#TOTAL_STAFF_QTY").val(); 
		var mngStaffQty = $("#MNG_STAFF_QTY").val();
		var techStaffQty =  $("#TECH_STAFF_QTY").val();
		$("#OTHER_STAFF_QTY").val( totalStaffQty-mngStaffQty-techStaffQty);
		var otherStaffQty = $("#OTHER_STAFF_QTY").val();
		if(otherStaffQty < 0) {
			$("#OTHER_STAFF_QTY").val(0);
		}
	}
	function getTOTAL_STAFF_QTY(){
		var totalStaffQty = $("#TOTAL_STAFF_QTY").val(); 
		var mngStaffQty = $("#MNG_STAFF_QTY").val();
		var techStaffQty =  $("#TECH_STAFF_QTY").val();
		$("#OTHER_STAFF_QTY").val( totalStaffQty-mngStaffQty-techStaffQty);
		var otherStaffQty = $("#OTHER_STAFF_QTY").val();
		if(otherStaffQty < 0) {
			$("#OTHER_STAFF_QTY").val(0);
		}
		
	}
	function checkError() {
		
		var orgCode = $("#ORG_CODE").val();
		if(orgCode == null || orgCode == "") {
			alert("��������֯��������");
			return;
		}
		
		
		var total_Staff_Qty = $("#TOTAL_STAFF_QTY").val();
		if(total_Staff_Qty == null || total_Staff_Qty == "") {
			alert("��������ְ����");
			return;
		}else {
			var flag = fucCheckInt(total_Staff_Qty);
			if(flag== 0) {
				alert("��ְ��������������ȷ�����ָ�ʽ");
				return
			}
		}
		
		var mng_Staff_Qty = $("#MNG_STAFF_QTY").val();
		if(mng_Staff_Qty == null || mng_Staff_Qty == "") {
			alert("���������ְ����");
			return;
		}else {
			var flag = fucCheckInt(mng_Staff_Qty);
			if(flag== 0) {
				alert("����ְ��������������ȷ�����ָ�ʽ");
				return
			}else if(parseInt(mng_Staff_Qty) > parseInt(total_Staff_Qty)){
				alert("����ְ����������С����ְ����");
				return
			}
		}
		var tech_Staff_Qty = $("#TECH_STAFF_QTY").val();
		if(tech_Staff_Qty == null || tech_Staff_Qty == "") {
			alert("�����뼼���˹���");
			return;
		}else {
			var flag = fucCheckInt(tech_Staff_Qty);
			if(flag== 0) {
				alert("�����˹�������������ȷ�����ָ�ʽ");
				return
			}else if(parseInt(tech_Staff_Qty) > parseInt(total_Staff_Qty)){
				alert("�����˹���������С����ְ����");
				return
			}
		}
		var name = $("#LIAI_NAME").val();
		if(name == null || name == "") {
			alert("����������");
			return;
		}
		var faxNo = $("#LIAI_FAX_NO").val();
		if(faxNo == null || faxNo == "") {
			alert("�����봫���");
			return;
		}else {
			var flag = fucCheckNUM(faxNo);
			if(flag== 0) {
				alert("�������������ȷ�����ָ�ʽ");
				return
			}
		}
		var mail = $("#LIAI_EMAIL").val();
		if(mail== null || mail == "") {
			alert("����������");
			return;
		}else {
			var mailFlag = fucCheckEmail(mail);
			if(mailFlag == 0) {
				alert("��������ȷ�������ʽ");
				return;
			}
		}
		var allRadio =document.getElementsByName("ENT_SCALE_TYPE");
		var flag = false;
		for(var i = 0;i < allRadio.length;i++){
		   if(allRadio[i].checked){
		    flag = true;
		   }
		}
		if (!flag){
			alert("��ѡ����ҵ��ģ");
			return;
		}
		
		var allRadio1 =document.getElementsByName("ENT_TYPE");
		var flag1 = false;
		for(var i = 0;i < allRadio1.length;i++){
		   if(allRadio1[i].checked){
		    flag1 = true;
		   }
		}
		if (!flag1){
			alert("��ѡ����ҵע������");
			return;
		}
	
		var phone = $("#LIAI_MOBILE_NO").val();
		if(phone == null || phone == "") {
			alert("�������ֻ���");
			return;
		}else {
			 var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
			 if (!reg.test(phone)) {
			      alert("�ֻ�������д����");
			      return;
			 }
		}
		
		var selectedLocal_Industry_Type = $("#LOCAL_INDUSTRY_TYPE").val();
		if(selectedLocal_Industry_Type == null || selectedLocal_Industry_Type == "") {
			alert("��ѡ��������ҵ����");
			return;
		}
		
		
		var tel_No = $("#LIAI_TEL_NO").val();
		if(tel_No == null || tel_No == "") {
			alert("������̻�");
			return;
		}else {
			var telFlag = fucCheckTEL(tel_No);
			if(telFlag == 0) {
				alert("��������ȷ�Ĺ̻�����");
				return;
			}
		}
		
		// ��ֹ�޸ĺ�û�������㶪ʧ�¼�
		var totalStaffQty = $("#TOTAL_STAFF_QTY").val(); 
		var mngStaffQty = $("#MNG_STAFF_QTY").val();
		var techStaffQty =  $("#TECH_STAFF_QTY").val();
		var otherStaffQty = $("#OTHER_STAFF_QTY").val();
		if(parseInt(otherStaffQty) + parseInt(mngStaffQty)+parseInt(techStaffQty) > parseInt(totalStaffQty)) {
			alert("��˶���ְ��Ա��!");
			return;
		}
		
		document.form1.submit();
		alert("����ɹ�");
		
	}
	
	 function isURL(str){
	        return!!str.match(/(((^https?:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)$/g);
	  }

	 
	 function checkmail(){
		 var mail = $("#LIAI_EMAIL").val();
		    var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		    if(re.test(mail)){
		        
		    }else{
		    	alert("��������ȷ�������ʽ");
		    }
	 }
	 //radioĬ��ѡ��
	 function init(){
		//radioĬ��ѡ��
			var aValue = '<%=SZCP_SQ_JBXX.getENT_TYPE() %>';
			var radio_oj = document.getElementsByName("ENT_TYPE");
			var r = '<%= SZCP_SQ_JBXX.getENT_SCALE_TYPE()%>';
			var a = document.getElementsByName("ENT_SCALE_TYPE");
			change(radio_oj,aValue); 
			change(a,r); 
		}

	function change(radio_oj,aValue){//����һ������
		for(var i=0;i<radio_oj.length;i++) {//ѭ��
	        if(radio_oj[i].value==aValue){  //�Ƚ�ֵ
		            radio_oj[i].checked=true; //�޸�ѡ��״̬
		            break; //ֹͣѭ��
			 }
	 	}
	}
</script>
</body>
</html>