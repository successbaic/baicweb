<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SZCP_SQ_JYGL" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL" />
<jsp:useBean id="SZCP_SQ_JYGL_XS1" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL_XS" />
<jsp:useBean id="SZCP_SQ_JYGL_XS2" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL_XS" />
<jsp:useBean id="SZCP_SXSZ" scope="page" class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" src="<%=request.getContextPath() %>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath() %>/szcp/css/print.css" type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath() %>/szcp/css/NoPrint.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>企业品牌和经营管理</title>
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
	SZCP_SQ_JYGL= SZCP_SQ_JYGL.querySZCP_SQ_JYGL(REG_NO.trim(),YEAR);
	SZCP_SQ_JYGL_XS1 = SZCP_SQ_JYGL_XS1.querySZCP_SQ_JYGL_XS(REG_NO.trim(),YEAR,REPORT_YEAR1);
	SZCP_SQ_JYGL_XS2 = SZCP_SQ_JYGL_XS2.querySZCP_SQ_JYGL_XS(REG_NO.trim(),YEAR,REPORT_YEAR2);
%>
	<!-- form表单 -->
	<form name="form1" method="POST" action="szcp_sq_jygl_action.jsp">
		<input type="hidden" class="noprint" value="<%=CERNO%>" name="CERNO"  id="CERNO">
		<input type="hidden" class="noprint" value="<%=REG_NO%>" name="REG_NO" id="REG_NO"> 
		<input type="hidden" class="noprint" name="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR">
		<input type="hidden" class="noprint" name="REPORT_YEAR1" id="REPORT_YEAR1" value="<%=REPORT_YEAR1 %>">
		<input type="hidden" class="noprint" name="REPORT_YEAR2" id="REPORT_YEAR2" value="<%=REPORT_YEAR2 %>"></form>

		<div style="text-align: right;" class="noprint">
			<input type=button name=button_print value="打印"
				onclick="javascript:print()"> <input type=button
				name=button_show value="打印预览" onclick="javascript:printpreview(1);">
		</div>

		<table border="1" width="90%" align="center" bordercolor="#000000">

			<caption align="center">
				<b> <span style="font-size: 16pt"><center>企业品牌和经营管理</center></b><br>
				<br>
			</caption>
			<tr align='center' height=40 >
				<td >项目\年份</td>
				<td colspan="2"><%=REPORT_YEAR1%>年</td>
				<td colspan="4"><%=REPORT_YEAR2%>年</td>
			</tr>
			<tr>
				<td align='center' height=40 >年末资产总额（万元）</td>
				<td align='center' height=40  colspan="2" ><%=SZCP_SQ_JYGL_XS1.getLAST_ASSET_RMB_W()%></td>
				<td align='center' height=40  colspan="4" ><%=SZCP_SQ_JYGL_XS2.getLAST_ASSET_RMB_W()%></td>
			</tr>

			<tr>
				<td align='center' height=40 >年销售总额（万元）</td>
				<td align="center" colspan="2"><%=SZCP_SQ_JYGL_XS1.getLAST_SALE_RMB_W() %></td>
				<td align="center" colspan="4"><%=SZCP_SQ_JYGL_XS2.getLAST_SALE_RMB_W() %></td>
			</tr>

			<tr align='center'>
				<td align='center'>销售情况</td>
				<td colspan="2">境内销售<u><%=SZCP_SQ_JYGL_XS1.getHOME_SALE_RMB_W() %></u>万元<br>销售<u><%=SZCP_SQ_JYGL_XS1.getCOVER_PROV_QTY() %></u>个省<br>外贸出口<u><%=SZCP_SQ_JYGL_XS1.getOUT_SALE_USD_W()%></u>万美元<br>出口<u><%=SZCP_SQ_JYGL_XS1.getCOVER_AREA_QTY()%></u>个国家（地区）</td>
				<td colspan="4">境内销售<u><%=SZCP_SQ_JYGL_XS2.getHOME_SALE_RMB_W() %></u>万元<br>销售<u><%=SZCP_SQ_JYGL_XS2.getCOVER_PROV_QTY() %></u>个省<br>外贸出口<u><%=SZCP_SQ_JYGL_XS2.getOUT_SALE_USD_W()%></u>万美元<br>出口<u><%=SZCP_SQ_JYGL_XS2.getCOVER_AREA_QTY()%></u>个国家（地区）</td>
				<%-- <td align='center' height=40 >境内销售（万元）</td>
				<td align='center' colspan="2"><%=SZCP_SQ_JYGL_XS1.getHOME_SALE_RMB_W() %></td>
				<td align='center' colspan="2"><%=SZCP_SQ_JYGL_XS2.getHOME_SALE_RMB_W() %></td> --%>
			</tr>


			

			<tr>
				<td align='center' rowspan="4">&nbsp;认证情况</td>
				<td align='center' height=40 >质量认证</td>
				<td align="center" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getQC_FLAG())%>'>
							<input type="radio" disabled ="disabled" name="QC_FLAG" value="1" checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" disabled ="disabled" name="QC_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getQC_FLAG())%>'>
							<input type="radio" disabled ="disabled" name="QC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" disabled ="disabled" name="QC_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"disabled ="disabled" name="QC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="QC_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=40 >环保认证</td>
				<td align="center" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getEC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="EC_FLAG" value="1" checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="EC_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getEC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="EC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="EC_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="EC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="EC_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>

			</tr>
			<tr>
				<td align='center' height=40 >产品认证</td>
				<td align="center" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getPC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="PC_FLAG" value="1" checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="PC_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getPC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="PC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="PC_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="PC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="PC_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=40 >其他认证</td>
				<td align="center" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getOC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="OC_FLAG" value="1" checked="checked"
								id="OC_FLAG">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="OC_FLAG" value="0" id="OC_FLAG">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getOC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="OC_FLAG" value="1" id="OC_FLAG">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="OC_FLAG" value="0"
								checked="checked" id="OC_FLAG">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="OC_FLAG" value="1" id="OC_FLAG">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="OC_FLAG" value="0" id="OC_FLAG">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>

			<tr>
				<td align='center' rowspan="4">知识产权</td>
				<td align="left" height=40  rowspan="3">专利权</td>
				<td align='left' height=40 >发明</td>
				<td align="center"><%=SZCP_SQ_JYGL.getINV_PATE_QTY() %>件</td>
				<td align="left" rowspan="3">商标</td>
				<td align="left">注册商标</td>
				<td align="center"><%=SZCP_SQ_JYGL.getREG_MARK_QTY() %>件</td>
			</tr>

			<tr>
				<td align='left' height=40>实用新型</td>
				<td align="center"><%=SZCP_SQ_JYGL.getUTI_PATE_QTY() %>件</td>
				<td align="left">驰名商标</td>
				<td align="center"><%=SZCP_SQ_JYGL.getWEL_MARK_QTY() %>件</td>
			</tr>

			<tr>
				<td align='left' height=40>外观设计</td>
				<td align="center"><%=SZCP_SQ_JYGL.getDES_PATE_QTY() %>件</td>
				<td align="left">著名商标</td>
				<td align="center"><%=SZCP_SQ_JYGL.getFMS_MARK_QTY() %>件</td>
			</tr>

			<tr>
				<td align='center' height=40  colspan="2">著作权</td>
				<td align="center" colspan="4"><%=SZCP_SQ_JYGL.getCPRT_QTY() %>件</td>
			</tr>

			<tr>
				<td align='center' rowspan="6">经营资质</td>
				<td align='center' height=40  colspan="6">所处行业有无特许资质和许可证
					<c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getIND_QUAL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="1"
								checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getIND_QUAL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td align='center' height=40  colspan="6">本企业是否已取得特许资质和许可证
					<c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getENT_QUAL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="1"
								checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getENT_QUAL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td align='center' height=40 colspan="6">所处行业是否经营资质等级划分
					<c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getQUAL_LEVEL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="1"
								checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getQUAL_LEVEL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td align='left' height=40 colspan="6">本企业资质等级为:<br>
					<c:choose>
						<c:when
							test='<%="0".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="0" checked="checked" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="4" disblank>无
				      			</c:when>
						<c:when
							test='<%="1".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="1" checked="checked" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="4" disblank>无
				      			</c:when>
						<c:when
							test='<%="2".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="2" checked="checked" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="4" disblank>无
				      			</c:when>
						<c:when
							test='<%="3".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="3" checked="checked" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="4" disblank>无
				      			</c:when>
				      			<c:when
							test='<%="4".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="4" checked="checked" disblank>无
				      			</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
			      						<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="资质等级" maxlength=50 value="4" disblank>无
				      			</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<br>
</body>
</html>