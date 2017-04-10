<%@ page language="java" contentType="application/msword" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XWGFDao"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XYGLDao"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_JYXYDao"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_XGZSDao"%>
<%@page import="com.macrosoft.icms.szcp.SZCP_SQ_XGZS"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_SHRYDao"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_GYJZDao"%>
<%@page import="com.macrosoft.icms.szcp.SZCP_SQ_SHRY"%>

<jsp:useBean id="Page" scope="session"class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="xwgf" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF" />
<jsp:useBean id="xygl" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XYGL" />
<jsp:useBean id="SZCP_SXSZ" scope="page" class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<jsp:useBean id="sl1" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF_SL" />
<jsp:useBean id="sl2" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF_SL" />	
<jsp:useBean id="SZCP_SQ_JYGL" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL" />
<jsp:useBean id="SZCP_SQ_JYGL_XS1" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL_XS" />
<jsp:useBean id="SZCP_SQ_JYGL_XS2" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL_XS" />
<jsp:useBean id="SZCP_SQ_LXQK_IN_LAST" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN" />
<jsp:useBean id="SZCP_SQ_LXQK_IN_NEXT" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN" />
<jsp:useBean id="SZCP_SQ_LXQK_OUT_LAST" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT" />
<jsp:useBean id="SZCP_SQ_LXQK_OUT_NEXT" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT" />
<jsp:useBean id="SZCP_SQ_LXQK_RATE_LAST" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE" />
<jsp:useBean id="SZCP_SQ_LXQK_RATE_NEXT" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE" />
<jsp:useBean id="SZCP_SQ_ZRXY" scope="page"class="com.macrosoft.icms.szcp.SZCP_SQ_ZRXY" />
<jsp:useBean id="gyjz_last" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ"/>
<jsp:useBean id="gyjzdao" scope="page" class="com.macrosoft.icms.szcp.dao.SZCP_SQ_GYJZDao"/>
<jsp:useBean id="gyjz_next" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ"/>
<jsp:useBean id="shry" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_SHRY" />
<jsp:useBean id="xgzs" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_XGZS" />
<jsp:useBean id="lczt" scope="page" class="com.macrosoft.icms.szcp.SZCP_LCZT" />
<jsp:useBean id="SZCP_SQ_JBXX" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JBXX" />
<jsp:useBean id="jyxy" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />
<jsp:useBean id="jyxy1" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />


<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page errorPage="/error.jsp"%>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="gsdbc" scope="page" class="com.macrosoft.icms.gsdbc.GsDbConnection"/>
<jsp:useBean id="sjdbc" scope="page" class="com.macrosoft.icms.gsdbc.SJGsDbConnection"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	
webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
String webPath = request.getContextPath() ;
String sanZheng = icms.getSanZheng(webuser.getXZQH());
boolean isSanZheng = false;

sanZheng = "0";

if("1".equals(sanZheng)){
	isSanZheng = true;
}
%>
<%
%>
<script language="javascript" src="<%=request.getContextPath() %>/support/jquery-1.8.3.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/list.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/Calendar.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/window.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/value.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/valid.js"></script>
<script type="text/javascript">
	webPath = "<%=webPath %>";
</script>

<html>
<head>
<title>导出word</title>
</head>
<body>

