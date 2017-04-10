<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XWGFDao"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XYGLDao"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="xwgf" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF" />
<jsp:useBean id="xygl" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XYGL" />
<jsp:useBean id="SZCP_SXSZ" scope="page" class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<jsp:useBean id="sl1" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF_SL" />
<jsp:useBean id="sl2" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF_SL" />	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" src="<%=request.getContextPath() %>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath() %>/szcp/css/print.css" type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath() %>/szcp/css/NoPrint.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>合同管理</title>
</head>
<body onload="initRadio()" style="margin-top: 0; margin-bottom: 0" id="body">
	<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
		id="wb" name="wb" width="0"></OBJECT>
	<%
	String REG_NO = request.getParameter("REG_NO");
	String YEAR = request.getParameter("EVAL_YEAR");
	String CERNO = request.getParameter("CerNO");
	SZCP_SXSZ = SZCP_SXSZ.querySZCP_SXSZ(YEAR);
	String REPORT_YEAR1 = SZCP_SXSZ.getREPORT_YEAR1();
	String REPORT_YEAR2 = SZCP_SXSZ.getREPORT_YEAR2();
	SZCP_SQ_HT_XWGFDao xwgfDao = new SZCP_SQ_HT_XWGFDao();
	SZCP_SQ_HT_XYGLDao xyglDao = new SZCP_SQ_HT_XYGLDao();
	xwgf = xwgfDao.querySZCP_SQ_HT_XWGF(REG_NO,YEAR);
	xygl = xyglDao.querySZCP_SQ_HT_XYGL(REG_NO,YEAR);
	sl1 = sl1.querySZCP_SQ_HT_XWGF_SL(REG_NO,YEAR,REPORT_YEAR1);
	sl2 = sl2.querySZCP_SQ_HT_XWGF_SL(REG_NO,YEAR,REPORT_YEAR2);
	// 查询合同信用管理机构
			if (xygl.getMNG_ORG_TYPE() != null&& !"".equals(xygl.getMNG_ORG_TYPE())) {
				
				xygl.setMNG_ORG_NAMEVIEW(xyglDao.queryMNG_ORG_TYPE_Print(xygl.getMNG_ORG_TYPE()));
				
			} else {
				
				xygl.setMNG_ORG_NAMEVIEW(xyglDao.queryAllMNG_ORG_TYPE());
			}
			// 查询职位
			if (xygl.getORG_LEAD_POS_TYPE() != null&& !"".equals(xygl.getORG_LEAD_POS_TYPE())) {
				xygl.setORG_LEAD_POSVIEW(xyglDao.queryPostCodeName_Print(xygl.getORG_LEAD_POS_TYPE()));
			} else {
				xygl.setORG_LEAD_POSVIEW(xyglDao.queryALLPOSTCODENAME());
			}
			// 查询职业资格
			if (xygl.getORG_LEAD_QUAL_TYPE() != null
					&& !"".equals(xygl.getORG_LEAD_QUAL_TYPE())) {
				xygl.setORG_LEAD_QUAL_TYPEVIEW(xyglDao
						.queryOrgQual_Level_Type_Print(xygl.getORG_LEAD_QUAL_TYPE(),""));
			} else {
				xygl.setORG_LEAD_QUAL_TYPEVIEW(xyglDao
						.queryAllOrgQualLevelType());
			}

			//查询职称
			if (xygl.getQUAL_LEVEL_TYPE() != null
					&& !"".equals(xygl.getQUAL_LEVEL_TYPE())) {
				xygl.setQUAL_LEVELVIEW(xyglDao.queryQualLevelType_Print(xygl
						.getQUAL_LEVEL_TYPE(),""));
			} else {
				xygl.setQUAL_LEVELVIEW(xyglDao.queryAllQualLevelType());
			}

			//合同授权委托管理
			if (xwgf.getDELEG_TYPE() != null
					&& !"".equals(xwgf.getDELEG_TYPE())) {
				xwgf.setDELEG_TYPEVIEW(xwgfDao.queryDELEG_TYPE_Print(xwgf
						.getDELEG_TYPE(),""));
			} else {
				xwgf.setDELEG_TYPEVIEW(xwgfDao.queryAllDELEG_TYPE());
			}

			// 台账登记形式
			if (xwgf.getACCT_FORM_TYPE() != null
					&& !"".equals(xwgf.getACCT_FORM_TYPE())) {
				xwgf.setACCTFORMTYPEVIEW(xwgfDao.queryACCTFORMTYPE_Print(xwgf
						.getACCT_FORM_TYPE(),""));
			} else {
				xwgf.setACCTFORMTYPEVIEW(xwgfDao.queryAllACCTFORMTYPE());
			}

			//客户信用信息建立方式
			if (xwgf.getGUEST_INFO_TYPE() != null
					&& !"".equals(xwgf.getGUEST_INFO_TYPE())) {
				xwgf.setGUESTINFOTYPEVIEW(xwgfDao.queryACCTFORMTYPE_Print(xwgf
						.getGUEST_INFO_TYPE(),""));
			} else {
				xwgf.setGUESTINFOTYPEVIEW(xwgfDao.queryAllACCTFORMTYPE());
			}

			// 合同签订审批
			if (xwgf.getSIGN_APPR_TYPE() != null
					&& !"".equals(xwgf.getSIGN_APPR_TYPE())) {
				xwgf.setSINGAPPRTYPEVIEW(xwgfDao.querySIGNAPPRTYPE_Print(xwgf
						.getSIGN_APPR_TYPE(),""));
			} else {
				xwgf.setSINGAPPRTYPEVIEW(xwgfDao.queryAllSIGNAPPRTYPE());
			}
	
