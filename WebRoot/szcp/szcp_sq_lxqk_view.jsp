<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SZCP_SQ_LXQK_IN_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN" />
<jsp:useBean id="SZCP_SQ_LXQK_IN_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN" />
<jsp:useBean id="SZCP_SQ_LXQK_OUT_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT" />
<jsp:useBean id="SZCP_SQ_LXQK_OUT_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT" />
<jsp:useBean id="SZCP_SQ_LXQK_RATE_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE" />
<jsp:useBean id="SZCP_SQ_LXQK_RATE_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE" />
<jsp:useBean id="SZCP_SXSZ" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<jsp:useBean id="createHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>合同履行</title>
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
.htlx a:link {
    color:#ffffff;
    text-decoration:none;
}
.htlx a:visited {
    color:#ffffff;
    text-decoration:none;
}
.htlx a:hover {
    color:#ffffff;
    text-decoration:none;
}
.htlx a:active {
    color:#ffffff;
    text-decoration:none;
}
.jygl,.htgl,.jbxx,.jyxy,.shxy,.shry,.xgzs {
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

.htlx {
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
</head>
<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">
	<%@include file="top_szcp.inc"%>
	<%
		String REG_NO = request.getParameter("REG_NO");
		String YEAR = request.getParameter("EVAL_YEAR");
		String CERNO = request.getParameter("CerNO");
		SZCP_SXSZ = SZCP_SXSZ.querySZCP_SXSZ(YEAR);
		String REPORT_YEAR1 = SZCP_SXSZ.getREPORT_YEAR1();
		String REPORT_YEAR2 = SZCP_SXSZ.getREPORT_YEAR2();
		SZCP_SQ_LXQK_IN_LAST = SZCP_SQ_LXQK_IN_LAST.querySZCP_SQ_LXQK_IN(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_IN_NEXT = SZCP_SQ_LXQK_IN_NEXT.querySZCP_SQ_LXQK_IN(REG_NO,YEAR,REPORT_YEAR2);
		SZCP_SQ_LXQK_OUT_LAST = SZCP_SQ_LXQK_OUT_LAST.querySZCP_SQ_LXQK_OUT(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_OUT_NEXT = SZCP_SQ_LXQK_OUT_NEXT.querySZCP_SQ_LXQK_OUT(REG_NO,YEAR,REPORT_YEAR2);
		SZCP_SQ_LXQK_RATE_LAST= SZCP_SQ_LXQK_RATE_LAST.querySZCP_SQ_LXQK_RATE(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_RATE_NEXT= SZCP_SQ_LXQK_RATE_NEXT.querySZCP_SQ_LXQK_RATE(REG_NO,YEAR,REPORT_YEAR2);
	%>
	<%=createHeaderUtil.createHeader_view(REG_NO,YEAR,CERNO,"4","") %>
	<!-- form表单 -->
	<form class="form1" name="form1" method="POST" action="szcp_sq_lxqk_action.jsp">
		<input type="hidden" name="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR">
		<input type="hidden" name="REG_NO" value="<%=REG_NO%>" id="REG_NO">
		<input type="hidden" name="REPORT_YEAR1" value="<%=REPORT_YEAR1%>"
			id="REPORT_YEAR1"> <input type="hidden" name="REPORT_YEAR2"
			value="<%=REPORT_YEAR2%>" id="REPORT_YEAR2">


		<table border="1" width="100%" cellpadding="0" cellspacing="0">
			<tr>
		        <td class="yxsm" colspan="8" align="center">
		        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>合同履行</font>
		        </p>
		        </td>
      		</tr>
			<tr>
				<td class="lc1" rowspan="2" colspan="3">项目/年度</td>
				<td class="lc1" colspan="2"><%=REPORT_YEAR1%>年</td>
				<td class="lc1" colspan="2"><%=REPORT_YEAR2%>年</td>
			</tr>
			<tr>
				<td class="lc1">收入性合同</td>
				<td class="lc1">支出性合同</td>
				<td class="lc1">收入性合同</td>
				<td class="lc1">支出性合同</td>
			</tr>
			<tr>
				<td rowspan="2" class="lc1" colspan="2">书面合同总数</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_CONT_QTY_IN_LAST" size="20" title="书面合同总份数"
					maxlength=8 id="TOTAL_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_CONT_QTY_OUT_LAST" size="20" title="书面合同总份数"
					maxlength=8 id="TOTAL_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_CONT_QTY_IN_NEXT" size="20" title="书面合同总份数"
					maxlength=8 id="TOTAL_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_CONT_QTY_OUT_NEXT" size="20" title="书面合同总份数"
					maxlength=8 id="TOTAL_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_CONT_RMB_W_IN_LAST" size="20" title="书面合同总金额"
					maxlength=5 id="TOTAL_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_CONT_RMB_W_OUT_LAST" size="20" title="书面合同总金额"
					maxlength=5 id="TOTAL_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_CONT_RMB_W_IN_NEXT" size="20" title="书面合同总金额"
					maxlength=5 id="TOTAL_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_CONT_RMB_W_OUT_NEXT" size="20" title="书面合同总金额"
					maxlength=5 id="TOTAL_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="lc1" colspan="2">其中：当年签订的书面合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_CONT_QTY_IN_LAST" size="20" title="签订的书面合同份数"
					maxlength=20 id="LAST_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getLAST_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_CONT_QTY_OUT_LAST" size="20" title="签订的书面合同份数"
					maxlength=20 id="LAST_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getLAST_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_CONT_QTY_IN_NEXT" size="20" title="签订的书面合同份数"
					maxlength=20 id="LAST_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getLAST_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_CONT_QTY_OUT_NEXT" size="20" title="签订的书面合同份数"
					maxlength=20 id="LAST_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_CONT_RMB_W_IN_LAST" size="20" title="签订的书面合同金额"
					maxlength=5 id="LAST_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getLAST_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_CONT_RMB_W_OUT_LAST" size="20" title="签订的书面合同金额"
					maxlength=5 id="LAST_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getLAST_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_CONT_RMB_W_IN_NEXT" size="20" title="签订的书面合同金额"
					maxlength=5 id="LAST_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getLAST_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_CONT_RMB_W_OUT_NEXT" size="20" title="签订的书面合同金额"
					maxlength=5 id="LAST_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="lc1" colspan="2">当年应当履行合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="PLAN_CONT_QTY_IN_LAST" size="20" title="应当履行合同份数"
					maxlength=20 id="PLAN_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getPLAN_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="PLAN_CONT_QTY_OUT_LAST" size="20" title="应当履行合同份数"
					maxlength=20 id="PLAN_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getPLAN_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="PLAN_CONT_QTY_IN_NEXT" size="20" title="应当履行合同份数"
					maxlength=20 id="PLAN_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getPLAN_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="PLAN_CONT_QTY_OUT_NEXT" size="20" title="应当履行合同份数"
					maxlength=20 id="PLAN_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getPLAN_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="PLAN_CONT_RMB_W_IN_LAST" size="20" title="应当履行合同金额"
					maxlength=5 id="PLAN_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getPLAN_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="PLAN_CONT_RMB_W_OUT_LAST" size="20" title="应当履行合同金额"
					maxlength=5 id="PLAN_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getPLAN_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="PLAN_CONT_RMB_W_IN_NEXT" size="20" title="应当履行合同金额"
					maxlength=5 id="PLAN_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getPLAN_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="PLAN_CONT_RMB_W_OUT_NEXT" size="20" title="应当履行合同金额"
					maxlength=5 id="PLAN_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getPLAN_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1" rowspan="2" colspan="2">当年实际履行合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="REAL_CONT_QTY_IN_LAST" size="20" title="实际履行合同份数"
					maxlength=20 id="REAL_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getREAL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="REAL_CONT_QTY_OUT_LAST" size="20" title="实际履行合同份数"
					maxlength=20 id="REAL_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getREAL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="REAL_CONT_QTY_IN_NEXT" size="20" title="实际履行合同份数"
					maxlength=20 id="REAL_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getREAL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="REAL_CONT_QTY_OUT_NEXT" size="20" title="实际履行合同份数"
					maxlength=20 id="REAL_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getREAL_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="REAL_CONT_RMB_W_IN_LAST" size="20" title="实际履行合同金额"
					maxlength=5 id="REAL_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getREAL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="REAL_CONT_RMB_W_OUT_LAST" size="20" title="实际履行合同金额"
					maxlength=5 id="REAL_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getREAL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="REAL_CONT_RMB_W_IN_NEXT" size="20" title="实际履行合同金额"
					maxlength=5 id="REAL_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getREAL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="REAL_CONT_RMB_W_OUT_NEXT" size="20" title="实际履行合同金额"
					maxlength=5 id="REAL_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getREAL_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="lc1" colspan="2">撤销合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CANCEL_CONT_QTY_IN_LAST" size="20" title="撤销合同份数"
					maxlength=20 id="CANCEL_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getCANCEL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CANCEL_CONT_QTY_OUT_LAST" size="20" title="撤销合同份数"
					maxlength=20 id="CANCEL_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getCANCEL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CANCEL_CONT_QTY_IN_NEXT" size="20" title="撤销合同份数"
					maxlength=20 id="CANCEL_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getCANCEL_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CANCEL_CONT_QTY_OUT_NEXT" size="20" title="撤销合同份数"
					maxlength=20 id="CANCEL_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getCANCEL_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CANCEL_CONT_RMB_W_IN_LAST" size="20" title="撤销合同金额"
					maxlength=5 id="CANCEL_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getCANCEL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CANCEL_CONT_RMB_W_OUT_LAST" size="20" title="撤销合同金额"
					maxlength=5 id="CANCEL_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getCANCEL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CANCEL_CONT_RMB_W_IN_NEXT" size="20" title="撤销合同金额"
					maxlength=5 id="CANCEL_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getCANCEL_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CANCEL_CONT_RMB_W_OUT_NEXT" size="20" title="撤销合同金额"
					maxlength=5 id="CANCEL_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getCANCEL_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="lc1" colspan="2">协议解除合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="COMP_CONT_QTY_IN_LAST" size="20" title="协议解除合同份数"
					maxlength=20 id="COMP_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getCOMP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="COMP_CONT_QTY_OUT_LAST" size="20" title="协议解除合同份数"
					maxlength=20 id="COMP_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getCOMP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="COMP_CONT_QTY_IN_NEXT" size="20" title="协议解除合同份数"
					maxlength=20 id="COMP_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getCOMP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="COMP_CONT_QTY_OUT_NEXT" size="20" title="协议解除合同份数"
					maxlength=20 id="COMP_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getCOMP_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="COMP_CONT_RMB_W_IN_LAST" size="20" title="协议解除合同金额"
					maxlength=5 id="COMP_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getCOMP_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="COMP_CONT_RMB_W_OUT_LAST" size="20" title="协议解除合同金额"
					maxlength=5 id="COMP_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getCOMP_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="COMP_CONT_RMB_W_IN_NEXT" size="20" title="协议解除合同金额"
					maxlength=5 id="COMP_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getCOMP_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="COMP_CONT_RMB_W_OUT_NEXT" size="20" title="协议解除合同金额"
					maxlength=5 id="COMP_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getCOMP_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="lc1" colspan="2">其他形式解除合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OTHER_CONT_QTY_IN_LAST" size="20" title="其他形式解除合同份数"
					maxlength=20 id="OTHER_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getOTHER_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OTHER_CONT_QTY_OUT_LAST" size="20" title="其他形式解除合同份数"
					maxlength=20 id="OTHER_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getOTHER_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OTHER_CONT_QTY_IN_NEXT" size="20" title="其他形式解除合同份数"
					maxlength=20 id="OTHER_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getOTHER_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OTHER_CONT_QTY_OUT_NEXT" size="20" title="其他形式解除合同份数"
					maxlength=20 id="OTHER_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getOTHER_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OTHER_CONT_RMB_W_IN_LAST" size="20" title="其他形式解除合同金额"
					maxlength=5 id="OTHER_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getOTHER_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OTHER_CONT_RMB_W_OUT_LAST" size="20" title="其他形式解除合同金额"
					maxlength=5 id="OTHER_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getOTHER_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OTHER_CONT_RMB_W_IN_NEXT" size="20" title="其他形式解除合同金额"
					maxlength=5 id="OTHER_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getOTHER_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OTHER_CONT_RMB_W_OUT_NEXT" size="20" title="其他形式解除合同金额"
					maxlength=5 id="OTHER_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getOTHER_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="lc1" colspan="2">变更合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CHANGE_CONT_QTY_IN_LAST" size="20" title="变更合同份数"
					maxlength=20 id="CHANGE_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getCHANGE_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CHANGE_CONT_QTY_OUT_LAST" size="20" title="变更合同份数"
					maxlength=20 id="CHANGE_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getCHANGE_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CHANGE_CONT_QTY_IN_NEXT" size="20" title="变更合同份数"
					maxlength=20 id="CHANGE_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getCHANGE_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CHANGE_CONT_QTY_OUT_NEXT" size="20" title="变更合同份数"
					maxlength=20 id="CHANGE_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getCHANGE_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CHANGE_CONT_RMB_W_IN_LAST" size="20" title="变更合同金额"
					maxlength=5 id="CHANGE_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getCHANGE_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CHANGE_CONT_RMB_W_OUT_LAST" size="20" title="变更合同金额"
					maxlength=5 id="CHANGE_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getCHANGE_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CHANGE_CONT_RMB_W_IN_NEXT" size="20" title="变更合同金额"
					maxlength=5 id="CHANGE_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getCHANGE_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="CHANGE_CONT_RMB_W_OUT_NEXT" size="20" title="变更合同金额"
					maxlength=5 id="CHANGE_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getCHANGE_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="lc1" colspan="2">到期未履行的合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OVERDUE_CONT_QTY_IN_LAST" size="20" title="到期未履行的合同总数"
					maxlength=20 id="OVERDUE_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getOVERDUE_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OVERDUE_CONT_QTY_OUT_LAST" size="20" title="到期未履行的合同总数"
					maxlength=20 id="OVERDUE_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getOVERDUE_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OVERDUE_CONT_QTY_IN_NEXT" size="20" title="到期未履行的合同总数"
					maxlength=20 id="OVERDUE_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getOVERDUE_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OVERDUE_CONT_QTY_OUT_NEXT" size="20" title="到期未履行的合同总数"
					maxlength=20 id="OVERDUE_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getOVERDUE_CONT_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OVERDUE_CONT_RMB_W_IN_LAST" size="20" title="到期未履行的合同金额"
					maxlength=5 id="OVERDUE_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getOVERDUE_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OVERDUE_CONT_RMB_W_OUT_LAST" size="20" title="到期未履行的合同金额"
					maxlength=5 id="OVERDUE_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getOVERDUE_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OVERDUE_CONT_RMB_W_IN_NEXT" size="20" title="到期未履行的合同金额"
					maxlength=5 id="OVERDUE_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getOVERDUE_CONT_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="OVERDUE_CONT_RMB_W_OUT_NEXT" size="20" title="到期未履行的合同金额"
					maxlength=5 id="OVERDUE_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getOVERDUE_CONT_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="6" class="lc1">其中</td>
				<td rowspan="2" class="lc1">本方违约合同</td>
				<td width="5%" class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_OUR_QTY_IN_LAST" size="20" title="本方违约合同总数" maxlength=20
					id="DFT_OUR_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getDFT_OUR_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_OUR_QTY_OUT_LAST" size="20" title="本方违约合同总数" maxlength=20
					id="DFT_OUR_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getDFT_OUR_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_OUR_QTY_IN_NEXT" size="20" title="本方违约合同总数" maxlength=20
					id="DFT_OUR_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getDFT_OUR_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_OUR_QTY_OUT_NEXT" size="20" title="本方违约合同总数" maxlength=20
					id="DFT_OUR_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_OUR_QTY()%>" disblank>
				</td>
			</tr>


			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_OUR_RMB_W_IN_LAST" size="20" title="本方违约合同金额"
					maxlength=5 id="DFT_OUR_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getDFT_OUR_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_OUR_RMB_W_OUT_LAST" size="20" title="本方违约合同金额"
					maxlength=5 id="DFT_OUR_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getDFT_OUR_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_OUR_RMB_W_IN_NEXT" size="20" title="本方违约合同金额"
					maxlength=5 id="DFT_OUR_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getDFT_OUR_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_OUR_RMB_W_OUT_NEXT" size="20" title="本方违约合同金额"
					maxlength=5 id="DFT_OUR_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_OUR_RMB_W()%>" disblank>
				</td>
			</tr>

			<tr>
				<td rowspan="2" class="lc1">对方违约合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_THEY_QTY_IN_LAST" size="20" title="对方违约合同总数" maxlength=20
					id="DFT_THEY_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getDFT_THEY_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_THEY_QTY_OUT_LAST" size="20" title="对方违约合同总数"
					maxlength=20 id="DFT_THEY_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getDFT_THEY_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_THEY_QTY_IN_NEXT" size="20" title="对方违约合同总数" maxlength=20
					id="DFT_THEY_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getDFT_THEY_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_THEY_QTY_OUT_NEXT" size="20" title="对方违约合同总数"
					maxlength=20 id="DFT_THEY_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_THEY_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_THEY_RMB_W_IN_LAST" size="20" title="对方违约合同金额"
					maxlength=5 id="DFT_THEY_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getDFT_THEY_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_THEY_RMB_W_OUT_LAST" size="20" title="对方违约合同金额"
					maxlength=5 id="DFT_THEY_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getDFT_THEY_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_THEY_RMB_W_IN_NEXT" size="20" title="对方违约合同金额"
					maxlength=5 id="DFT_THEY_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getDFT_THEY_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_THEY_RMB_W_OUT_NEXT" size="20" title="对方违约合同金额"
					maxlength=5 id="DFT_THEY_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_THEY_RMB_W()%>" disblank>
				</td>
			</tr>
			<tr>
				<td clas="lc1" rowspan="2" class="lc1">因不可抗力未履行合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_GOD_QTY_IN_LAST" size="20" title="因不可抗力未履行合同总数"
					maxlength=20 id="DFT_GOD_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getDFT_GOD_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_GOD_QTY_OUT_LAST" size="20" title="因不可抗力未履行合同总数"
					maxlength=20 id="DFT_GOD_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getDFT_GOD_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_GOD_QTY_IN_NEXT" size="20" title="因不可抗力未履行合同总数"
					maxlength=20 id="DFT_GOD_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getDFT_GOD_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_GOD_QTY_OUT_NEXT" size="20" title="因不可抗力未履行合同总数"
					maxlength=20 id="DFT_GOD_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_GOD_QTY()%>" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_GOD_RMB_W_IN_LAST" size="20" title="因不可抗力未履行合同金额"
					maxlength=5 id="DFT_GOD_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getDFT_GOD_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_GOD_RMB_W_OUT_LAST" size="20" title="因不可抗力未履行合同金额"
					maxlength=5 id="DFT_GOD_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getDFT_GOD_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_GOD_RMB_W_IN_NEXT" size="20" title="因不可抗力未履行合同金额"
					maxlength=5 id="DFT_GOD_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getDFT_GOD_RMB_W()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="DFT_GOD_RMB_W_OUT_NEXT" size="20" title="因不可抗力未履行合同金额"
					maxlength=5 id="DFT_GOD_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_GOD_RMB_W()%>" disblank>
				</td>
			</tr>

			<tr>
				<td rowspan="2" colspan="2" class="lc1">发生争议合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_DISP_CONT_QTY_IN_LAST" size="20" title="发生争议合同总数"
					maxlength=20 id="LAST_DISP_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getLAST_DISP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_DISP_CONT_QTY_OUT_LAST" size="20" title="发生争议合同总数"
					maxlength=20 id="LAST_DISP_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getLAST_DISP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_DISP_CONT_QTY_IN_NEXT" size="20" title="发生争议合同总数"
					maxlength=20 id="LAST_DISP_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getLAST_DISP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_DISP_CONT_QTY_OUT_NEXT" size="20" title="发生争议合同总数"
					maxlength=20 id="LAST_DISP_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_DISP_CONT_QTY()%>" disblank>
				</td>
			</tr>

			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_DISP_CONT_RMB_W_IN_LAST" size="20" title="发生争议合同金额"
					maxlength=5 id="LAST_DISP_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getLAST_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_DISP_CONT_RMB_W_OUT_LAST" size="20" title="发生争议合同金额"
					maxlength=5 id="LAST_DISP_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getLAST_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_DISP_CONT_RMB_W_IN_NEXT" size="20" title="发生争议合同金额"
					maxlength=5 id="LAST_DISP_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getLAST_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="LAST_DISP_CONT_RMB_W_OUT_NEXT" size="20" title="发生争议合同金额"
					maxlength=5 id="LAST_DISP_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
			</tr>

			<tr>
				<td rowspan="2" style="width: 2%" colspan="2" class="lc1">累计争议合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_DISP_CONT_QTY_IN_LAST" size="20" title="累计争议合同总数"
					maxlength=20 id="TOTAL_DISP_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_DISP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_DISP_CONT_QTY_OUT_LAST" size="20" title="累计争议合同总数"
					maxlength=20 id="TOTAL_DISP_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_DISP_CONT_QTY()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_DISP_CONT_QTY_IN_NEXT" size="20" title="累计争议合同总数"
					maxlength=20 id="TOTAL_DISP_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_DISP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_DISP_CONT_QTY_OUT_NEXT" size="20" title="累计争议合同总数"
					maxlength=20 id="TOTAL_DISP_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_DISP_CONT_QTY()%>"
					disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_DISP_CONT_RMB_W_IN_LAST" size="20" title="累计争议合同金额"
					maxlength=5 id="TOTAL_DISP_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_DISP_CONT_RMB_W_OUT_LAST" size="20" title="累计争议合同金额"
					maxlength=5 id="TOTAL_DISP_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_DISP_CONT_RMB_W_IN_NEXT" size="20" title="累计争议合同金额"
					maxlength=5 id="TOTAL_DISP_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="TOTAL_DISP_CONT_RMB_W_OUT_NEXT" size="20" title="累计争议合同金额"
					maxlength=5 id="TOTAL_DISP_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
			</tr>

			<tr>
				<td rowspan="2" style="width: 2%" colspan="2" class="lc1">解决争议合同</td>
				<td class="lc1">份数（份）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="SOLVE_DISP_CONT_QTY_IN_LAST" size="20" title="书面合同总数"
					maxlength=20 id="SOLVE_DISP_CONT_QTY_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getSOLVE_DISP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="SOLVE_DISP_CONT_QTY_OUT_LAST" size="20" title="书面合同总数"
					maxlength=20 id="SOLVE_DISP_CONT_QTY_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getSOLVE_DISP_CONT_QTY()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="SOLVE_DISP_CONT_QTY_IN_NEXT" size="20" title="书面合同总数"
					maxlength=20 id="SOLVE_DISP_CONT_QTY_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getSOLVE_DISP_CONT_QTY()%>" disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="SOLVE_DISP_CONT_QTY_OUT_NEXT" size="20" title="书面合同总数"
					maxlength=20 id="SOLVE_DISP_CONT_QTY_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getSOLVE_DISP_CONT_QTY()%>"
					disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">金额（万元）</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="SOLVE_DISP_CONT_RMB_W_IN_LAST" size="20" title="书面合同总金额"
					maxlength=5 id="SOLVE_DISP_CONT_RMB_W_IN_LAST"
					value="<%=SZCP_SQ_LXQK_IN_LAST.getSOLVE_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="SOLVE_DISP_CONT_RMB_W_OUT_LAST" size="20" title="书面合同总金额"
					maxlength=5 id="SOLVE_DISP_CONT_RMB_W_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_OUT_LAST.getSOLVE_DISP_CONT_RMB_W()%>">
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="SOLVE_DISP_CONT_RMB_W_IN_NEXT" size="20" title="书面合同总金额"
					maxlength=5 id="SOLVE_DISP_CONT_RMB_W_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_IN_NEXT.getSOLVE_DISP_CONT_RMB_W()%>"
					disblank>
				</td>
				<td class="lc2" style="width: 5%"><input type="text"
					name="SOLVE_DISP_CONT_RMB_W_OUT_NEXT" size="20" title="书面合同总金额"
					maxlength=5 id="SOLVE_DISP_CONT_RMB_W_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_OUT_NEXT.getSOLVE_DISP_CONT_RMB_W()%>">
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">项目/年度</td>
				<td class="lc1" colspan="2"><%=REPORT_YEAR1%>年</td>
				<td class="lc1" colspan="2"><%=REPORT_YEAR2%>年</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">当年收入性合同实际履约率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" style="background-color: gray;"
					name="RECV_PRFM_QTY_RATE_LAST" size="42" title="收入性合同实际履约率"
					maxlength=20 id="RECV_PRFM_QTY_RATE_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getRECV_PRFM_QTY_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" style="background-color: gray;"
					name="RECV_PRFM_QTY_RATE_NEXT" size="42" title="收入性合同实际履约率"
					maxlength=20 id="RECV_PRFM_QTY_RATE_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getRECV_PRFM_QTY_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">当年支出性合同实际履约率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="PAY_PRFM_QTY_RATE_OUT_LAST" size="42"
					title="支出性合同实际履约率" maxlength=20 id="PAY_PRFM_QTY_RATE_OUT_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getPAY_PRFM_QTY_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="PAY_PRFM_QTY_RATE_OUT_NEXT" size="42"
					title="支出性合同实际履约率" maxlength=20 id="PAY_PRFM_QTY_RATE_OUT_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getPAY_PRFM_QTY_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">期末应收款占收入性合同总额比例</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="RECV_AMT_RATE_IN_LAST" size="42"
					title="期末应收款占收入性合同比例" maxlength=20 id="RECV_AMT_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getRECV_AMT_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="RECV_AMT_RATE_IN_NEXT" size="42"
					title="期末应收款占收入性合同比例" maxlength=20 id="RECV_AMT_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getRECV_AMT_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">期末应付款占支出性合同总额比例</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="PAY_AMT_RATE_IN_LAST" size="42"
					title="期末应付款占支出性合同比例" maxlength=20 id="PAY_AMT_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getPAY_AMT_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="PAY_AMT_RATE_IN_NEXT" size="42"
					title="期末应付款占支出性合同比例" maxlength=20 id="PAY_AMT_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getPAY_AMT_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">合同撤销率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="REVOKE_RATE_IN_LAST" size="42" title="合同撤销率"
					maxlength=20 id="REVOKE_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getREVOKE_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="REVOKE_RATE_IN_NEXT" size="42" title="合同撤销率"
					maxlength=20 id="REVOKE_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getREVOKE_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">协议解除合同率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="COMP_RQTE_IN_LAST" size="42" title="协议解除合同率"
					maxlength=20 id="COMP_RQTE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getCOMP_RQTE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="COMP_RQTE_IN_NEXT" size="42" title="协议解除合同率"
					maxlength=20 id="COMP_RQTE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getCOMP_RQTE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">其他形式解除合同率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="OTHER_RATE_IN_LAST" size="42" title="其他形式解除合同率"
					maxlength=20 id="OTHER_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getOTHER_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="OTHER_RATE_IN_NEXT" size="42" title="其他形式解除合同率"
					maxlength=20 id="OTHER_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getOTHER_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">合同变更率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="CHANGE_RATE_IN_LAST" size="42" title="合同变更率"
					maxlength=20 id="CHANGE_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getCHANGE_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="CHANGE_RATE_IN_NEXT" size="42" title="合同变更率"
					maxlength=20 id="CHANGE_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getCHANGE_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">到期未履行的合同比率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="OVERDUE_RATE_IN_LAST" size="42"
					title="到期未履行的合同比率" maxlength=20 id="OVERDUE_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getOVERDUE_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="OVERDUE_RATE_IN_NEXT" size="42"
					title="到期未履行的合同比率" maxlength=20 id="OVERDUE_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getOVERDUE_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" rowspan="3" style="width: 4%">其中</td>
				<td class="lc1" colspan="2">本方违约合同比率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="DFT_OUR_RATE_IN_LAST" size="42" title="本方违约合同比率"
					maxlength=20 id="DFT_OUR_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getDFT_OUR_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="DFT_OUR_RATE_IN_NEXT" size="42" title="本方违约合同比率"
					maxlength=20 id="DFT_OUR_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getDFT_OUR_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="2">对方违约合同比率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="DFT_THEY_RATE_IN_LAST" size="42" title="对方违约合同比率"
					maxlength=20 id="DFT_THEY_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getDFT_THEY_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="DFT_THEY_RATE_IN_NEXT" size="42" title="对方违约合同比率"
					maxlength=20 id="DFT_THEY_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getDFT_THEY_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="2">因不可抗力因素未履行合同比率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="GOD_RATE_IN_LAST" size="42"
					title="因不可抗力因素未履行合同比率" maxlength=20 id="GOD_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getGOD_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="GOD_RATE_IN_NEXT" size="42"
					title="因不可抗力因素未履行合同比率" maxlength=20 id="GOD_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getGOD_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">合同争议率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="DISP_RATE_IN_LAST" size="42" title="合同争议率"
					maxlength=20 id="DISP_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getDISP_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="DISP_RATE_IN_NEXT" size="42" title="合同争议率"
					maxlength=20 id="DISP_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getDISP_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
			<tr>
				<td class="lc1" colspan="3">合同争议解决率</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="SOLVE_RATE_IN_LAST" size="42" title=">合同争议解决率"
					maxlength=20 id="SOLVE_RATE_IN_LAST"
					value="<%=SZCP_SQ_LXQK_RATE_LAST.getSOLVE_RATE()%>"
					readonly="readonly">%</input>
				</td>
				<td class="lc2" style="width: 5%" colspan="2"><input
					type="text" name="SOLVE_RATE_IN_NEXT" size="42" title=">合同争议解决率"
					maxlength=20 id="SOLVE_RATE_IN_NEXT"
					value="<%=SZCP_SQ_LXQK_RATE_NEXT.getSOLVE_RATE()%>"
					readonly="readonly">%</input>
				</td>
			</tr>
		</table>
			<br>
				<CENTER>
				<div style="display:inline">
					<a id="printa"
				href="print/szcp_sq_lxqk_print.jsp?REG_NO=<%=REG_NO%>&EVAL_YEAR=<%=YEAR %>"
				target="_blank">打印本页</a></div>
				
			
			<div class="subImgs" style="display: inline" onclick="view()">
				下一步</div>
		</CENTER>
	</form>
	<%@include file="../bottom.inc"%>
	<script type="text/javascript">
	function view() {
		var regNo = '<%=REG_NO%>';
		var year = '<%=YEAR%>';
		var cerNo = '<%=CERNO%>';
		window.location.href = "szcp_sq_jyxy_view.jsp?REG_NO="+regNo+"&EVAL_YEAR="+year+"&CerNO="+cerNo;
	}	
	function checkNum(NUM) 
	{    
		var i,j,strTemp;
		strTemp="0123456789";
		if ( NUM.length == 0) return 1;
		for (i=0;i<NUM.length;i++) 
		{
			j = strTemp.indexOf(NUM.charAt(i));
			if (j==-1) 
			{
				return false;
			}
		}
		return true;
	}
		
	
	
		function doLastSub() {
			var evalYear = $("#EVAL_YEAR").val();
			var regNo = $("#REG_NO").val();
			window.location.href = "szcp_sq_htgl.jsp?REG_NO=" + regNo
					+ "&EVAL_YEAR=" + evalYear+"&CerNO=<%=CERNO%>";
		}
		function doNextSub() {
			var evalYear = $("#EVAL_YEAR").val();
			var regNo = $("#REG_NO").val();
			window.location.href = "szcp_sq_jyxy.jsp?REG_NO=" + regNo
					+ "&EVAL_YEAR=" + evalYear+"&CerNO=<%=CERNO%>";
		}
		function checkErrors() {
			document.form1.submit();
		}

		function checkError() {
			var a = document.getElementsByTagName('input');
			for(var i = 0;i<a.length;i++){
				if(a[i].value ==""){
					alert("请输入"+a[i].title)	;
					return;
				}else if(a[i].title.indexOf('份数')>0){
					if(!checkNum(a[i].value)){
						alert(a[i].title+"只能输入整数");
						return;
					}
				}else if(isNaN(a[i].value)){
					alert(a[i].title+"只能输入数字")
					return;
				}
			}
			
			var REAL_CONT_QTY_IN_LAST = $("#REAL_CONT_QTY_IN_LAST").val(); // 当年应当履行合同份数
			var PLAN_CONT_QTY_IN_LAST = $("#PLAN_CONT_QTY_IN_LAST").val(); // 当年计划履行合同份数
			var DFT_GOD_QTY_IN_LAST = $("#DFT_GOD_QTY_IN_LAST").val();  // 不可抗力，对方违约份数
			var REAL_CONT_RMB_W_IN_LAST = $("#REAL_CONT_RMB_W_IN_LAST").val(); // 当年实际履行的收入性合同金额
			var PLAN_CONT_RMB_W_IN_LAST = $("#PLAN_CONT_RMB_W_IN_LAST").val(); // 当年应当履行收入性合同金额
			var DFT_GOD_RMB_W_IN_LAST = $("#DFT_GOD_RMB_W_IN_LAST").val();// 不可抗力，对方违约金额
			if(PLAN_CONT_QTY_IN_LAST-DFT_GOD_QTY_IN_LAST == 0 || PLAN_CONT_RMB_W_IN_LAST-DFT_GOD_RMB_W_IN_LAST == 0) {
				$("#RECV_PRFM_QTY_RATE_LAST").val(0);
			}else {
				// 当年收入性合同实际履约率  报告年度1
				var srxhtsjlyl_Last = (REAL_CONT_QTY_IN_LAST/(PLAN_CONT_QTY_IN_LAST-DFT_GOD_QTY_IN_LAST)
				+REAL_CONT_RMB_W_IN_LAST/(PLAN_CONT_RMB_W_IN_LAST-DFT_GOD_RMB_W_IN_LAST))/2*100;
				srxhtsjlyl_Last= toDecimal4(srxhtsjlyl_Last);
				$("#RECV_PRFM_QTY_RATE_LAST").val(srxhtsjlyl_Last);
			}
			
			var REAL_CONT_QTY_IN_NEXT = $("#REAL_CONT_QTY_IN_NEXT").val(); // 当年应当履行合同份数
			var PLAN_CONT_QTY_IN_NEXT = $("#PLAN_CONT_QTY_IN_NEXT").val(); // 当年计划履行合同份数
			var DFT_GOD_QTY_IN_NEXT = $("#DFT_GOD_QTY_IN_NEXT").val();  // 不可抗力，对方违约份数
			var REAL_CONT_RMB_W_IN_NEXT = $("#REAL_CONT_RMB_W_IN_NEXT").val(); // 当年实际履行的收入性合同金额
			var PLAN_CONT_RMB_W_IN_NEXT = $("#PLAN_CONT_RMB_W_IN_NEXT").val(); // 当年应当履行收入性合同金额
			var DFT_GOD_RMB_W_IN_NEXT = $("#DFT_GOD_RMB_W_IN_NEXT").val();// 不可抗力，对方违约金额
			// 当年收入性合同实际履约率  报告年度2
			if(PLAN_CONT_QTY_IN_NEXT-DFT_GOD_QTY_IN_NEXT == 0 || PLAN_CONT_RMB_W_IN_NEXT-DFT_GOD_RMB_W_IN_NEXT == 0) {
				$("#RECV_PRFM_QTY_RATE_NEXT").val(0);
			}else {
				var srxhtsjlyl_Next = (REAL_CONT_QTY_IN_NEXT/(PLAN_CONT_QTY_IN_NEXT-DFT_GOD_QTY_IN_NEXT)
				+REAL_CONT_RMB_W_IN_NEXT/(PLAN_CONT_RMB_W_IN_NEXT-DFT_GOD_RMB_W_IN_NEXT))/2*100;
				srxhtsjlyl_Next = toDecimal4(srxhtsjlyl_Next);
				$("#RECV_PRFM_QTY_RATE_NEXT").val(srxhtsjlyl_Next);
			}
			
			// 当年支出型合同实际履约率  报告年度1
			var REAL_CONT_QTY_OUT_LAST = $("#REAL_CONT_QTY_OUT_LAST").val(); // 当年应当履行合同份数
			var PLAN_CONT_QTY_OUT_LAST = $("#PLAN_CONT_QTY_OUT_LAST").val(); // 当年计划履行合同份数
			var DFT_GOD_QTY_OUT_LAST = $("#DFT_GOD_QTY_OUT_LAST").val();  // 不可抗力，对方违约份数
			var REAL_CONT_RMB_W_OUT_LAST = $("#REAL_CONT_RMB_W_OUT_LAST").val(); // 当年实际履行的收入性合同金额
			var PLAN_CONT_RMB_W_OUT_LAST = $("#PLAN_CONT_RMB_W_OUT_LAST").val(); // 当年应当履行收入性合同金额
			var DFT_GOD_RMB_W_OUT_LAST = $("#DFT_GOD_RMB_W_OUT_LAST").val();// 不可抗力，对方违约金额
			if(PLAN_CONT_QTY_OUT_LAST-DFT_GOD_QTY_OUT_LAST == 0 || PLAN_CONT_RMB_W_OUT_LAST-DFT_GOD_RMB_W_OUT_LAST == 0 ){
				$("#PAY_PRFM_QTY_RATE_OUT_LAST").val(0);
			}else {
				var zcxhtsjlyl_Last = (REAL_CONT_QTY_OUT_LAST/(PLAN_CONT_QTY_OUT_LAST-DFT_GOD_QTY_OUT_LAST)
						+REAL_CONT_RMB_W_OUT_LAST/(PLAN_CONT_RMB_W_OUT_LAST-DFT_GOD_RMB_W_OUT_LAST))/2*100;
				zcxhtsjlyl_Last = toDecimal4(zcxhtsjlyl_Last);
				$("#PAY_PRFM_QTY_RATE_OUT_LAST").val(zcxhtsjlyl_Last);
			}
			
			// 当年支出型合同实际履约率  报告年度2
			var REAL_CONT_QTY_OUT_NEXT = $("#REAL_CONT_QTY_OUT_NEXT").val(); // 当年应当履行合同份数
			var PLAN_CONT_QTY_OUT_NEXT = $("#PLAN_CONT_QTY_OUT_NEXT").val(); // 当年计划履行合同份数
			var DFT_GOD_QTY_OUT_NEXT = $("#DFT_GOD_QTY_OUT_NEXT").val();  // 不可抗力，对方违约份数
			var REAL_CONT_RMB_W_OUT_NEXT = $("#REAL_CONT_RMB_W_OUT_NEXT").val(); // 当年实际履行的收入性合同金额
			var PLAN_CONT_RMB_W_OUT_NEXT = $("#PLAN_CONT_RMB_W_OUT_NEXT").val(); // 当年应当履行收入性合同金额
			var DFT_GOD_RMB_W_OUT_NEXT = $("#DFT_GOD_RMB_W_OUT_NEXT").val();// 不可抗力，对方违约金额
			if(PLAN_CONT_QTY_OUT_NEXT-DFT_GOD_QTY_OUT_NEXT == 0 || PLAN_CONT_RMB_W_OUT_NEXT-DFT_GOD_RMB_W_OUT_NEXT == 0) {
				$("#PAY_PRFM_QTY_RATE_OUT_NEXT").val(0);
			}else {
				var zcxhtsjlyl_Next = (REAL_CONT_QTY_OUT_NEXT/(PLAN_CONT_QTY_OUT_NEXT-DFT_GOD_QTY_OUT_NEXT)
				+REAL_CONT_RMB_W_OUT_NEXT/(PLAN_CONT_RMB_W_OUT_NEXT-DFT_GOD_RMB_W_OUT_NEXT))/2*100;
				zcxhtsjlyl_Next = toDecimal4(zcxhtsjlyl_Next);
				$("#PAY_PRFM_QTY_RATE_OUT_NEXT").val(zcxhtsjlyl_Next);
			}
			
			// 期末应收账款占收入性合同总额比例  报告年度1
			if(PLAN_CONT_RMB_W_IN_LAST == 0) {
				$("#RECV_AMT_RATE_IN_LAST").val(0);
			}else {
				var qmyszkbl_Last = REAL_CONT_RMB_W_IN_LAST/PLAN_CONT_RMB_W_IN_LAST*100;
				qmyszkbl_Last = toDecimal4(qmyszkbl_Last);
				$("#RECV_AMT_RATE_IN_LAST").val(qmyszkbl_Last);
			}
			
			// 期末应付账款占收入性合同总额比例  报告年度2
			if(PLAN_CONT_RMB_W_IN_NEXT == 0) {
				$("#RECV_AMT_RATE_IN_NEXT").val(0);
			}else {
				var qmyszkbl_Next = REAL_CONT_RMB_W_IN_NEXT/PLAN_CONT_RMB_W_IN_NEXT*100;
				qmyszkbl_Next =  toDecimal4(qmyszkbl_Next);
				$("#RECV_AMT_RATE_IN_NEXT").val(qmyszkbl_Last);
			}
			
			
			// 期末应付账款占支出型合同总额比例  报告年度1
			if(PLAN_CONT_RMB_W_OUT_LAST == 0) {
				$("#PAY_AMT_RATE_IN_LAST").val(0);	
			}else {
				var qmyfzkbl_Last = REAL_CONT_RMB_W_OUT_LAST/PLAN_CONT_RMB_W_OUT_LAST*100;
				qmyfzkbl_Last = toDecimal4(qmyfzkbl_Last);
				$("#PAY_AMT_RATE_IN_LAST").val(qmyfzkbl_Last);	
			}
			
			// 期末应付账款占支出型合同总额比例  报告年度2
			if(PLAN_CONT_RMB_W_OUT_NEXT == 0) {
				$("#PAY_AMT_RATE_IN_NEXT").val(0);	
			}else {
				var qmyfzkbl_Next = REAL_CONT_RMB_W_OUT_NEXT/PLAN_CONT_RMB_W_OUT_NEXT*100;
				qmyfzkbl_Next = toDecimal4(qmyfzkbl_Next);
				$("#PAY_AMT_RATE_IN_NEXT").val(qmyfzkbl_Next);	
			}
			
			// 合同撤销率  	// 报告年度1
			var CANCEL_CONT_QTY_IN_LAST = $("#CANCEL_CONT_QTY_IN_LAST").val();
			var CANCEL_CONT_QTY_OUT_LAST = $("#CANCEL_CONT_QTY_OUT_LAST").val();
			var TOTAL_CONT_QTY_IN_LAST = $("#TOTAL_CONT_QTY_IN_LAST").val();
			var TOTAL_CONT_QTY_OUT_LAST = $("#TOTAL_CONT_QTY_OUT_LAST").val();
			
			var CANCEL_CONT_RMB_W_IN_LAST = $("#CANCEL_CONT_RMB_W_IN_LAST").val();
			var CANCEL_CONT_RMB_W_OUT_LAST = $("#CANCEL_CONT_RMB_W_OUT_LAST").val();
			var TOTAL_CONT_RMB_W_IN_LAST = $("#TOTAL_CONT_RMB_W_IN_LAST").val();
			var TOTAL_CONT_RMB_W_OUT_LAST = $("#TOTAL_CONT_RMB_W_OUT_LAST").val();
			
			
			if(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST == 0 || TOTAL_CONT_RMB_W_IN_LAST+TOTAL_CONT_RMB_W_OUT_LAST == 0) {
				$("#REVOKE_RATE_IN_LAST").val(0);
			}else  {
				var htcxl_Last = ((CANCEL_CONT_QTY_IN_LAST+CANCEL_CONT_QTY_OUT_LAST)/(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST)
				+(CANCEL_CONT_RMB_W_IN_LAST*1+CANCEL_CONT_RMB_W_OUT_LAST*1)/(TOTAL_CONT_RMB_W_IN_LAST*1+TOTAL_CONT_RMB_W_OUT_LAST*1))/2*100;
				 htcxl_Last = toDecimal4(htcxl_Last); 
				$("#REVOKE_RATE_IN_LAST").val(htcxl_Last);
			}
			
			// 合同撤销率 报告年度2
			var CANCEL_CONT_QTY_IN_NEXT = $("#CANCEL_CONT_QTY_IN_NEXT").val();
			var CANCEL_CONT_QTY_OUT_NEXT = $("#CANCEL_CONT_QTY_OUT_NEXT").val();
			var TOTAL_CONT_QTY_IN_NEXT = $("#TOTAL_CONT_QTY_IN_NEXT").val();
			var TOTAL_CONT_QTY_OUT_NEXT = $("#TOTAL_CONT_QTY_OUT_NEXT").val();
			
			var CANCEL_CONT_RMB_W_IN_NEXT = $("#CANCEL_CONT_RMB_W_IN_NEXT").val();
			var CANCEL_CONT_RMB_W_OUT_NEXT = $("#CANCEL_CONT_RMB_W_OUT_NEXT").val();
			var TOTAL_CONT_RMB_W_IN_NEXT = $("#TOTAL_CONT_RMB_W_IN_NEXT").val();
			var TOTAL_CONT_RMB_W_OUT_NEXT = $("#TOTAL_CONT_RMB_W_OUT_NEXT").val();
			if(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST == 0 || TOTAL_CONT_RMB_W_IN_LAST+TOTAL_CONT_RMB_W_OUT_LAST == 0) {
				$("#REVOKE_RATE_IN_NEXT").val(0);
			}
			else {
				var htcxl_Next = ((CANCEL_CONT_QTY_IN_LAST+CANCEL_CONT_QTY_OUT_LAST)/(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST)
						+(CANCEL_CONT_RMB_W_IN_LAST*1+CANCEL_CONT_RMB_W_OUT_LAST*1)/(TOTAL_CONT_RMB_W_IN_LAST*1+TOTAL_CONT_RMB_W_OUT_LAST*1))/2*100;
				htcxl_Next =  toDecimal4(htcxl_Next);
				$("#REVOKE_RATE_IN_NEXT").val(htcxl_Next);
			}
			
			// 协议合同解除率   报告年度1
			var COMP_CONT_QTY_IN_LAST = $("#COMP_CONT_QTY_IN_LAST").val();
			var COMP_CONT_QTY_OUT_LAST = $("#COMP_CONT_QTY_OUT_LAST").val();
			var COMP_CONT_RMB_W_IN_LAST = $("#COMP_CONT_RMB_W_IN_LAST").val();
			var COMP_CONT_RMB_W_OUT_LAST = $("#COMP_CONT_RMB_W_OUT_LAST").val();
			if(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST == 0 || TOTAL_CONT_RMB_W_IN_LAST+TOTAL_CONT_RMB_W_OUT_LAST == 0) {
				$("#COMP_RQTE_IN_LAST").val(0);
			}else {
				var xyhtjcl_Last =  ((COMP_CONT_QTY_IN_LAST+COMP_CONT_QTY_OUT_LAST)/(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST)
				+(COMP_CONT_RMB_W_IN_LAST*1+COMP_CONT_RMB_W_OUT_LAST*1)/(TOTAL_CONT_RMB_W_IN_LAST*1+TOTAL_CONT_RMB_W_OUT_LAST*1))/2*100;
				xyhtjcl_Last = toDecimal4(xyhtjcl_Last);	
				$("#COMP_RQTE_IN_LAST").val(xyhtjcl_Last);
			}
			
			
			// 协议合同解除率  报告年度2
			var COMP_CONT_QTY_IN_NEXT = $("#COMP_CONT_QTY_IN_NEXT").val();
			var COMP_CONT_QTY_OUT_NEXT = $("#COMP_CONT_QTY_OUT_NEXT").val();
			var COMP_CONT_RMB_W_IN_NEXT = $("#COMP_CONT_RMB_W_IN_NEXT").val();
			var COMP_CONT_RMB_W_OUT_NEXT = $("#COMP_CONT_RMB_W_OUT_NEXT").val();
			if(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_IN_NEXT == 0 || TOTAL_CONT_RMB_W_IN_NEXT+TOTAL_CONT_RMB_W_OUT_NEXT == 0){
				$("#COMP_RQTE_IN_NEXT").val(0);
			}else {
				var xyhtjcl_Next = ((COMP_CONT_QTY_IN_NEXT+COMP_CONT_QTY_OUT_NEXT)/(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_IN_NEXT)
						+(COMP_CONT_RMB_W_IN_NEXT*1+COMP_CONT_RMB_W_OUT_NEXT*1)/(TOTAL_CONT_RMB_W_IN_NEXT*1+TOTAL_CONT_RMB_W_OUT_NEXT*1))/2*100;
				xyhtjcl_Next = toDecimal4(xyhtjcl_Next);	
				$("#COMP_RQTE_IN_NEXT").val(xyhtjcl_Next);
			}
			
			// 其他形式解除合同率  报告年度1
			var OTHER_CONT_QTY_IN_LAST = $("#OTHER_CONT_QTY_IN_LAST").val();
			var OTHER_CONT_QTY_OUT_LAST = $("#OTHER_CONT_QTY_OUT_LAST").val();
			var OTHER_CONT_RMB_W_IN_LAST = $("#OTHER_CONT_RMB_W_IN_LAST").val();
			var OTHER_CONT_RMB_W_OUT_LAST = $("#OTHER_CONT_RMB_W_OUT_LAST").val();
			if(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST == 0 || TOTAL_CONT_RMB_W_IN_LAST+TOTAL_CONT_RMB_W_OUT_LAST == 0){
				$("#OTHER_RATE_IN_LAST").val(0);
			}else {
				var qtxshtjcl_Last = ((OTHER_CONT_QTY_IN_LAST+OTHER_CONT_QTY_OUT_LAST)/(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST)
						+(OTHER_CONT_RMB_W_IN_LAST*1+OTHER_CONT_RMB_W_OUT_LAST*1)/(TOTAL_CONT_RMB_W_IN_LAST*1+TOTAL_CONT_RMB_W_OUT_LAST*1))/2*100;
				qtxshtjcl_Last = toDecimal4(qtxshtjcl_Last);	
				$("#OTHER_RATE_IN_LAST").val(qtxshtjcl_Last);
			}
			// 其他形式解除合同率  报告年度2
			var OTHER_CONT_QTY_IN_NEXT = $("#OTHER_CONT_QTY_IN_NEXT").val();
			var OTHER_CONT_QTY_OUT_NEXT = $("#OTHER_CONT_QTY_OUT_NEXT").val();
			var OTHER_CONT_RMB_W_IN_NEXT = $("#OTHER_CONT_RMB_W_IN_NEXT").val();
			var OTHER_CONT_RMB_W_OUT_NEXT = $("#OTHER_CONT_RMB_W_OUT_NEXT").val();
			if(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_OUT_NEXT == 0 || TOTAL_CONT_RMB_W_IN_NEXT+TOTAL_CONT_RMB_W_OUT_NEXT == 0){
				$("#OTHER_RATE_IN_NEXT").val(0);
			}else {
				var qtxshtjcl_Next = ((OTHER_CONT_QTY_IN_NEXT+OTHER_CONT_QTY_OUT_NEXT)/(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_OUT_NEXT)
						+(OTHER_CONT_RMB_W_IN_NEXT*1+OTHER_CONT_RMB_W_OUT_NEXT*1)/(TOTAL_CONT_RMB_W_IN_NEXT*1+TOTAL_CONT_RMB_W_OUT_NEXT*1))/2*100;
				qtxshtjcl_Next = toDecimal4(qtxshtjcl_Next);
				$("#OTHER_RATE_IN_NEXT").val(qtxshtjcl_Next);
			}
			
			// 合同变更率  报告年度1
			var CHANGE_CONT_QTY_IN_LAST = $("#CHANGE_CONT_QTY_IN_LAST").val();
			var CHANGE_CONT_QTY_OUT_LAST = $("#CHANGE_CONT_QTY_OUT_LAST").val();
			var CHANGE_CONT_RMB_W_IN_LAST = $("#CHANGE_CONT_RMB_W_IN_LAST").val();
			var CHANGE_CONT_RMB_W_OUT_LAST = $("#CHANGE_CONT_RMB_W_OUT_LAST").val();
			if(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST == 0 || TOTAL_CONT_RMB_W_IN_LAST+TOTAL_CONT_RMB_W_OUT_LAST == 0) {
				$("#CHANGE_RATE_IN_LAST").val(0);
			}else {
				var htbgl_Last = ((CHANGE_CONT_QTY_IN_LAST+CHANGE_CONT_QTY_OUT_LAST)/(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST)
						+(CHANGE_CONT_RMB_W_IN_LAST*1+CHANGE_CONT_RMB_W_OUT_LAST*1)/(TOTAL_CONT_RMB_W_IN_LAST*1+TOTAL_CONT_RMB_W_OUT_LAST*1))/2*100;
				htbgl_Last = toDecimal4(htbgl_Last);
				$("#CHANGE_RATE_IN_LAST").val(htbgl_Last);
			}
			
			// 合同变更率  报告年度2
			var CHANGE_CONT_QTY_IN_NEXT = $("#CHANGE_CONT_QTY_IN_NEXT").val();
			var CHANGE_CONT_QTY_OUT_NEXT = $("#CHANGE_CONT_QTY_OUT_NEXT").val();
			var CHANGE_CONT_RMB_W_IN_NEXT = $("#CHANGE_CONT_RMB_W_IN_NEXT").val();
			var CHANGE_CONT_RMB_W_OUT_NEXT = $("#CHANGE_CONT_RMB_W_OUT_NEXT").val();
			if(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_OUT_NEXT == 0 || TOTAL_CONT_RMB_W_IN_NEXT+TOTAL_CONT_RMB_W_OUT_NEXT == 0) {
				$("#CHANGE_RATE_IN_NEXT").val(0);
			}else {
				var htbgl_Next = ((CHANGE_CONT_QTY_IN_NEXT+CHANGE_CONT_QTY_OUT_NEXT)/(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_OUT_NEXT)
						+(CHANGE_CONT_RMB_W_IN_NEXT*1+CHANGE_CONT_RMB_W_OUT_NEXT*1)/(TOTAL_CONT_RMB_W_IN_NEXT*1+TOTAL_CONT_RMB_W_OUT_NEXT*1))/2*100;
				htbgl_Next = toDecimal4(htbgl_Next);
				$("#CHANGE_RATE_IN_NEXT").val(htbgl_Next);
			}
			
			//到期未履行的合同比率  报告年度1
			var OVERDUE_CONT_QTY_IN_LAST = $("#OVERDUE_CONT_QTY_IN_LAST").val();
			var OVERDUE_CONT_QTY_OUT_LAST = $("#OVERDUE_CONT_QTY_OUT_LAST").val();
			var OVERDUE_CONT_RMB_W_IN_LAST = $("#OVERDUE_CONT_RMB_W_IN_LAST").val();
			var OVERDUE_CONT_RMB_W_OUT_LAST = $("#OVERDUE_CONT_RMB_W_OUT_LAST").val();
			if(PLAN_CONT_QTY_IN_LAST+PLAN_CONT_QTY_OUT_LAST == 0 || PLAN_CONT_RMB_W_IN_LAST+PLAN_CONT_RMB_W_OUT_LAST == 0){
				$("#OVERDUE_RATE_IN_LAST").val(0);
			}else {
				var dqwlxhtbl_Last = ((OVERDUE_CONT_QTY_IN_LAST+OVERDUE_CONT_QTY_OUT_LAST)/(PLAN_CONT_QTY_IN_LAST+PLAN_CONT_QTY_OUT_LAST)
						+(OVERDUE_CONT_RMB_W_IN_LAST*1+OVERDUE_CONT_RMB_W_OUT_LAST*1)/(PLAN_CONT_RMB_W_IN_LAST*1+PLAN_CONT_RMB_W_OUT_LAST*1))/2*100;
				dqwlxhtbl_Last = toDecimal4(dqwlxhtbl_Last);
				$("#OVERDUE_RATE_IN_LAST").val(dqwlxhtbl_Last);
			}
			
			// 到期未履行的合同比率 报告年度2
			var OVERDUE_CONT_QTY_IN_NEXT = $("#OVERDUE_CONT_QTY_IN_NEXT").val();
			var OVERDUE_CONT_QTY_OUT_NEXT = $("#OVERDUE_CONT_QTY_OUT_NEXT").val();
			var OVERDUE_CONT_RMB_W_IN_NEXT = $("#OVERDUE_CONT_RMB_W_IN_NEXT").val();
			var OVERDUE_CONT_RMB_W_OUT_NEXT = $("#OVERDUE_CONT_RMB_W_OUT_NEXT").val();
			if(PLAN_CONT_QTY_IN_NEXT+PLAN_CONT_QTY_OUT_NEXT == 0 || PLAN_CONT_RMB_W_IN_NEXT+PLAN_CONT_RMB_W_OUT_NEXT == 0){
				$("#OVERDUE_RATE_IN_NEXT").val(0);
			}else {
				var dqwlxhtbl_NEXT = ((OVERDUE_CONT_QTY_IN_NEXT+OVERDUE_CONT_QTY_OUT_NEXT)/(PLAN_CONT_QTY_IN_NEXT+PLAN_CONT_QTY_OUT_NEXT)
						+(OVERDUE_CONT_RMB_W_IN_NEXT*1+OVERDUE_CONT_RMB_W_OUT_NEXT*1)/(PLAN_CONT_RMB_W_IN_NEXT*1+PLAN_CONT_RMB_W_OUT_NEXT*1))/2*100;
				dqwlxhtbl_NEXT = toDecimal4(dqwlxhtbl_NEXT);
				$("#OVERDUE_RATE_IN_NEXT").val(dqwlxhtbl_NEXT);
			}
			
			// 本方违约合同比率  报告年度1
			var DFT_OUR_QTY_IN_LAST = $("#DFT_OUR_QTY_IN_LAST").val();
			var DFT_OUR_QTY_OUT_LAST = $("#DFT_OUR_QTY_OUT_LAST").val();
			var DFT_OUR_RMB_W_IN_LAST = $("#DFT_OUR_RMB_W_IN_LAST").val();
			var DFT_OUR_RMB_W_OUT_LAST = $("#DFT_OUR_RMB_W_OUT_LAST").val();
			if(PLAN_CONT_QTY_IN_LAST+PLAN_CONT_QTY_OUT_LAST == 0 || PLAN_CONT_RMB_W_IN_LAST+PLAN_CONT_RMB_W_OUT_LAST == 0){
				$("#DFT_OUR_RATE_IN_LAST").val(0);
			}else {
				var bfwyhtbl_Last = ((DFT_OUR_QTY_IN_LAST+DFT_OUR_QTY_OUT_LAST)/(PLAN_CONT_QTY_IN_LAST+PLAN_CONT_QTY_OUT_LAST)
						+(DFT_OUR_RMB_W_IN_LAST*1+DFT_OUR_RMB_W_OUT_LAST*1)/(PLAN_CONT_RMB_W_IN_LAST*1+PLAN_CONT_RMB_W_OUT_LAST*1))/2*100;
				bfwyhtbl_Last = toDecimal4(bfwyhtbl_Last);
				$("#DFT_OUR_RATE_IN_LAST").val(bfwyhtbl_Last);
			}
			// 本方违约合同比率 报告年度2
			var DFT_OUR_QTY_IN_NEXT = $("#DFT_OUR_QTY_IN_NEXT").val();
			var DFT_OUR_QTY_OUT_NEXT = $("#DFT_OUR_QTY_OUT_NEXT").val();
			var DFT_OUR_RMB_W_IN_NEXT = $("#DFT_OUR_RMB_W_IN_NEXT").val();
			var DFT_OUR_RMB_W_OUT_NEXT = $("#DFT_OUR_RMB_W_OUT_NEXT").val();
			if(PLAN_CONT_QTY_IN_NEXT+PLAN_CONT_QTY_OUT_NEXT == 0 || PLAN_CONT_RMB_W_IN_NEXT+PLAN_CONT_RMB_W_OUT_NEXT == 0){
				$("#DFT_OUR_RATE_IN_NEXT").val(0);
			}else {
				var bfwyhtbl_Next = ((DFT_OUR_QTY_IN_NEXT+DFT_OUR_QTY_OUT_NEXT)/(PLAN_CONT_QTY_IN_NEXT+PLAN_CONT_QTY_OUT_NEXT)
						+(DFT_OUR_RMB_W_IN_NEXT*1+DFT_OUR_RMB_W_OUT_NEXT*1)/(PLAN_CONT_RMB_W_IN_NEXT*1+PLAN_CONT_RMB_W_OUT_NEXT*1))/2*100;
				bfwyhtbl_Next = toDecimal4(bfwyhtbl_Next);
				$("#DFT_OUR_RATE_IN_NEXT").val(bfwyhtbl_Next);
			}
			
			// 对方违约合同比率 报告年度1
			var DFT_THEY_QTY_IN_LAST = $("#DFT_THEY_QTY_IN_LAST").val();
			var DFT_THEY_QTY_OUT_LAST = $("#DFT_THEY_QTY_OUT_LAST").val();
			var DFT_THEY_RMB_W_IN_LAST = $("#DFT_THEY_RMB_W_IN_LAST").val();
			var DFT_THEY_RMB_W_OUT_LAST = $("#DFT_THEY_RMB_W_OUT_LAST").val();
			if(PLAN_CONT_QTY_IN_LAST+PLAN_CONT_QTY_OUT_LAST == 0 || PLAN_CONT_RMB_W_IN_LAST+PLAN_CONT_RMB_W_OUT_LAST == 0) {
				$("#DFT_THEY_RATE_IN_LAST").val(0);
			}else {
				var dfwyhtbl_Last = ((DFT_THEY_QTY_IN_LAST+DFT_THEY_QTY_OUT_LAST)/(PLAN_CONT_QTY_IN_LAST+PLAN_CONT_QTY_OUT_LAST)
						+(DFT_THEY_RMB_W_IN_LAST*1+DFT_THEY_RMB_W_OUT_LAST*1)/(PLAN_CONT_RMB_W_IN_LAST*1+PLAN_CONT_RMB_W_OUT_LAST*1))/2*100;
				dfwyhtbl_Last = toDecimal4(dfwyhtbl_Last);
				$("#DFT_THEY_RATE_IN_LAST").val(dfwyhtbl_Last);
			}
			
			// 对方违约合同比率 报告年度2
			var DFT_THEY_QTY_IN_NEXT = $("#DFT_THEY_QTY_IN_NEXT").val();
			var DFT_THEY_QTY_OUT_NEXT = $("#DFT_THEY_QTY_OUT_NEXT").val();
			var DFT_THEY_RMB_W_IN_NEXT = $("#DFT_THEY_RMB_W_IN_NEXT").val();
			var DFT_THEY_RMB_W_OUT_NEXT = $("#DFT_THEY_RMB_W_OUT_NEXT").val();
			if(PLAN_CONT_QTY_IN_NEXT+PLAN_CONT_QTY_OUT_NEXT == 0 || PLAN_CONT_RMB_W_IN_NEXT+PLAN_CONT_RMB_W_OUT_NEXT == 0) {
				$("#DFT_THEY_RATE_IN_NEXT").val(0);
			}else {
				var dfwyhtbl_Next = ((DFT_THEY_QTY_IN_NEXT+DFT_THEY_QTY_OUT_NEXT)/(PLAN_CONT_QTY_IN_NEXT+PLAN_CONT_QTY_OUT_NEXT)
						+(DFT_THEY_RMB_W_IN_NEXT*1+DFT_THEY_RMB_W_OUT_NEXT*1)/(PLAN_CONT_RMB_W_IN_NEXT*1+PLAN_CONT_RMB_W_OUT_NEXT*1))/2*100;
				dfwyhtbl_Next = toDecimal4(dfwyhtbl_Next);
				$("#DFT_THEY_RATE_IN_NEXT").val(dfwyhtbl_Next);
			}
			
			// 因不可抗力因素未履行的合同比率  报告年度1
			var  DFT_GOD_QTY_IN_LAST = $("#DFT_GOD_QTY_IN_LAST").val();
			var DFT_GOD_QTY_OUT_LAST = $("#DFT_GOD_QTY_OUT_LAST").val();
			var DFT_GOD_RMB_W_IN_LAST = $("#DFT_GOD_RMB_W_IN_LAST").val();
			var DFT_GOD_RMB_W_OUT_LAST = $("#DFT_GOD_RMB_W_OUT_LAST").val();
			if(PLAN_CONT_QTY_IN_LAST+PLAN_CONT_QTY_OUT_LAST == 0 || PLAN_CONT_RMB_W_IN_LAST+PLAN_CONT_RMB_W_OUT_LAST == 0) {
				$("#GOD_RATE_IN_LAST").val(0);
			}else {
				var bkklysbl_Last = ((DFT_GOD_QTY_IN_LAST+DFT_GOD_QTY_OUT_LAST)/(PLAN_CONT_QTY_IN_LAST+PLAN_CONT_QTY_OUT_LAST)
						+(DFT_GOD_RMB_W_IN_LAST*1+DFT_GOD_RMB_W_OUT_LAST*1)/(PLAN_CONT_RMB_W_IN_LAST*1+PLAN_CONT_RMB_W_OUT_LAST*1))/2*100;
				bkklysbl_Last = toDecimal4(bkklysbl_Last);
				$("#GOD_RATE_IN_LAST").val(bkklysbl_Last);
			}
			// 因不可抗力因素未履行的合同比率  报告年度2
			var  DFT_GOD_QTY_IN_NEXT = $("#DFT_GOD_QTY_IN_NEXT").val();
			var DFT_GOD_QTY_OUT_NEXT = $("#DFT_GOD_QTY_OUT_NEXT").val();
			var DFT_GOD_RMB_W_IN_NEXT = $("#DFT_GOD_RMB_W_IN_NEXT").val();
			var DFT_GOD_RMB_W_OUT_NEXT = $("#DFT_GOD_RMB_W_OUT_NEXT").val();
			if(PLAN_CONT_QTY_IN_NEXT+PLAN_CONT_QTY_OUT_NEXT == 0 || PLAN_CONT_RMB_W_IN_NEXT+PLAN_CONT_RMB_W_OUT_NEXT == 0) {
				$("#GOD_RATE_IN_NEXT").val(0);
			}else {
				var bkklysbl_Next = ((DFT_GOD_QTY_IN_NEXT+DFT_GOD_QTY_OUT_NEXT)/(PLAN_CONT_QTY_IN_NEXT+PLAN_CONT_QTY_OUT_NEXT)
						+(DFT_GOD_RMB_W_IN_NEXT*1+DFT_GOD_RMB_W_OUT_NEXT*1)/(PLAN_CONT_RMB_W_IN_NEXT*1+PLAN_CONT_RMB_W_OUT_NEXT*1))/2*100;
				bkklysbl_Next = toDecimal4(bkklysbl_Next);
				$("#GOD_RATE_IN_NEXT").val(bkklysbl_Next);
			}
			
			// 合同争议率  报告年度1
			var LAST_DISP_CONT_QTY_IN_LAST = $("#LAST_DISP_CONT_QTY_IN_LAST").val();
			var LAST_DISP_CONT_QTY_OUT_LAST = $("#LAST_DISP_CONT_QTY_OUT_LAST").val();
			var LAST_DISP_CONT_RMB_W_IN_LAST = $("#LAST_DISP_CONT_RMB_W_IN_LAST").val();
			var LAST_DISP_CONT_RMB_W_OUT_LAST = $("#LAST_DISP_CONT_RMB_W_OUT_LAST").val();
			if(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST == 0 || TOTAL_CONT_RMB_W_IN_LAST+TOTAL_CONT_RMB_W_OUT_LAST == 0) {
				$("#DISP_RATE_IN_LAST").val(0);
			}else {
				var htzyl_Last = ((LAST_DISP_CONT_QTY_IN_LAST+LAST_DISP_CONT_QTY_OUT_LAST)/(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST)
						+(LAST_DISP_CONT_RMB_W_IN_LAST*1+LAST_DISP_CONT_RMB_W_OUT_LAST*1)/(TOTAL_CONT_RMB_W_IN_LAST*1+TOTAL_CONT_RMB_W_OUT_LAST*1))/2*100;
				htzyl_Last  = toDecimal4(htzyl_Last);
				$("#DISP_RATE_IN_LAST").val(htzyl_Last);
			}
			
			// 合同争议率 报告年度2
			var LAST_DISP_CONT_QTY_IN_NEXT = $("#LAST_DISP_CONT_QTY_IN_NEXT").val();
			var LAST_DISP_CONT_QTY_OUT_NEXT= $("#LAST_DISP_CONT_QTY_OUT_NEXT").val();
			var LAST_DISP_CONT_RMB_W_IN_NEXT = $("#LAST_DISP_CONT_RMB_W_IN_NEXT").val();
			var LAST_DISP_CONT_RMB_W_OUT_NEXT = $("#LAST_DISP_CONT_RMB_W_OUT_NEXT").val();
			if(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_OUT_NEXT == 0 || TOTAL_CONT_RMB_W_IN_NEXT+TOTAL_CONT_RMB_W_OUT_NEXT == 0){
				$("#DISP_RATE_IN_NEXT").val(0);
			}else {
				var htzyl_Next = ((LAST_DISP_CONT_QTY_IN_NEXT+LAST_DISP_CONT_QTY_OUT_NEXT)/(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_OUT_NEXT)
						+(LAST_DISP_CONT_RMB_W_IN_NEXT*1+LAST_DISP_CONT_RMB_W_OUT_NEXT*1)/(TOTAL_CONT_RMB_W_IN_NEXT*1+TOTAL_CONT_RMB_W_OUT_NEXT*1))/2*100;
				htzyl_Next = toDecimal4(htzyl_Next);
				$("#DISP_RATE_IN_NEXT").val(htzyl_Next);
			}
			
			// 合同争议解决率 报告年度1
			var SOLVE_DISP_CONT_QTY_IN_LAST = $("#SOLVE_DISP_CONT_QTY_IN_LAST").val();
			var SOLVE_DISP_CONT_QTY_OUT_LAST= $("#SOLVE_DISP_CONT_QTY_OUT_LAST").val();
			var SOLVE_DISP_CONT_RMB_W_IN_LAST = $("#SOLVE_DISP_CONT_RMB_W_IN_LAST").val();
			var SOLVE_DISP_CONT_RMB_W_OUT_LAST = $("#SOLVE_DISP_CONT_RMB_W_OUT_LAST").val();
			if(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST == 0 || TOTAL_CONT_RMB_W_IN_LAST+TOTAL_CONT_RMB_W_OUT_LAST == 0 ) {
				$("#SOLVE_RATE_IN_LAST").val(0);
			}else {
				var htzyjjl_Last = ((SOLVE_DISP_CONT_QTY_IN_LAST+SOLVE_DISP_CONT_QTY_OUT_LAST)/(TOTAL_CONT_QTY_IN_LAST+TOTAL_CONT_QTY_OUT_LAST)
						+(SOLVE_DISP_CONT_RMB_W_IN_LAST*1+SOLVE_DISP_CONT_RMB_W_OUT_LAST*1)/(TOTAL_CONT_RMB_W_IN_LAST*1+TOTAL_CONT_RMB_W_OUT_LAST*1))/2*100;
				htzyjjl_Last =  toDecimal4(htzyjjl_Last);
				$("#SOLVE_RATE_IN_LAST").val(htzyjjl_Last);
			}
			// 合同争议解决率 报告年度2
			var SOLVE_DISP_CONT_QTY_IN_NEXT = $("#SOLVE_DISP_CONT_QTY_IN_NEXT").val();
			var SOLVE_DISP_CONT_QTY_OUT_NEXT= $("#SOLVE_DISP_CONT_QTY_OUT_NEXT").val();
			var SOLVE_DISP_CONT_RMB_W_IN_NEXT = $("#SOLVE_DISP_CONT_RMB_W_IN_NEXT").val();
			var SOLVE_DISP_CONT_RMB_W_OUT_NEXT = $("#SOLVE_DISP_CONT_RMB_W_OUT_NEXT").val();
			if(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_OUT_NEXT == 0 || TOTAL_CONT_RMB_W_IN_NEXT+TOTAL_CONT_RMB_W_OUT_NEXT == 0) {
				$("#SOLVE_RATE_IN_NEXT").val(0);
			}else {
				var htzyjjl_Next = ((SOLVE_DISP_CONT_QTY_IN_NEXT+SOLVE_DISP_CONT_QTY_OUT_NEXT)/(TOTAL_CONT_QTY_IN_NEXT+TOTAL_CONT_QTY_OUT_NEXT)
						+(SOLVE_DISP_CONT_RMB_W_IN_NEXT*1+SOLVE_DISP_CONT_RMB_W_OUT_NEXT*1)/(TOTAL_CONT_RMB_W_IN_NEXT*1+TOTAL_CONT_RMB_W_OUT_NEXT*1))/2*100;
				htzyjjl_Next =  toDecimal4(htzyjjl_Next);
				$("#SOLVE_RATE_IN_NEXT").val(htzyjjl_Next);
			}
			
			var flag = confirm("合同比率已经计算完毕，请核对后再确定！");
			if (flag) {
				document.form1.submit();
				alert("保存成功");
			}
		}
		function toDecimal4(x) {
 				var f = parseFloat(x);
			if (isNaN(f)) {
				return false;
			}
			var f = Math.round(x * 100) / 100;
			var s = f.toString();
			var rs = s.indexOf('.');
			if (rs < 0) {
				rs = s.length;
				s += '.';
			}
			while (s.length <= rs + 4) {
				s += '0';
			}
			return s;
		}
	</script>
</body>
</html>