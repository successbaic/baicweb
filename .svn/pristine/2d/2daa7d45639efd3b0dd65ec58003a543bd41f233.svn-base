<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SZCP_SQ_JYGL" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL" />
<jsp:useBean id="SZCP_SQ_JYGL_XS1" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL_XS" />
<jsp:useBean id="SZCP_SQ_JYGL_XS2" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL_XS" />
<jsp:useBean id="SZCP_SXSZ" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<jsp:useBean id="createHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>经营管理</title>
<link href="../szcp/css/print.css" rel="stylesheet" type="text/css"
	/ media="print">
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
.jbxx,.htgl,.htlx,.jyxy,.shxy,.shry,.xgzs {
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

.jygl,.jygl,.htgl,.htlx,.jyxy,.shxy,.shry,.xgzs {
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
.jygl a:link {
    color:#ffffff;
    text-decoration:none;
}
.jygl a:visited {
    color:#ffffff;
    text-decoration:none;
}
.jygl a:hover {
    color:#ffffff;
    text-decoration:none;
}
.jygl a:active {
    color:#ffffff;
    text-decoration:none;
}
.jbxx,.htgl,.htlx,.jyxy,.shxy,.shry,.xgzs {
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

.jygl {
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
.form{
	padding: 0;margin: 0;
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
SZCP_SQ_JYGL= SZCP_SQ_JYGL.querySZCP_SQ_JYGL(REG_NO.trim(),YEAR);
SZCP_SQ_JYGL_XS1 = SZCP_SQ_JYGL_XS1.querySZCP_SQ_JYGL_XS(REG_NO.trim(),YEAR,REPORT_YEAR1);
SZCP_SQ_JYGL_XS2 = SZCP_SQ_JYGL_XS2.querySZCP_SQ_JYGL_XS(REG_NO.trim(),YEAR,REPORT_YEAR2);

%>
<%=createHeaderUtil.createHeader(REG_NO,YEAR,CERNO,"2" ,"") %>
	<!-- form表单 -->
	<form class="form" name="form1" method="POST" action="szcp_sq_jygl_action.jsp">
		<input type="hidden" class="noprint" value="<%=CERNO.trim()%>" name="CERNO"  id="CERNO">
		<input type="hidden" class="noprint" value="<%=REG_NO.trim()%>" name="REG_NO" id="REG_NO"> 
		<input type="hidden" class="noprint" name="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR">
		<input type="hidden" class="noprint" name="REPORT_YEAR1" id="REPORT_YEAR1" value="<%=REPORT_YEAR1 %>">
		<input type="hidden" class="noprint" name="REPORT_YEAR2" id="REPORT_YEAR2" value="<%=REPORT_YEAR2 %>">

		<table border="1" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="yxsm" colspan="7" align="center">
					<p style="font-color: #000080;font-size: 11pt;font-weight: bold;">
						<font color=#000080>经营管理</font>
					</p>
				</td>
			</tr>
			
			<tr>
				<td class="lc1" >项目/年度</td>
				<td class="lc1" colspan="3"><%=REPORT_YEAR1%>年</td>
				<td class="lc1" colspan="3"><%=REPORT_YEAR2%>年</td>
			</tr>
			<tr>
				<td class="lc1">年末资产总额（万元）</td>
				<td class="lc2" colspan="3"><input type="text"
					name="LAST_ASSET_RMB_W"
					value="<%=SZCP_SQ_JYGL_XS1.doubleToString(SZCP_SQ_JYGL_XS1.getLAST_ASSET_RMB_W())%>" size="30"
					title="年末资产总额" maxlength=19 id="LAST_ASSET_RMB_W"></input>
				</td>
				<td class="lc2" colspan="3">
					<input type="text" name="LAST_ASSET_RMB_W_TIME"
					value="<%=SZCP_SQ_JYGL_XS1.doubleToString(SZCP_SQ_JYGL_XS2.getLAST_ASSET_RMB_W())%>" size="30"
					title="年末资产总额" maxlength=19 id="LAST_ASSET_RMB_W_TIME"></input>
				</td>
			</tr>
			<tr>
				<td class="lc1" nowrap>年销售总额（万元）</td>
				<td class="lc2" colspan="3"><input type="text"
					name="LAST_SALE_RMB_W"
					value="<%=SZCP_SQ_JYGL_XS1.doubleToString(SZCP_SQ_JYGL_XS1.getLAST_SALE_RMB_W()) %>" size="30"
					title="年销售总额（万元）" maxlength=19 id="LAST_SALE_RMB_W"></input>
				</td>
				<td class="lc2" colspan="3"><input type="text"
					name="LAST_SALE_RMB_W_TIME"
					value="<%=SZCP_SQ_JYGL_XS1.doubleToString(SZCP_SQ_JYGL_XS2.getLAST_SALE_RMB_W()) %>" size="30"
					title="年销售总额（万元）" maxlength=19 id="LAST_SALE_RMB_W_TIME"></input>
				</td>
			</tr>
			<tr >
				<td class="lc1" rowspan="5" >销售情况</td>
			</tr>
			<tr>
				<td class="lc1" >境内销售（万元）</td>
				<td class="lc2" colspan="2"><input type="text"
					name="HOME_SALE_RMB_W"
					value="<%=SZCP_SQ_JYGL_XS1.doubleToString(SZCP_SQ_JYGL_XS1.getHOME_SALE_RMB_W()) %>" size="15"
					title="境内销售（万元）" maxlength=19 id="HOME_SALE_RMB_W" disblank>
				</td>
				<td class="lc2" colspan="3"><input type="text"
					name="HOME_SALE_RMB_W_TIME"
					value="<%=SZCP_SQ_JYGL_XS1.doubleToString(SZCP_SQ_JYGL_XS2.getHOME_SALE_RMB_W()) %>" size="30"
					title="境内销售（万元）" maxlength=19  id="HOME_SALE_RMB_W_TIME" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1" >销售省份（个）</td>
				<td class="lc2" colspan="2"><input type="text"
					name="COVER_PROV_QTY"
					value="<%=SZCP_SQ_JYGL_XS1.getCOVER_PROV_QTY() %>" size="15"
					title="销售省份" maxlength=6 id="COVER_PROV_QTY" disblank>
				</td>
				<td class="lc2" colspan="3"><input type="text"
					name="COVER_PROV_QTY_TIME"
					value="<%=SZCP_SQ_JYGL_XS2.getCOVER_PROV_QTY() %>" size="30"
					title="销售省份" maxlength=6 id="COVER_PROV_QTY_TIME" disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1">外贸出口（万美元）</td>
				<td class="lc2" colspan="2"><input type="text"
					name="OUT_SALE_USD_W" value="<%=SZCP_SQ_JYGL_XS1.doubleToString(SZCP_SQ_JYGL_XS1.getOUT_SALE_USD_W())%>"
					size="15" title="外贸出口（万美元）" maxlength=19 id="OUT_SALE_USD_W"
					disblank>
				</td>
				<td class="lc2" colspan="3"><input type="text"
					name="OUT_SALE_USD_W_TIME" value="<%=SZCP_SQ_JYGL_XS1.doubleToString(SZCP_SQ_JYGL_XS2.getOUT_SALE_USD_W())%>"
					size="30" title="外贸出口（万美元）" maxlength=19 id="OUT_SALE_USD_W_TIME"
					disblank>
				</td>
			</tr>
			<tr>
				<td class="lc1" >出口国家/地区（个）</td>
				<td class="lc2"colspan="2"><input type="text" name="COVER_AREA_QTY"
					value="<%=SZCP_SQ_JYGL_XS1.getCOVER_AREA_QTY()%>" size="15"
					title="出口国家/地区出口国家/地区" maxlength=6 id="COVER_AREA_QTY" disblank>
				</td>
				<td class="lc2"colspan="3"><input type="text" name="COVER_AREA_QTY_TIME"
					value="<%=SZCP_SQ_JYGL_XS2.getCOVER_AREA_QTY()%>" size="30"
					title="出口国家/地区出口国家/地区" maxlength=6 id="COVER_AREA_QTY_TIME" disblank>
				</td>
			</tr>
			<tr>
				<td rowspan="5" class="lc1">&nbsp;认证情况</td>
			</tr>
			<tr>
				<td class="lc1">质量认证</td>
				<td class="lc2" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getQC_FLAG())%>'>
							<input type="radio" name="QC_FLAG" value="1" checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="QC_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getQC_FLAG())%>'>
							<input type="radio" name="QC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="QC_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio" name="QC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio" name="QC_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td class="lc1">环保认证</td>
				<td class="lc2" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getEC_FLAG())%>'>
							<input type="radio" name="EC_FLAG" value="1" checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="EC_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getEC_FLAG())%>'>
							<input type="radio" name="EC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="EC_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio" name="EC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio" name="EC_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>

			</tr>
			<tr>
				<td class="lc1">产品认证</td>
				<td class="lc2" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getPC_FLAG())%>'>
							<input type="radio" name="PC_FLAG" value="1" checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="PC_FLAG" value="0">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getPC_FLAG())%>'>
							<input type="radio" name="PC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="PC_FLAG" value="0"
								checked="checked">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio" name="PC_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio" name="PC_FLAG" value="0">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td class="lc1">其他认证</td>
				<td class="lc2" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getOC_FLAG())%>'>
							<input type="radio" name="OC_FLAG" value="1" checked="checked"
								id="OC_FLAG">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="OC_FLAG" value="0" id="OC_FLAG">无</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getOC_FLAG())%>'>
							<input type="radio" name="OC_FLAG" value="1" id="OC_FLAG">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="OC_FLAG" value="0"
								checked="checked" id="OC_FLAG">无</input>
						</c:when>
						<c:otherwise>
							<input type="radio" name="OC_FLAG" value="1" id="OC_FLAG">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio" name="OC_FLAG" value="0" id="OC_FLAG">无</input>
						</c:otherwise>
					</c:choose></td>
			</tr>

			<tr>
							<td class="lc1" rowspan="4">知识产权</td>
							<td class="lc1" rowspan="3">专利权</td>
							<td class="lc1">发明</td>
							<td class="lc2"><input type="text" name="INV_PATE_QTY"
								value="<%=SZCP_SQ_JYGL.getINV_PATE_QTY() %>" title="发明"
								size="15" maxlength=6 id="INV_PATE_QTY">件</input></td>
							<td class="lc1" rowspan="3">商标</td>
							<td class="lc1">注册商标</td>
							<td class="lc2"><input type="text" name="REG_MARK_QTY"
								value="<%=SZCP_SQ_JYGL.getREG_MARK_QTY() %>" title="注册商标"
								maxlength=6 id="REG_MARK_QTY">件 </input></td>
						</tr>

						<tr>
							<td class="lc1">实用新型</td>
							<td class="lc2"><input type="text" name="UTI_PATE_QTY"
								value="<%=SZCP_SQ_JYGL.getUTI_PATE_QTY() %>" size="15"
								title="实用新型" id="UTI_PATE_QTY" maxlength=6>件 </input></td>
							<td class="lc1">驰名商标</td>
							<td class="lc2"><input type="text" name="WEL_MARK_QTY"
								value="<%=SZCP_SQ_JYGL.getWEL_MARK_QTY() %>" title="驰名商标"
								maxlength=6 id="WEL_MARK_QTY" disblank>件 </input></td>
						</tr>

						<tr>
							<td class="lc1">外观设计</td>
							<td class="lc2"><input type="text" name="DES_PATE_QTY"
								value="<%=SZCP_SQ_JYGL.getDES_PATE_QTY() %>" id="DES_PATE_QTY"
								size="15" title="外观设计" maxlength=6 disblank>件 </input></td>
							<td class="lc1">著名商标</td>
							<td class="lc2"><input type="text" name="FMS_MARK_QTY"
								value="<%=SZCP_SQ_JYGL.getFMS_MARK_QTY() %>" title="著名商标"
								maxlength=6 id="FMS_MARK_QTY" disblank>件 </input></td>
						</tr>

						<tr>
							<td class="lc1" colspan="2">著作权</td>
							<td class="lc2" colspan="4"><input type="text"
								name="CPRT_QTY" value="<%=SZCP_SQ_JYGL.getCPRT_QTY() %>"
								size="15" title="著作权" id="CPRT_QTY" maxlength=6 disblank>件
								</input></td>
						</tr>

			<tr>
							<td rowspan="6" class="lc1">经营资质</td>
						</tr>
						<tr>
							<td class="lc2" colspan="6">所处行业有无特许资质和许可证 <c:choose>
									<c:when test='<%="1".equals(SZCP_SQ_JYGL.getIND_QUAL_FLAG())%>'>
										<input type="radio" name="IND_QUAL_FLAG" value="1"
											checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="IND_QUAL_FLAG" value="0">无</input>
									</c:when>
									<c:when test='<%="0".equals(SZCP_SQ_JYGL.getIND_QUAL_FLAG())%>'>
										<input type="radio" name="IND_QUAL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="IND_QUAL_FLAG" value="0"
											checked="checked">无</input>
									</c:when>
									<c:otherwise>
										<input type="radio" name="IND_QUAL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio" name="IND_QUAL_FLAG" value="0">无</input>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="lc2" colspan="6" >本企业是否已取得特许资质和许可证 <c:choose>
									<c:when test='<%="1".equals(SZCP_SQ_JYGL.getENT_QUAL_FLAG())%>'>
										<input type="radio" name="ENT_QUAL_FLAG" value="1"
											checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="ENT_QUAL_FLAG" value="0">无</input>
									</c:when>
									<c:when test='<%="0".equals(SZCP_SQ_JYGL.getENT_QUAL_FLAG())%>'>
										<input type="radio" name="ENT_QUAL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="ENT_QUAL_FLAG" value="0"
											checked="checked">无</input>
									</c:when>
									<c:otherwise>
										<input type="radio" name="ENT_QUAL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio" name="ENT_QUAL_FLAG" value="0">无</input>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="lc2" colspan="6" >所处行业是否经营资质等级划分 <c:choose>
									<c:when
										test='<%="1".equals(SZCP_SQ_JYGL.getQUAL_LEVEL_FLAG())%>'>
										<input type="radio" name="QUAL_LEVEL_FLAG" value="1"
											checked="checked">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="QUAL_LEVEL_FLAG" value="0">无</input>
									</c:when>
									<c:when
										test='<%="0".equals(SZCP_SQ_JYGL.getQUAL_LEVEL_FLAG())%>'>
										<input type="radio" name="QUAL_LEVEL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="QUAL_LEVEL_FLAG" value="0"
											checked="checked">无</input>
									</c:when>
									<c:otherwise>
										<input type="radio" name="QUAL_LEVEL_FLAG" value="1">有</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio" name="QUAL_LEVEL_FLAG" value="0">无</input>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="lc2"  colspan="6" >本企业资质等级为 <c:choose>
									<c:when
										test='<%="0".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="0" checked="checked"
											disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="4" disblank>无&nbsp;&nbsp;&nbsp;&nbsp;
				      			</c:when>
									<c:when
										test='<%="1".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="1" checked="checked"
											disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="4" disblank>无&nbsp;&nbsp;&nbsp;&nbsp;
				      			</c:when>
									<c:when
										test='<%="2".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="2" checked="checked"
											disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="4" disblank>无&nbsp;&nbsp;&nbsp;&nbsp;
				      			</c:when>
									<c:when
										test='<%="3".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="3" checked="checked"
											disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="4" disblank>无&nbsp;&nbsp;&nbsp;&nbsp;
				      			</c:when>
				      			<c:when
										test='<%="4".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="3" 
											disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15" 
											title="资质等级" maxlength=6 value="4"  checked="checked "disblank>无&nbsp;&nbsp;&nbsp;&nbsp;
				      			</c:when>
									<c:otherwise>
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="0" disblank>特级&nbsp;&nbsp;&nbsp;&nbsp;
			      						<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="1" disblank>一级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="2" disblank>二级&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="3" disblank>三级&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="ENT_QUAL_LEVEL_TYPE" size="15"
											title="资质等级" maxlength=6 value="4" disblank>无&nbsp;&nbsp;&nbsp;&nbsp;
				      			</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table> <br>
					<CENTER class="noprint">
							<div style="display:inline">
								<a  id="printa" ondragstart="return false"
									href="print/szcp_sq_jygl_print.jsp?REG_NO=<%=REG_NO%>&EVAL_YEAR=<%=YEAR %>"
									target="_blank">打印本页</a>
							</div>
						<div class="subImgs" style="display:inline" onclick="doSub()">下一步</div>
					</CENTER>
					</form> 