%>
	<form name="form1" method="POST" target="editframe"
		action="szcp_sq_htgl_action.jsp">

		<input type="hidden" class="noprint"
			value="<%=xygl.getORG_LEAD_POS_TYPE() %>"
			name="ORG_LEAD_POS_TYPEHIDDEN"></input> <input type="hidden"
			class="noprint" value="<%=REG_NO%>" name="REGNOHIDDEN" id=" REG_NO"></input>
		<input type="hidden" class="noprint" value="<%=YEAR%>"
			name="EVALYEAREHIDDEN" id="EVAL_YEAR"></input>

		<div style="text-align: right;" class="noprint">
			<input type=button name=button_print value="打印"
				onclick="javascript:print()"> <input type=button
				name=button_show value="打印预览" onclick="javascript:printpreview();">
		</div>
		<table border="1" width="90%" align="center" bordercolor="#000000">
		<caption align="center">
			<b> <span style="font-size: 16pt"><center>合同管理</center></b><br>
			<br>
		</caption>

		<%-- <tr>
			<td align='center' height=40 >机构名称</td>
			<td align='center' colspan="6"><%=xygl.getOTHER_ORG_DESC() == null ? "" : xygl
					.getOTHER_ORG_DESC()%></td>
		</tr> --%>

		<tr>
			<td align='center' height=40>合同信用管理机构</td>
			<td align='center'  colspan="6"><%=xygl.getMNG_ORG_NAMEVIEW()%></td>
			
		</tr>


		<tr>
			<td align='center' rowspan="3">合同信息管理部门负责人</td>
			<td align='center' height=40 width="10%">姓名</td>
			<td align='center'><%=xygl.getORG_LEAD_NAME() == null ? "" : xygl
					.getORG_LEAD_NAME()%></td>
			<td align='center' height=40  width="10%">职务</td>
			<td align='center' >
				<%=xygl.getORG_LEAD_POSVIEW() %>
			</td>
			<td align='center'  width="12%">联系方式</td>
			<td align='center' ><%=xygl.getORG_LEAD_TEL_NO() == null ? "" : xygl
					.getORG_LEAD_TEL_NO()%></td>
		</tr>

		<tr>
			<td align='center' height=30 >资格</td>
			<td colspan="5"><%=xygl.getORG_LEAD_QUAL_TYPEVIEW()%></td>
		</tr>

		<tr>
			<td align='center' height=40 >职称</td>
			<td colspan="5"><%=xygl.getQUAL_LEVELVIEW()%></td>
		</tr>

		<tr>
			<td align='center' height="44">合同信用管理制度</td>
			<td colspan="6"><br>
			企业已建立的合同信用管理制度:<br><br>
			<input type="checkbox"  disabled ="disabled" name="MSCheckBox1"
				value="1"
				<%="1".equals(xygl.getMS_POS_RESP_FLAG())
					? "checked='checked'"
					: ""%>>
				岗位职责</input> <input type="checkbox" disabled ="disabled" disabled ="disabled" name="MSCheckBox2" value="1"
				<%="1".equals(xygl.getMS_DELEGATE_FLAG())
					? "checked='checked'"
					: ""%>>
				委托授权</input> <br><br>
				<input type="checkbox" disabled ="disabled" name="MSCheckBox3" value="1"
				<%="1".equals(xygl.getMS_SIGN_REVIEW_FLAG())
					? "checked='checked'"
					: ""%>>
				合同签订审批</input> <input type="checkbox" disabled ="disabled" name="MSCheckBox4" value="1"
				<%="1".equals(xygl.getMS_SEAL_FILE_FLAG())
					? "checked='checked'"
					: ""%>>
				印章和文本</input> <br><br><input type="checkbox" disabled ="disabled" name="MSCheckBox5" value="1"
				<%="1".equals(xygl.getMS_RISK_EMG_FLAG())
					? "checked='checked'"
					: ""%>>
				风险和应急</input> <input type="checkbox" disabled ="disabled" name="MSCheckBox6" value="1"
				<%="1".equals(xygl.getMS_SIGN_CANCEL_FLAG())
					? "checked='checked'"
					: ""%>>
				签履变撤</input> <br><br><input type="checkbox" disabled ="disabled" name="MSCheckBox7" value="1"
				<%="1".equals(xygl.getMS_RECV_ACCT_FLAG())
					? "checked='checked'"
					: ""%>>
				应收账款</input> <input type="checkbox" disabled ="disabled" name="MSCheckBox8" value="1"
				<%="1".equals(xygl.getMS_PAY_ACCT_FLAG())
					? "checked='checked'"
					: ""%>>
				应付账款</input><br><br> <input type="checkbox" disabled ="disabled" name="MSCheckBox9" value="1"
				<%="1".equals(xygl.getMS_GUEST_FLAG())
					? "checked='checked'"
					: ""%>>
				客户信用档案</input></td>
		</tr>

		<tr>
			<td align='center' height=40 rowspan="2">合同信用管理人员数</td>
			<td align='center' height=40  colspan="3">专职人数</td>
			<td align='center' colspan="3"><%=xygl.getFULLTIME_MNG_QTY()%>人</td>
		</tr>

		<tr>
			<td align='center' height=40  colspan="3">兼职人数</td>
			<td align='center' colspan="3"><%=xygl.getPARTTIME_MNG_QTY()%>人</td>
		</tr>

		<tr>
			<td align='center' height=40 width="20%">格式条款是否备案</td>
			<td align='center'  colspan="3"><c:choose>
					<c:when test='<%="1".equals(xwgf.getFC_ARCH_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" checked="checked"
							value="1">有</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="0">无</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="0">无规定</input>
					</c:when>
					<c:when test='<%="0".equals(xwgf.getFC_ARCH_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" checked="checked"
							value="0">无</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG"value="2">无规定</input>
					</c:when>
					<c:when test='<%="2".equals(xwgf.getFC_ARCH_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG"
							value="0">无</input>
							<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" checked="checked"
							value="2">无规定</input>
					</c:when>
					<c:otherwise>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="0">无</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="0">无规定</input>
					</c:otherwise>
				</c:choose></td>
			<td align='center' height=40>格式条款有否违规记录</td>
			<td align='center'  colspan="2"><c:choose>
					<c:when test='<%="1".equals(xwgf.getFC_VIOL_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" checked="checked"
							value="1">有</input>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="0">无</input>
					</c:when>
					<c:when test='<%="0".equals(xwgf.getFC_VIOL_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="0"
							checked="checked">无</input>
					</c:when>
					<c:otherwise>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="0">无</input>
					</c:otherwise>
				</c:choose></td>
		</tr>

		<tr>
			<td align='center' height=40 colspan="2">行业有无合同示范为本</td>
			<td align='left' colspan="6"><c:choose>
					<c:when test='<%="1".equals(xwgf.getMODEL_TEXT_TYPE())%>'>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" checked="checked"
							value="1">有</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="0">无</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="2">适合本企业使用</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="3">不适合本企业使用</input>
					</c:when>
					
					<c:when test='<%="0".equals(xwgf.getMODEL_TEXT_TYPE())%>'>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" checked="checked"
							value="0">无</input>
							<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="2">适合本企业使用</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="3">不适合本企业使用</input>
					</c:when>
					
					<c:when test='<%="2".equals(xwgf.getMODEL_TEXT_TYPE())%>'>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" 
							value="0">无</input>
							<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="2" checked="checked">适合本企业使用</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="3">不适合本企业使用</input>
					</c:when>
					<c:when test='<%="3".equals(xwgf.getMODEL_TEXT_TYPE())%>'>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" 
							value="0">无</input>
							<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="2">适合本企业使用</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="3"  checked="checked">不适合本企业使用</input>
					</c:when>
					
					<c:otherwise>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="0">无</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="2">适合本企业使用</input>
						<input type="radio"  disabled ="disabled"name="MODEL_TEXT_TYPE" value="3">不适合本企业使用</input>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr align="center" height="44">
			<td>项目/年度</td>
			<td colspan="3"><%=REPORT_YEAR1%>年（%）</td>
			<td colspan="3"><%=REPORT_YEAR2%>年（%）</td>
			
		</tr>

		<tr>
			<td align='center' height=40 >收入性合同书面签约率</td>
		    <td align='center' colspan="3"><%=sl1.getINC_SIGN_RATE() %></td>
			<td align='center' colspan="3"><%=sl2.getINC_SIGN_RATE() %></td> 
		</tr>

		<tr>
			<td align='center' height=40 >支出性合同书面签约率</td>
			<td align='center' colspan="3"><%=sl1.getEXP_SIGN_RATE() %></td>
			<td align='center' colspan="3"><%=sl2.getEXP_SIGN_RATE() %></td> 
		</tr>

		<tr>
			<td align='center' height=40 >合同示范文本使用率</td>
			<td align='center' colspan="3"><%=sl1.getMODEL_TEXT_US_RATE() %></td>
			<td align='center' colspan="3"><%=sl2.getMODEL_TEXT_US_RATE() %></td> 
		</tr>

		<tr>
			<td align='center' height=40 >合同签订授权委托管理</td>
			<td colspan="6">
			<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="1"/>均经书面授权委托
			<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="2"/>部分使用书面授权委托、部分口头授权委托
			<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="3"/>无书面授权委托、全部口头授权委托
			<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="4"/>有未授权委托情况
		</tr>
	</table>
	
	<p class="PageNext"><br>
	
	<table border="1" width="90%" align="center" bordercolor="#000000">
		<tr>
			<td align='center' height="35"  rowspan="2">合同签订审核管理</td>
			<td align="left" colspan="4">合同签订审批(可多选)<br><%=xwgf.getSINGAPPRTYPEVIEW()%></td>
		</tr>

		<tr>
			<td align='left' height="35"  colspan="4">合同签订审核内容(可多选)<br>
			<input type="checkbox" disabled ="disabled"
				name="SACheckBox1" value="1"
				<%="1".equals(xwgf.getSA_QUAL_FLAG())
					? "checked='checked'"
					: ""%>>对方资格和经营范围</input><br>
				<input type="checkbox" disabled ="disabled" name="SACheckBox2" value="1"
				<%="1".equals(xwgf.getSA_VALID_FLAG())
					? "checked='checked'"
					: ""%>>
				对方合法性</input> <br><input type="checkbox" disabled ="disabled" name="SACheckBox3" value="1"
				<%="1".equals(xwgf.getSA_CREDIT_FLAG())
					? "checked='checked'"
					: ""%>>
				对方资信状况</input><br> <input type="checkbox" disabled ="disabled" name="SACheckBox4" value="1"
				<%="1".equals(xwgf.getSA_PERFORM_FLAG())
					? "checked='checked'"
					: ""%>>
				对方履约能力</input>
			
			</td>
		</tr>

		<tr>
			<td align="center" rowspan="3">合同档案和台账管理</td>
			<td align="left" height=30  colspan="4">有无合同档案管理部门<c:choose>
					<c:when test='<%="1".equals(xwgf.getMNG_ORG_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							checked="checked" value="1">有</input>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="0">无</input>
					</c:when>
					<c:when test='<%="0".equals(xwgf.getMNG_ORG_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="1">有</input>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="0" checked="checked">无</input>
					</c:when>
					<c:otherwise>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="1">有</input>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="0">无</input>
					</c:otherwise>
				</c:choose></td>


		</tr>

		<tr>
			<td align='left' height=30  colspan="4">台账登记形式<br><%=xwgf.getACCTFORMTYPEVIEW()%></td>

		</tr>

		<tr>
			<td height=30  align="left" colspan="4">台账内容(可多选)<br>
			<input type="checkbox" disabled ="disabled"
				name="ACCTCheckBox1" value="1"
				<%="1".equals(xwgf.getACCT_SERIAL_FLAG())
					? "checked='checked'"
					: ""%>>
				合同编号</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox2" value="1"
				<%="1".equals(xwgf.getACCT_GUEST_FLAG())
					? "checked='checked'"
					: ""%>>
				客户名称</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox3" value="1"
				<%="1".equals(xwgf.getACCT_WHEN_FLAG())
					? "checked='checked'"
					: ""%>>
				签订时间</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox4" value="1"
				<%="1".equals(xwgf.getACCT_UNDLY_FLAG())
					? "checked='checked'"
					: ""%>>
				合同标的</input> <br><input type="checkbox" disabled ="disabled" name="ACCTCheckBox5" value="1"
				<%="1".equals(xwgf.getACCT_QTY_FLAG())
					? "checked='checked'"
					: ""%>>
				合同数量</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox6" value="1"
				<%="1".equals(xwgf.getACCT_CAP_FLAG())
					? "checked='checked'"
					: ""%>>
				合同金额</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox7" value="1"
				<%="1".equals(xwgf.getACCT_PLAN_TIME_FLAG())
					? "checked='checked'"
					: ""%>>
				应履行时间</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox8" value="1"
				<%="1".equals(xwgf.getACCT_REAL_TIME_FLAG())
					? "checked='checked'"
					: ""%>>
				实际履行时间</input><br> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox9" value="1"
				<%="1".equals(xwgf.getACCT_PLAN_CAP_FLAG())
					? "checked='checked'"
					: ""%>>
				应履行金额</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox10" value="1"
				<%="1".equals(xwgf.getACCT_REAL_CAP_FLAG())
					? "checked='checked'"
					: ""%>>
				实际履行金额</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox11" value="1"
				<%="1".equals(xwgf.getACCT_PERFOM_CERT_FLAG())
					? "checked='checked'"
					: ""%>>
				履行凭证</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox12" value="1"
				<%="1".equals(xwgf.getACCT_CHANGE_FLAG())
					? "checked='checked'"
					: ""%>>
				变更解除情况</input>
			</td>

		</tr>

		<tr>
			<td align='center' height=30  rowspan="3">客户资信商帐管理</td>
			<td align='left' colspan="4" height=30 >客户信用信息数据建立方式<br><%=xwgf.getGUESTINFOTYPEVIEW()%></td>

		</tr>

		<tr>
			<td align="left" height=30  colspan="4">客户资信管理(可多选)<br><input type="checkbox" disabled ="disabled"
				name="GCTCheckBox1" value="1"
				<%="1".equals(xwgf.getGC_RECORD_FLAG())
					? "checked='checked'"
					: ""%>>
				有档案</input> <input type="checkbox" disabled ="disabled" name="GCTCheckBox2" value="1"
				<%="1".equals(xwgf.getGC_THIRD_PART_FLAG())
					? "checked='checked'"
					: ""%>>
				第三方征信报</input> <input type="checkbox" disabled ="disabled" name="GCTCheckBox3" value="1"
				<%="1".equals(xwgf.getGC_RESERCH_FLAG())
					? "checked='checked'"
					: ""%>>
				实地调查报告</input></td>

		</tr>

		<tr>
			<td align='left' height=30  colspan="4">商账管理(可多选)<br><input type="checkbox" disabled ="disabled"
				name="AMCheckBox1" value="1"
				<%="1".equals(xwgf.getAM_RECV_AGE_FLAG())
					? "checked='checked'"
					: ""%>>
				对应收账款账龄进行分析</input> <input type="checkbox" disabled ="disabled" name="AMCheckBox2" value="1"
				<%="1".equals(xwgf.getAM_OVERDUE_FLAG())
					? "checked='checked'"
					: ""%>>
				对逾期账款进行分析</input> <input type="checkbox" disabled ="disabled" name="AMCheckBox3" value="1"
				<%="1".equals(xwgf.getAM_SPEC_RECOVER_FLAG())
					? "checked='checked'"
					: ""%>>
				有专人负责账款追收</input> <input type="checkbox" disabled ="disabled" name="AMCheckBox4" value="1"
				<%="1".equals(xwgf.getAM_RECV_SUM_FLAG())
					? "checked='checked'"
					: ""%>>
				对应付账款进行分析</input></td>

		</tr>
		
		<tr align="center" height="30">
			<td rowspan="7" align="center">合同争议解决、处理</td>
			<td colspan="2" width="30%">项目/年度</td>
			<td ><%=REPORT_YEAR1%>年</td>
			<td ><%=REPORT_YEAR2%>年</td>
		</tr>
		<tr>
		<td align='center' rowspan="2">因违约产生的合同争议</td>
			<td align='center' height=30 >本方违约件数</td>
			<td align='center' ><%=sl1.getLAST_DFT_OUR_QTY() %></td>
			<td align='center' ><%=sl2.getLAST_DFT_OUR_QTY() %></td>
		</tr>
		<tr>
			<td align='center' height=30 >对方违约件数</td>
			<td align='center' ><%=sl1.getLAST_DFT_THEY__QTY() %></td>
			<td align='center' ><%=sl2.getLAST_DFT_THEY__QTY() %></td>

		</tr>

		<tr>
			<td align='center' rowspan="4">合同争议解决</td>
			<td align='center' height=30 >和解件数</td>
			<td align='center' ><%=sl1.getDISP_COMP_QTY() %></td>
			<td align='center' ><%=sl2.getDISP_COMP_QTY() %></td>
			<%-- <td align='center' colspan="2"><%=xwgf.getDISP_COMP_QTY()%></td> --%>
		</tr>
		<tr>
			<td align='center' height=30 >调解件数</td>
			<td align='center' ><%=sl1.getDISP_MED_QTY() %></td>
			<td align='center' ><%=sl2.getDISP_MED_QTY() %></td>
			<%-- <td align='center' colspan="2"><%=xwgf.getDISP_MED_QTY()%></td> --%>
		</tr>

		<tr>
			<td align='center' height=30 >仲裁件数</td>
			<td align='center' ><%=sl1.getDISP_ARB_QTY() %></td>
			<td align='center' ><%=sl2.getDISP_ARB_QTY() %></td>
			<%-- <td align='center' colspan="2"><%=xwgf.getDISP_ARB_QTY()%></td> --%>
		</tr>

		<tr>
			<td align='center' height=30 >诉讼件数</td>
			<td align='center' ><%=sl1.getDISP_LAW_QTY() %></td>
			<td align='center' ><%=sl2.getDISP_LAW_QTY() %></td>
			<%-- <td align='center' colspan="2"><%=xwgf.getDISP_LAW_QTY()%></td> --%>
		</tr>
	</table>
		<br>
	</form>
