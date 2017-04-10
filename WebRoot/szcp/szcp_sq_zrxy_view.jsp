<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" /> 		
<jsp:useBean id="SZCP_SQ_ZRXY" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_ZRXY" />
<jsp:useBean id="gyjz_last" scope="page" 
	class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ"/>
<jsp:useBean id="gyjzdao" scope="page" 
	class="com.macrosoft.icms.szcp.dao.SZCP_SQ_GYJZDao"/>
<jsp:useBean id="gyjz_next" scope="page" 
	class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ"/>
<jsp:useBean id="SZCP_SXSZ" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
	<jsp:useBean id="createHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>社会信用</title>
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
.shxy a:link {
    color:#ffffff;
    text-decoration:none;
}
.shxy a:visited {
    color:#ffffff;
    text-decoration:none;
}
.shxy a:hover {
    color:#ffffff;
    text-decoration:none;
}
.shxy a:active {
    color:#ffffff;
    text-decoration:none;
}
.jygl,.htgl,.htlx,.jyxy,.jbxx,.shry,.xgzs {
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

.shxy {
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
gyjz_last = gyjzdao.querySZCP_SQ_GYJZ(REG_NO,YEAR,REPORT_YEAR1);
gyjz_next = gyjzdao.querySZCP_SQ_GYJZ(REG_NO,YEAR,REPORT_YEAR2);
SZCP_SQ_ZRXY= SZCP_SQ_ZRXY.querySZCP_SQ_ZRXY(REG_NO,YEAR);
%>
<%=createHeaderUtil.createHeader_view(REG_NO,YEAR,CERNO,"6","") %>
<!-- form表单 -->
<form class="form1" name="form1" method="POST"  id="form1"action="szcp_sq_zrxy_action.jsp">
	<input type="hidden" value="<%=REG_NO %>" name="REG_NO" id="REG_NO">
	<input type="hidden" name ="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR">
	<input type="hidden" name ="REPORT_YEAR1" value="<%=REPORT_YEAR1%>" id="REPORT_YEAR1">
	<input type="hidden" name ="REPORT_YEAR2" value="<%=REPORT_YEAR2%>" id="REPORT_YEAR2">			

				
	<table border="1" width="100%" cellpadding="0" cellspacing="0">
		<tr>
        <td class="yxsm" colspan="3" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>社会信用</font>
        </p>
        </td>
      </tr>
			<tr>
				<td class="lc1"  rowspan="3" style="10" >劳动保护</td>
				<td class="lc1"  >拖欠员工工资</td>    
				<td class="lc2"  style="20">
						&nbsp;&nbsp;
		      			<c:choose>
		      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getLP_ARR_WAGE_FLAG())%>'>
		      					<input type="radio" name="LP_ARR_WAGE_FLAG"  value="1" checked="checked" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="LP_ARR_WAGE_FLAG"   value="0" >无</input>
		      			</c:when>
		      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getLP_ARR_WAGE_FLAG())%>'>
		      					<input type="radio" name="LP_ARR_WAGE_FLAG"   value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="LP_ARR_WAGE_FLAG"   value="0"checked="checked" >无</input>
		      			</c:when>
		      			<c:otherwise>
	      						<input type="radio" name="LP_ARR_WAGE_FLAG"  value="1"  >有</input>&nbsp;&nbsp;
      							<input type="radio" name="LP_ARR_WAGE_FLAG"  value="0"  >无</input>
		      			</c:otherwise>
		      			</c:choose>
		      		</td>
			 </tr>
			 <tr>
				<td class="lc1">与员工均签订劳动合同</td>    
				<td class="lc2"  style="20">
						&nbsp;&nbsp;
		      			<c:choose>
		      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getLP_ALL_CONT_FLAG())%>'>
		      					<input type="radio" name="LP_ALL_CONT_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="LP_ALL_CONT_FLAG"   value="0" >无</input>
		      			</c:when>
		      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getLP_ALL_CONT_FLAG())%>'>
		      					<input type="radio" name="LP_ALL_CONT_FLAG"   value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="LP_ALL_CONT_FLAG"   value="0" checked="checked"  >无</input>
		      			</c:when>
		      			<c:otherwise>
	      						<input type="radio" name="LP_ALL_CONT_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
      							<input type="radio" name="LP_ALL_CONT_FLAG"   value="0"  >无</input>
		      			</c:otherwise>
		      			</c:choose>
		      		</td>
			 </tr>
			 <tr>
				<td class="lc1" style="40%" >办理社会保险</td>    
				<td class="lc2"  style="20">
						&nbsp;&nbsp;
		      			<c:choose>
		      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getLP_SOC_INSRC_FLAG())%>'>
		      					<input type="radio" name="LP_SOC_INSRC_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="LP_SOC_INSRC_FLAG"   value="0" >无</input>
		      			</c:when>
		      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getLP_SOC_INSRC_FLAG())%>'>
		      					<input type="radio" name="LP_SOC_INSRC_FLAG"   value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="LP_SOC_INSRC_FLAG"   value="0" checked="checked" >无</input>
		      			</c:when>
		      			<c:otherwise>
	      						<input type="radio" name="LP_SOC_INSRC_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
      							<input type="radio" name="LP_SOC_INSRC_FLAG"   value="0"  >无</input>
		      			</c:otherwise>
		      			</c:choose>
		      		</td>
			 </tr>
			<tr>
				<td class="lc1"  style="10" >纳税信用</td>
				<td class="lc1">涉嫌税法</td>    
						<td class="lc2"  style="20">
								&nbsp;&nbsp;
				      			<c:choose>
				      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getTAX_VOLITE_FLAG())%>'>
				      					<input type="radio" name="TAX_VOLITE_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
				      					<input type="radio" name="TAX_VOLITE_FLAG"   value="0" >无</input>
				      			</c:when>
				      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getTAX_VOLITE_FLAG())%>'>
				      					<input type="radio" name="TAX_VOLITE_FLAG"   value="1" >有</input>&nbsp;&nbsp;
				      					<input type="radio" name="TAX_VOLITE_FLAG"   value="0" checked="checked"  >无</input>
				      			</c:when>
				      			<c:otherwise>
			      						<input type="radio" name="TAX_VOLITE_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
		      							<input type="radio" name="TAX_VOLITE_FLAG"   value="0"  >无</input>
				      			</c:otherwise>
				      			</c:choose>
				      		</td>
			</tr>
			<tr>
				<td class="lc1"  rowspan="2" style="10" >环境保护</td>
				<td class="lc1" >生产经营违反环保法律法规</td>    
				<td class="lc2"  style="20">
						&nbsp;&nbsp;
		      			<c:choose>
		      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getECO_OPR_DMG_FLAG())%>'>
		      					<input type="radio" name="ECO_OPR_DMG_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="ECO_OPR_DMG_FLAG"   value="0" >无</input>
		      			</c:when>
		      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getECO_OPR_DMG_FLAG())%>'>
		      					<input type="radio" name="ECO_OPR_DMG_FLAG"   value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="ECO_OPR_DMG_FLAG"   value="0" checked="checked" >无</input>
		      			</c:when>
		      			<c:otherwise>
	      						<input type="radio" name="ECO_OPR_DMG_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
      							<input type="radio" name="ECO_OPR_DMG_FLAG"   value="0"  >无</input>
		      			</c:otherwise>
		      			</c:choose>
		      		</td>
			</tr>
			<tr>
				<td class="lc1"  >产品或服务违反环保规定</td>    
				<td class="lc2"  style="20">
						&nbsp;&nbsp;
		      			<c:choose>
		      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getECO_PRO_DMG_FLAG())%>'>
		      					<input type="radio" name="ECO_PRO_DMG_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="ECO_PRO_DMG_FLAG"   value="0" >无</input>
		      			</c:when>
		      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getECO_PRO_DMG_FLAG())%>'>
		      					<input type="radio" name="ECO_PRO_DMG_FLAG"   value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="ECO_PRO_DMG_FLAG"   value="0" checked="checked"  >无</input>
		      			</c:when>
		      			<c:otherwise>
	      						<input type="radio" name="ECO_PRO_DMG_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
      							<input type="radio" name="ECO_PRO_DMG_FLAG"   value="0"  >无</input>
		      			</c:otherwise>
		      			</c:choose>
		      		</td>
			</tr>
			
			<tr>
				<td class="lc1" rowspan="2" style="10" >安全生产</td>
				<td class="lc1"  >重大安全事故</td>    
				<td class="lc2"  style="20">
						&nbsp;&nbsp;
		      			<c:choose>
		      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getSP_MAJOR_ACC_FLAG())%>'>
		      					<input type="radio" name="SP_MAJOR_ACC_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="SP_MAJOR_ACC_FLAG"   value="0" >无</input>
		      			</c:when>
		      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getSP_MAJOR_ACC_FLAG())%>'>
		      					<input type="radio" name="SP_MAJOR_ACC_FLAG"   value="1" >有</input>&nbsp;&nbsp;
		      					<input type="radio" name="SP_MAJOR_ACC_FLAG"   value="0" checked="checked"  >无</input>
		      			</c:when>
		      			<c:otherwise>
	      						<input type="radio" name="SP_MAJOR_ACC_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
      							<input type="radio" name="SP_MAJOR_ACC_FLAG"   value="0"  >无</input>
		      			</c:otherwise>
		      			</c:choose>
		      	</td>
				</tr>
				<tr>
					<td class="lc1" >被安检部门查处</td>    
					<td class="lc2"  style="20">
							&nbsp;&nbsp;
			      			<c:choose>
			      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getSP_ORG_INVEST_FLAG())%>'>
			      					<input type="radio" name="SP_ORG_INVEST_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
			      					<input type="radio" name="SP_ORG_INVEST_FLAG"   value="0" >无</input>
			      			</c:when>
			      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getSP_ORG_INVEST_FLAG())%>'>
			      					<input type="radio" name="SP_ORG_INVEST_FLAG"   value="1" >有</input>&nbsp;&nbsp;
			      					<input type="radio" name="SP_ORG_INVEST_FLAG"   value="0" checked="checked" >无</input>
			      			</c:when>
			      			<c:otherwise>
		      						<input type="radio" name="SP_ORG_INVEST_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
	      							<input type="radio" name="SP_ORG_INVEST_FLAG"   value="0"  >无</input>
			      			</c:otherwise>
			      			</c:choose>
			      		</td>
				</tr>
				<tr>
				<td class="lc1"  style="10">产品质量</td>
				<td class="lc1" style="10%" >产品质量违法行为</td>    
						<td class="lc2"  style="20">
								&nbsp;&nbsp;
				      			<c:choose>
				      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getQS_INVEST_FLAG())%>'>
				      					<input type="radio" name="QS_INVEST_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
				      					<input type="radio" name="QS_INVEST_FLAG"   value="0" >无</input>
				      			</c:when>
				      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getQS_INVEST_FLAG())%>'>
				      					<input type="radio" name="QS_INVEST_FLAG"   value="1" >有</input>&nbsp;&nbsp;
				      					<input type="radio" name="QS_INVEST_FLAG"   value="0" checked="checked" >无</input>
				      			</c:when>
				      			<c:otherwise>
			      						<input type="radio" name="QS_INVEST_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
		      							<input type="radio" name="QS_INVEST_FLAG"   value="0"  >无</input>
				      			</c:otherwise>
				      			</c:choose>
				      		</td>
			</tr>
			<tr>
				<td class="lc1"  style="10">银行信贷</td>
				<td class="lc1" style="10%" >逾期银行贷款</td>    
						<td class="lc2"  style="20">
								&nbsp;&nbsp;
				      			<c:choose>
				      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getBANK_INVEST_FLAG())%>'>
				      					<input type="radio" name="BANK_INVEST_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
				      					<input type="radio" name="BANK_INVEST_FLAG"   value="0" >无</input>
				      			</c:when>
				      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getBANK_INVEST_FLAG())%>'>
				      					<input type="radio" name="BANK_INVEST_FLAG"   value="1" >有</input>&nbsp;&nbsp;
				      					<input type="radio" name="BANK_INVEST_FLAG"   value="0" checked="checked" >无</input>
				      			</c:when>
				      			<c:otherwise>
			      						<input type="radio" name="BANK_INVEST_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
		      							<input type="radio" name="BANK_INVEST_FLAG"   value="0"  >无</input>
				      			</c:otherwise>
				      			</c:choose>
				      		</td>
			</tr>
			<tr>
				<td class="lc1"  style="10" >海关信用</td>
				<td class="lc1" style="10%" >进出口违法行为</td>    
						<td class="lc2"  style="20">
								&nbsp;&nbsp;
				      			<c:choose>
				      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getCSTM_INVEST_FLAG())%>'>
				      					<input type="radio" name="CSTM_INVEST_FLAG"  checked="checked" value="1" >有</input>&nbsp;&nbsp;
				      					<input type="radio" name="CSTM_INVEST_FLAG"   value="0" >无</input>
				      			</c:when>
				      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getCSTM_INVEST_FLAG())%>'>
				      					<input type="radio" name="CSTM_INVEST_FLAG"   value="1" >有</input>&nbsp;&nbsp;
				      					<input type="radio" name="CSTM_INVEST_FLAG"   value="0" checked="checked" >无</input>
				      			</c:when>
				      			<c:otherwise>
			      						<input type="radio" name="CSTM_INVEST_FLAG"   value="1"  >有</input>&nbsp;&nbsp;
		      							<input type="radio" name="CSTM_INVEST_FLAG"   value="0"  >无</input>
				      			</c:otherwise>
				      			</c:choose>
				      		</td>
			</tr>
			
			<tr>
				<td class="lc1" colspan="2">未执行法院判决、裁定事项</td>
				<td class="lc2">
					&nbsp;&nbsp;&nbsp;&nbsp;<%=REPORT_YEAR1%>年<input type="text" maxlength=9 id="LAST_COURT_INVEST_QTY_LAST" name="LAST_COURT_INVEST_QTY_LAST" value="<%=gyjz_last.getLAST_COURT_INVEST_QTY() %>">次 &nbsp;&nbsp; 
					<%=REPORT_YEAR2%>年<input type="text"maxlength=9 id="LAST_COURT_INVEST_QTY_NEXT" name="LAST_COURT_INVEST_QTY_NEXT" value="<%=gyjz_next.getLAST_COURT_INVEST_QTY() %>">次
				</td>
			</tr>
			
			<tr>
				<td class="lc1" colspan="2">未执行仲裁机构裁决事项</td>
				<td class="lc2">
					&nbsp;&nbsp;&nbsp;&nbsp;<%=REPORT_YEAR1%>年<input type="text" maxlength=9 id="LAST_ARBIT_INVEST_LAST" name="LAST_ARBIT_INVEST_LAST" value="<%=gyjz_last.getLAST_ARBIT_INVEST() %>">次 &nbsp;&nbsp; 
					<%=REPORT_YEAR2%>年<input type="text" id="LAST_ARBIT_INVEST_NEXT" maxlength=9 name="LAST_ARBIT_INVEST_NEXT" value="<%=gyjz_next.getLAST_ARBIT_INVEST() %>">次
				</td>
			</tr>
			
			<tr>
				<td class="lc1"  style="10" colspan="2">其他违法违规行为</td>
						<td class="lc2">
								&nbsp;&nbsp;
				      			<c:choose>
				      			<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getOTHER_INVEST_FLAG())%>'>
				      					<input type="radio" name="OTHER_INVEST_FLAG"  checked="checked" value="1" >有</input>
				      					&nbsp;&nbsp;
				      					<input type="radio" name="OTHER_INVEST_FLAG"   value="0" >无</input>
				      			</c:when>
				      			<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getOTHER_INVEST_FLAG())%>'>
				      					<input type="radio" name="OTHER_INVEST_FLAG"   value="1" >有</input>
				      					&nbsp;&nbsp;
				      					<input type="radio" name="OTHER_INVEST_FLAG"   value="0" checked="checked" >无</input>
				      			</c:when>
				      			<c:otherwise>
			      						<input type="radio" name="OTHER_INVEST_FLAG"   value="1"  >有</input>
			      						&nbsp;&nbsp;
		      							<input type="radio" name="OTHER_INVEST_FLAG"   value="0"  >无</input>
				      			</c:otherwise>
				      			</c:choose>
				    </td>
			</tr>
			<tr>
				<td class="lc1">公益捐赠</td>
				<td class="lc1">捐赠折合金额</td>
				<td class="lc2">
						&nbsp;&nbsp;&nbsp;&nbsp;<%=REPORT_YEAR1%>年<input type="text" maxlength=6 id="LAST_DONT_RMB_W_LAST" name="LAST_DONT_RMB_W_LAST" value="<%=gyjz_last.getLAST_DONT_RMB_W() %>">万元
						&nbsp;&nbsp;&nbsp;&nbsp;<%=REPORT_YEAR2%>年<input type="text" maxlength=6 id="LAST_DONT_RMB_W_NEXT" name="LAST_DONT_RMB_W_NEXT" value="<%=gyjz_next.getLAST_DONT_RMB_W() %>">万元
				</td>
				
			</tr>
	</table>
			<br>
			<CENTER>
				<div style="display:inline">
			<a id="printa"
				href="print/szcp_sq_zrxy_print.jsp?REG_NO=<%=REG_NO%>&EVAL_YEAR=<%=YEAR %>"
				target="_blank">打印本页</a></div>
				
				<div class="subImgs" onclick="view()" style="display:inline">
					下一步
				</div>
			</CENTER>		