<script type="text/javascript">

var hkey_root,hkey_path,hkey_key; 
hkey_root="HKEY_CURRENT_USER"; 
hkey_path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"; 
//配置网页打印的页眉页脚为空 
function pagesetup_null(){   
try{ 
    var RegWsh = new ActiveXObject("WScript.Shell");           
    hkey_key="header";           
    RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,""); 
    hkey_key="footer"; 
    RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,""); 
    //&b 第&p页/共&P页 &b 
}catch(e){} 
} 
//配置网页打印的页眉页脚为默认值 
function pagesetup_default(){ 
try{ 
    var RegWsh = new ActiveXObject("WScript.Shell"); 
    hkey_key="header"; 
    RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&w&b页码，&p/&P") 
    hkey_key="footer"; 
    RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&u&b&d"); 
}catch(e){} 
} 
//打印
function print(){
    wb.ExecWB(6,1)
    //wb.execwb(1,1)//打开
    //wb.ExecWB(2,1);//关闭现在所有的IE窗口，并打开一个新窗口
    //wb.ExecWB(4,1)//;保存网页
    //wb.ExecWB(6,1)//打印
    //wb.ExecWB(7,1)//打印预览
    //wb.ExecWB(8,1)//打印页面设置
    //wb.ExecWB(10,1)//查看页面属性
    //wb.ExecWB(15,1)//好像是撤销，有待确认
    //wb.ExecWB(17,1)//全选
    //wb.ExecWB(22,1)//刷新
    //wb.ExecWB(45,1)//关闭窗体无提示
}
function printsetup(){
//  打印页面设置
wb.execwb(8,1);   
}
function printpreview(){
//  打印页面预览
pagesetup_null();
wb.execwb(7,1); 
}

	function doSub() {
	
		var LAST_ASSET_RMB_W = $("#LAST_ASSET_RMB_W").val();
		if(LAST_ASSET_RMB_W == null || LAST_ASSET_RMB_W == "") {
			alert("请输入年末资产总额");
			return;
		}else {
			var flag = fucCheckNUM(LAST_ASSET_RMB_W);
			if(flag== 0) {
				alert("年末资产总额请输入正确的数字格式");
				return
			}else{
				if(LAST_ASSET_RMB_W.indexOf(".") >= 0) {
					var arr = LAST_ASSET_RMB_W.split(".");
					if(arr[1].length > 6) {
						alert("年末资产总额,最多为6位小数");
						return
					}
				}else {
					if(LAST_ASSET_RMB_W.length > 12) {
						alert("年末资产总额,最多输入12位整数");
						return
					}
				}
			}
		}
		
		var LAST_ASSET_RMB_W_TIME = $("#LAST_ASSET_RMB_W_TIME").val();
		if(LAST_ASSET_RMB_W_TIME == null || LAST_ASSET_RMB_W_TIME == "") {
			alert("请输入年末资产总额");
			return;
		}else {
			var flag = fucCheckNUM(LAST_ASSET_RMB_W_TIME);
			if(flag== 0) {
				alert("年末资产总额请输入正确的数字格式");
				return
			}else{
				if(LAST_ASSET_RMB_W_TIME.indexOf(".") >= 0) {
					var arr = LAST_ASSET_RMB_W_TIME.split(".");
					if(arr[1].length > 6) {
						alert("年末资产总额,最多为6位小数");
						return
					}
				}else {
					if(LAST_ASSET_RMB_W_TIME.length > 12) {
						alert("年末资产总额,最多输入12位整数");
						return
					}
				}
			}
		}
		
		var LAST_SALE_RMB_W = $("#LAST_SALE_RMB_W").val();
		if(LAST_SALE_RMB_W == null || LAST_SALE_RMB_W == "") {
			alert("请输入年销售总额");
			return;
		}else {
			var flag = fucCheckNUM(LAST_SALE_RMB_W);
			if(flag== 0) {
				alert("年销售总额请输入正确的数字格式");
				return
			}else{
				if(LAST_SALE_RMB_W.indexOf(".") >= 0) {
					var arr = LAST_SALE_RMB_W.split(".");
					if(arr[1].length > 6) {
						alert("年销售总额,最多为6位小数");
						return
					}
				}else {
					if(LAST_SALE_RMB_W.length > 12 ){
						alert("年销售总额,最多输入12位整数");
						return
					}
				}
			}
		}
		
		var LAST_SALE_RMB_W_TIME  = $("#LAST_SALE_RMB_W_TIME").val();
		if(LAST_SALE_RMB_W_TIME == null || LAST_SALE_RMB_W_TIME == "") {
			alert("请输入年销售总额");
			return;
		}else {
			var flag = fucCheckNUM(LAST_SALE_RMB_W_TIME);
			if(flag== 0) {
				alert("年销售总额请输入正确的数字格式");
				return
			}else{
				if(LAST_SALE_RMB_W_TIME.indexOf(".") >= 0) {
					var arr = LAST_SALE_RMB_W_TIME.split(".");
					if(arr[1].length > 6) {
						alert("年销售总额,最多为6位小数");
						return
					}
				}else {
					if(LAST_SALE_RMB_W_TIME.length > 12 ){
						alert("年销售总额,最多输入12位整数");
						return
					}
				}
			}
		}
		
		
		var HOME_SALE_RMB_W = $("#HOME_SALE_RMB_W").val();
		if(HOME_SALE_RMB_W == null || HOME_SALE_RMB_W == "") {
			alert("请输入境内销售总额");
			return;
		}else {
			var flag = fucCheckNUM(HOME_SALE_RMB_W);
			if(flag== 0) {
				alert("境内销售总额请输入正确的数字格式");
				return
			}else{
				if(HOME_SALE_RMB_W.indexOf(".") >= 0) {
					var arr = HOME_SALE_RMB_W.split(".");
					if(arr[1].length > 6) {
						alert("境内销售总额,最多为6位小数");
						return
					}
				}else {
					if(HOME_SALE_RMB_W.length > 12 ){
						alert("境内销售总额,最多输入12位整数");
						return
					}
				}
			}
		}
		
		var HOME_SALE_RMB_W_TIME = $("#HOME_SALE_RMB_W_TIME").val();
		if(HOME_SALE_RMB_W_TIME == null || HOME_SALE_RMB_W_TIME == "") {
			alert("请输入境内销售总额");
			return;
		}else {
			var flag = fucCheckNUM(HOME_SALE_RMB_W_TIME);
			if(flag== 0) {
				alert("境内销售总额请输入正确的数字格式");
				return
			}else{
				if(HOME_SALE_RMB_W_TIME.indexOf(".") >= 0) {
					var arr = HOME_SALE_RMB_W_TIME.split(".");
					if(arr[1].length > 6) {
						alert("境内销售总额,最多为6位小数");
						return
					}
				}else {
					if(HOME_SALE_RMB_W_TIME.length > 12 ){
						alert("境内销售总额,最多输入12位整数");
						return
					}
				}
			}
		}
		
		
		var COVER_PROV_QTY = $("#COVER_PROV_QTY").val();
		if(COVER_PROV_QTY == null || COVER_PROV_QTY == "") {
			alert("请输入销售省份数");
			return;
		}else {
			var flag = fucCheckInt(COVER_PROV_QTY);
			if(flag== 0) {
				alert("销售省份数请输入正确的数字格式");
				return
			}
		}
		
		var COVER_PROV_QTY_TIME = $("#COVER_PROV_QTY_TIME").val();
		if(COVER_PROV_QTY_TIME == null || COVER_PROV_QTY_TIME == "") {
			alert("请输入销售省份数");
			return;
		}else {
			var flag = fucCheckInt(COVER_PROV_QTY_TIME);
			if(flag== 0) {
				alert("销售省份数请输入正确的数字格式");
				return
			}
		}
		
		
		var OUT_SALE_USD_W = $("#OUT_SALE_USD_W").val();
		if(OUT_SALE_USD_W == null || OUT_SALE_USD_W == "") {
			alert("请输入外贸出口总额");
			return;
		}else {
			var flag = fucCheckNUM(OUT_SALE_USD_W);
			if(flag== 0) {
				alert("外贸出口总额请输入正确的数字格式");
				return
			}else{
				if(OUT_SALE_USD_W.indexOf(".") >= 0) {
					var arr = OUT_SALE_USD_W.split(".");
					if(arr[1].length > 6) {
						alert("外贸出口总额,最多为6位小数");
						return
					}
				}else {
					if(OUT_SALE_USD_W.length > 12 ){
						alert("外贸出口总额,最多输入12位整数");
						return
					}
				}
			}
		}
		
		var OUT_SALE_USD_W_TIME = $("#OUT_SALE_USD_W_TIME").val();
		if(OUT_SALE_USD_W_TIME == null || OUT_SALE_USD_W_TIME == "") {
			alert("请输入外贸出口总额");
			return;
		}else {
			var flag = fucCheckNUM(OUT_SALE_USD_W_TIME);
			if(flag== 0) {
				alert("外贸出口总额请输入正确的数字格式");
				return
			}else{
				if(OUT_SALE_USD_W_TIME.indexOf(".") >= 0) {
					var arr = OUT_SALE_USD_W_TIME.split(".");
					if(arr[1].length > 6) {
						alert("外贸出口总额,最多为6位小数");
						return
					}
				}else {
					if(OUT_SALE_USD_W_TIME.length > 12 ){
						alert("外贸出口总额,最多输入12位整数");
						return
					}
				}
			}
		}
		
		var COVER_AREA_QTY = $("#COVER_AREA_QTY").val();
		if(COVER_AREA_QTY == null || COVER_AREA_QTY == "") {
			alert("请输入出口国家/地区数");
			return;
		}else {
			var flag = fucCheckInt(COVER_AREA_QTY);
			if(flag== 0) {
				alert("出口国家/地区数请输入正确的数字格式");
				return
			}
		}
		
		var COVER_AREA_QTY_TIME = $("#COVER_AREA_QTY_TIME").val();
		if(COVER_AREA_QTY_TIME == null || COVER_AREA_QTY_TIME == "") {
			alert("请输入出口国家/地区数");
			return;
		}else {
			var flag = fucCheckInt(COVER_AREA_QTY_TIME);
			if(flag== 0) {
				alert("出口国家/地区数请输入正确的数字格式");
				return
			}
		}
		

		var val1 = $('input:radio[name="QC_FLAG"]:checked').val();
        if(val1 ==null){
        	alert("请选择有无质量认证");
            return;
        }
		
        var val2 = $('input:radio[name="EC_FLAG"]:checked').val();
        if(val2 ==null){
        	alert("请选择有无环保认证");
            return;
        }
		
        var val3 = $('input:radio[name="PC_FLAG"]:checked').val();
        if(val3 ==null){
        	alert("请选择有无产品认证");
            return;
        }
		
        var val4 = $('input:radio[name="OC_FLAG"]:checked').val();
        if(val4 ==null){
        	alert("请选择有无其他认证");
            return;
        }
		
		var INV_PATE_QTY = $("#INV_PATE_QTY").val();
		if(INV_PATE_QTY == null || INV_PATE_QTY == "") {
			alert("请输入发明专利数");
			return;
		}else {
			var flag = fucCheckInt(INV_PATE_QTY);
			if(flag== 0) {
				alert("发明专利数请输入正确的数字格式");
				return
			}
		}
		var UTI_PATE_QTY = $("#UTI_PATE_QTY").val();
		if(UTI_PATE_QTY == null || UTI_PATE_QTY == "") {
			alert("请输入实用新型专利数");
			return;
		}else {
			var flag = fucCheckInt(UTI_PATE_QTY);
			if(flag== 0) {
				alert("实用新型专利数请输入正确的数字格式");
				return
			}
		}
		var DES_PATE_QTY = $("#DES_PATE_QTY").val();
		if(DES_PATE_QTY == null || DES_PATE_QTY == "") {
			alert("请输入外观设计专利数");
			return;
		}else {
			var flag = fucCheckInt(DES_PATE_QTY);
			if(flag== 0) {
				alert("外观设计专利数请输入正确的数字格式");
				return
			}
		}
		var REG_MARK_QTY = $("#REG_MARK_QTY").val();
		if(REG_MARK_QTY == null || REG_MARK_QTY == "") {
			alert("请输入注册商标数");
			return;
		}else {
			var flag = fucCheckInt(REG_MARK_QTY);
			if(flag== 0) {
				alert("注册商标数请输入正确的数字格式");
				return
			}
		}
		var WEL_MARK_QTY = $("#WEL_MARK_QTY").val();
		if(WEL_MARK_QTY == null || WEL_MARK_QTY == "") {
			alert("请输入驰名商标数");
			return;
		}else {
			var flag = fucCheckInt(WEL_MARK_QTY);
			if(flag== 0) {
				alert("驰名商标数请输入正确的数字格式");
				return
			}
		}
		var FMS_MARK_QTY = $("#FMS_MARK_QTY").val();
		if(FMS_MARK_QTY == null || FMS_MARK_QTY == "") {
			alert("请输入著名商标数");
			return;
		}else {
			var flag = fucCheckInt(FMS_MARK_QTY);
			if(flag== 0) {
				alert("著名商标数请输入正确的数字格式");
				return
			}
		}
		var CPRT_QTY = $("#CPRT_QTY").val();
		if(CPRT_QTY == null || CPRT_QTY == "") {
			alert("请输入著作权数");
			return;
		}else {
			var flag = fucCheckInt(CPRT_QTY);
			if(flag== 0) {
				alert("著作权数请输入正确的数字格式");
				return
			}
		}
		
		var val5 = $('input:radio[name="IND_QUAL_FLAG"]:checked').val();
        if(val5 ==null){
        	alert("请选择所处行业是否要求特许资质");
            return;
        }
		
        var val6 = $('input:radio[name="ENT_QUAL_FLAG"]:checked').val();
        if(val6 ==null){
        	alert("请选择本企业是否具有特许资质");
            return;
        }
        
        var val7 = $('input:radio[name="QUAL_LEVEL_FLAG"]:checked').val();
        if(val7 ==null){
        	alert("请选择所处行业是否划分经营资质等级水平");
            return;
        }
		
        var val8 = $('input:radio[name="ENT_QUAL_LEVEL_TYPE"]:checked').val();
        if(val8 ==null){
        	alert("请选择本企业资质等级水平");
            return;
        }
		
		document.form1.submit();
		alert("保存成功");
	}
	
</script>
</body>
</html>