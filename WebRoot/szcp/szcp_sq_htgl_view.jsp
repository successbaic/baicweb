<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XWGFDao" %>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XYGLDao" %>        
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="xwgf" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF" />
<jsp:useBean id="xygl" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XYGL" />
<jsp:useBean id="SZCP_SXSZ" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<jsp:useBean id="sl1" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF_SL" />
<jsp:useBean id="sl2" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF_SL" />
<jsp:useBean id="createHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />		    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>合同管理</title>
<link href="../szcp/css/print.css" rel="stylesheet" type="text/css"
	/ media="print">
	<script language="javascript" src="../szcp/js/print.js"></script>
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
.htgl a:link {
    color:#ffffff;
    text-decoration:none;
}
.htgl a:visited {
    color:#ffffff;
    text-decoration:none;
}
.htgl a:hover {
    color:#ffffff;
    text-decoration:none;
}
.htgl a:active {
    color:#ffffff;
    text-decoration:none;
}
.jygl,.jbxx,.htlx,.jyxy,.shxy,.shry,.xgzs {
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

.htgl {
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
<style type="text/css" media="print">
table {
	min-height: 30px;
	padding: 0px 0 0px 0px;
	vertical-align: top;
	border-collapse: separate;
	border-spacing: 10px;
	border-color: black;
}
</style>
<title>合同管理</title>
</head>
<%@include file="top_szcp.inc"%>
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
	if(xygl.getMNG_ORG_TYPE() != null && !"".equals(xygl.getMNG_ORG_TYPE() ))	 {
		xygl.setMNG_ORG_NAMEVIEW(xyglDao.queryMNG_ORG_TYPE(xygl.getMNG_ORG_TYPE()));
	}else {
		xygl.setMNG_ORG_NAMEVIEW(xyglDao.queryAllMNG_ORG_TYPE());
	}
	// 查询职位
	if(xygl.getORG_LEAD_POS_TYPE() != null && !"".equals(xygl.getORG_LEAD_POS_TYPE())) {
		xygl.setORG_LEAD_POSVIEW(xyglDao.queryPostCodeName(xygl.getORG_LEAD_POS_TYPE()));
	}else {
		xygl.setORG_LEAD_POSVIEW(xyglDao.queryALLPOSTCODENAME());
	}
	// 查询职业资格
	if(xygl.getORG_LEAD_QUAL_TYPE() != null && !"".equals(xygl.getORG_LEAD_QUAL_TYPE())) {
		xygl.setORG_LEAD_QUAL_TYPEVIEW(xyglDao.queryOrgQual_Level_Type(xygl.getORG_LEAD_QUAL_TYPE()));
	}else {
		xygl.setORG_LEAD_QUAL_TYPEVIEW(xyglDao.queryAllOrgQualLevelType());
	}
	
	//查询职称
	if(xygl.getQUAL_LEVEL_TYPE() != null && !"".equals(xygl.getQUAL_LEVEL_TYPE())) {
		xygl.setQUAL_LEVELVIEW(xyglDao.queryQualLevelType(xygl.getQUAL_LEVEL_TYPE()));
	}else {
		xygl.setQUAL_LEVELVIEW(xyglDao.queryAllQualLevelType());
	}
	
	//合同授权委托管理
	if(xwgf.getDELEG_TYPE() != null && !"".equals(xwgf.getDELEG_TYPE())) {
		xwgf.setDELEG_TYPEVIEW(xwgfDao.queryDELEG_TYPE(xwgf.getDELEG_TYPE()));
	}else {
		xwgf.setDELEG_TYPEVIEW(xwgfDao.queryAllDELEG_TYPE());
	}
	
	// 台账登记形式
	if(xwgf.getACCT_FORM_TYPE() != null && !"".equals(xwgf.getACCT_FORM_TYPE())) {
		xwgf.setACCTFORMTYPEVIEW(xwgfDao.queryACCTFORMTYPE(xwgf.getACCT_FORM_TYPE()));
	}else {
		xwgf.setACCTFORMTYPEVIEW(xwgfDao.queryAllACCTFORMTYPE());
	}
	
	//客户信用信息建立方式
	if(xwgf.getGUEST_INFO_TYPE() != null && !"".equals(xwgf.getGUEST_INFO_TYPE())) {
		xwgf.setGUESTINFOTYPEVIEW(xwgfDao.queryACCTFORMTYPE(xwgf.getGUEST_INFO_TYPE()));
	}else {
		xwgf.setGUESTINFOTYPEVIEW(xwgfDao.queryAllACCTFORMTYPE());
	}
	
	// 合同签订审批
	if(xwgf.getSIGN_APPR_TYPE() != null && !"".equals(xwgf.getSIGN_APPR_TYPE())) {
		xwgf.setSINGAPPRTYPEVIEW(xwgfDao.querySIGNAPPRTYPE(xwgf.getSIGN_APPR_TYPE()));
	}else {
		xwgf.setSINGAPPRTYPEVIEW(xwgfDao.queryAllSIGNAPPRTYPE());
	}
	
%>
<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0" id="body"  onload="initRadio()">
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

<%=createHeaderUtil.createHeader_view(REG_NO,YEAR,CERNO,"3","") %>

	<form class="form1" name="form1" method="POST" 
			 action="szcp_sq_htgl_action.jsp" >
		
		<input type="hidden" class="noprint" value="<%=xygl.getORG_LEAD_POS_TYPE() %>" name="ORG_LEAD_POS_TYPEHIDDEN"></input>		
		<input type="hidden" class="noprint" value="<%=REG_NO%>" name="REGNOHIDDEN"  id=" REG_NO"></input>		
		<input type="hidden" class="noprint" value="<%=YEAR%>" name="EVALYEAREHIDDEN" id="EVAL_YEAR"></input>	
		<input type="hidden" class="noprint" name="REPORT_YEAR1" id="REPORT_YEAR1" value="<%=REPORT_YEAR1 %>">
		<input type="hidden" class="noprint" name="REPORT_YEAR2" id="REPORT_YEAR2" value="<%=REPORT_YEAR2 %>">	
		

		<table border="1" width="100%" cellpadding="0" cellspacing="0" >
			<tr>
		        <td class="yxsm" colspan="4" align="center">
		        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>合同管理</font>
		        </p>
		        </td>
      		</tr>
      		
      		<tr>
      			<td colspan="4">
      				<table class="table1" border="1" width="100%" cellpadding="0" cellspacing="0">
      					<tr>		
      					<td class="lc1" >
      						合同信用管理机构
      					</td>
					      			<td class="lc2" >
										<input type="radio" name="MNG_ORG_TYPE" id ="MNG_ORG_TYPE" value="1"/>法务部
										<input type="radio" name="MNG_ORG_TYPE" id ="MNG_ORG_TYPE" value="2"/>合同管理部
										<input type="radio" name="MNG_ORG_TYPE" id ="MNG_ORG_TYPE" value="3"/>信控部
										<input type="radio" name="MNG_ORG_TYPE" id ="MNG_ORG_TYPE" value="4"/>销售部
										<input type="radio" name="MNG_ORG_TYPE" id ="MNG_ORG_TYPE" value="5"/>财务部
										<input type="radio" name="MNG_ORG_TYPE" id ="MNG_ORG_TYPE" value="6"/>办公室
										<input type="radio" name="MNG_ORG_TYPE" id ="MNG_ORG_TYPE" value="7"/>其他
										<input type="radio" name="MNG_ORG_TYPE" id ="MNG_ORG_TYPE" value="8"/>无
									</td> 
      					</tr>
      				</table>
      			</td>
      		</tr>
      		
      		<tr >
      			<td colspan="4" >
      				<table border="1" class="table2" width="100%" cellpadding="0" cellspacing="0">
		      			<tr>
			      			<td class="lc1" rowspan="3" >合同信息管理部门负责人</td>
			      			<td class="lc1" >姓名</td>
			      			<td class="lc2"  >
								<input type="text"   id ="ORG_LEAD_NAME"  name="ORG_LEAD_NAME" title="姓名"  value="<%=xygl.getORG_LEAD_NAME() == null?"":xygl.getORG_LEAD_NAME() %>" ></input>&nbsp;
							</td>
			      			<td class="lc1" >职务</td>
			      			<td class="lc2" >
								<select name="ORG_LEAD_POS" title="职务"  id ="ORG_LEAD_POS"
								style="width:192px; "> 
									<option value=''>请选择</option>
									<%=xygl.getORG_LEAD_POSVIEW() %>
								</select>&nbsp;
						
							</td>
			      			<td class="lc1" >联系方式</td>
			      			<td class="lc2"  >
								<input type="text" name="ORG_LEAD_TEL_NO" 
								id="ORG_LEAD_TEL_NO" maxlength=11
								 title="联系方式"   value="<%=xygl.getORG_LEAD_TEL_NO() == null?"":xygl.getORG_LEAD_TEL_NO() %>" ></input>&nbsp;
							</td>
			      		</tr>
      		
			      			<tr>
				      			<td class="lc1">资格</td>
				      			<td class="lc2" colspan="6">
									<input type="radio" name="ORG_LEAD_QUAL_TYPE" id="ORG_LEAD_QUAL_TYPE" value="1"/>企业法律顾问
									<input type="radio" name="ORG_LEAD_QUAL_TYPE" id="ORG_LEAD_QUAL_TYPE" value="2"/>律师	
									<input type="radio" name="ORG_LEAD_QUAL_TYPE" id="ORG_LEAD_QUAL_TYPE" value="3"/>信用管理师
									<input type="radio" name="ORG_LEAD_QUAL_TYPE" id="ORG_LEAD_QUAL_TYPE" value="4"/>其他
								</td>
			      		</tr>
      		
	      		<tr>
	      			<td class="lc1">职称</td>
	      			<td class="lc2"  colspan="6">
						<input type="radio" name="QUAL_LEVEL_TYPE" id="QUAL_LEVEL_TYPE" value="1"/>高级职称
						<input type="radio" name="QUAL_LEVEL_TYPE" id="QUAL_LEVEL_TYPE" value="2"/>中级职称
						<input type="radio" name="QUAL_LEVEL_TYPE" id="QUAL_LEVEL_TYPE" value="3"/>初级职称
						<input type="radio" name="QUAL_LEVEL_TYPE" id="QUAL_LEVEL_TYPE" value="1"/>无
					</td>
	      		</tr>
	      	</table>
      			</td>
      		</tr>
      			
      		
      		<tr>
      			<td class="lc1">合同信用管理制度</td>
      			<td class="lc2"  colspan="2">
      				企业已建立的合同信用信用管理制度：<br/>
      				<input type="checkbox"  name = "MSCheckBox1"  value="1"   <%="1".equals(xygl.getMS_POS_RESP_FLAG()) ? "checked='checked'":"" %>>明确合同信用管理部门相关岗位职责</input>
      				<input type="checkbox"  name = "MSCheckBox2"  value="1"   <%="1".equals(xygl.getMS_DELEGATE_FLAG()) ? "checked='checked'":""%>> 委托授权管理制度</input><br/>
      				<input type="checkbox"  name = "MSCheckBox3"  value="1"  <%="1".equals(xygl.getMS_SIGN_REVIEW_FLAG()) ? "checked='checked'":"" %>> 合同签订评审制度</input>
      				<input type="checkbox"  name = "MSCheckBox4"  value="1"  <%="1".equals(xygl.getMS_SEAL_FILE_FLAG()) ?"checked='checked'":"" %>> 合同印章和合同文本管理制度</input><br/>
      				<input type="checkbox"  name = "MSCheckBox5"  value="1"  <%="1".equals(xygl.getMS_RISK_EMG_FLAG()) ?"checked='checked'":""%>> 客户风险评价、授权及应急处理制度</input><br/>
      				<input type="checkbox"  name = "MSCheckBox6"  value="1"   <%="1".equals(xygl.getMS_SIGN_CANCEL_FLAG()) ?"checked='checked'":""%>>合同签订、履行、变更和解除管理制度</input><br/>
      				<input type="checkbox"  name = "MSCheckBox7"  value="1"  <%="1".equals(xygl.getMS_RECV_ACCT_FLAG()) ?"checked='checked'":""%>> 应收账款与商账管理制度</input>
      				<input type="checkbox"  name = "MSCheckBox8"  value="1" <%="1".equals(xygl.getMS_PAY_ACCT_FLAG()) ?"checked='checked'":""%>> 应付账款管理制度</input>
      				<input type="checkbox"  name = "MSCheckBox9"  value="1"  <%="1".equals(xygl.getMS_GUEST_FLAG()) ?"checked='checked'":""%>> 客户信用档案管理制度</input>
      			</td>
      		</tr>
      		
      		<tr>
      			<td colspan="4">
      				<table class="table3" border="1" width="100%" cellpadding="0" cellspacing="0">
      				<tr>
      					<td class="lc1" rowspan="3">合同信用管理人员数</td>
      				</tr>
      				<tr>
		      				<td class="lc1">专职人数</td>
		      				<td class="lc2" >
		      					<input type="text" name="FULLTIME_MNG_QTY"   id = "FULLTIME_MNG_QTY"  size="40" title="专职人数" maxlength="6"  value="<%=xygl.getFULLTIME_MNG_QTY() %>" ></input>&nbsp;
		      				</td>
		      				<td class="lc1">兼职人数</td>
		      				<td class="lc2" >
		      					<input type="text" name="PARTTIME_MNG_QTY"   id="PARTTIME_MNG_QTY"  size="40" title="兼职人数" maxlength="6"  value="<%=xygl.getPARTTIME_MNG_QTY() %>" ></input>&nbsp;
		      				</td>
      				</tr>
	      		</table>	
      			</td>
      		</tr>
      		
      		<tr>
      			<td colspan="4">
      				<table class="table4" border="1" width="100%" cellpadding="0" cellspacing="0">
      						<tr>	
				      			<td class="lc1" style="width:19%">格式条款是否备案</td>
				      			<td class="lc2" >
				      				<c:choose>
				      					<c:when test='<%="1".equals(xwgf.getFC_ARCH_FLAG())%>'>
				      						<input type="radio" name="FC_ARCH_FLAG"   checked="checked" value="1">有</input>
				      						<input type="radio" name="FC_ARCH_FLAG"   value="0">无</input>
				      						<input type="radio" name="FC_ARCH_FLAG" value="2">无规定</input>
				      					</c:when>
				      					<c:when test='<%="0".equals(xwgf.getFC_ARCH_FLAG())%>'>
				      						<input type="radio" name="FC_ARCH_FLAG"   value="1">有</input>
				      						<input type="radio" name="FC_ARCH_FLAG"  checked="checked"  value="0">无</input>
				      						<input type="radio" name="FC_ARCH_FLAG" value="2">无规定</input>
				      					</c:when>
				      					<c:when test='<%="2".equals(xwgf.getFC_ARCH_FLAG())%>'>
				      						<input type="radio" name="FC_ARCH_FLAG"   value="1">有</input>
				      						<input type="radio" name="FC_ARCH_FLAG"   value="0">无</input>
				      						<input type="radio" name="FC_ARCH_FLAG" value="2" checked="checked">无规定</input>
				      					</c:when>
				      					<c:otherwise>
				      						<input type="radio" name="FC_ARCH_FLAG"   value="1">有</input>
				      						<input type="radio" name="FC_ARCH_FLAG"   value="0">无</input>
				      						<input type="radio" name="FC_ARCH_FLAG" value="2" >无规定</input>
				      					</c:otherwise>
				      				</c:choose>
				      			</td>
				      			
				      			<td class="lc1">格式条款有否违规记录</td>
				      			<td class="lc2" >
				      				<c:choose>
				      				<c:when test='<%="1".equals(xwgf.getFC_VIOL_FLAG())%>'>
				      						<input type="radio" name="FC_VIOL_FLAG"  checked="checked" value="1">有</input>
				      						<input type="radio" name="FC_VIOL_FLAG"   value="0">无</input>
				      				</c:when>
				      				<c:when test='<%="0".equals(xwgf.getFC_VIOL_FLAG())%>'>
				      						<input type="radio" name="FC_VIOL_FLAG"   value="1">有</input>
				      						<input type="radio" name="FC_VIOL_FLAG"   value="0" checked="checked" >无</input>
				      				</c:when>
				      				<c:otherwise>
				      						<input type="radio" name="FC_VIOL_FLAG"   value="1">有</input>
				      						<input type="radio" name="FC_VIOL_FLAG"   value="0" >无</input>
				      				</c:otherwise>
				      				</c:choose>
				      			</td>
				      		</tr>
      				</table>
      			</td>
      		
      		<tr>
      			<td colspan="4">
      				<table border="1" class="table5" width="100%" cellpadding="0" cellspacing="0">
      					<tr>
		      					<td class="lc1" style="width:19%">行业有无合同示范文本</td>
				      			<td class="lc2"  colspan="2">
				      				<c:choose>
				      					<c:when test='<%="1".equals(xwgf.getMODEL_TEXT_TYPE())%>'>
				      							<input type="radio" name="MODEL_TEXT_TYPE"  checked="checked" value="1">有</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="0">无</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="2">适合本企业使用</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="3">不适合本企业使用</input>
				      					</c:when>
				      					<c:when test='<%="0".equals(xwgf.getMODEL_TEXT_TYPE())%>'>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="1">有</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"  checked="checked"  value="0">无</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="2">适合本企业使用</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="3">不适合本企业使用</input>
				      					</c:when>
				      					<c:when test='<%="2".equals(xwgf.getMODEL_TEXT_TYPE())%>'>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="1">有</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="0">无</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="2"  checked="checked">适合本企业使用</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="3">不适合本企业使用</input>
				      					</c:when>
				      					<c:when test='<%="3".equals(xwgf.getMODEL_TEXT_TYPE())%>'>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="1">有</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="0">无</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="2" >适合本企业使用</input>
				      							<input type="radio" name="MODEL_TEXT_TYPE"   value="3" checked="checked">不适合本企业使用</input>
				      					</c:when>
				      					<c:otherwise>
				      								<input type="radio" name="MODEL_TEXT_TYPE"   value="1">有</input>
				      								<input type="radio" name="MODEL_TEXT_TYPE"  value="0">无</input>
				      								<input type="radio" name="MODEL_TEXT_TYPE"   value="2">适合本企业使用</input>
				      								<input type="radio" name="MODEL_TEXT_TYPE"   value="3">不适合本企业使用</input>
				      					</c:otherwise>
				      				</c:choose>
				      			</td>
			      			</tr>
      					</table>	
      			</td>
      		</tr>
      		
      		<tr>
      			<td colspan="4">
      				<table class="table6" border="1" width="100%" cellpadding="0" cellspacing="0">
      						<tr>
      							<td align="center" class="lc1">项目/年度</td>
      							<td align="center" class="lc1" colspan="3"><%=REPORT_YEAR1%>年（%）</td>
      							<td align="center" class="lc1"><%=REPORT_YEAR2%>年（%）</td>
      						</tr>
      						<tr>
					      			<td class="lc1">收入性合同书面签约率</td>
					      			<td class="lc2" colspan="3">
					      					<input type="text" name="INC_SIGN_RATE" id="INC_SIGN_RATE"  size="40" title="收入性合同书面签约率" maxlength=3  value="<%=sl1.getINC_SIGN_RATE() %>" ></input>&nbsp;
					      			</td>
					      			<td class="lc2" colspan="3">
					      					<input type="text" name="INC_SIGN_RATE_TIME" id="INC_SIGN_RATE_TIME"  size="40" title="收入性合同书面签约率" maxlength=3  value="<%=sl2.getINC_SIGN_RATE() %>" ></input>&nbsp;
					      			</td>
					      		</tr>
					      		
					      		  <tr>
					      			<td class="lc1">支出性合同书面签约率</td>
					      			<td class="lc2"  colspan="3">
					      					<input type="text" name="EXP_SIGN_RATE"  id="EXP_SIGN_RATE" size="40" title="支出性合同书面签约率" maxlength=3  value="<%=sl1.getEXP_SIGN_RATE() %>" ></input>&nbsp;
					      			</td>
					      			<td class="lc2"  colspan="3">
					      					<input type="text" name="EXP_SIGN_RATE_TIME"  id="EXP_SIGN_RATE_TIME" size="40" title="支出性合同书面签约率" maxlength=3  value="<%=sl2.getEXP_SIGN_RATE() %>" ></input>&nbsp;
					      			</td>
					      		</tr>
					      		
					      		 <tr>
					      			<td class="lc1">合同示范文本使用率</td>
					      			<td class="lc2"  colspan="3">
					      					<input type="text" name="MODEL_TEXT_US_RATE" id="MODEL_TEXT_US_RATE" size="40" title="合同示范文本使用率" maxlength=3  value="<%=sl1.getMODEL_TEXT_US_RATE() %>" ></input>&nbsp;
					      			</td>
					      			<td class="lc2"  >
					      					<input type="text" name="MODEL_TEXT_US_RATE_TIME" id="MODEL_TEXT_US_RATE_TIME" size="40" title="合同示范文本使用率" maxlength=3  value="<%=sl2.getMODEL_TEXT_US_RATE() %>" ></input>&nbsp;
					      			</td>
					      		</tr>
					      		
					      		<tr>
					      			<td class="lc1">合同签订授权委托管理</td>
					      			<td class="lc2"  colspan="4">
										<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="1"/>均经书面授权委托
										<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="2"/>部分使用书面授权委托、部分口头授权委托
										<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="3"/>无书面授权委托、全部口头授权委托
										<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="4"/>有未授权委托情况
					      			</td>
					      		</tr>
      				</table>
      			</td>
      		</tr>
      		
      		<tr>
      			<td colspan="4">
      				<table class="table7" border="1" width="100%" cellpadding="0" cellspacing="0">
      					<tr>
				      			<td class="lc1" rowspan="3" style="width:19%">合同签订审核管理</td>
				      			<td class="lc2" colspan="4">
										合同签订审批：<br/>
										<input type="radio" name="sign_appr_type" value="1" id="sign_appr_type"/>签订合同前对客户信用状况进行审查</br>
										<input type="radio" name="sign_appr_type" value="2" id="sign_appr_type"/>所有合同都有专门的审核部门或者专人审核</br>
										<input type="radio" name="sign_appr_type" value="3" id="sign_appr_type"/>重大合同由相关部门流转审核</br>
										<input type="radio" name="sign_appr_type" value="4" id="sign_appr_type"/>直接由总经理审核</br>
										<input type="radio" name="sign_appr_type" value="5" id="sign_appr_type"/>由业务部门或者合同签订人员自己审核</br>
										<input type="radio" name="sign_appr_type" value="6" id="sign_appr_type"/>无审核部门、人员及记录</br>
				      			</td>
				      		</tr>
				      		
				      	<tr>
				      			<td class="lc2" colspan="4">
				      			合同签订审核内容(可多选)<br/>
				      				<input type="checkbox"  name = "SACheckBox1"  value="1"  <%="1".equals(xwgf.getSA_QUAL_FLAG()) ?"checked='checked'":""%>>对方资格和经营范围</input>
				      				<input type="checkbox"  name = "SACheckBox2"  value="1"  <%="1".equals(xwgf.getSA_VALID_FLAG()) ?"checked='checked'":""%>> 对方合法性</input><br/>
				      				<input type="checkbox"  name = "SACheckBox3"  value="1"  <%="1".equals(xwgf.getSA_CREDIT_FLAG()) ?"checked='checked'":"" %>> 对方资信状况</input><br/>
				      				<input type="checkbox"  name = "SACheckBox4"  value="1" <%="1".equals(xwgf.getSA_PERFORM_FLAG()) ?"checked='checked'":""%>> 对方履约能力</input><br/>
				      			</td>
		      		</tr>	
      				
      				</table>
      			</td>
      		</tr>
			      		
      		<tr>
      			<td colspan="4">
      				<table class="table8" border="1" width="100%" cellpadding="0" cellspacing="0">
		      				<tr>
				      			<td class="lc1" rowspan="3">合同档案和台账管理</td>
				      			<td class="lc2">
				      			有无合同档案管理部门：
				      					<c:choose>
				      					<c:when test='<%="1".equals(xwgf.getMNG_ORG_FLAG())%>'>
				      							<input type="radio" name="MNG_ORG_FLAG"  id="MNG_ORG_FLAG" checked="checked" value="1">有</input>
				      							<input type="radio" name="MNG_ORG_FLAG"  id="MNG_ORG_FLAG" value="0">无</input>
				      					</c:when>
				      					<c:when test='<%="0".equals(xwgf.getMNG_ORG_FLAG())%>'>
				      							<input type="radio" name="MNG_ORG_FLAG"  id="MNG_ORG_FLAG" value="1">有</input>
				      							<input type="radio" name="MNG_ORG_FLAG"  id="MNG_ORG_FLAG" value="0" checked="checked" >无</input>
				      					</c:when>
				      					<c:otherwise>
			      								<input type="radio" name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"  value="1">有</input>
		      									<input type="radio" name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"  value="0" >无</input>
				      					</c:otherwise>
				      				</c:choose>
				      			</td>
				      		</tr>
				      		
				      		<tr>
				      			<td class="lc2">
				      				台账登记形式：<br/>
									<input type="radio" name="ACCT_FORM_TYPE" id="ACCT_FORM_TYPE" value="1"/>合同管理软件
									<input type="radio" name="ACCT_FORM_TYPE" id="ACCT_FORM_TYPE" value="2"/>办公软件电子化word/excel等制表<br/>
									<input type="radio" name="ACCT_FORM_TYPE" id="ACCT_FORM_TYPE" value="3"/>手工登记
				      			</td>
				      		</tr>
				      		
				      		<tr>
				      			<td class="lc2">
				      				台账内容(可多选):<br/>
				      				<input type="checkbox"  name = "ACCTCheckBox1"  value="1"  <%="1".equals(xwgf.getACCT_SERIAL_FLAG()) ?"checked='checked'":""%>> 合同编号</input>
				      				<input type="checkbox"  name = "ACCTCheckBox2"  value="1"  <%="1".equals(xwgf.getACCT_GUEST_FLAG()) ?"checked='checked'":""%>> 客户名称</input>
				      				<input type="checkbox"  name = "ACCTCheckBox3"  value="1"  <%="1".equals(xwgf.getACCT_WHEN_FLAG()) ?"checked='checked'":"" %>> 签订时间</input>
				      				<input type="checkbox"  name = "ACCTCheckBox4"  value="1" <%="1".equals(xwgf.getACCT_UNDLY_FLAG()) ?"checked='checked'":""%>> 合同标的</input><br/>
				      				<input type="checkbox"  name = "ACCTCheckBox5"  value="1"  <%="1".equals(xwgf.getACCT_QTY_FLAG()) ?"checked='checked'":""%>> 合同数量</input>
				      				<input type="checkbox"  name = "ACCTCheckBox6"  value="1"  <%="1".equals(xwgf.getACCT_CAP_FLAG()) ?"checked='checked'":""%>> 合同金额</input>
				      				<input type="checkbox"  name = "ACCTCheckBox7"  value="1"  <%="1".equals(xwgf.getACCT_PLAN_TIME_FLAG()) ?"checked='checked'":"" %>> 应履行时间</input><br/>
				      				<input type="checkbox"  name = "ACCTCheckBox8"  value="1"  <%="1".equals(xwgf.getACCT_REAL_TIME_FLAG()) ?"checked='checked'":""  %>> 实际履行时间</input>
				      				<input type="checkbox"  name = "ACCTCheckBox9"  value="1"  <%="1".equals(xwgf.getACCT_PLAN_CAP_FLAG()) ?"checked='checked'":"" %>> 应履行金额</input>
				      				<input type="checkbox"  name = "ACCTCheckBox10"  value="1"  <%="1".equals(xwgf.getACCT_REAL_CAP_FLAG()) ?"checked='checked'":"" %>> 实际履行金额</input>
				      				<input type="checkbox"  name = "ACCTCheckBox11"  value="1"  <%="1".equals(xwgf.getACCT_PERFOM_CERT_FLAG()) ?"checked='checked'":""  %>> 履行凭证</input>
				      				<input type="checkbox"  name = "ACCTCheckBox12"  value="1"  <%="1".equals(xwgf.getACCT_CHANGE_FLAG()) ?"checked='checked'":""  %>> 变更解除情况</input>
				      			</td>
		      		</tr>
      			</table>
      			</td>
      		</tr>
      		
      		
      		<tr>
      			<td colspan="4">
      				<table class="table9" border="1" width="100%" cellpadding="0" cellspacing="0">
      						<tr>
				      			<td class="lc1" rowspan="3" style="width:19%">客户资信商帐管理</td>
				      			<td class="lc2">
				      			客户信用信息数据建立方式：<br/>
									<input type="radio" name="GUEST_INFO_TYPE" id="GUEST_INFO_TYPE" value="1">合同管理软件
									<input type="radio" name="GUEST_INFO_TYPE" id="GUEST_INFO_TYPE" value="2">办公软件电子化word/excel等制表<br/>
									<input type="radio" name="GUEST_INFO_TYPE" id="GUEST_INFO_TYPE" value="3">手工登记
				      			</td>
				      		</tr>
				      		
				      		<tr>
				      			<td class="lc2">
				      				客户资信管理(可多选):<br/>
				      				<input type="checkbox"  name = "GCTCheckBox1"  value="1"  <%="1".equals(xwgf.getGC_RECORD_FLAG()) ?"checked='checked'":""%>> 有客户信用信息档案</input>
				      				<input type="checkbox"  name = "GCTCheckBox2"  value="1"  <%="1".equals(xwgf.getGC_THIRD_PART_FLAG()) ?"checked='checked'":""%>> 有第三方征信报机构出具的资信调查报告</input><br/>
				      				<input type="checkbox"  name = "GCTCheckBox3"  value="1"  <%="1".equals(xwgf.getGC_RESERCH_FLAG()) ?"checked='checked'":""%>> 实地调查报告</input>
				      			</td>
				      		</tr>
				      		
				      		<tr>
				      			<td class="lc2">
				      				商账管理(可多选)<br/>
				      				<input type="checkbox"  name = "AMCheckBox1"  value="1"  <%="1".equals(xwgf.getAM_RECV_AGE_FLAG()) ?"checked='checked'":""%>> 对应收账款账龄进行分析</input>
				      				<input type="checkbox"  name = "AMCheckBox2"  value="1"  <%="1".equals(xwgf.getAM_OVERDUE_FLAG()) ?"checked='checked'":""%>> 对逾期账款进行分析</input><br/>
				      				<input type="checkbox"  name = "AMCheckBox3"  value="1"  <%="1".equals(xwgf.getAM_SPEC_RECOVER_FLAG()) ?"checked='checked'":""%>> 有专人负责账款追收</input>
				      				<input type="checkbox"  name = "AMCheckBox4"  value="1"  <%="1".equals(xwgf.getAM_RECV_SUM_FLAG()) ?"checked='checked'":""%>> 对应付账款进行分析</input>
				      			</td>
				      		</tr>
      				</table>	
      			</td>
      		</tr>  
      		
      		<tr>
      			<td colspan="4">
      					<table class="table10" border="1" width="100%" cellpadding="0" cellspacing="0">
    							<tr>
				      			<td class="lc1" rowspan="8">合同争议解决、处理</td>
				      			<tr>
      								<td align="center" class="lc1" colspan="2">项目/年度</td>
      								<td align="center" class="lc1" ><%=REPORT_YEAR1%>年</td>
      								<td align="center" class="lc1" colspan="3"><%=REPORT_YEAR2%>年</td>
      							</tr>
				      			<td class="lc1" rowspan="2">因违约产生的合同争议</td>
				      			<td class="lc1">
				      				本方违约件数
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="LAST_DFT_OUR_QTY"  id="LAST_DFT_OUR_QTY" size="40" title="本方违约件数" maxlength=3  value="<%=sl1.getLAST_DFT_OUR_QTY() %>" ></input>&nbsp;
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="LAST_DFT_OUR_QTY_TIME"  id="LAST_DFT_OUR_QTY_TIME" size="40" title="本方违约件数" maxlength=3  value="<%=sl2.getLAST_DFT_OUR_QTY() %>" ></input>&nbsp;
				      			</td>
				      			
				      		</tr>
				      		
				      		<tr>
				      			<td class="lc1">
				      				对方违约件数
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="LAST_DFT_THEY_QTY" id="LAST_DFT_THEY_QTY" size="40" title="对方违约件数" maxlength=3  value="<%=sl1.getLAST_DFT_THEY__QTY() %>" ></input>&nbsp;
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="LAST_DFT_THEY_QTY_TIME" id="LAST_DFT_THEY_QTY_TIME" size="40" title="对方违约件数" maxlength=3  value="<%=sl2.getLAST_DFT_THEY__QTY() %>" ></input>&nbsp;
				      			</td>
				      		</tr>
				      		
				      		 <tr>
				      			<td class="lc1" rowspan="4">合同争议解决</td>
				      			<td class="lc1">
				      				和解件数
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="DISP_COMP_QTY" id="DISP_COMP_QTY" size="40" title="和解件数" maxlength=3  value="<%=sl1.getDISP_COMP_QTY() %>" ></input>&nbsp;
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="DISP_COMP_QTY_TIME" id="DISP_COMP_QTY_TIME" size="40" title="和解件数" maxlength=3  value="<%=sl2.getDISP_COMP_QTY() %>" ></input>&nbsp;
				      			</td>
				      		</tr>
				      		
				      		  <tr>
				      			<td class="lc1">
				      				调解件数
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="DISP_MED_QTY" id="DISP_MED_QTY" size="40" title="调解件数" maxlength=3  value="<%=sl1.getDISP_MED_QTY() %>" ></input>&nbsp;
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="DISP_MED_QTY_TIME" id="DISP_MED_QTY_TIME" size="40" title="调解件数" maxlength=3  value="<%=sl2.getDISP_MED_QTY() %>" ></input>&nbsp;
				      			</td>
				      		</tr>
				      		
				      		<tr>
				      			<td class="lc1">
				      				仲裁件数
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="DISP_ARB_QTY"  id="DISP_ARB_QTY" size="40" title="仲裁件数" maxlength=3  value="<%=sl1.getDISP_ARB_QTY() %>" ></input>&nbsp;
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="DISP_ARB_QTY_TIME"  id="DISP_ARB_QTY_TIME" size="40" title="仲裁件数" maxlength=3  value="<%=sl2.getDISP_ARB_QTY() %>" ></input>&nbsp;
				      			</td>
				      		</tr>
				      		
				      		 <tr>
				      			<td class="lc1">
				      				诉讼件数
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="DISP_LAW_QTY" id="DISP_LAW_QTY" size="40" title="诉讼件数" maxlength=3  value="<%=sl1.getDISP_LAW_QTY() %>" ></input>&nbsp;
				      			</td>
				      			<td class="lc2" colspan="2">
				      				<input type="text" name="DISP_LAW_QTY_TIME" id="DISP_LAW_QTY_TIME" size="40" title="诉讼件数" maxlength=3  value="<%=sl2.getDISP_LAW_QTY() %>" ></input>&nbsp;
				      			</td>
				      		</tr>
      					</table>
      			</td>
      		</tr>
		</table>
		<br>
			<CENTER class="noprint">
					<div style="display:inline">
			<a  id="printa"
				href="print/szcp_sq_htgl_print.jsp?REG_NO=<%=REG_NO%>&EVAL_YEAR=<%=YEAR %>"
				target="_blank">打印本页</a>
		</div>	
				<div class="subImgs" style="display:inline"
					onclick="view()">
					下一步
				</div>
			</CENTER>		
	</form>
</body>
<script type="text/javascript">
		function view() {
			var regNo = '<%=REG_NO%>';
			var year = '<%=YEAR%>';
			var cerNo = '<%=CERNO%>';
			window.location.href = "szcp_sq_lxqk_view.jsp?REG_NO="+regNo+"&EVAL_YEAR="+year+"&CerNO="+cerNo;
		}

	function checkError() {
		var MNG_ORG_TYPE = $("#MNG_ORG_TYPE").val();
		if(MNG_ORG_TYPE == null || MNG_ORG_TYPE == "") {
			alert("请选择合同信用管理机构");
			return;
		}
		
		/* var OTHER_ORG_DESC = $("#OTHER_ORG_DESC").val();
		if(OTHER_ORG_DESC == null || OTHER_ORG_DESC == "") {
			alert("请输入机构名称");
			return;
		} */
		
		var ORG_LEAD_NAME = $("#ORG_LEAD_NAME").val();
		if(ORG_LEAD_NAME == null || ORG_LEAD_NAME == "") {
			alert("请输入姓名");
			return;
		}
		
		var ORG_LEAD_POS = $("#ORG_LEAD_POS").val();
		if(ORG_LEAD_POS == null || ORG_LEAD_POS == "") {
			alert("请选择职务");
			return;
		}
		
		var ORG_LEAD_POS = $("#ORG_LEAD_POS").val();
		if(ORG_LEAD_POS == null || ORG_LEAD_POS == "") {
			alert("请选择职务");
			return;
		}
		
		var ORG_LEAD_TEL_NO = $("#ORG_LEAD_TEL_NO").val();
		if(ORG_LEAD_TEL_NO == null || ORG_LEAD_TEL_NO == "") {
			alert("请输入联系方式");
			return;
		}else{
			var flag = fucCheckTEL(ORG_LEAD_TEL_NO);
			if(flag==0){
				alert("联系方式, 请输入正确的数字格式");
				return;
			}
		}
		var ORG_LEAD_QUAL_TYPE = $("#ORG_LEAD_QUAL_TYPE").val();
		if(ORG_LEAD_QUAL_TYPE == null || ORG_LEAD_QUAL_TYPE == "") {
			alert("请选择资格");
			return;
		}
		
		var QUAL_LEVEL_TYPE = $("#QUAL_LEVEL_TYPE").val();
		if(QUAL_LEVEL_TYPE == null || QUAL_LEVEL_TYPE == "") {
			alert("请选择职称");
			return;
		}
		
		var num1 = $("input[type='checkbox'][name='MSCheckBox1'][checked]").length;
		var num2 = $("input[type='checkbox'][name='MSCheckBox2'][checked]").length;
		var num3 = $("input[type='checkbox'][name='MSCheckBox3'][checked]").length;
		var num4 = $("input[type='checkbox'][name='MSCheckBox4'][checked]").length;
		var num5 = $("input[type='checkbox'][name='MSCheckBox5'][checked]").length;
		var num6 = $("input[type='checkbox'][name='MSCheckBox6'][checked]").length;
		var num7 = $("input[type='checkbox'][name='MSCheckBox7'][checked]").length;
		var num8 = $("input[type='checkbox'][name='MSCheckBox8'][checked]").length;
		var num9 = $("input[type='checkbox'][name='MSCheckBox9'][checked]").length;
		if(num1 == 0 && num2 == 0 && num3 == 0 && num4 == 0 && num5 == 0
				&& num6 == 0 && num7 == 0 && num8 == 0 && num9 == 0) {
			alert("合同信用管理制度,请至少选择一项");
			return;
		}
		
		
		
		var FULLTIME_MNG_QTY = $("#FULLTIME_MNG_QTY").val();
		if(FULLTIME_MNG_QTY == null || FULLTIME_MNG_QTY == "") {
			alert("请输入专职人数");
			return;
		}else{
			var flag = fucCheckNUM(FULLTIME_MNG_QTY);
			if(flag==0){
				alert("专职人数,请输入正确的数字格式");
				return;
			}
		}
		var PARTTIME_MNG_QTY = $("#PARTTIME_MNG_QTY").val();
		if(PARTTIME_MNG_QTY == null || PARTTIME_MNG_QTY == "") {
			alert("请输入兼职人数");
			return;
		}else{
			var flag = fucCheckNUM(PARTTIME_MNG_QTY);
			if(flag==0){
				alert("兼职人数,请输入正确的数字格式");
				return;
			}
		}
		
		 var FC_ARCH_FLAG = $('input:radio[name="FC_ARCH_FLAG"]:checked').val();
         if(FC_ARCH_FLAG ==null){
        	alert("请选择格式条款是否备案");
            return;
        }
         var FC_VIOL_FLAG = $('input:radio[name="FC_VIOL_FLAG"]:checked').val();
         if(FC_VIOL_FLAG ==null){
        	alert("请选择格式条款有无违控记录");
            return;
        }
        
         var MODEL_TEXT_TYPE = $('input:radio[name="MODEL_TEXT_TYPE"]:checked').val();
         if(MODEL_TEXT_TYPE ==null){
        	alert("请选择行业有无合同示范文本");
            return;
        }
		
		
		var INC_SIGN_RATE = $("#INC_SIGN_RATE").val();
		if(INC_SIGN_RATE == null || INC_SIGN_RATE == "") {
			alert("请输入收入性合同书面签约率");
			return;
		}else{
			var flag = fucCheckNUM(INC_SIGN_RATE);
			if(flag==0){
				alert("收入性合同书面签约率,请输入正确的数字格式");
				return;
			}
		}
		var EXP_SIGN_RATE = $("#EXP_SIGN_RATE").val();
		if(EXP_SIGN_RATE == null || EXP_SIGN_RATE == "") {
			alert("请输入支出性合同书面签约率");
			return;
		}else{
			var flag = fucCheckNUM(EXP_SIGN_RATE);
			if(flag==0){
				alert("支出性合同书面签约率,请输入正确的数字格式");
				return;
			}
		}
		
		var MODEL_TEXT_US_RATE = $("#MODEL_TEXT_US_RATE").val();
		if(MODEL_TEXT_US_RATE == null || MODEL_TEXT_US_RATE == "") {
			alert("请输入合同示范文本使用率");
			return;
		}else{
			var flag = fucCheckNUM(MODEL_TEXT_US_RATE);
			if(flag==0){
				alert("合同示范文本使用率,请输入正确的数字格式");
				return;
			}
		}
		
		var DELEGTYPE = $("#DELEGTYPE").val();
		if(DELEGTYPE == null || DELEGTYPE == "") {
			alert("请选择合同签订授权委托管理");
			return;
		}
		
		 var signnum = $('input:radio[name="sign_appr_type"]:checked').val();
         if(signnum ==null){
        		alert("合同签订审批，请至少选择一项");
            return;
        }
		/* var signnum1 = $("input[type='checkbox'][name='SINGCheckBox1'][checked]").length;
		var signnum2 = $("input[type='checkbox'][name='SINGCheckBox2'][checked]").length;
		var signnum3 = $("input[type='checkbox'][name='SINGCheckBox3'][checked]").length;
		var signnum4 = $("input[type='checkbox'][name='SINGCheckBox4'][checked]").length;
		var signnum5 = $("input[type='checkbox'][name='SINGCheckBox5'][checked]").length;
		if(signnum1 == 0 && signnum2 == 0 && signnum3 == 0 && signnum4 == 0 && signnum5==0 ){
			alert("合同签订审批，请至少选择一项");
			return;
		} */
		
		var sanum1 = $("input[type='checkbox'][name='SACheckBox1'][checked]").length;
		var sanum2 = $("input[type='checkbox'][name='SACheckBox2'][checked]").length;
		var sanum3 = $("input[type='checkbox'][name='SACheckBox3'][checked]").length;
		var sanum4 = $("input[type='checkbox'][name='SACheckBox4'][checked]").length;
		if(sanum1 == 0 && sanum2 == 0 && sanum3 == 0 && sanum4 == 0 ) {
			alert("合同签订审核内容,请至少选择一项");
			return;
		}
		
		var acctnum1 = $("input[type='checkbox'][name='ACCTCheckBox1'][checked]").length;
		var acctnum2 = $("input[type='checkbox'][name='ACCTCheckBox2'][checked]").length;
		var acctnum3 = $("input[type='checkbox'][name='ACCTCheckBox3'][checked]").length;
		var acctnum4 = $("input[type='checkbox'][name='ACCTCheckBox4'][checked]").length;
		var acctnum5 = $("input[type='checkbox'][name='ACCTCheckBox5'][checked]").length;
		var acctnum6 = $("input[type='checkbox'][name='ACCTCheckBox6'][checked]").length;
		var acctnum7 = $("input[type='checkbox'][name='ACCTCheckBox7'][checked]").length;
		var acctnum8 = $("input[type='checkbox'][name='ACCTCheckBox8'][checked]").length;
		var acctnum9 = $("input[type='checkbox'][name='ACCTCheckBox9'][checked]").length;
		var acctnum10 = $("input[type='checkbox'][name='ACCTCheckBox10'][checked]").length;
		var acctnum11 = $("input[type='checkbox'][name='ACCTCheckBox11'][checked]").length;
		var acctnum12 = $("input[type='checkbox'][name='ACCTCheckBox12'][checked]").length;
		if(acctnum1 == 0 && acctnum2 == 0 && acctnum3 == 0 && acctnum4 == 0 
				&& acctnum5 == 0 && acctnum6 == 0 && acctnum7 == 0 && acctnum8 == 0
				&& acctnum9 == 0 && acctnum10 == 0 && acctnum11 == 0 && acctnum12 == 0) {
			alert("台账内容,请至少选择一项");
			return;
		}
		
		var gctnum1 = $("input[type='checkbox'][name='GCTCheckBox1'][checked]").length;
		var gctnum2 = $("input[type='checkbox'][name='GCTCheckBox2'][checked]").length;
		var gctnum3 = $("input[type='checkbox'][name='GCTCheckBox3'][checked]").length;
		if(gctnum1 == 0 && gctnum2 == 0 && gctnum3 ==0 ) {
			alert("客户资信管理,请至少选择一项");
			return;
		}
		
		var amnum1 = $("input[type='checkbox'][name='AMCheckBox1'][checked]").length;
		var amnum2= $("input[type='checkbox'][name='AMCheckBox2'][checked]").length;
		var amnum3 = $("input[type='checkbox'][name='AMCheckBox3'][checked]").length;
		var amnum4 = $("input[type='checkbox'][name='AMCheckBox4'][checked]").length;
		if(amnum1 == 0 && amnum2 == 0 && amnum3 ==0 && amnum4 == 0){
			alert("商帐管理,请至少选择一项");
			return;
		}
		
		 var MNG_ORG_FLAG = $('input:radio[name="MNG_ORG_FLAG"]:checked').val();
         if(MNG_ORG_FLAG ==null){
        	alert("请选择有无合同档案管理部门");
            return;
        }
		
		var ACCT_FORM_TYPE = $("#ACCT_FORM_TYPE").val();
		if(ACCT_FORM_TYPE == null || ACCT_FORM_TYPE == "") {
			alert("请选择台账登记形式");
			return;
		}
		
		var GUEST_INFO_TYPE = $("#GUEST_INFO_TYPE").val();
		if(GUEST_INFO_TYPE == null || GUEST_INFO_TYPE == "") {
			alert("请选择客户信用信息数据建立方式");
			return;
		}
		
		var LAST_DFT_OUR_QTY = $("#LAST_DFT_OUR_QTY").val();
		if(LAST_DFT_OUR_QTY == null || LAST_DFT_OUR_QTY == "") {
			alert("请输入本方违约件数");
			return;
		}else{
			var flag = fucCheckInt(LAST_DFT_OUR_QTY);
			if(flag==0){
				alert("本方违约件数,请输入正确的数字格式");
				return;
			}
		}
		var LAST_DFT_THEY_QTY = $("#LAST_DFT_THEY_QTY").val();
		if(LAST_DFT_THEY_QTY == null || LAST_DFT_THEY_QTY == "") {
			alert("请输入对方违约件数");
			return;
		}else{
			var flag = fucCheckInt(LAST_DFT_THEY_QTY);
			if(flag==0){
				alert("对方违约件数,请输入正确的数字格式");
				return;
			}
		}
		var DISP_COMP_QTY = $("#DISP_COMP_QTY").val();
		if(DISP_COMP_QTY == null || DISP_COMP_QTY == "") {
			alert("请输入和解件数");
			return;
		}else{
			var flag = fucCheckInt(DISP_COMP_QTY);
			if(flag==0){
				alert("和解件数,请输入正确的数字格式");
				return;
			}
		}
		var DISP_MED_QTY = $("#DISP_MED_QTY").val();
		if(DISP_MED_QTY == null || DISP_MED_QTY == "") {
			alert("请输入调解件数");
			return;
		}else{
			var flag = fucCheckInt(DISP_MED_QTY);
			if(flag==0){
				alert("调解件数,请输入正确的数字格式");
				return;
			}
		}
		var DISP_ARB_QTY = $("#DISP_ARB_QTY").val();
		if(DISP_ARB_QTY == null || DISP_ARB_QTY == "") {
			alert("请输入仲裁件数");
			return;
		}else{
			var flag = fucCheckInt(DISP_ARB_QTY);
			if(flag==0){
				alert("仲裁件数,请输入正确的数字格式");
				return;
			}
		}
		var DISP_LAW_QTY = $("#DISP_LAW_QTY").val();
		if(DISP_LAW_QTY == null || DISP_LAW_QTY == "") {
			alert("请输入诉讼件数");
			return;
		}else{
			var flag = fucCheckInt(DISP_LAW_QTY);
			if(flag==0){
				alert("诉讼件数, 请输入正确的数字格式");
				return;
			}
		}
		
		document.form1.submit();
		alert("保存成功");
	}
	function doLastSub() {
		var evalYear = $("#EVAL_YEAR").val();
		var regNo = $("#REG_NO").val();
		window.location.href = "szcp_sq_lxqk.jsp?REG_NO="+regNo+"&EVAL_YEAR="+evalYear+"&CerNO=<%=CERNO%>";
	}
	
</script>



</html>