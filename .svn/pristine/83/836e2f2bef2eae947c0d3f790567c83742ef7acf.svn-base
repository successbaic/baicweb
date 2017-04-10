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
<title>基本信息</title>
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
	/*解决ie不支持background-size*/
	background-size :cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/tab/tabbefore.png',sizingMethod='scale');
	border: 0px solid black;
}

.jbxx {
	width: 81px;
	height: 30px;
	background: transparent url(../images/tab/tabafter.png) no-repeat;
	/*解决ie不支持background-size*/
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
// 企业规模 
String ent_scale_Type = SZCP_SQ_JBXX.getENT_SCALE_TYPE();
String entScaleStr = "";
if(ent_scale_Type== null || "".equals(ent_scale_Type)) {
	entScaleStr = SZCP_SQ_JBXX.queryALLENT_SCALE_TYPE();
}else {
	entScaleStr = SZCP_SQ_JBXX.queryENT_SCALE_TYPE_Name(ent_scale_Type);
}
// 守重行业分类
String local_industry_Type = SZCP_SQ_JBXX.getLOCAL_INDUSTRY_TYPE();
String localIndustryStr = "";
if(local_industry_Type == null || "".equals(local_industry_Type)) {
	localIndustryStr = SZCP_SQ_JBXX.queryALLLOCAL_INDUSTRY_TYPE_NAME();
}else {
	localIndustryStr = SZCP_SQ_JBXX.queryLOCAL_INDUSTRY_TYPE_NAME(local_industry_Type);
}
//查询所有报送机关370100200195319
SZCP_SQ_JBXX.queryReportOrgNo(REG_NO,YEAR);

String postCode = SZCP_SQ_JBXX.getLIAI_POS_CODE();
String postCodeStr = "";
if(postCode == null || "".equals(postCode)) {
	// 加载数据字典所有
/* 	postCodeStr = SZCP_SQ_JBXX.queryALLPOSTCODENAME(); */
}else {
	// 根据code查询数据字典
	postCodeStr = SZCP_SQ_JBXX.queryPostCodeName(postCode);
}
String sb = createHeaderUtil.createHeader(REG_NO,YEAR,CerNO,"1",SZCP_SQ_JBXX.getENT_NAME());
out.print(sb);
%>

	<!-- form表单 -->
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

						<font color=#000080>基本信息</font>
					</p></td>
		<tr>
			<td align='center' height=44 width="10%"colspan="2" class="lc1">企业名称</td>
			<td colspan="3" ><input type="text" name="ENT_NAME" size="40"
					title="企业(机构)名称" maxlength="50"
					value="<%=SZCP_SQ_JBXX.getENT_NAME()%>" readonly="readonly"
					style="background-color:silver;;"></input></td>
		</tr>
		<tr>
			<td align='center' height=44 colspan="2" class="lc1">企业网址</td>
			<td colspan="3" ><input type="text"
					id="WEBSITE_DESC" name="WEBSITE_DESC" title="企业网址" size="40"
					maxlength=20 value="<%=SZCP_SQ_JBXX.getWEBSITE_DESC()%>"></input></td>
		</tr>
		<tr>
			<td class="lc1" rowspan="2">企业注册类型</td>	
			<td align='center' height=44  class="lc1"> 内资企业</td>
			<td class="lc2" colspan="4">
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="1">有限责任公司
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="2">股份有限公司（已上市）
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="3">股份有限公司（未上市）
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="4">非公司企业法人
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="5">个人独资企业
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="6">合伙企业
			</td>
		</tr>
		
		
		<tr>
			<td align='center' height=44 width="10%" class="lc1">外商投资企业</td>
			<td class="lc2" colspan="4">
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="7">中外合作企业
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="8">中外合资企业
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="9">外商独资企业
			</td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%" class="lc1">发照机关</td>
			<td align='center'><input type="text" name="REGORG" id="REGORG"
					size="40" title="发照机关" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.queryLOCAL_ORG_NAME(SZCP_SQ_JBXX.getREGORG()) %>"></input></td>
			<td  align='center' class="lc1">报送机关</td>
			<td align='center' colspan="2">
			<input type="text"
					id="REPORT_ORG_NO_NAME" name="REPORT_ORG_NO_NAME" title="报送机关" size="40"
					readonly="readonly"
					maxlength=20 value="<%=SZCP_SQ_JBXX.getReportName()%>"></input>
					</td>	
		<tr>
			<td align='center' height=44 width="20%" class="lc1">企业住所</td>
			<td  colspan="4"><input type="text" name="ADDR_DESC"
					id="ADDR_DESC" size="63" title="企业住所" maxlength=50
					readonly="readonly" style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getADDR_DESC() %>"></input></td>
			
		</tr>
			
		<tr>
			<td align='center' height=44 width="20%" class="lc1">注册号</td>
			<td align='center'><input type="text" name="REG_NO" id="REG_NO"
					size="40" title="注册号" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getREG_NO() %>"></input></td>
			<td  align='center' class="lc1">组织机构代码</td>
			<td align='center' colspan="2"><input type="text" id="ORG_CODE"
					name="ORG_CODE" size="40" title="组织机构代码" maxlength=30
					value="<%=SZCP_SQ_JBXX.getORG_CODE()%>"></input></td>
		</tr>
		
		<tr>
			<td  align='center' height=44 width="20%" class="lc1">注册资本</td>
			<td  colspan="6"><input type="text"
					name="REG_CAP_RMB_W" size="63" title="注册资本" maxlength=50
					readonly="readonly" style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getREG_CAP_RMB_W()%>"></input>万元</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" class="lc1">成立日期</td>
			<td align='center'><input type="text" name="EST_DATE" size="40"
					title="成立日期" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getEST_DATE()%>"></input></td>
			<td align='center' class="lc1">经营期限</td>
			<td align='center' colspan="2"><input type="text"
					name="OPER_TO_DATE" size="40" title="经营期限" maxlength=50
					readonly="readonly" style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getOPER_TO_DATE()%>"></input></td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" class="lc1">法定代表人</td>
			<td height=44 width="10%" >
					<table border="0">
						<tr>
							<td  height=44 width="45" >姓名</td>
							<td><input type="text" name="LEG_REP_NAME"
					 title="法定代表人姓名" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getLEG_REP_NAME()%>"></input></td>
						</tr>
					</table>
			</td>
			<td align='center' class="lc1">固定电话</td>
			<td align='center' colspan="2"><input type="text" name="TEL_NO"
					size="40" title="企业固定电话" maxlength=50 readonly="readonly"
					style="background-color:silver;;"
					value="<%=SZCP_SQ_JBXX.getTEL_NO()%>"></td>
		</tr>
		<tr>
			<td align='center' class="lc1">企业规模</td>
			<td align='center' colspan="4">
				<input type="radio" name="ENT_SCALE_TYPE" id="ENT_SCALE_TYPE" value="1">大型</input>&nbsp;&nbsp;
				<input type="radio" name="ENT_SCALE_TYPE" id="ENT_SCALE_TYPE" value="2">中型</input>&nbsp;&nbsp;
				<input type="radio" name="ENT_SCALE_TYPE" id="ENT_SCALE_TYPE" value="3">小型</input>&nbsp;&nbsp;
				<input type="radio" name="ENT_SCALE_TYPE" id="ENT_SCALE_TYPE" value="4">微型</input>&nbsp;&nbsp; 
			</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" class="lc1">经营范围</td>
			<td  colspan="4"><textarea rows="8" cols="106"
						readonly="readonly" style="background-color:silver;overflow-y:hidden;"
						id="BUSI_SCOPE_DESC" name="BUSI_SCOPE_DESC" title="经营范围"><%= SZCP_SQ_JBXX.getBUSI_SCOPE_DESC()%></textarea></td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" class="lc1">主营业务所属行业</td>
			<td align='center'><input type="text" name="GB_INDUSTRY_TYPE"
					size="40" title="主营业务所属行业" maxlength=50 readonly="readonly"
					style="background-color:silver;;" disblank
					value="<%=SZCP_SQ_JBXX.queryINDUSTRY_TYPE_CODE_Name(SZCP_SQ_JBXX.getGB_INDUSTRY_TYPE()) %>"></td>
		
			<td align='center' height=44 width="20%" class="lc1">守重行业分类</td>
			<td align='center' colspan="4">
						<select  name="LOCAL_INDUSTRY_TYPE"
							id="LOCAL_INDUSTRY_TYPE" title="守重行业分类" >
							<option value=''>请选择</option>
							<%=localIndustryStr%>
						</select>
					</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%" rowspan="2" class="lc1">在职人员</td>
			<td align="center" height=44 width="20%" class="lc1">总人数</td>

			<td align="center" height=44 width="20%" class="lc1">管理人员</td>

			<td align="center" height=44 width="20%" class="lc1">技术人员</td>

			<td align="center" height=44 width="20%" class="lc1">其他</td>
		</tr>
		<tr height=44>
			<td align="center"><input type="text"
					style="text-align: center;" name="TOTAL_STAFF_QTY"
					id="TOTAL_STAFF_QTY" size="15" title="总人数" maxlength=10
					value="<%=SZCP_SQ_JBXX.getTOTAL_STAFF_QTY() %>" onblur="getTOTAL_STAFF_QTY()" >
			</td>
			<td align="center"><input type="text"
					style="text-align: center;" name="MNG_STAFF_QTY" id="MNG_STAFF_QTY"
					size="15" title="管理人员" maxlength=10
					value="<%=SZCP_SQ_JBXX.getMNG_STAFF_QTY() %>" onblur="getMNG_STAFF_QTY()"> 
			</td>
			<td align="center"><input type="text"
					style="text-align: center; " name="TECH_STAFF_QTY"
					id="TECH_STAFF_QTY" size="15" title="技术人员" maxlength=10
					value="<%=SZCP_SQ_JBXX.getTECH_STAFF_QTY()%>"  onblur="getTech_Staff_Qty()">
			</td>
			<td align="center"><input type="text"
					readonly="readonly" style="text-align: center; "
					style="background-color:silver;;" name="OTHER_STAFF_QTY"
					id="OTHER_STAFF_QTY" size="15" title="其他" maxlength=10
					value="<%=SZCP_SQ_JBXX.getTOTAL_STAFF_QTY()-SZCP_SQ_JBXX.getMNG_STAFF_QTY()-SZCP_SQ_JBXX.getTECH_STAFF_QTY() %>">
			</td>
		</tr>
		<tr height=44>
			<td align='center'  width="20%" rowspan="3"class="lc1">企业联系人</td>
			<td align='center' class="lc1">姓名</td>
			<td align='center'><input type="text" name="LIAI_NAME"
					id="LIAI_NAME"  title="姓名" maxlength=4
					value="<%=SZCP_SQ_JBXX.getLIAI_NAME()%>"></td>
			<td align='center' class="lc1">职务</td>
			<td align='center' ><input type="text"
					style="text-align: center; " name="LIAI_POS_CODE"
					id="LIAI_POS_CODE"  title="技术人员" maxlength=15
					value="<%=SZCP_SQ_JBXX.getLIAI_POS_CODE()%>">
			</td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%" class="lc1">传真</td>
			<td align='center'><input type="text" id="LIAI_FAX_NO"
					name="LIAI_FAX_NO"  title="传真" maxlength=20
					value="<%=SZCP_SQ_JBXX.getLIAI_FAX_NO()%>"></td>
			<td align='center' height=44 width="20%" class="lc1">电子邮箱</td>
			<td align='center'><input type="text" id="LIAI_EMAIL" onblur="checkmail()"
					name="LIAI_EMAIL"  title="电子邮箱" maxlength=50
					value="<%=SZCP_SQ_JBXX.getLIAI_EMAIL()%>"></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%" class="lc1">移动电话</td>
			<td align='center'><input type="text" id="LIAI_MOBILE_NO"
					name="LIAI_MOBILE_NO"  title="移动电话" maxlength=15
					value="<%=SZCP_SQ_JBXX.getLIAI_MOBILE_NO()%>"></td>
			<td align='center' height=44 width="20%" class="lc1">固定电话</td>
			<td align='center'><input type="text" id="LIAI_TEL_NO"
					name="LIAI_TEL_NO"  title="固定电话" maxlength=15
					value="<%=SZCP_SQ_JBXX.getLIAI_TEL_NO() %>"></td>
		</tr>
	</table>
		<br>
		<CENTER class="noprint">
			<div class="subImgs" style="display:inline"><a id="printa" ondragstart="return false"
				href="print/szcp_sq_jbxx_print.jsp?REG_NO=<%=REG_NO%>&YEAR=<%=YEAR %>"
				target="_blank" >打印本页</a></div>
			<div class="subImgs" style="display:inline" onclick="checkError()">下一页</div>
		</CENTER>
		
		
	</form>
	<%@include file="../bottom.inc"%>
	<script type="text/javascript">
	function jbxx(){
		
	}
	//动态设置a href
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
			alert("请输入组织机构代码");
			return;
		}
		
		
		var total_Staff_Qty = $("#TOTAL_STAFF_QTY").val();
		if(total_Staff_Qty == null || total_Staff_Qty == "") {
			alert("请输入总职工数");
			return;
		}else {
			var flag = fucCheckInt(total_Staff_Qty);
			if(flag== 0) {
				alert("总职工数，请输入正确的数字格式");
				return
			}
		}
		
		var mng_Staff_Qty = $("#MNG_STAFF_QTY").val();
		if(mng_Staff_Qty == null || mng_Staff_Qty == "") {
			alert("请输入管理职工数");
			return;
		}else {
			var flag = fucCheckInt(mng_Staff_Qty);
			if(flag== 0) {
				alert("管理职工数，请输入正确的数字格式");
				return
			}else if(parseInt(mng_Staff_Qty) > parseInt(total_Staff_Qty)){
				alert("管理职工数，必须小于总职工数");
				return
			}
		}
		var tech_Staff_Qty = $("#TECH_STAFF_QTY").val();
		if(tech_Staff_Qty == null || tech_Staff_Qty == "") {
			alert("请输入技术人工数");
			return;
		}else {
			var flag = fucCheckInt(tech_Staff_Qty);
			if(flag== 0) {
				alert("技术人工数，请输入正确的数字格式");
				return
			}else if(parseInt(tech_Staff_Qty) > parseInt(total_Staff_Qty)){
				alert("技术人工数，必须小于总职工数");
				return
			}
		}
		var name = $("#LIAI_NAME").val();
		if(name == null || name == "") {
			alert("请输入姓名");
			return;
		}
		var faxNo = $("#LIAI_FAX_NO").val();
		if(faxNo == null || faxNo == "") {
			alert("请输入传真号");
			return;
		}else {
			var flag = fucCheckNUM(faxNo);
			if(flag== 0) {
				alert("传真号请输入正确的数字格式");
				return
			}
		}
		var mail = $("#LIAI_EMAIL").val();
		if(mail== null || mail == "") {
			alert("请输入邮箱");
			return;
		}else {
			var mailFlag = fucCheckEmail(mail);
			if(mailFlag == 0) {
				alert("请输入正确的邮箱格式");
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
			alert("请选择企业规模");
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
			alert("请选择企业注册类型");
			return;
		}
	
		var phone = $("#LIAI_MOBILE_NO").val();
		if(phone == null || phone == "") {
			alert("请输入手机号");
			return;
		}else {
			 var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
			 if (!reg.test(phone)) {
			      alert("手机号码填写有误");
			      return;
			 }
		}
		
		var selectedLocal_Industry_Type = $("#LOCAL_INDUSTRY_TYPE").val();
		if(selectedLocal_Industry_Type == null || selectedLocal_Industry_Type == "") {
			alert("请选择守重行业分类");
			return;
		}
		
		
		var tel_No = $("#LIAI_TEL_NO").val();
		if(tel_No == null || tel_No == "") {
			alert("请输入固话");
			return;
		}else {
			var telFlag = fucCheckTEL(tel_No);
			if(telFlag == 0) {
				alert("请输入正确的固话号码");
				return;
			}
		}
		
		// 防止修改后，没有做焦点丢失事件
		var totalStaffQty = $("#TOTAL_STAFF_QTY").val(); 
		var mngStaffQty = $("#MNG_STAFF_QTY").val();
		var techStaffQty =  $("#TECH_STAFF_QTY").val();
		var otherStaffQty = $("#OTHER_STAFF_QTY").val();
		if(parseInt(otherStaffQty) + parseInt(mngStaffQty)+parseInt(techStaffQty) > parseInt(totalStaffQty)) {
			alert("请核对在职人员数!");
			return;
		}
		
		document.form1.submit();
		alert("保存成功");
		
	}
	
	 function isURL(str){
	        return!!str.match(/(((^https?:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)$/g);
	  }

	 
	 function checkmail(){
		 var mail = $("#LIAI_EMAIL").val();
		    var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		    if(re.test(mail)){
		        
		    }else{
		    	alert("请输入正确的邮箱格式");
		    }
	 }
	 //radio默认选中
	 function init(){
		//radio默认选中
			var aValue = '<%=SZCP_SQ_JBXX.getENT_TYPE() %>';
			var radio_oj = document.getElementsByName("ENT_TYPE");
			var r = '<%= SZCP_SQ_JBXX.getENT_SCALE_TYPE()%>';
			var a = document.getElementsByName("ENT_SCALE_TYPE");
			change(radio_oj,aValue); 
			change(a,r); 
		}

	function change(radio_oj,aValue){//传入一个对象
		for(var i=0;i<radio_oj.length;i++) {//循环
	        if(radio_oj[i].value==aValue){  //比较值
		            radio_oj[i].checked=true; //修改选中状态
		            break; //停止循环
			 }
	 	}
	}
</script>
</body>
</html>