<%
	String REG_NO = request.getParameter("REG_NO");
	String YEAR =request.getParameter("EVAL_YEAR");
	String CerNO = request.getParameter("CerNO");
	SZCP_SQ_JBXX.doSelect(REG_NO,YEAR,CerNO);
	String v = request.getParameter("sv");
	//jbxx
	//企业规模 
	String ent_scale_Type = SZCP_SQ_JBXX.getENT_SCALE_TYPE();
	String entScaleStr = "";
	 if(ent_scale_Type== null || "".equals(ent_scale_Type)) {
		entScaleStr = SZCP_SQ_JBXX.queryALLENT_SCALE_TYPE();
	}else {
		entScaleStr = SZCP_SQ_JBXX.queryENT_SCALE_TYPE_Name_Exp(ent_scale_Type);
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
		
		//jygl
		SZCP_SXSZ = SZCP_SXSZ.querySZCP_SXSZ(YEAR);
		String REPORT_YEAR1 = SZCP_SXSZ.getREPORT_YEAR1();
		String REPORT_YEAR2 = SZCP_SXSZ.getREPORT_YEAR2();
		SZCP_SQ_JYGL= SZCP_SQ_JYGL.querySZCP_SQ_JYGL(REG_NO.trim(),YEAR);
		SZCP_SQ_JYGL_XS1 = SZCP_SQ_JYGL_XS1.querySZCP_SQ_JYGL_XS(REG_NO.trim(),YEAR,REPORT_YEAR1);
		SZCP_SQ_JYGL_XS2 = SZCP_SQ_JYGL_XS2.querySZCP_SQ_JYGL_XS(REG_NO.trim(),YEAR,REPORT_YEAR2);
		//htgl
		SZCP_SQ_HT_XWGFDao xwgfDao = new SZCP_SQ_HT_XWGFDao();
		SZCP_SQ_HT_XYGLDao xyglDao = new SZCP_SQ_HT_XYGLDao();
		xwgf = xwgfDao.querySZCP_SQ_HT_XWGF(REG_NO,YEAR);
		xygl = xyglDao.querySZCP_SQ_HT_XYGL(REG_NO,YEAR);
		sl1 = sl1.querySZCP_SQ_HT_XWGF_SL(REG_NO,YEAR,REPORT_YEAR1);
		sl2 = sl2.querySZCP_SQ_HT_XWGF_SL(REG_NO,YEAR,REPORT_YEAR2);
		// 查询合同信用管理机构
		if (xygl.getMNG_ORG_TYPE() != null&& !"".equals(xygl.getMNG_ORG_TYPE())) {
			
			xygl.setMNG_ORG_NAMEVIEW(xyglDao.queryMNG_ORG_TYPE_Exp(xygl.getMNG_ORG_TYPE()));
			
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
					.queryOrgQual_Level_Type_Print(xygl.getORG_LEAD_QUAL_TYPE(),"exp"));
		} else {
			xygl.setORG_LEAD_QUAL_TYPEVIEW(xyglDao
					.queryAllOrgQualLevelType());
		}

		//查询职称
		if (xygl.getQUAL_LEVEL_TYPE() != null
				&& !"".equals(xygl.getQUAL_LEVEL_TYPE())) {
			xygl.setQUAL_LEVELVIEW(xyglDao.queryQualLevelType_Print(xygl
					.getQUAL_LEVEL_TYPE(),"exp"));
		} else {
			xygl.setQUAL_LEVELVIEW(xyglDao.queryAllQualLevelType());
		}

		//合同授权委托管理
		if (xwgf.getDELEG_TYPE() != null
				&& !"".equals(xwgf.getDELEG_TYPE())) {
			xwgf.setDELEG_TYPEVIEW(xwgfDao.queryDELEG_TYPE_Print(xwgf
					.getDELEG_TYPE(),"exp"));
		} else {
			xwgf.setDELEG_TYPEVIEW(xwgfDao.queryAllDELEG_TYPE());
		}

		// 台账登记形式
		if (xwgf.getACCT_FORM_TYPE() != null
				&& !"".equals(xwgf.getACCT_FORM_TYPE())) {
			xwgf.setACCTFORMTYPEVIEW(xwgfDao.queryACCTFORMTYPE_Print(xwgf
					.getACCT_FORM_TYPE(),"exp"));
		} else {
			xwgf.setACCTFORMTYPEVIEW(xwgfDao.queryAllACCTFORMTYPE());
		}

		//客户信用信息建立方式
		if (xwgf.getGUEST_INFO_TYPE() != null
				&& !"".equals(xwgf.getGUEST_INFO_TYPE())) {
			xwgf.setGUESTINFOTYPEVIEW(xwgfDao.queryACCTFORMTYPE_Print(xwgf
					.getGUEST_INFO_TYPE(),"exp"));
		} else {
			xwgf.setGUESTINFOTYPEVIEW(xwgfDao.queryAllACCTFORMTYPE());
		}

		// 合同签订审批
		if (xwgf.getSIGN_APPR_TYPE() != null
				&& !"".equals(xwgf.getSIGN_APPR_TYPE())) {
			xwgf.setSINGAPPRTYPEVIEW(xwgfDao.querySIGNAPPRTYPE_Print(xwgf
					.getSIGN_APPR_TYPE(),"exp"));
		} else {
			xwgf.setSINGAPPRTYPEVIEW(xwgfDao.queryAllSIGNAPPRTYPE());
		}
		//lxqk
		SZCP_SQ_LXQK_IN_LAST = SZCP_SQ_LXQK_IN_LAST.querySZCP_SQ_LXQK_IN(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_IN_NEXT = SZCP_SQ_LXQK_IN_NEXT.querySZCP_SQ_LXQK_IN(REG_NO,YEAR,REPORT_YEAR2);
		SZCP_SQ_LXQK_OUT_LAST = SZCP_SQ_LXQK_OUT_LAST.querySZCP_SQ_LXQK_OUT(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_OUT_NEXT = SZCP_SQ_LXQK_OUT_NEXT.querySZCP_SQ_LXQK_OUT(REG_NO,YEAR,REPORT_YEAR2);
		SZCP_SQ_LXQK_RATE_LAST= SZCP_SQ_LXQK_RATE_LAST.querySZCP_SQ_LXQK_RATE(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_RATE_NEXT= SZCP_SQ_LXQK_RATE_NEXT.querySZCP_SQ_LXQK_RATE(REG_NO,YEAR,REPORT_YEAR2);
		//JYXY
		SZCP_SQ_JYXYDao jyxyDao = new SZCP_SQ_JYXYDao();
		jyxy = jyxyDao.querySZCP_SQ_JYXY(REG_NO, YEAR, REPORT_YEAR1);
		jyxy1 = jyxyDao.querySZCP_SQ_JYXY(REG_NO, YEAR, REPORT_YEAR2);
		//zrxy
		gyjz_last = gyjzdao.querySZCP_SQ_GYJZ(REG_NO,YEAR,REPORT_YEAR1);
		gyjz_next = gyjzdao.querySZCP_SQ_GYJZ(REG_NO,YEAR,REPORT_YEAR2);
		SZCP_SQ_ZRXY= SZCP_SQ_ZRXY.querySZCP_SQ_ZRXY(REG_NO,YEAR);
		//shry
		SZCP_SQ_SHRYDao shryDao = new SZCP_SQ_SHRYDao();
		SZCP_SQ_GYJZDao gyjzDao = new SZCP_SQ_GYJZDao();
		List<SZCP_SQ_SHRY> list = shryDao.querySZCP_SQ_SHRY(REG_NO,YEAR);
		//xgzs
		SZCP_SQ_XGZSDao xgzsDao = new SZCP_SQ_XGZSDao();
		List<SZCP_SQ_XGZS> list1 = xgzsDao.querySZCP_SQ_XGZS(REG_NO,YEAR);
		lczt = xgzsDao.queryLcztStatus(REG_NO,YEAR);
		lczt = lczt.selectSZCP_LCZT(REG_NO, YEAR); 
		
		response.setHeader("Content-disposition","attachment; filename="+ java.net.URLEncoder.encode(SZCP_SQ_JBXX.getENT_NAME()+".doc", "utf-8"));
%>

<table  align="center" bordercolor="#000000"  CELLSPACING="0"  CELLPADDING="0"  WIDTH="700" border=0>
		<b> <span style="font-size: 20pt"><center>山东省工商行政管理局<u><%=REPORT_YEAR1 %></u>—<u><%=REPORT_YEAR2 %></u>年度</center></center></b>
    <b> <span style="font-size: 20pt"><center>"守合同重信用"企业申报表</center></b>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<b> <span style="font-size: 20pt"><center>申报企业名称: <u><%=SZCP_SQ_JBXX.getENT_NAME()%></u></center></b><br>
	<b> <span style="font-size: 20pt"><center>申报日期: <u><%= lczt.getAPPLY_DATE()%></u></center></b><br>
	<b> <span style="font-size: 20pt"><center>企业所在地: <u><%=SZCP_SQ_JBXX.getADDR_DESC()%></u></center></b>
</table>

<br><br><br>

<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=0>
		<b> <span style="font-size: 20pt"><center>承诺书</center></b><br>
		<tr><td><font size="4">
		&nbsp;&nbsp;一、本企业自愿申报参加山东省工商行政管理局<u><%=REPORT_YEAR1 %></u>—<u><%=REPORT_YEAR2 %></u>年度"守合同重<br><br>信用"企业公示活动。<br>
		&nbsp;&nbsp;二、本企业保证所提供的信息、数据、资料真实有效，网上填报数据与<br><br>纸质申报表内容一致，并对此承担相应责任。<br>
		&nbsp;&nbsp;三、本企业同意将本企业<u><%=REPORT_YEAR1 %></u>—<u><%=REPORT_YEAR2 %></u>年度的一下合同履约信息，在山东省工<br><br>商行政管理局设立的"守合同重信用"企业公示平台上向社会公示：<br>
				&nbsp;&nbsp;1.收入性合同实际履约率<br>
				&nbsp;&nbsp;2.支出性合同实际履约率<br>
				&nbsp;&nbsp;3.期末应收款占收入性合同总额比例<br>
				&nbsp;&nbsp;4.期末应付款占支出性合同总额比例<br>
				&nbsp;&nbsp;5.合同撤销率<br>
				&nbsp;&nbsp;6.协议解除合同率<br>
				&nbsp;&nbsp;7.其他形式解除合同率<br>
				&nbsp;&nbsp;8.合同变更率<br>
				&nbsp;&nbsp;9.到期未履行的合同比率<br>
				&nbsp;&nbsp;&nbsp;其中（1）本方违约合同比率<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）对方违约合同比率<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）因不可抗力未履行合同比率<br>
				&nbsp;&nbsp;10.合同争议率<br>
				&nbsp;&nbsp;11.合同争议解决率<br><br><br><br>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法定代表人（负责人）签字：<br><br>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（企 业 公 章）<br><br>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</font>
</td>
	</table>
	
	<br><br><br><br><br><br><br>
	<h1><b> <span style="font-size: 20pt"><center>注 意 事 项</center></b><br></h1>
	<table  align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=0>
			
<tr>
	<td>
		<font size="4">
			&nbsp;&nbsp;一、本申报表由企业自行填报，所填报的信息数据为<u><%=REPORT_YEAR1 %></u>—<u><%=REPORT_YEAR2 %></u>年度的信<br>息数据。<br><br>
			&nbsp;&nbsp;二、《山东省工商行政管理局<u><%=REPORT_YEAR1 %></u>—<u><%=REPORT_YEAR2 %></u>年度"守合同重信用"企业申报<br><br>表》通过以下方式提交：<br><br>
			&nbsp;&nbsp;1.企业经省级工商局审核同意后，登陆山东省工商行政管理局"守合同<br><br>重信用"企业信用标准体系软件系统，在线进行企业信用信息数据录入并<br><br>保存。<br><br>
			&nbsp;&nbsp;2.企业信息录入完成之后，点击下载系统自动生成的《山东省工商行政<br><br>管理局<u><%=YEAR %></u>年度"守合同重信用"企业申报表》，打印一式三份，其中<br><br>两份按照要求由企业法人代表（负责人）签字、加盖企业公章之后，提交<br><br>所在地省级工商局，一份企业留存。<br><br>
				&nbsp;&nbsp;三、合同履约数据填报请认真把握好一下逻辑关系：<br><br>
				&nbsp;&nbsp;1.书面合同总数=（当年签订的书面合同+以前年度签订未履行完毕的合<br><br>同）；<br><br>
				&nbsp;&nbsp;2.当年应当履行合同=（当年实际履行合同+到期未履行的合同）；<br><br>
				&nbsp;&nbsp;3.到期未履行的合同=（本方违约合同+对方违约合同+因不可抗力未履<br><br>行的合同+因争议、中止等导致的未履行合同）。
			</font>
		</td>
	</tr>
</table>
<br><br>
<%-- 
<h1><b> <span style="font-size: 20pt"><center><u><%=REPORT_YEAR1 %></u>—<u><%=REPORT_YEAR2 %></u>年度省级"守合同重信用"企业申报资格函询汇总表</center></b></h1>
<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>
	<tr align="center" height=40>
		<td rowspan="3" align="center">劳动保护</td>
		<td align="center">拖欠员工工资</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr  align="center" height=40>
		<td align="center">与员工均签订劳动合同</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr  align="center" height=40>
		<td align="center">办理社会保险</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center">纳税信用</td>
		<td align="center">涉税违法</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center" rowspan="2">环境保护</td>
		<td align="center">生产经营违反环保法律规则</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center">产品或服务违反环保规定</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center" rowspan="2">安全生产</td>
		<td align="center">重大安全事故</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center">被安检部门查处</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center">产品质量</td>
		<td align="center">产品质量违法行为</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center">银行信贷</td>
		<td align="center">逾期银行贷款</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center">海关信用</td>
		<td align="center">进出口违法行为</td>
		<td align="center">□&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;否</td>
	</tr>
	<tr align="center" height=40>
		<td align="center" rowspan="2">判决、裁定、仲裁执行情况</td>
		<td align="center">未执行法院判决、裁定事项</td>
		<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件</td>
	</tr>
	<tr align="center" height=40>
		<td align="center">未执行仲裁机构裁决事项</td>
		<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件</td>
	</tr>
	<tr align="center" height=40>
		<td align="center">其他情况</td>
		<td align="center">其他违法违规行为</td>
		<td align="center">□&nbsp;有&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□&nbsp;无</td>
	</tr>
	<tr align="center" height=99>
		<td align="center">分局意见</td>
		<td align="center" colspan="2"></td>
	</tr>
	<tr align="center" height=99>
		<td align="center">市局意见</td>
		<td  align="center" colspan="2"></td>
	</tr>
	<tr >
		<td align="center" colspan="3" >注：一企业一表，一式两份，由分局填写与《山东省守合同重信用企业申报表》一并报市局。</td>
	</tr>
</table> --%>

<h1><b> <span style="font-size: 16pt"><center>企业基本信息</center></b></h1>
 <table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>
		
<tr>
	<td align='center' height=40 width="20%" colspan="2">企业名称</td>
	<td colspan="4" align='center'><%=SZCP_SQ_JBXX.getENT_NAME()%></td>
</tr>
<tr>
	<td align='center' height=40 width="20%" colspan="2">企业网址</td>
	<td colspan="4" align='center'><%=SZCP_SQ_JBXX.getWEBSITE_DESC()%></td>
</tr>
<tr>
	<td align='center' height=40 width="20%" rowspan="2">企业注册类型</td>
	<td align='center' height=40 > 内资企业</td>
	<td class="lc2" colspan="4">
		<%=SZCP_SQ_JBXX.queryENT_TYPE_Name(SZCP_SQ_JBXX
			.getENT_TYPE())%>
	</td>
</tr>

<tr>
	<td align='center' height=40 width="10%" class="lc1">外商投资企业</td>
	<td class="lc2" colspan="4">
		□中外合作企业
		□中外合资企业
		□外商独资企业
	</td>
</tr>

<tr>
	<td align='center' height=40 width="20%">发照机关</td>
	<td align='center' colspan="2"><%=SZCP_SQ_JBXX.queryLOCAL_ORG_NAME(SZCP_SQ_JBXX
			.getLOCAL_ORG_NO())%></td>
	<td align='center' height=40 width="20%">报送机关</td>
	<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getReportName()%></td>
<tr>
	<td align='center' height=40 width="20%">企业住所</td>
	<td align='center' colspan="5"><%=SZCP_SQ_JBXX.getADDR_DESC()%></td>

</tr>

<tr>
	<td align='center' height=40 width="20%">注册号</td>
	<td align='center'><%=SZCP_SQ_JBXX.getREG_NO()%></td>
	<td align='center'>组织机构代码</td>
	<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getORG_CODE()%></td>
</tr>

<tr>
	<td align='center' height=40 width="20%">注册资本</td>
	<td align='center' colspan="2">${SZCP_SQ_JBXX.REG_CAP_RMB_W}万人民币</td>
</tr>

<tr>
	<td align='center' height=40 width="20%">成立日期</td>
	<td align='center'><%=SZCP_SQ_JBXX.getEST_DATE()%></td>
	<td align='center'>经营期限</td>
	<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getOPER_TO_DATE()%></td>
</tr>

<tr>
	<td align='center' height=40 width="20%">法定代表人姓名</td>
	<td align='center'><%=SZCP_SQ_JBXX.getLEG_REP_NAME()%></td>
	<td align='center'>企业固定电话</td>
	<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getTEL_NO()%></td>
</tr>
<tr>
	<td align='center' height=40 width="20%">主营业务所属行业</td>
	<td align='center'><%=SZCP_SQ_JBXX.queryINDUSTRY_TYPE_CODE_Name(SZCP_SQ_JBXX
			.getGB_INDUSTRY_TYPE())%></td>
	<td align='center'>企业规模</td>
	<td align='center' colspan="3"><%=entScaleStr%></td>
</tr>

<tr>
	<td align='center' height=40 width="20%">守重行业分类</td>
	<td align='left' colspan="5"><%=localIndustryStr%></td>
</tr>
<tr>
	<td align='center' height=40 width="20%">经营范围</td>
	<td align='left' colspan="5"><%=SZCP_SQ_JBXX.getBUSI_SCOPE_DESC()%></td>
</tr>
<tr align='center' height=40 width="20%">
	<td align='center' height=40 width="20%" rowspan="2">在职人员</td>
	<td align="center" height=40 width="20%">总人数</td>

	<td align="center" height=40 width="20%">管理人员</td>

	<td align="center" height=40 width="20%">技术人员</td>

	<td align="center" height=40 width="20%" colspan="2">其他</td>
</tr>
<tr align='center' height=40 width="20%">
	<td align="center"><%=SZCP_SQ_JBXX.getTOTAL_STAFF_QTY()%></td>
	<td align="center"><%=SZCP_SQ_JBXX.getMNG_STAFF_QTY()%></td>
	<td align="center"><%=SZCP_SQ_JBXX.getTECH_STAFF_QTY()%></td>
	<td align="center" colspan="2"><%=SZCP_SQ_JBXX.getTOTAL_STAFF_QTY()
			- SZCP_SQ_JBXX.getMNG_STAFF_QTY()
			- SZCP_SQ_JBXX.getTECH_STAFF_QTY()%></td>
</tr>
<tr height=40 >
	<td align='center' height=40 width="20%" rowspan="3">企业联系人</td>
	<td align='center'>姓名</td>
	<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_NAME()%></td>
	<td align='center'>职务</td>
	<td align='center' ><%=SZCP_SQ_JBXX.getLIAI_POS_CODE()%></td>
</tr>
<tr>
	<td align='center' height=40 width="20%">传真</td>
	<td align='center'><%=SZCP_SQ_JBXX.getLIAI_FAX_NO()%></td>
	<td align='center' height=40 width="20%">电子邮箱</td>
	<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_EMAIL()%></td>
</tr>

<tr>
	<td align='center' height=40 width="20%">移动电话</td>
	<td align='center'><%=SZCP_SQ_JBXX.getLIAI_MOBILE_NO()%></td>
	<td align='center' height=40 width="20%">固定电话</td>
	<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_TEL_NO()%></td>
	</tr>
</table>
<br>
	<br><br>
	<h1><b> <span style="font-size: 16pt"><center><%=REPORT_YEAR1%>年—<%=REPORT_YEAR2%>企业品牌和经营管理</center></b></h1>
	
	<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>

	<tr align='center' height=40 >
		<td align='center' >项目\年份</td>
		<td align='center' colspan="2"><%=REPORT_YEAR1%>年</td>
		<td align='center' colspan="4"><%=REPORT_YEAR2%>年</td>
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
	</tr>


	

	<tr>
		<td align='center' rowspan="4">&nbsp;认证情况</td>
		<td align='center' height=40 >质量认证</td>
		<td align="center" colspan="5">
			<c:if test='<%=SZCP_SQ_JYGL.getQC_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getQC_FLAG().equals("0") %>'>□有    √无</c:if>
			</td>
	</tr>
	<tr>
		<td align='center' height=40 >环保认证</td>
		<td align="center" colspan="5">
			<c:if test='<%=SZCP_SQ_JYGL.getEC_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getEC_FLAG().equals("0") %>'>□有    √无</c:if>
			</td>

	</tr>
	<tr>
		<td align='center' height=40 >产品认证</td>
		<td align="center" colspan="5">
			<c:if test='<%=SZCP_SQ_JYGL.getPC_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getPC_FLAG().equals("0") %>'>□有    √无</c:if>
			</td>
	</tr>
	<tr>
		<td align='center' height=40 >其他认证</td>
		<td align="center" colspan="5">
			<c:if test='<%=SZCP_SQ_JYGL.getOC_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getOC_FLAG().equals("0") %>'>□有    √无</c:if>
			</td>
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
			<c:if test='<%=SZCP_SQ_JYGL.getIND_QUAL_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getIND_QUAL_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40  colspan="6">本企业是否已取得特许资质和许可证
			<c:if test='<%=SZCP_SQ_JYGL.getENT_QUAL_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getENT_QUAL_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="6">所处行业是否经营资质等级划分
			<c:if test='<%=SZCP_SQ_JYGL.getQUAL_LEVEL_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getQUAL_LEVEL_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="6">本企业资质等级为
			<c:if test='<%=SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE().equals("0") %>'>√特级    □一级     □二级     □三级</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE().equals("1") %>'>□特级    √一级     □二级     □三级</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE().equals("2") %>'>□特级    □一级     √二级     □三级</c:if>
			<c:if test='<%=SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE().equals("3") %>'>□特级    □一级     □二级     √三级</c:if>
			</td>
		</tr>
	</table>
	<br><br><br><br><br><br>
	
	<h1><b> <span style="font-size: 16pt"><center>合同管理</center></b></h1>
<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>

<%-- <tr>
	<td align='center' height=40 >机构名称</td>
	<td align='center' colspan="6"><%=xygl.getOTHER_ORG_DESC() == null ? "" : xygl
			.getOTHER_ORG_DESC()%></td>
</tr> --%>

<tr>
	<td align='center' height=40>合同信用管理机构</td>
	<td align='center'  colspan="7"><%=xygl.getMNG_ORG_NAMEVIEW()%></td>
</tr>	

<tr>
	<td align='center' rowspan="3">合同信息管理部门负责人</td>
	<td align='center' height=40>姓名</td>
	<td align='center'><%=xygl.getORG_LEAD_NAME() == null ? "" : xygl
			.getORG_LEAD_NAME()%> </td>
	<td align='center' height=40 >职务</td>
	<td align='center' >
		<%=xygl.getORG_LEAD_POSVIEW() %>
	</td>
	<td align='center' >联系方式</td>
	<td align='center' colspan="2"><%=xygl.getORG_LEAD_TEL_NO() == null ? "" : xygl
			.getORG_LEAD_TEL_NO()%></td>
</tr>

<tr>
	<td align='center' height=40 >资格</td>
	<td colspan="6"><%=xygl.getORG_LEAD_QUAL_TYPEVIEW()%></td>
</tr>

<tr>
	<td align='center' height=40 >职称</td>
	<td colspan="6"><%=xygl.getQUAL_LEVELVIEW()%></td>
</tr>

<tr>
	<td align='center' height="44">合同信用管理制度</td>
	<td colspan="7"><br>
	企业已建立的合同信用管理制度:<br><br>
			<c:if test='<%=xygl.getMS_POS_RESP_FLAG().equals("1") %>'>√明确合同信用管理部门相关岗位职责</c:if>
			<c:if test='<%=xygl.getMS_POS_RESP_FLAG().equals("0") %>'>□明确合同信用管理部门相关岗位职责</c:if>
			<c:if test='<%=xygl.getMS_DELEGATE_FLAG().equals("1") %>'>√委托授权管理制度</c:if>
			<c:if test='<%=xygl.getMS_DELEGATE_FLAG().equals("0") %>'>□委托授权管理制度</c:if>
			<br/><br/>
			<c:if test='<%=xygl.getMS_SIGN_REVIEW_FLAG().equals("1") %>'>√合同签订评审制度</c:if>
			<c:if test='<%=xygl.getMS_SIGN_REVIEW_FLAG().equals("0") %>'>□合同签订评审制度</c:if>
			<c:if test='<%=xygl.getMS_SEAL_FILE_FLAG().equals("1") %>'>√合同印章和合同文本管理制度</c:if>
			<c:if test='<%=xygl.getMS_SEAL_FILE_FLAG().equals("0") %>'>□合同印章和合同文本管理制度</c:if>
			<br/><br/>
			<c:if test='<%=xygl.getMS_RISK_EMG_FLAG().equals("1") %>'>√客户风险评价、授权及应急处理制度</c:if>
			<c:if test='<%=xygl.getMS_RISK_EMG_FLAG().equals("0") %>'>□客户风险评价、授权及应急处理制度</c:if><br><br>
			<c:if test='<%=xygl.getMS_SIGN_CANCEL_FLAG().equals("1") %>'>√合同签订、履行、变更和解除管理制度</c:if>
			<c:if test='<%=xygl.getMS_SIGN_CANCEL_FLAG().equals("0") %>'>□合同签订、履行、变更和解除管理制度</c:if>
			<br/><br/>
			<c:if test='<%=xygl.getMS_RECV_ACCT_FLAG().equals("1") %>'>√应收账款与商账管理制度</c:if>
			<c:if test='<%=xygl.getMS_RECV_ACCT_FLAG().equals("0") %>'>□应收账款与商账管理制度</c:if>
			<c:if test='<%=xygl.getMS_PAY_ACCT_FLAG().equals("1") %>'>√应付账款管理制度</c:if>
			<c:if test='<%=xygl.getMS_PAY_ACCT_FLAG().equals("0") %>'>□应付账款管理制度</c:if>
			<c:if test='<%=xygl.getMS_GUEST_FLAG().equals("1") %>'>√客户信用档案管理制度</c:if>
			<c:if test='<%=xygl.getMS_GUEST_FLAG().equals("0") %>'>□客户信用档案管理制度</c:if>
		</td>
</tr>

<tr>
	<td align='center' height=40 rowspan="2">合同信用管理人员数</td>
	<td align='center' height=40  colspan="3">专职人数</td>
	<td align='center' colspan="4"><%=xygl.getFULLTIME_MNG_QTY()%>人</td>
</tr>

<tr>
	<td align='center' height=40  colspan="3">兼职人数</td>
	<td align='center' colspan="4"><%=xygl.getPARTTIME_MNG_QTY()%>人</td>
</tr>

<tr>
	<td align='center' height=40 width="20%">格式条款是否备案</td>
	<td align='center'  colspan="3">
			<c:if test='<%=xwgf.getFC_ARCH_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=xwgf.getFC_ARCH_FLAG().equals("0") %>'>□有    √无</c:if>
	</td>
	<td align='center' height=40  colspan="3" >格式条款有否违控记录</td>
	<td align='center' >
			<c:if test='<%=xwgf.getFC_VIOL_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=xwgf.getFC_VIOL_FLAG().equals("0") %>'>□有    √无</c:if>
	</td>
</tr>

<tr>
	<td align='center' height=40 >行业有无合同示范为本</td>
	<td align='center' colspan="7">
			<c:if test='<%=xwgf.getMODEL_TEXT_TYPE().equals("1") %>'>√有    □无    □适合本企业使用    □不适合本企业使用</c:if>
			<c:if test='<%=xwgf.getMODEL_TEXT_TYPE().equals("0") %>'>□有    √无    □适合本企业使用    □不适合本企业使用</c:if>
			<c:if test='<%=xwgf.getMODEL_TEXT_TYPE().equals("2") %>'>□有    □无    √适合本企业使用    □不适合本企业使用</c:if>
			<c:if test='<%=xwgf.getMODEL_TEXT_TYPE().equals("3") %>'>□有    □无    □适合本企业使用    √不适合本企业使用</c:if>
	</td>
</tr>

<tr>
	<td align='center' height=40 >收入性合同书面签约率</td>
    <td align='center' colspan="4"><%=sl1.getINC_SIGN_RATE() %></td>
	<td align='center' colspan="4"><%=sl2.getINC_SIGN_RATE() %></td> 
</tr>

<tr>
	<td align='center' height=40 >支出性合同书面签约率</td>
	<td align='center' colspan="4"><%=sl1.getEXP_SIGN_RATE() %></td>
	<td align='center' colspan="4"><%=sl2.getEXP_SIGN_RATE() %></td> 
</tr>

<tr>
	<td align='center' height=40 >合同示范文本使用率</td>
	<td align='center' colspan="4"><%=sl1.getEXP_SIGN_RATE() %></td>
	<td align='center' colspan="4"><%=sl2.getEXP_SIGN_RATE() %></td> 
</tr>

<tr>
	<td align='center' height=40 >合同签订授权委托管理</td>
	<td align='left' colspan="8"><%=xwgf.getDELEG_TYPEVIEW()%></td>
	</tr>
</table>
<br>
<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>
	<tr>
		<td align='center' height=40  rowspan="2">合同签订审核管理</td>
		<td align="left" colspan="4">合同签订审批(可多选)<br><br><%=xwgf.getSINGAPPRTYPEVIEW()%></td>
</tr>

<tr>
	<td align='left' height=40  colspan="4">合同签订审核内容(可多选)<br><br>
			<c:if test='<%=xwgf.getSA_QUAL_FLAG().equals("1") %>'>√对方资格和经验范围</c:if>
			<c:if test='<%=xwgf.getSA_QUAL_FLAG().equals("0") %>'>□对方资格和经验范围</c:if>
			<c:if test='<%=xwgf.getSA_VALID_FLAG().equals("1") %>'>√对方合法性</c:if>
			<c:if test='<%=xwgf.getSA_VALID_FLAG().equals("0") %>'>□对方合法性</c:if>
			<br>
			<c:if test='<%=xwgf.getSA_CREDIT_FLAG().equals("1") %>'>√对方资信状况</c:if>
			<c:if test='<%=xwgf.getSA_CREDIT_FLAG().equals("0") %>'>□对方资信状况</c:if>
			<br>
			<c:if test='<%=xwgf.getSA_PERFORM_FLAG().equals("1") %>'>√对方履约能力</c:if>
			<c:if test='<%=xwgf.getSA_PERFORM_FLAG().equals("0") %>'>□对方履约能力</c:if>
	
	</td>
</tr>

<tr>
	<td align="center" rowspan="3">合同档案和台账管理</td>
	<td align="center" height=40 >有无合同档案管理部门</td>
	<td align="center" colspan="3">
			<c:if test='<%=xwgf.getMNG_ORG_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=xwgf.getMNG_ORG_FLAG().equals("0") %>'>□无    √有</c:if>
	</td>


</tr>

<tr>
	<td align='left' height=40  colspan="4">台账登记形式<br><%=xwgf.getACCTFORMTYPEVIEW()%></td>

</tr>

<tr>
	<td height=40  align="left" colspan="4">台账内容(可多选)<br>
			<c:if test='<%=xwgf.getACCT_SERIAL_FLAG().equals("1") %>'>√合同编号</c:if>
			<c:if test='<%=xwgf.getSA_PERFORM_FLAG().equals("0") %>'>□合同编号</c:if>
			<c:if test='<%=xwgf.getACCT_GUEST_FLAG().equals("1") %>'>√客户名称</c:if>
			<c:if test='<%=xwgf.getACCT_GUEST_FLAG().equals("0") %>'>□客户名称</c:if>
			<c:if test='<%=xwgf.getACCT_WHEN_FLAG().equals("1") %>'>√签订时间</c:if>
			<c:if test='<%=xwgf.getACCT_WHEN_FLAG().equals("0") %>'>□签订时间</c:if>
			<c:if test='<%=xwgf.getACCT_UNDLY_FLAG().equals("1") %>'>√合同标的</c:if>
			<c:if test='<%=xwgf.getACCT_UNDLY_FLAG().equals("0") %>'>□合同标的</c:if>
			<br>
			<c:if test='<%=xwgf.getACCT_QTY_FLAG().equals("1") %>'>√合同数量</c:if>
			<c:if test='<%=xwgf.getACCT_QTY_FLAG().equals("0") %>'>□合同数量</c:if>
			<c:if test='<%=xwgf.getACCT_CAP_FLAG().equals("1") %>'>√合同金额</c:if>
			<c:if test='<%=xwgf.getACCT_CAP_FLAG().equals("0") %>'>□合同金额</c:if>
			<c:if test='<%=xwgf.getACCT_PLAN_TIME_FLAG().equals("1") %>'>√应履行时间</c:if>
			<c:if test='<%=xwgf.getACCT_PLAN_TIME_FLAG().equals("0") %>'>□应履行时间</c:if>
			<br>
			<c:if test='<%=xwgf.getACCT_REAL_TIME_FLAG().equals("1") %>'>√实际履行时间</c:if>
			<c:if test='<%=xwgf.getACCT_REAL_TIME_FLAG().equals("0") %>'>□实际履行时间</c:if>
			<c:if test='<%=xwgf.getACCT_PLAN_CAP_FLAG().equals("1") %>'>√应履行金额</c:if>
			<c:if test='<%=xwgf.getACCT_PLAN_CAP_FLAG().equals("0") %>'>□应履行金额</c:if>
			<c:if test='<%=xwgf.getACCT_REAL_CAP_FLAG().equals("1") %>'>√实际履行金额</c:if>
			<c:if test='<%=xwgf.getACCT_REAL_CAP_FLAG().equals("0") %>'>□实际履行金额</c:if>
			<c:if test='<%=xwgf.getACCT_PERFOM_CERT_FLAG().equals("1") %>'>√履行凭证</c:if>
			<c:if test='<%=xwgf.getACCT_PERFOM_CERT_FLAG().equals("0") %>'>□履行凭证</c:if>
			<c:if test='<%=xwgf.getACCT_CHANGE_FLAG().equals("1") %>'>√变更解除情况</c:if>
			<c:if test='<%=xwgf.getACCT_CHANGE_FLAG().equals("0") %>'>□变更解除情况</c:if>
	</td>

</tr>

<tr>
	<td align='center' height=40  rowspan="3">客户资信商帐管理</td>
	<td align='left' colspan="4" height=40 >客户信用信息数据建立方式<br><%=xwgf.getGUESTINFOTYPEVIEW()%></td>

</tr>

<tr>
	<td align="left" height=40  colspan="4">客户资信管理(可多选)<br>
			<c:if test='<%=xwgf.getGC_RECORD_FLAG().equals("1") %>'>√有档案</c:if>
			<c:if test='<%=xwgf.getGC_RECORD_FLAG().equals("0") %>'>□有档案</c:if>
			<c:if test='<%=xwgf.getGC_THIRD_PART_FLAG().equals("1") %>'>√第三方征信报</c:if>
			<c:if test='<%=xwgf.getGC_THIRD_PART_FLAG().equals("0") %>'>□第三方征信报</c:if>
			<c:if test='<%=xwgf.getGC_RESERCH_FLAG().equals("1") %>'>√实地调查报告</c:if>
			<c:if test='<%=xwgf.getGC_RESERCH_FLAG().equals("0") %>'>□实地调查报告</c:if>
		</td>
</tr>

<tr>
	<td align='left' height=40  colspan="4">商帐管理(可多选)<br>
			<c:if test='<%=xwgf.getAM_RECV_AGE_FLAG().equals("1") %>'>√应收帐龄分析</c:if>
			<c:if test='<%=xwgf.getAM_RECV_AGE_FLAG().equals("0") %>'>□应收帐龄分析</c:if>
			<c:if test='<%=xwgf.getAM_OVERDUE_FLAG().equals("1") %>'>√逾期账款分析</c:if>
			<c:if test='<%=xwgf.getAM_OVERDUE_FLAG().equals("0") %>'>□逾期账款分析</c:if>
			<c:if test='<%=xwgf.getAM_SPEC_RECOVER_FLAG().equals("1") %>'>√专人账款追收</c:if>
			<c:if test='<%=xwgf.getAM_SPEC_RECOVER_FLAG().equals("0") %>'>□专人账款追收</c:if>
			<c:if test='<%=xwgf.getAM_RECV_SUM_FLAG().equals("1") %>'>√应收账款分析</c:if>
			<c:if test='<%=xwgf.getAM_RECV_SUM_FLAG().equals("0") %>'>□应收账款分析</c:if>
	</td>
</tr>

<tr align="center" height="44">
	<td rowspan="7" align="center">合同争议解决、处理</td>
	<td align="center" colspan="2" width="30%" >项目/年度</td>
	<td align="center" ><%=REPORT_YEAR1%>年</td>
	<td align="center" ><%=REPORT_YEAR2%>年</td>
</tr>
<tr>
<td align='center' rowspan="2">因违约产生的合同争议</td>
	<td align='center' height=40 >本方违约件数</td>
	<td align='center' ><%=sl1.getLAST_DFT_OUR_QTY() %></td>
	<td align='center' ><%=sl2.getLAST_DFT_OUR_QTY() %></td>
</tr>
<tr>
	<td align='center' height=40 >对方违约件数</td>
	<td align='center' ><%=sl1.getLAST_DFT_THEY__QTY() %></td>
	<td align='center' ><%=sl2.getLAST_DFT_THEY__QTY() %></td>

</tr>

<tr>
	<td align='center' rowspan="4">合同争议解决</td>
	<td align='center' height=40 >和解件数</td>
	<td align='center' ><%=sl1.getDISP_COMP_QTY() %></td>
	<td align='center' ><%=sl2.getDISP_COMP_QTY() %></td>
	<%-- <td align='center' colspan="2"><%=xwgf.getDISP_COMP_QTY()%></td> --%>
</tr>
<tr>
	<td align='center' height=40 >调解件数</td>
	<td align='center' ><%=sl1.getDISP_MED_QTY() %></td>
	<td align='center' ><%=sl2.getDISP_MED_QTY() %></td>
	<%-- <td align='center' colspan="2"><%=xwgf.getDISP_MED_QTY()%></td> --%>
</tr>

<tr>
	<td align='center' height=40 >仲裁件数</td>
	<td align='center' ><%=sl1.getDISP_ARB_QTY() %></td>
	<td align='center' ><%=sl2.getDISP_ARB_QTY() %></td>
	<%-- <td align='center' colspan="2"><%=xwgf.getDISP_ARB_QTY()%></td> --%>
</tr>

<tr>
	<td align='center' height=40 >诉讼件数</td>
	<td align='center' ><%=sl1.getDISP_LAW_QTY() %></td>
	<td align='center' ><%=sl2.getDISP_LAW_QTY() %></td>
	<%-- <td align='center' colspan="2"><%=xwgf.getDISP_LAW_QTY()%></td> --%>
	</tr>
</table>
<br>

<h1><b> <span style="font-size: 16pt"><center>合同履行状况</center></b></h1>
<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>

	<tr align='center' height=40>
		<td  colspan="3" rowspan="2">项目/年度</td>
		<td  colspan="2"><%=REPORT_YEAR1%>年</td>
		<td  colspan="2"><%=REPORT_YEAR2%>年</td>
	</tr>
	<tr align='center'>
		<td >收入性合同</td>
		<td >支出性合同</td>
		<td >收入性合同</td>
		<td >支出性合同</td>
	</tr>

	<tr>
		<td align='center' height=25 width="20%" rowspan="2" colspan="2">书面合同总数</td>
		<td align="center" height=25 width="20%">份数（份）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_CONT_QTY()%></td>
	</tr>

	<tr>
		<td align="center" height=25 width="20%">金额（万元）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_CONT_RMB_W()%></td>
	</tr>



	<tr>
		<td align='center' height=25 width="20%" rowspan="2" colspan="2">其中:当年签订的书面合同</td>
		<td align="center" height=25 width="20%">份数（份）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getLAST_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_CONT_QTY()%></td>
	</tr>

	<tr>
		<td align="center" height=25 width="20%">金额（万元）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getLAST_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_CONT_RMB_W()%></td>
	</tr>



	<tr>
		<td align='center' height=25 width="20%" rowspan="2" colspan="2">应当履行合同</td>
		<td align="center" height=25 width="20%">份数（份）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getPLAN_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getPLAN_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getPLAN_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getPLAN_CONT_QTY()%></td>
	</tr>

	<tr>
		<td align="center" height=25 width="20%">金额（万元）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getPLAN_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getPLAN_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getPLAN_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getPLAN_CONT_RMB_W()%></td>
	</tr>



	<tr>
		<td align='center' height=25 width="20%" rowspan="2" colspan="2">实际履行合同</td>
		<td align="center" height=25 width="20%">份数（份）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getREAL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getREAL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getREAL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getREAL_CONT_QTY()%></td>
	</tr>

	<tr>
		<td align="center" height=25 width="20%">金额（万元）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getREAL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getREAL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getREAL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getREAL_CONT_RMB_W()%></td>
	</tr>



	<tr>
		<td align='center' height=25 width="20%" rowspan="2" colspan="2">撤销合同</td>
		<td align="center" height=25 width="20%">份数（份）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getCANCEL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getCANCEL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getCANCEL_CONT_QTY()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getCANCEL_CONT_QTY()%></td>
	</tr>
	<tr>
		<td align="center" height=25 width="20%">金额（万元）</td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getCANCEL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getCANCEL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getCANCEL_CONT_RMB_W()%></td>
		<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getCANCEL_CONT_RMB_W()%></td>
	</tr>



	<tr>
		<td align='center' height=25 width="20%" rowspan="2" colspan="2">协议解除合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCOMP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCOMP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCOMP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCOMP_CONT_QTY()%></td>
	</tr>

	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCOMP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCOMP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCOMP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCOMP_CONT_RMB_W()%></td>
	</tr>


	<tr>
		<td align='center' height=25 width="20%" rowspan="2" colspan="2">其他形式解除合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOTHER_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOTHER_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOTHER_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOTHER_CONT_QTY()%></td>
	</tr>
	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOTHER_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOTHER_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOTHER_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOTHER_CONT_RMB_W()%></td>
	</tr>



	<tr>
		<td align='center' height=25 width="20%" rowspan="2"colspan="2">变更合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCHANGE_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCHANGE_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCHANGE_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCHANGE_CONT_QTY()%></td>
	</tr>
	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCHANGE_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCHANGE_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCHANGE_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCHANGE_CONT_RMB_W()%></td>
	</tr>



	<tr>
		<td align='center' height=25 width="20%" rowspan="2" colspan="2">到期未履行的合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOVERDUE_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOVERDUE_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOVERDUE_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOVERDUE_CONT_QTY()%></td>
	</tr>
	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOVERDUE_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOVERDUE_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOVERDUE_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOVERDUE_CONT_RMB_W()%></td>
	</tr>

	<tr>
		<td rowspan="6" align='center' >其中</td>
		<td align='center' height=25 width="20%" rowspan="2">本方违约合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_OUR_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_OUR_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_OUR_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_OUR_QTY()%></td>
	</tr>


	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_OUR_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_OUR_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_OUR_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_OUR_RMB_W()%></td>
	</tr>

	<tr>
		<td align='center' height=25 width="20%" rowspan="2">对方违约合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_THEY_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_THEY_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_THEY_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_THEY_QTY()%></td>
	</tr>
	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_THEY_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_THEY_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_THEY_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_THEY_RMB_W()%></td>
	</tr>
	<tr>
		<td align='center' height=25 width="20%" rowspan="2">因不可抗力未履行合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_GOD_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_GOD_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_GOD_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_GOD_QTY()%></td>
	</tr>
	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_GOD_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_GOD_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_GOD_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_GOD_RMB_W()%></td>
	</tr>

	<tr align='center' >
		<td rowspan="2" colspan="2">发生争议合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getLAST_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_DISP_CONT_QTY()%></td>
	</tr>

	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getLAST_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_DISP_CONT_RMB_W()%></td>
	</tr>

	<tr align='center' >
		<td rowspan="2" style="width: 2%" colspan="2">累计争议合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_DISP_CONT_QTY()%></td>
	</tr>
	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_DISP_CONT_RMB_W()%></td>
	</tr>

	<tr align='center' >
		<td rowspan="2" style="width: 2%" colspan="2">解决争议合同</td>
		<td align='center' height=25 width="20%">份数（份）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getSOLVE_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getSOLVE_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getSOLVE_DISP_CONT_QTY()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getSOLVE_DISP_CONT_QTY()%></td>
	</tr>
	<tr>
		<td align='center' height=25 width="20%">金额（万元）</td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getSOLVE_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getSOLVE_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getSOLVE_DISP_CONT_RMB_W()%></td>
		<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getSOLVE_DISP_CONT_RMB_W()%></td>
	</tr>
	
</table>

<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>

	<tr align='center' height=40>
		<td  colspan="2" >项目/年度</td>
		<td  ><%=REPORT_YEAR1%>年</td>
		<td  ><%=REPORT_YEAR2%>年</td>
	</tr>
	
	<tr>
		<td align='center' height=40 colspan="2">当年收入性合同实际履约率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getRECV_PRFM_QTY_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getRECV_PRFM_QTY_RATE()%> %</td>
	</tr>
	
	<tr>
		<td align='center' height=40 colspan="2">当年支出性合同实际履约率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getPAY_PRFM_QTY_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getPAY_PRFM_QTY_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="2">期末应收款占收入性合同比例</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getRECV_AMT_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getRECV_AMT_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="2">期末应付款占支出性合同比例</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getPAY_AMT_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getPAY_AMT_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="2">合同撤销率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getREVOKE_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getREVOKE_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40  colspan="2">协议解除合同率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getCOMP_RQTE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getCOMP_RQTE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="2">其他形式解除合同率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getOTHER_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getOTHER_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40  colspan="2">合同变更率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getCHANGE_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getCHANGE_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="2">到期未履行的合同比率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getOVERDUE_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getOVERDUE_RATE()%> %</td>
	</tr>
	
	<tr>
	<td rowspan="3" align='center' >其中</td>
		<td align='center' height=40 >本方违约合同比率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDFT_OUR_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDFT_OUR_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40 >对方违约合同比率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDFT_THEY_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDFT_THEY_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40 >因不可抗力因素未履行合同比率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getGOD_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getGOD_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40  colspan="2">合同争议率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDISP_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDISP_RATE()%> %</td>
	</tr>
	<tr>
		<td align='center' height=40  colspan="2">合同争议解决率</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getSOLVE_RATE()%> %</td>
		<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getSOLVE_RATE()%> %</td>
	</tr>
</table>
<br><br><br><br><br><br><br><br><br><br><br>
<h1><b> <span style="font-size: 16pt"><center>企业经营效益</center></b></h1>
<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>
		

	<tr align="center" height="44">
	<td align="center">项目/年份</td>
	<td align="center"><%=REPORT_YEAR1%>年（%）</td>
	<td  align="center"><%=REPORT_YEAR2%>年（%）</td>
</tr>

<tr>
	<td align='center' height=50 width="40%">营业收入增长率(%)</td>
	<td align='center'><%=jyxy.getREVE_GROW_RATE()%></td>
	<td align='center'><%=jyxy1.getREVE_GROW_RATE()%></td>
</tr>

<tr>
	<td align='center' height=50 width="40%">主营业务利润率(%)</td>
	<td align='center'><%=jyxy.getPRI_GROW_RATE()%></td>
	<td align='center'><%=jyxy1.getPRI_GROW_RATE()%></td>
</tr>

<tr>
	<td align='center' height=50 width="40%">净资产收益率(%)</td>
	<td align='center'><%=jyxy.getNET_ASSET_RATE()%></td>
	<td align='center'><%=jyxy1.getNET_ASSET_RATE()%></td>
</tr>

<tr>
	<td align='center' height=50 width="40%">资产负债率(%)</td>
	<td align='center'><%=jyxy.getDEBT_ASSET_RATE()%></td>
	<td align='center'><%=jyxy1.getDEBT_ASSET_RATE()%></td>
</tr>

<tr>
	<td align='center' height=50 width="40%">速动比率(%)</td>
	<td align='center'><%=jyxy.getQUICK_ACT_RATE()%></td>
	<td align='center'><%=jyxy1.getQUICK_ACT_RATE()%></td>
</tr>

<tr>
	<td align='center' height=50 width="40%">应收账款周转率(%)</td>
	<td align='center'><%=jyxy.getRECV_TNOV_RATE()%></td>
	<td align='center'><%=jyxy1.getRECV_TNOV_RATE()%></td>
</tr>

<tr>
	<td align='center' height=50 width="40%">逾期账款占应收账款比例(%)</td>
	<td align='center'><%=jyxy.getRCV_OVERDUE_RATE()%></td>
	<td align='center'><%=jyxy1.getRCV_OVERDUE_RATE()%></td>
</tr>

<tr>
	<td align='center' height=50 width="40%">逾期账款占应付账款比例(%)</td>
	<td align='center'><%=jyxy.getPAY_OVERDUE_RATE()%></td>
	<td align='center'><%=jyxy1.getPAY_OVERDUE_RATE()%></td>
</tr>


</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<h1><b> <span style="font-size: 16pt"><center>企业社会责任和信用</center></b></h1>
<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700"  border=1>
		

	<tr>
		<td align='center' rowspan="3">劳动保护</td>

		<td align='center' height=40>拖欠员工工资</td>
		<td align='center'>
			<c:if test='<%=SZCP_SQ_ZRXY.getLP_ARR_WAGE_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_ZRXY.getLP_ARR_WAGE_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40>与员工均签订劳动合同</td>
		<td align='center'>
			<c:if test='<%=SZCP_SQ_ZRXY.getLP_ALL_CONT_FLAG().equals("1") %>'>√有    □无</c:if>
			<c:if test='<%=SZCP_SQ_ZRXY.getLP_ALL_CONT_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40>办理社会保险</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getLP_SOC_INSRC_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getLP_SOC_INSRC_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40>纳税信用</td>
		<td align='center'>涉嫌税法</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getTAX_VOLITE_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getTAX_VOLITE_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>

	<tr>
		<td align='center' height=40 rowspan="2">环境保护</td>
		<td align='center' height=40>生产经营违反环保法律法规</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getECO_OPR_DMG_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getECO_OPR_DMG_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40>产品或服务违反环保规定</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getECO_PRO_DMG_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getECO_PRO_DMG_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>

	<tr>
		<td align='center' height=40 rowspan="2">安全生产</td>
		<td align='center' height=40>重大安全事故</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getSP_MAJOR_ACC_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getSP_MAJOR_ACC_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40>被安检部门查处</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getSP_ORG_INVEST_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getSP_ORG_INVEST_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="1">产品质量</td>
		<td align='center'>产品质量违法行为</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getQS_INVEST_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getQS_INVEST_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40>银行信贷</td>
		<td align='center'>逾期银行贷款</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getBANK_INVEST_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getBANK_INVEST_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr>
		<td align='center' height=40>海关信用</td>
		<td align='center'>进出口违法行为</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getCSTM_INVEST_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getCSTM_INVEST_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
<%-- 	<tr>
		<td align='center' height=40>建筑工程</td>
		<td align='center'>建设工程违法违规行为</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getCE_INVEST_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getCE_INVEST_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr> --%>
	<tr>
		<td align='center' height=40 colspan="2">未执行法院裁决、裁定事项</td>
		<td align='center'><%=REPORT_YEAR1%>年: <%=gyjz_last.getLAST_COURT_INVEST_QTY() %> 次 &nbsp;&nbsp; 
			<%=REPORT_YEAR2%>年: <%=gyjz_next.getLAST_COURT_INVEST_QTY() %> 次</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="2">未执行仲裁机构裁决事项</td>
		<td align='center'><%=REPORT_YEAR1%>年: <%=gyjz_last.getLAST_ARBIT_INVEST() %> 次 &nbsp;&nbsp; 
			<%=REPORT_YEAR2%>年: <%=gyjz_next.getLAST_ARBIT_INVEST() %> 次</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan="2">其他违法违规行为</td>
		<td align='center'>
				<c:if test='<%=SZCP_SQ_ZRXY.getOTHER_INVEST_FLAG().equals("1") %>'>√有    □无</c:if>
				<c:if test='<%=SZCP_SQ_ZRXY.getOTHER_INVEST_FLAG().equals("0") %>'>□有    √无</c:if>
		</td>
	</tr>
	<tr height="44" align="center">
		<td>公益捐赠</td>
		<td>捐赠折合金额</td>
		<td><%=gyjz_last.getLAST_DONT_RMB_W() %>&nbsp;元</td>
	</tr>
</table>
<br><br><br><br><br><br><br><br><br><br>

<h1><b> <span style="font-size: 16pt"><center>社会荣誉</center></b><br></h1>
<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>
		

	<tr align='center' height=40 width="20%">
		<td>荣誉级别</td>
		<td>荣誉名称</td>
		<td>证件号</td>
		<td>授予单位</td>
		<td>授予日期</td>
		<td>有效期至</td>
		<td>说明</td>
	</tr>
	<c:if test="<%=list.size() == 0%>">
		<tr align='center' height=40 width="20%">
			<td colspan="8">暂无数据，请先点击右上角按钮进行添加！</td>
		</tr>
	</c:if>
	<c:if test="<%=list.size() != 0%>">
		<c:forEach items="<%=list%>" var="temp">
			<tr align='center' height=40 width="20%">
				<td>${temp.HONOR_LEVEL_TYPE_VIEW}</td>
				<td>${temp.CERT_NAME}</td>
				<td>${temp.CERT_NO}</td>
				<td>${temp.AUTH_ORG_DESC}</td>
				<td>${temp.ISSUE_DATE}</td>
				<td>${temp.VALID_TO_DATE}</td>
				<td>${temp.HONORDESC}</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<br><br><br><br><br><br><br><br>

<h1><b> <span style="font-size: 16pt"><center>相关证书</center></b></h1>
<table align="center"  CELLSPACING="0"  CELLPADDING="0" bordercolor="#000000"  WIDTH="700" border=1>

		


	<tr align='center' height=40 width="20%">
		<td>证件名称</td>
		<td>证件编号</td>
		<td>发证机构</td>
		<td>发证日期</td>
		<td>有效期至</td>
	</tr>
	<c:if test="<%=list1.size() == 0%>">
		<tr>
			<td colspan="8">暂无数据，请先点击右上角按钮进行添加！</td>
		</tr>
	</c:if>
	<c:if test="<%=list1.size() != 0%>">
		<c:forEach items="<%=list1%>" var="temp">
			<tr align='center' height=40 width="20%">
				<td>${temp.CERT_NAME}</td>
				<td>${temp.CERT_NO}</td>
				<td>${temp.AUTH_ORG_DESC}</td>
				<td>${temp.ISSUE_DATE}</td>
				<td>${temp.VALID_TO_DATE}</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

</body>
</html>