</form>			
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
		<iframe height="0" width="0" name="hiddenframe" src=""
			id="hiddenframe"></iframe>
		<%@include file="../bottom.inc"%>
<script type="text/javascript">
	function doLastSub() {
		var evalYear = $("#EVAL_YEAR").val();
		var regNo = $("#REG_NO").val();
		window.location.href = "szcp_sq_jyxy.jsp?REG_NO="+regNo+"&EVAL_YEAR="+evalYear+"&CerNO=<%=CERNO%>";
	}
	function view() {
		var regNo = '<%=REG_NO%>';
		var year = '<%=YEAR%>';
		var cerNo = '<%=CERNO%>';
		window.location.href = "szcp_sq_shry_view.jsp?REG_NO="+regNo+"&EVAL_YEAR="+year+"&CerNO="+cerNo;
	}	
	function checkError() {
		var val1 = $('input:radio[name="LP_ARR_WAGE_FLAG"]:checked').val();
        if(val1 ==null){
        	alert("请选择有无拖欠员工工资");
            return;
        }
        var LP_ALL_CONT_FLAG = $('input:radio[name="LP_ALL_CONT_FLAG"]:checked').val();
        if(LP_ALL_CONT_FLAG ==null){
        	alert("请选择是否与员工均签订劳动合同");
            return;
        }
        
        var LP_SOC_INSRC_FLAG = $('input:radio[name="LP_SOC_INSRC_FLAG"]:checked').val();
        if(LP_SOC_INSRC_FLAG ==null){
        	alert("请选择有无办理社会保险");
            return;
        }
        var TAX_VOLITE_FLAG = $('input:radio[name="TAX_VOLITE_FLAG"]:checked').val();
        if(TAX_VOLITE_FLAG ==null){
        	alert("请选择是否涉税违法");
            return;
        }
        var ECO_OPR_DMG_FLAG = $('input:radio[name="ECO_OPR_DMG_FLAG"]:checked').val();
        if(ECO_OPR_DMG_FLAG ==null){
        	alert("请选择有无生产经营违反环保法律法规");
            return;
        }
        var ECO_PRO_DMG_FLAG = $('input:radio[name="ECO_PRO_DMG_FLAG"]:checked').val();
        if(ECO_PRO_DMG_FLAG ==null){
        	alert("请选择有无产品服务违反环保规定");
            return;
        }
		
		var SP_MAJOR_ACC_FLAG = $('input:radio[name="SP_MAJOR_ACC_FLAG"]:checked').val();
        if(SP_MAJOR_ACC_FLAG ==null){
        	alert("请选择有无产品服务违反环保规定");
            return;
        }
        
        var SP_ORG_INVEST_FLAG = $('input:radio[name="SP_ORG_INVEST_FLAG"]:checked').val();
        if(SP_ORG_INVEST_FLAG ==null){
        	alert("请选择有无被安检部门查处");
            return;
        }
        
         var QS_INVEST_FLAG = $('input:radio[name="QS_INVEST_FLAG"]:checked').val();
         if(QS_INVEST_FLAG ==null){
        	alert("请选择有无产品质量违法行为");
            return;
        }
		 var BANK_INVEST_FLAG = $('input:radio[name="BANK_INVEST_FLAG"]:checked').val();
         if(BANK_INVEST_FLAG ==null){
        	alert("请选择有无逾期银行贷款");
            return;
        }
		 var CSTM_INVEST_FLAG = $('input:radio[name="CSTM_INVEST_FLAG"]:checked').val();
         if(CSTM_INVEST_FLAG ==null){
        	alert("请选择有无进出口违法行为");
            return;
        }
		
       
		var OTHER_INVEST_FLAG = $('input:radio[name="OTHER_INVEST_FLAG"]:checked').val();
         if(OTHER_INVEST_FLAG ==null){
        	alert("请选择有无其他违法违规行为");
            return;
        }
		
		document.form1.submit();
		alert("保存成功");
	}
	
</script>
</body>
</html>