</body>
<script type="text/javascript">
function initRadio() {
	var MNG_ORG_TYPE = document.getElementsByName("MNG_ORG_TYPE");
	var MNG_ORG_TYPEVal = '<%=xygl.getMNG_ORG_TYPE()%>';
	change(MNG_ORG_TYPE, MNG_ORG_TYPEVal);
	var ORG_LEAD_QUAL_TYPE = document.getElementsByName("ORG_LEAD_QUAL_TYPE");
	var ORG_LEAD_QUAL_TYPEVal = '<%=xygl.getORG_LEAD_QUAL_TYPE()%>';
	change(ORG_LEAD_QUAL_TYPE, ORG_LEAD_QUAL_TYPEVal);
	var QUAL_LEVEL_TYPE = document.getElementsByName("QUAL_LEVEL_TYPE");
	var QUAL_LEVEL_TYPEVal = '<%=xygl.getQUAL_LEVEL_TYPE()%>';
	change(QUAL_LEVEL_TYPE,QUAL_LEVEL_TYPEVal);
	var DELEGTYPE = document.getElementsByName("DELEGTYPE");
	var DELEGTYPEVal = '<%=xwgf.getDELEG_TYPE()%>';
	change(DELEGTYPE,DELEGTYPEVal);
	var DELEGTYPE = document.getElementsByName("DELEGTYPE");
	var DELEGTYPEVal = '<%=xwgf.getDELEG_TYPE()%>';
	change(DELEGTYPE,DELEGTYPEVal);
	var ACCT_FORM_TYPE = document.getElementsByName("ACCT_FORM_TYPE");
	var ACCT_FORM_TYPEVal = '<%=xwgf.getACCT_FORM_TYPE()%>';
	change(ACCT_FORM_TYPE,ACCT_FORM_TYPEVal); 
	
	var SIGN_APPR_TYPE = document.getElementsByName("sign_appr_type");
	var SIGN_APPR_TYPEVal = '<%=xwgf.getSIGN_APPR_TYPE()%>';
	change(SIGN_APPR_TYPE,SIGN_APPR_TYPEVal);
	
	var GUEST_INFO_TYPE = document.getElementsByName("GUEST_INFO_TYPE");
	var GUEST_INFO_TYPEVal = '<%=xwgf.getGUEST_INFO_TYPE()%>';
	change(GUEST_INFO_TYPE,GUEST_INFO_TYPEVal);
	
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


</html>