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
<title>企业基本信息</title>
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
//企业规模 
		String ent_scale_Type = SZCP_SQ_JBXX.getENT_SCALE_TYPE();
		String entScaleStr = "";
		 if(ent_scale_Type== null || "".equals(ent_scale_Type)) {
			entScaleStr = SZCP_SQ_JBXX.queryALLENT_SCALE_TYPE();
		}else {
			entScaleStr = SZCP_SQ_JBXX.queryENT_SCALE_TYPE_Name_Print(ent_scale_Type);
		}

		// 守重行业分类
			String local_industry_Type = SZCP_SQ_JBXX.getLOCAL_INDUSTRY_TYPE();
			String localIndustryStr = "";
 			if(local_industry_Type == null || "".equals(local_industry_Type)) {
				localIndustryStr = SZCP_SQ_JBXX.queryALLLOCAL_INDUSTRY_TYPE_NAME();
			}else {
				localIndustryStr = SZCP_SQ_JBXX.queryLOCAL_INDUSTRY_TYPE_NAME_Print(local_industry_Type);
			} 
			//职务
			String postCode = SZCP_SQ_JBXX.getLIAI_POS_CODE();
			String postCodeStr = "";
			if (postCode == null || "".equals(postCode)) {
				// 加载数据字典所有
				postCodeStr = SZCP_SQ_JBXX.queryALLPOSTCODENAME();
			} else {
				// 根据code查询数据字典
				postCodeStr = SZCP_SQ_JBXX.queryPostCodeName_Print(postCode);
			}
			//查询所有报送机关370100200195319
			SZCP_SQ_JBXX.queryReportOrgNo(REG_NO,YEAR);
%>
	<!-- form表单 -->
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
			<input type=button name=button_print value="打印"
				onclick="javascript:print()">
			<input type=button name=button_show value="打印预览"
				onclick="javascript:printpreview();">
		</div>
	</form>
	<table border="1" width="90%" align="center" bordercolor="#000000">
		<caption align="center">
			<b> <span style="font-size: 16pt"><center>企业基本信息</center></b><br>
			<br>
		</caption>
		<tr>
			<td align='center' height=44 width="20%"colspan="2">企业名称</td>
			<td colspan="4" align='center'><%=SZCP_SQ_JBXX.getENT_NAME()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%"colspan="2">企业网址</td>
			<td colspan="4" align='center'><%=SZCP_SQ_JBXX.getWEBSITE_DESC()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%" rowspan="2">企业注册类型</td>
			<td align='center' height=44  class="lc1"> 内资企业</td>
			<td class="lc2" colspan="4">
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="1" disabled ="disabled" >有限责任公司
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="2" disabled ="disabled">股份有限公司（已上市）
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="3" disabled ="disabled">股份有限公司（未上市）
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="4" disabled ="disabled">非公司企业法人
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="5" disabled ="disabled">个人独资企业
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="6" disabled ="disabled">合伙企业
			</td>
		</tr>
		
		
		<tr>
			<td align='center' height=44 width="10%" class="lc1">外商投资企业</td>
			<td class="lc2" colspan="4">
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="7" disabled ="disabled">中外合作企业
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="8" disabled ="disabled">中外合资企业
				<input type="radio" name="ENT_TYPE" id="ENT_TYPE" value="9" disabled ="disabled">外商独资企业
			</td>
		</tr>
		<tr>
		<td align='center' height=44 width="20%">发照机关</td>
			<td align='center'><%=SZCP_SQ_JBXX.queryLOCAL_ORG_NAME(SZCP_SQ_JBXX.getREGORG()) %></td>
			<td align='center' height=44 width="20%">报送机关</td>
			<td align='center' colspan="3" ><%=SZCP_SQ_JBXX.getReportName()%></td>
		<tr>
			<td align='center' height=44 width="20%">企业住所</td>
			<td align='center' colspan="5"><%=SZCP_SQ_JBXX.getADDR_DESC() %></td>
			
		</tr>
			
		<tr>
			<td align='center' height=44 width="20%">注册号</td>
			<td align='center'><%=SZCP_SQ_JBXX.getREG_NO() %></td>
			<td  align='center'>组织机构代码</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getORG_CODE()%></td>
		</tr>
		
		<tr>
			<td  align='center' height=44 width="20%">注册资本</td>
			<td align='center' colspan="2">${SZCP_SQ_JBXX.REG_CAP_RMB_W}万人民币</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%">成立日期</td>
			<td align='center'><%=SZCP_SQ_JBXX.getEST_DATE()%></td>
			<td align='center'>经营期限</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getOPER_TO_DATE()%></td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%">法定代表人姓名</td>
			<td align='center' ><%=SZCP_SQ_JBXX.getLEG_REP_NAME()%></td>
			<td align='center'>企业固定电话</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getTEL_NO()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">主营业务所属行业</td>
			<td align='center'><%=SZCP_SQ_JBXX.queryINDUSTRY_TYPE_CODE_Name(SZCP_SQ_JBXX
					.getGB_INDUSTRY_TYPE())%></td>
			<td align='center'>企业规模</td>
			<td align='center' colspan="3"><%=entScaleStr%></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">守重行业分类</td>
			<td align='left' colspan="5"><%=localIndustryStr%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">经营范围</td>
			<td align='left' colspan="5"><%=SZCP_SQ_JBXX.getBUSI_SCOPE_DESC()%></td>
		</tr>
		<tr align='center' height=44 width="20%">
			<td align='center' height=44 width="20%" rowspan="2">在职人员</td>
			<td align="center" height=44 width="20%">总人数</td>

			<td align="center" height=44 width="20%">管理人员</td>

			<td align="center" height=44 width="20%">技术人员</td>

			<td align="center" height=44 width="20%" colspan="2">其他</td>
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
			<td align='center' height=44 width="20%" rowspan="3">企业联系人</td>
			<td align='center'>姓名</td>
			<td align='center' ><%=SZCP_SQ_JBXX.getLIAI_NAME()%></td>
			<td align='center' width="10%">职务</td>
			<td align='center' ><%=SZCP_SQ_JBXX.getLIAI_POS_CODE()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">传真</td>
			<td align='center'><%=SZCP_SQ_JBXX.getLIAI_FAX_NO()%></td>
			<td align='center' height=44 width="20%">电子邮箱</td>
			<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_EMAIL()%></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">移动电话</td>
			<td align='center'><%=SZCP_SQ_JBXX.getLIAI_MOBILE_NO()%></td>
			<td align='center' height=44 width="20%">固定电话</td>
			<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_TEL_NO()%></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
//radio默认选中
function init(){
		var aValue = <%=SZCP_SQ_JBXX.getENT_TYPE() %>;
		var radio_oj = document.getElementsByName("ENT_TYPE");
		var r = <%= SZCP_SQ_JBXX.getENT_SCALE_TYPE()%>;
		var a = document.getElementsByName("ENT_SCALE_TYPE");
		change(radio_oj,aValue); //
		guimo(a,r);
	}

function change(radio_oj,aValue){//传入一个对象
	for(var i=0;i<radio_oj.length;i++) {//循环
       if(radio_oj[i].value==aValue){  //比较值
	            radio_oj[i].checked=true; //修改选中状态
	            break; //停止循环
		 }
	}
}
function guimo(radio_oj,aValue){//传入一个对象
	for(var i=0;i<radio_oj.length;i++) {//循环
       if(radio_oj[i].value==aValue){  //比较值
	            radio_oj[i].checked=true; //修改选中状态
	            break; //停止循环
		 }
	}
}
</script>
</html>