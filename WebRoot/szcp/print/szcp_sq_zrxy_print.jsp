<%@ page language="java" contentType="text/html; charset=GBK"pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="Page" scope="session"class="com.macrosoft.icms.system.WebSysPage" /> 		
<jsp:useBean id="SZCP_SQ_ZRXY" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_ZRXY" />
<jsp:useBean id="gyjz_last" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ"/>
<jsp:useBean id="gyjzdao" scope="page" class="com.macrosoft.icms.szcp.dao.SZCP_SQ_GYJZDao"/>
<jsp:useBean id="gyjz_next" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ"/>
<jsp:useBean id="SZCP_SXSZ" scope="page"class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript"
	src="<%=request.getContextPath()%>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath()%>/szcp/css/print.css"
	type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath()%>/szcp/css/NoPrint.css"
	type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>社会信用</title>
</head>
<body style="margin-top: 0; margin-bottom: 0">
	<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
		id="wb" name="wb" width="0"></OBJECT>
	<%
	String REG_NO = request.getParameter("REG_NO");
	String YEAR = request.getParameter("EVAL_YEAR");
	String CERNO = request.getParameter("CerNO");
	SZCP_SXSZ = SZCP_SXSZ.querySZCP_SXSZ(YEAR);
	String REPORT_YEAR1 = SZCP_SXSZ.getREPORT_YEAR1();
	String REPORT_YEAR2 = SZCP_SXSZ.getREPORT_YEAR2();
	gyjz_last = gyjzdao.querySZCP_SQ_GYJZ(REG_NO,YEAR,REPORT_YEAR1);
	gyjz_next = gyjzdao.querySZCP_SQ_GYJZ(REG_NO,YEAR,REPORT_YEAR2);
	SZCP_SQ_ZRXY= SZCP_SQ_ZRXY.querySZCP_SQ_ZRXY(REG_NO,YEAR);
	%>
	<!-- form表单 -->
	<form name="form1" method="POST" id="form1"
		action="szcp_sq_zrxy_action.jsp">
		<input type="hidden" value="<%=REG_NO%>" name="REG_NO" id="REG_NO">
		<input type="hidden" name="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR">
		<div style="text-align: right;" class="noprint">
			<input type=button name=button_print value="打印"
				onclick="javascript:print()"> <input type=button
				name=button_show value="打印预览" onclick="javascript:printpreview();">
		</div>

		<table border="1" width="90%" align="center" bordercolor="#000000">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>企业社会责任和信用</center></b><br>
				<br>
			</caption>

			<tr>
				<td align='center' rowspan="3">劳动保护</td>

				<td align='center' height=44>拖欠员工工资</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getLP_ARR_WAGE_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="1"
								checked="checked">有</input>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getLP_ARR_WAGE_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>与员工均签订劳动合同</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getLP_ALL_CONT_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getLP_ALL_CONT_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>办理社会保险</td>
				<td align='center'><c:choose>
						<c:when
							test='<%="1".equals(SZCP_SQ_ZRXY.getLP_SOC_INSRC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="0">无</input>
						</c:when>
						<c:when
							test='<%="0".equals(SZCP_SQ_ZRXY.getLP_SOC_INSRC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>纳税信用</td>
				<td align='center'>涉嫌税法</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getTAX_VOLITE_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getTAX_VOLITE_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>

			<tr>
				<td align='center' height=44 rowspan="2">环境保护</td>
				<td align='center' height=44>生产经营违反环保法律法规</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getECO_OPR_DMG_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getECO_OPR_DMG_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>产品或服务违反环保规定</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getECO_PRO_DMG_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getECO_PRO_DMG_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>

			<tr>
				<td align='center' height=44 rowspan="2">安全生产</td>
				<td align='center' height=44>重大安全事故</td>
				<td align='center'><c:choose>
						<c:when
							test='<%="1".equals(SZCP_SQ_ZRXY.getSP_MAJOR_ACC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="0">无</input>
						</c:when>
						<c:when
							test='<%="0".equals(SZCP_SQ_ZRXY.getSP_MAJOR_ACC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>被安检部门查处</td>
				<td align='center'><c:choose>
						<c:when
							test='<%="1".equals(SZCP_SQ_ZRXY.getSP_ORG_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="0">无</input>
						</c:when>
						<c:when
							test='<%="0".equals(SZCP_SQ_ZRXY.getSP_ORG_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="1">产品质量</td>
				<td align='center'>产品质量违法行为</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getQS_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getQS_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>银行信贷</td>
				<td align='center'>逾期银行贷款</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getBANK_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getBANK_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>海关信用</td>
				<td align='center'>进出口违法行为</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getCSTM_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getCSTM_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
<%-- 			<tr>
				<td align='center' height=44>建筑工程</td>
				<td align='center'>建设工程违法违规行为</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getCE_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getCE_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr> --%>
			<tr>
				<td align='center' height=44 colspan="2">未执行法院裁决、裁定事项</td>
				<td align='center'><%=REPORT_YEAR1%>年: <%=gyjz_last.getLAST_COURT_INVEST_QTY() %> 次 &nbsp;&nbsp; 
					<%=REPORT_YEAR2%>年: <%=gyjz_next.getLAST_COURT_INVEST_QTY() %> 次</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">未执行仲裁机构裁决事项</td>
				<td align='center'><%=REPORT_YEAR1%>年: <%=gyjz_last.getLAST_ARBIT_INVEST() %> 次 &nbsp;&nbsp; 
					<%=REPORT_YEAR2%>年: <%=gyjz_next.getLAST_ARBIT_INVEST() %> 次</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">其他违法违规行为</td>
				<td align='center'><c:choose>
						<c:when
							test='<%="1".equals(SZCP_SQ_ZRXY.getOTHER_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" checked="checked"
								value="1">有</input>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="0">无</input>
						</c:when>
						<c:when
							test='<%="0".equals(SZCP_SQ_ZRXY.getOTHER_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="1">有</input>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr height="44" align="center">
				<td>公益捐赠</td>
				<td>捐赠折合金额</td>
				<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<%=REPORT_YEAR1%>年:&nbsp;<%=gyjz_last.getLAST_DONT_RMB_W() %>万元
						&nbsp;&nbsp;&nbsp;&nbsp;<%=REPORT_YEAR2%>年:&nbsp;<%=gyjz_next.getLAST_DONT_RMB_W() %>万元 
				</td>
			</tr>
		</table>
		<br>
	</form>
	<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
	<iframe height="0" width="0" name="hiddenframe" src="" id="hiddenframe"></iframe>
</body>
</html>