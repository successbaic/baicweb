<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
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
	
webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��
String webPath = request.getContextPath() ;
String sanZheng = icms.getSanZheng(webuser.getXZQH());
boolean isSanZheng = false;

sanZheng = "0";

if("1".equals(sanZheng)){
	isSanZheng = true;
}
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
<script language="javascript" src="<%=request.getContextPath() %>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath() %>/szcp/css/print.css" type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath() %>/szcp/css/NoPrint.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ӡȫ��</title>
</head>
<body onload="init()" style="margin-top: 0; margin-bottom: 0" id="body" >
	<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="wb" name="wb" width="0"></OBJECT>
<%
	String REG_NO = request.getParameter("REG_NO");
	String YEAR =request.getParameter("EVAL_YEAR");
	String CerNO = request.getParameter("CerNO");
	SZCP_SQ_JBXX.doSelect(REG_NO,YEAR,CerNO);
	String v = request.getParameter("sv");
	//jbxx
	//��ҵ��ģ 
	String ent_scale_Type = SZCP_SQ_JBXX.getENT_SCALE_TYPE();
	String entScaleStr = "";
	 if(ent_scale_Type== null || "".equals(ent_scale_Type)) {
		entScaleStr = SZCP_SQ_JBXX.queryALLENT_SCALE_TYPE();
	}else {
		entScaleStr = SZCP_SQ_JBXX.queryENT_SCALE_TYPE_Name_Print(ent_scale_Type);
	}

	// ������ҵ����
		String local_industry_Type = SZCP_SQ_JBXX.getLOCAL_INDUSTRY_TYPE();
		String localIndustryStr = "";
			if(local_industry_Type == null || "".equals(local_industry_Type)) {
			localIndustryStr = SZCP_SQ_JBXX.queryALLLOCAL_INDUSTRY_TYPE_NAME();
		}else {
			localIndustryStr = SZCP_SQ_JBXX.queryLOCAL_INDUSTRY_TYPE_NAME_Print(local_industry_Type);
		} 
		//ְ��
		String postCode = SZCP_SQ_JBXX.getLIAI_POS_CODE();
		String postCodeStr = "";
		if (postCode == null || "".equals(postCode)) {
			// ���������ֵ�����
			postCodeStr = SZCP_SQ_JBXX.queryALLPOSTCODENAME();
		} else {
			// ����code��ѯ�����ֵ�
			postCodeStr = SZCP_SQ_JBXX.queryPostCodeName_Print(postCode);
		}
		//��ѯ���б��ͻ���370100200195319
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
		// ��ѯ��ͬ���ù������
		if (xygl.getMNG_ORG_TYPE() != null&& !"".equals(xygl.getMNG_ORG_TYPE())) {
			
			xygl.setMNG_ORG_NAMEVIEW(xyglDao.queryMNG_ORG_TYPE_Print(xygl.getMNG_ORG_TYPE()));
			
		} else {
			
			xygl.setMNG_ORG_NAMEVIEW(xyglDao.queryAllMNG_ORG_TYPE());
		}
		// ��ѯְλ
		if (xygl.getORG_LEAD_POS_TYPE() != null&& !"".equals(xygl.getORG_LEAD_POS_TYPE())) {
			xygl.setORG_LEAD_POSVIEW(xyglDao.queryPostCodeName_Print(xygl.getORG_LEAD_POS_TYPE()));
		} else {
			xygl.setORG_LEAD_POSVIEW(xyglDao.queryALLPOSTCODENAME());
		}
		// ��ѯְҵ�ʸ�
		if (xygl.getORG_LEAD_QUAL_TYPE() != null
				&& !"".equals(xygl.getORG_LEAD_QUAL_TYPE())) {
			xygl.setORG_LEAD_QUAL_TYPEVIEW(xyglDao
					.queryOrgQual_Level_Type_Print(xygl.getORG_LEAD_QUAL_TYPE(),""));
		} else {
			xygl.setORG_LEAD_QUAL_TYPEVIEW(xyglDao
					.queryAllOrgQualLevelType());
		}

		//��ѯְ��
		if (xygl.getQUAL_LEVEL_TYPE() != null
				&& !"".equals(xygl.getQUAL_LEVEL_TYPE())) {
			xygl.setQUAL_LEVELVIEW(xyglDao.queryQualLevelType_Print(xygl
					.getQUAL_LEVEL_TYPE(),""));
		} else {
			xygl.setQUAL_LEVELVIEW(xyglDao.queryAllQualLevelType());
		}

		//��ͬ��Ȩί�й���
		if (xwgf.getDELEG_TYPE() != null
				&& !"".equals(xwgf.getDELEG_TYPE())) {
			xwgf.setDELEG_TYPEVIEW(xwgfDao.queryDELEG_TYPE_Print(xwgf
					.getDELEG_TYPE(),""));
		} else {
			xwgf.setDELEG_TYPEVIEW(xwgfDao.queryAllDELEG_TYPE());
		}

		// ̨�˵Ǽ���ʽ
		if (xwgf.getACCT_FORM_TYPE() != null
				&& !"".equals(xwgf.getACCT_FORM_TYPE())) {
			xwgf.setACCTFORMTYPEVIEW(xwgfDao.queryACCTFORMTYPE_Print(xwgf
					.getACCT_FORM_TYPE(),""));
		} else {
			xwgf.setACCTFORMTYPEVIEW(xwgfDao.queryAllACCTFORMTYPE());
		}

		//�ͻ�������Ϣ������ʽ
		if (xwgf.getGUEST_INFO_TYPE() != null
				&& !"".equals(xwgf.getGUEST_INFO_TYPE())) {
			xwgf.setGUESTINFOTYPEVIEW(xwgfDao.queryACCTFORMTYPE_Print(xwgf
					.getGUEST_INFO_TYPE(),""));
		} else {
			xwgf.setGUESTINFOTYPEVIEW(xwgfDao.queryAllACCTFORMTYPE());
		}

		// ��ͬǩ������
		if (xwgf.getSIGN_APPR_TYPE() != null
				&& !"".equals(xwgf.getSIGN_APPR_TYPE())) {
			xwgf.setSINGAPPRTYPEVIEW(xwgfDao.querySIGNAPPRTYPE_Print(xwgf
					.getSIGN_APPR_TYPE(),""));
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
%>

<div style="text-align: right;" class="noprint">
			<input type=button name=button_print value="��ӡ"
				onclick="javascript:print()"> <input type=button
				name=button_show value="��ӡԤ��" onclick="javascript:printpreview();">
	</div><br>
	<table width="90%" align="center" bordercolor="#000000">
		<tr>
			<td><b> <span style="font-size: 20pt"><center>�����й������������<u><%=REPORT_YEAR2 %></u>-<u><%=REPORT_YEAR1 %></u>���</center></center></b>
		    <b> <span style="font-size: 20pt"><center>"�غ�ͬ������"��ҵ��ʾ�걨��</center></b>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<b> <span style="font-size: 20pt">�걨��ҵ����:<u><%=SZCP_SQ_JBXX.getENT_NAME()%></u>���Ӹ���ҵ���£�</b><br><br>
			<b> <span style="font-size: 20pt">�걨����:<u><%= lczt.getAPPLY_DATE()==""?"" :lczt.getAPPLY_DATE()%></u></b><br><br>
			<b> <span style="font-size: 20pt">��ҵ���ڵ�:<u><%=SZCP_SQ_JBXX.getADDR_DESC()%></u></b><br></td>
		</tr>
	</table>
	<br><p class="PageNext">
	<table width="90%" align="center" bordercolor="#000000">
		<caption align="center">
			<b> <span style="font-size: 20pt"><center>��ŵ��</center></b><br>
		</caption>
		<tr>
			<td><font size="4">
		&nbsp;&nbsp;һ������ҵ��Ը�걨�μӼ����й������������<u><%=REPORT_YEAR2 %></u>-<u><%=REPORT_YEAR1 %></u>���"�غ�ͬ������"��ҵ��ʾ���<br><br>
		&nbsp;&nbsp;��������ҵ��֤���ṩ����Ϣ�����ݡ�������ʵ��Ч�������������ֽ���걨������һ�£����Դ˳е���Ӧ���Ρ�<br><br>
		&nbsp;&nbsp;��������ҵͬ�⽫����ҵ<u><%=REPORT_YEAR2 %></u>-<u><%=REPORT_YEAR1 %></u>��ȵ�һ�º�ͬ��Լ��Ϣ���ڼ����й������������������"�غ�ͬ������"��ҵ��ʾƽ̨������ṫʾ��<br><br>
		&nbsp;&nbsp;1.�����Ժ�ͬʵ����Լ��<br><br>
		&nbsp;&nbsp;2.֧���Ժ�ͬʵ����Լ��<br><br>
		&nbsp;&nbsp;3.��ĩӦ�տ�ռ�����Ժ�ͬ�ܶ����<br><br>
		&nbsp;&nbsp;4.��ĩӦ����ռ֧���Ժ�ͬ�ܶ����<br><br>
		&nbsp;&nbsp;5.��ͬ������<br><br>
		&nbsp;&nbsp;6.Э������ͬ��<br><br>
		&nbsp;&nbsp;7.������ʽ�����ͬ��<br><br>
		&nbsp;&nbsp;8.��ͬ�����<br><br>
		&nbsp;&nbsp;9.����δ���еĺ�ͬ����<br><br>
		&nbsp;&nbsp;&nbsp;���У�1������ΥԼ��ͬ����<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��2���Է�ΥԼ��ͬ����<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��3���򲻿ɿ���δ���к�ͬ����<br><br>
		&nbsp;&nbsp;10.��ͬ������<br><br>
		&nbsp;&nbsp;11.��ͬ��������<br><br>
		<br>
		
		</font></td>
		</tr>
		<tr align="right">
			<td><font size="4">���������ˣ������ˣ�ǩ�֣�<br><br>
			���� ҵ �� �£�<br><br>&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</font></td>
		</tr>
	</table>
	<p class="PageNext"></p>
	
	<table width="90%" align="center" bordercolor="#000000">
		<caption align="center">
			<b> <span style="font-size: 20pt"><center>ע �� �� ��</center></b><br>
		</caption>
		<tr>
			<td>
				<font size="4">
					&nbsp;&nbsp;һ�����걨������ҵ��������������Ϣ����Ϊ<u><%=REPORT_YEAR2 %></u>-<u><%=REPORT_YEAR1%></u>��ȵ���Ϣ���ݡ�<br><br>
					&nbsp;&nbsp;�����������й������������<u><%=REPORT_YEAR2 %></u>-<u><%=REPORT_YEAR1 %></u>���"�غ�ͬ������"��ҵ�걨<br><br>��ͨ�����·�ʽ�ύ��<br><br>
					&nbsp;&nbsp;1.��ҵ���м����̾����ͬ��󣬵�½�����й������������"�غ�ͬ<br><br>������"��ҵ���ñ�׼��ϵ���ϵͳ�����߽�����ҵ������Ϣ����¼�벢<br><br>���档<br><br>
					&nbsp;&nbsp;2.��ҵ��Ϣ¼�����֮�󣬵������ϵͳ�Զ����ɵġ������й�������<br><br>�����<u><%=YEAR %></u>���"�غ�ͬ������"��ҵ�걨������ӡһʽ���ݣ�����<br><br>���ݰ���Ҫ������ҵ���˴��������ˣ�ǩ�֡��Ӹ���ҵ����֮���ύ<br><br>���ڵ��м����֣̾�һ����ҵ���档<br><br>
					&nbsp;&nbsp;������ͬ��Լ�������������պ�һ���߼���ϵ��<br><br>
					&nbsp;&nbsp;1.�����ͬ����=������ǩ���������ͬ+��ǰ���ǩ��δ������ϵĺ�<br><br>ͬ����<br><br>
					&nbsp;&nbsp;2.����Ӧ�����к�ͬ=������ʵ�����к�ͬ+����δ���еĺ�ͬ����<br><br>
					&nbsp;&nbsp;3.����δ���еĺ�ͬ=������ΥԼ��ͬ+�Է�ΥԼ��ͬ+�򲻿ɿ���δ��<br><br>�еĺ�ͬ+�����顢��ֹ�ȵ��µ�δ���к�ͬ����
				</font>
			</td>
	</table>
	<p class="PageNext"></p><br>
	 
	 <table border="1" width="90%" align="center" bordercolor="#000000">
		<caption align="center">
			<b> <span style="font-size: 16pt"><center>��ҵ������Ϣ</center></b><br>
		</caption>
		<tr>
			<td align='center' height=44 width="20%" colspan="2">��ҵ����</td>
			<td colspan="4" align='center'><%=SZCP_SQ_JBXX.getENT_NAME()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%" colspan="2">��ҵ��ַ</td>
			<td colspan="4" align='center'><%=SZCP_SQ_JBXX.getWEBSITE_DESC()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%" rowspan="2">��ҵע������</td>
			<td align='center' height=44  > ������ҵ</td>
			<td  colspan="4">
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="1">�������ι�˾
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="2">�ɷ����޹�˾�������У�
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="3">�ɷ����޹�˾��δ���У�
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="4">�ǹ�˾��ҵ����
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="5">���˶�����ҵ
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="6">�ϻ���ҵ
			</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="10%" class="lc1">����Ͷ����ҵ</td>
			<td class="lc2" colspan="4">
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="7">���������ҵ
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="8">���������ҵ
				<input type="radio"  disabled ="disabled"name="ENT_TYPE" id="ENT_TYPE" value="9">���̶�����ҵ
			</td>
		</tr>
		
		<tr>
			<td align='center' height=44 width="20%">���ջ���</td>
			<td align='center' colspan="2"><%=SZCP_SQ_JBXX.queryLOCAL_ORG_NAME(SZCP_SQ_JBXX
					.getREGORG())%></td>
			<td align='center' height=44 width="20%">���ͻ���</td>
			<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getReportName()%></td>
		<tr>
			<td align='center' height=44 width="20%">��ҵס��</td>
			<td align='center' colspan="5"><%=SZCP_SQ_JBXX.getADDR_DESC()%></td>

		</tr>

		<tr>
			<td align='center' height=44 width="20%">ע���</td>
			<td align='center'><%=SZCP_SQ_JBXX.getREG_NO()%></td>
			<td align='center'>��֯��������</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getORG_CODE()%></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">ע���ʱ�</td>
			<td align='center' colspan="2">${SZCP_SQ_JBXX.REG_CAP_RMB_W}�������</td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">��������</td>
			<td align='center'><%=SZCP_SQ_JBXX.getEST_DATE()%></td>
			<td align='center'>��Ӫ����</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getOPER_TO_DATE()%></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">��������������</td>
			<td align='center'><%=SZCP_SQ_JBXX.getLEG_REP_NAME()%></td>
			<td align='center'>��ҵ�̶��绰</td>
			<td align='center' colspan="3"><%=SZCP_SQ_JBXX.getTEL_NO()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">��Ӫҵ��������ҵ</td>
			<td align='center'><%=SZCP_SQ_JBXX.queryINDUSTRY_TYPE_CODE_Name(SZCP_SQ_JBXX
					.getGB_INDUSTRY_TYPE())%></td>
			<td align='center'>��ҵ��ģ</td>
			<td align='center' colspan="3"><%=entScaleStr%></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">������ҵ����</td>
			<td align='left' colspan="5"><%=localIndustryStr%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">��Ӫ��Χ</td>
			<td align='left' colspan="5"><%=SZCP_SQ_JBXX.getBUSI_SCOPE_DESC()%></td>
		</tr>
		<tr align='center' height=44 width="20%">
			<td align='center' height=44 width="20%" rowspan="2">��ְ��Ա</td>
			<td align="center" height=44 width="20%">������</td>

			<td align="center" height=44 width="20%">������Ա</td>

			<td align="center" height=44 width="20%">������Ա</td>

			<td align="center" height=44 width="20%" colspan="2">����</td>
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
			<td align='center' height=44 width="20%" rowspan="3">��ҵ��ϵ��</td>
			<td align='center'>����</td>
			<td align='center' ><%=SZCP_SQ_JBXX.getLIAI_NAME()%></td>
			<td align='center'>ְ��</td>
			<td align='center'  width="10%"><%=SZCP_SQ_JBXX.getLIAI_POS_CODE()%></td>
		</tr>
		<tr>
			<td align='center' height=44 width="20%">����</td>
			<td align='center'><%=SZCP_SQ_JBXX.getLIAI_FAX_NO()%></td>
			<td align='center' height=44 width="20%">��������</td>
			<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_EMAIL()%></td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">�ƶ��绰</td>
			<td align='center'><%=SZCP_SQ_JBXX.getLIAI_MOBILE_NO()%></td>
			<td align='center' height=44 width="20%">�̶��绰</td>
			<td align='center' colspan="2"><%=SZCP_SQ_JBXX.getLIAI_TEL_NO()%></td>
		</tr>
	</table>
	<p class="PageNext"><br>
	
		<table border="1" width="90%" align="center" bordercolor="#000000">

			<caption align="center">
				<b> <span style="font-size: 16pt"><center>��ҵƷ�ƺ;�Ӫ����</center></b><br>
				<br>
			</caption>

			<tr align='center' height=40 >
				<td >��Ŀ\���</td>
				<td colspan="2"><%=REPORT_YEAR1%>��</td>
				<td colspan="4"><%=REPORT_YEAR2%>��</td>
			</tr>
			
			<tr>
				<td align='center' height=40 >��ĩ�ʲ��ܶ��Ԫ��</td>
				<td align='center' height=40  colspan="2" ><%=SZCP_SQ_JYGL_XS1.getLAST_ASSET_RMB_W()%></td>
				<td align='center' height=40  colspan="4" ><%=SZCP_SQ_JYGL_XS2.getLAST_ASSET_RMB_W()%></td>
			</tr>

			<tr>
				<td align='center' height=40 >�������ܶ��Ԫ��</td>
				<td align="center" colspan="2"><%=SZCP_SQ_JYGL_XS1.getLAST_SALE_RMB_W() %></td>
				<td align="center" colspan="4"><%=SZCP_SQ_JYGL_XS2.getLAST_SALE_RMB_W() %></td>
			</tr>

			<tr align='center'>
				<td align='center'>�������</td>
				<td colspan="2">��������<u><%=SZCP_SQ_JYGL_XS1.getHOME_SALE_RMB_W() %></u>��Ԫ<br>����<u><%=SZCP_SQ_JYGL_XS1.getCOVER_PROV_QTY() %></u>��ʡ<br>��ó����<u><%=SZCP_SQ_JYGL_XS1.getOUT_SALE_USD_W()%></u>����Ԫ<br>����<u><%=SZCP_SQ_JYGL_XS1.getCOVER_AREA_QTY()%></u>�����ң�������</td>
				<td colspan="4">��������<u><%=SZCP_SQ_JYGL_XS2.getHOME_SALE_RMB_W() %></u>��Ԫ<br>����<u><%=SZCP_SQ_JYGL_XS2.getCOVER_PROV_QTY() %></u>��ʡ<br>��ó����<u><%=SZCP_SQ_JYGL_XS2.getOUT_SALE_USD_W()%></u>����Ԫ<br>����<u><%=SZCP_SQ_JYGL_XS2.getCOVER_AREA_QTY()%></u>�����ң�������</td>
			</tr>


			

			<tr>
				<td align='center' rowspan="4">&nbsp;��֤���</td>
				<td align='center' height=40 >������֤</td>
				<td align="center" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getQC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QC_FLAG" value="1" checked="checked">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="QC_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getQC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QC_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="QC_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="QC_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="QC_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=40 >������֤</td>
				<td align="center" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getEC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="EC_FLAG" value="1" checked="checked">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="EC_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getEC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="EC_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="EC_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="EC_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="EC_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>

			</tr>
			<tr>
				<td align='center' height=40 >��Ʒ��֤</td>
				<td align="center" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getPC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="PC_FLAG" value="1" checked="checked">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="PC_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getPC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="PC_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="PC_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="PC_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="PC_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=40 >������֤</td>
				<td align="center" colspan="5"><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getOC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="OC_FLAG" value="1" checked="checked"
								id="OC_FLAG">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="OC_FLAG" value="0" id="OC_FLAG">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getOC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="OC_FLAG" value="1" id="OC_FLAG">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="OC_FLAG" value="0"
								checked="checked" id="OC_FLAG">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="OC_FLAG" value="1" id="OC_FLAG">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="OC_FLAG" value="0" id="OC_FLAG">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>

			<tr>
				<td align='center' rowspan="4">֪ʶ��Ȩ</td>
				<td align="left" height=40  rowspan="3">ר��Ȩ</td>
				<td align='left' height=40 >����</td>
				<td align="center"><%=SZCP_SQ_JYGL.getINV_PATE_QTY() %>��</td>
				<td align="left" rowspan="3">�̱�</td>
				<td align="left">ע���̱�</td>
				<td align="center"><%=SZCP_SQ_JYGL.getREG_MARK_QTY() %>��</td>
			</tr>

			<tr>
				<td align='left' height=40>ʵ������</td>
				<td align="center"><%=SZCP_SQ_JYGL.getUTI_PATE_QTY() %>��</td>
				<td align="left">�����̱�</td>
				<td align="center"><%=SZCP_SQ_JYGL.getWEL_MARK_QTY() %>��</td>
			</tr>

			<tr>
				<td align='left' height=40>������</td>
				<td align="center"><%=SZCP_SQ_JYGL.getDES_PATE_QTY() %>��</td>
				<td align="left">�����̱�</td>
				<td align="center"><%=SZCP_SQ_JYGL.getFMS_MARK_QTY() %>��</td>
			</tr>

			<tr>
				<td align='center' height=40  colspan="2">����Ȩ</td>
				<td align="center" colspan="4"><%=SZCP_SQ_JYGL.getCPRT_QTY() %>��</td>
			</tr>

			<tr>
				<td align='center' rowspan="6">��Ӫ����</td>
				<td align='center' height=40  colspan="6">������ҵ�����������ʺ����֤
					<c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getIND_QUAL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="1"
								checked="checked">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getIND_QUAL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="IND_QUAL_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td align='center' height=40  colspan="6">����ҵ�Ƿ���ȡ���������ʺ����֤
					<c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getENT_QUAL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="1"
								checked="checked">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getENT_QUAL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="ENT_QUAL_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td align='center' height=40 colspan="6">������ҵ�Ƿ�Ӫ���ʵȼ�����
					<c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_JYGL.getQUAL_LEVEL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="1"
								checked="checked">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_JYGL.getQUAL_LEVEL_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="1">��</input>&nbsp;&nbsp;&nbsp;&nbsp;
		      							<input type="radio"  disabled ="disabled"name="QUAL_LEVEL_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td align='left' height=40 colspan="6">����ҵ���ʵȼ�Ϊ:<br>
					<c:choose>
						<c:when
							test='<%="0".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="0" checked="checked" disblank>�ؼ�&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="1" disblank>һ��&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="2" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="3" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="4" disblank>��
				      			</c:when>
						<c:when
							test='<%="1".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="0" disblank>�ؼ�&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="1" checked="checked" disblank>һ��&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="2" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="3" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="4" disblank>��
				      			</c:when>
						<c:when
							test='<%="2".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="0" disblank>�ؼ�&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="1" disblank>һ��&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="2" checked="checked" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="3" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="4" disblank>��
				      			</c:when>
						<c:when
							test='<%="3".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="0" disblank>�ؼ�&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="1" disblank>һ��&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="2" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="3" checked="checked" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="4" disblank>��
				      			</c:when>
				      			<c:when
							test='<%="4".equals(SZCP_SQ_JYGL.getENT_QUAL_LEVEL_TYPE())%>'>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="0" disblank>�ؼ�&nbsp;&nbsp;&nbsp;&nbsp;
				      					<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="1" disblank>һ��&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="2" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="3" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="4" checked="checked" disblank>��
				      			</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="0" disblank>�ؼ�&nbsp;&nbsp;&nbsp;&nbsp;
			      						<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="1" disblank>һ��&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="2" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="3" disblank>����&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio"  disabled ="disabled"name="ENT_QUAL_LEVEL_TYPE" size="15"
								title="���ʵȼ�" maxlength=50 value="4" disblank>��
				      			</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<br><p class="PageNext"><br>
		
	<table border="1" width="90%" align="center" bordercolor="#000000">
		<caption align="center">
			<b> <span style="font-size: 16pt"><center>��ͬ����</center></b><br>
			<br>
		</caption>

		<%-- <tr>
			<td align='center' height=44 >��������</td>
			<td align='center' colspan="6"><%=xygl.getOTHER_ORG_DESC() == null ? "" : xygl
					.getOTHER_ORG_DESC()%></td>
		</tr> --%>
		
		<tr>
			<td align='center' height=44>��ͬ���ù������</td>
			<td align='center'  colspan="6"><%=xygl.getMNG_ORG_NAMEVIEW()%></td>
		</tr>	

		<tr>
			<td align='center' rowspan="3">��ͬ��Ϣ�����Ÿ�����</td>
			<td align='center' height=44>����</td>
			<td align='center'><%=xygl.getORG_LEAD_NAME() == null ? "" : xygl
					.getORG_LEAD_NAME()%> </td>
			<td align='center' height=44 >ְ��</td>
			<td align='center' >
				<%=xygl.getORG_LEAD_POSVIEW() %>
			</td>
			<td align='center' >��ϵ��ʽ</td>
			<td align='center' ><%=xygl.getORG_LEAD_TEL_NO() == null ? "" : xygl
					.getORG_LEAD_TEL_NO()%></td>
		</tr>

		<tr>
			<td align='center' height=44 >�ʸ�</td>
			<td colspan="5"><%=xygl.getORG_LEAD_QUAL_TYPEVIEW()%></td>
		</tr>

		<tr>
			<td align='center' height=44 >ְ��</td>
			<td colspan="5"><%=xygl.getQUAL_LEVELVIEW()%></td>
		</tr>

		<tr>
			<td align='center' height="44">��ͬ���ù����ƶ�</td>
			<td colspan="6"><br>
			��ҵ�ѽ����ĺ�ͬ���ù����ƶ�:<br>
			<input type="checkbox" disabled ="disabled" name="MSCheckBox1"
				value="1"
				<%="1".equals(xygl.getMS_POS_RESP_FLAG())
					? "checked='checked'"
					: ""%>>
				��λְ��</input> <input type="checkbox" disabled ="disabled" name="MSCheckBox2" value="1"
				<%="1".equals(xygl.getMS_DELEGATE_FLAG())
					? "checked='checked'"
					: ""%>>
				ί����Ȩ</input> <br><br>
				<input type="checkbox" disabled ="disabled" name="MSCheckBox3" value="1"
				<%="1".equals(xygl.getMS_SIGN_REVIEW_FLAG())
					? "checked='checked'"
					: ""%>>
				��ͬǩ������</input> <input type="checkbox" disabled ="disabled" name="MSCheckBox4" value="1"
				<%="1".equals(xygl.getMS_SEAL_FILE_FLAG())
					? "checked='checked'"
					: ""%>>
				ӡ�º��ı�</input> <br><br><input type="checkbox" disabled ="disabled" name="MSCheckBox5" value="1"
				<%="1".equals(xygl.getMS_RISK_EMG_FLAG())
					? "checked='checked'"
					: ""%>>
				���պ�Ӧ��</input> <input type="checkbox" disabled ="disabled" name="MSCheckBox6" value="1"
				<%="1".equals(xygl.getMS_SIGN_CANCEL_FLAG())
					? "checked='checked'"
					: ""%>>
				ǩ�ı䳷</input> <br><br><input type="checkbox" disabled ="disabled" name="MSCheckBox7" value="1"
				<%="1".equals(xygl.getMS_RECV_ACCT_FLAG())
					? "checked='checked'"
					: ""%>>
				Ӧ���˿�</input> <input type="checkbox" disabled ="disabled" name="MSCheckBox8" value="1"
				<%="1".equals(xygl.getMS_PAY_ACCT_FLAG())
					? "checked='checked'"
					: ""%>>
				Ӧ���˿�</input><br><br> <input type="checkbox" disabled ="disabled" name="MSCheckBox9" value="1"
				<%="1".equals(xygl.getMS_GUEST_FLAG())
					? "checked='checked'"
					: ""%>>
				�ͻ����õ���</input></td>
		</tr>

		<tr>
			<td align='center' height=44 rowspan="2">��ͬ���ù�����Ա��</td>
			<td align='center' height=44  colspan="3">רְ����</td>
			<td align='center' colspan="3"><%=xygl.getFULLTIME_MNG_QTY()%>��</td>
		</tr>

		<tr>
			<td align='center' height=44  colspan="3">��ְ����</td>
			<td align='center' colspan="3"><%=xygl.getPARTTIME_MNG_QTY()%>��</td>
		</tr>

		<tr>
			<td align='center' height=44 width="20%">��ʽ�����Ƿ񱸰�</td>
			<td align='center'  colspan="3"><c:choose>
					<c:when test='<%="1".equals(xwgf.getFC_ARCH_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" checked="checked"
							value="1">��</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="0">��</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="2">�޹涨</input>
					</c:when>
					<c:when test='<%="0".equals(xwgf.getFC_ARCH_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="1">��</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" checked="checked"
							value="0">��</input>
							<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="2">�޹涨</input>
					</c:when>
					<c:when test='<%="2".equals(xwgf.getFC_ARCH_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="1">��</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" 
							value="0">��</input>
							<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="2" checked="checked">�޹涨</input>
					</c:when>
					<c:otherwise>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="1">��</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="0">��</input>
						<input type="radio"  disabled ="disabled"name="FC_ARCH_FLAG" value="2">�޹涨</input>
					</c:otherwise>
				</c:choose></td>
			<td align='center' height=44  colspan="2" >��ʽ�����з�Υ���¼</td>
			<td align='center' ><c:choose>
					<c:when test='<%="1".equals(xwgf.getFC_VIOL_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" checked="checked"
							value="1">��</input>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="0">��</input>
					</c:when>
					<c:when test='<%="0".equals(xwgf.getFC_VIOL_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="1">��</input>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="0"
							checked="checked">��</input>
					</c:when>
					<c:otherwise>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="1">��</input>
						<input type="radio"  disabled ="disabled"name="FC_VIOL_FLAG" value="0">��</input>
					</c:otherwise>
				</c:choose></td>
		</tr>

		<tr>
			<td align='center' height=44 >��ҵ���޺�ͬʾ��Ϊ��</td>
			<td align="left" colspan="6">
					<c:if test='<%=xwgf.getMODEL_TEXT_TYPE().equals("1") %>'>����    ����    ���ʺϱ���ҵʹ��    �����ʺϱ���ҵʹ��</c:if>
					<c:if test='<%=xwgf.getMODEL_TEXT_TYPE().equals("0") %>'>����    ����    ���ʺϱ���ҵʹ��    �����ʺϱ���ҵʹ��</c:if>
					<c:if test='<%=xwgf.getMODEL_TEXT_TYPE().equals("2") %>'>����    ����    ���ʺϱ���ҵʹ��    �����ʺϱ���ҵʹ��</c:if>
					<c:if test='<%=xwgf.getMODEL_TEXT_TYPE().equals("3") %>'>����    ����    ���ʺϱ���ҵʹ��    �̲��ʺϱ���ҵʹ��</c:if>
			</td>
		</tr>


		<tr align="center" height="44">
			<td>��Ŀ/���</td>
			<td colspan="3"><%=REPORT_YEAR1%>�꣨%��</td>
			<td colspan="3"><%=REPORT_YEAR2%>�꣨%��</td>
			
		</tr>
		<tr>
			<td align='center' height=40 >�����Ժ�ͬ����ǩԼ��</td>
		    <td align='center' colspan="3"><%=sl1.getINC_SIGN_RATE() %></td>
			<td align='center' colspan="3"><%=sl2.getINC_SIGN_RATE() %></td> 
		</tr>

		<tr>
			<td align='center' height=40 >֧���Ժ�ͬ����ǩԼ��</td>
			<td align='center' colspan="3"><%=sl1.getEXP_SIGN_RATE() %></td>
			<td align='center' colspan="3"><%=sl2.getEXP_SIGN_RATE() %></td> 
		</tr>

		<tr>
			<td align='center' height=40 >��ͬʾ���ı�ʹ����</td>
			<td align='center' colspan="3"><%=sl1.getMODEL_TEXT_US_RATE() %></td>
			<td align='center' colspan="3"><%=sl2.getMODEL_TEXT_US_RATE() %></td> 
		</tr>

		<tr>
			<td align='center' height=44 >��ͬǩ����Ȩί�й���</td>
			<%-- <td align='center' colspan="6"><%=xwgf.getDELEG_TYPEVIEW()%></td> --%>
			<%-- <td align='center' colspan="6"><%=xwgf.getDELEG_TYPEVIEW()%></td> --%>
			<td colspan="6">
	<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="1"/>����������Ȩί��
										<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="2"/>����ʹ��������Ȩί�С����ֿ�ͷ��Ȩί��
										<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="3"/>��������Ȩί�С�ȫ����ͷ��Ȩί��
										<input type="radio" name="DELEGTYPE" id="DELEGTYPE" value="4"/>��δ��Ȩί�����
		</tr>
	</table>
	<p class="PageNext"></p><br>
	
	<table border="1" width="90%" align="center" bordercolor="#000000">
		<tr>
			<td align='center' height="35"  rowspan="2">��ͬǩ����˹���</td>
			<td align="left" colspan="4">��ͬǩ������(�ɶ�ѡ)<br><%=xwgf.getSINGAPPRTYPEVIEW()%></td>
		</tr>

		<tr>
			<td align='left' height="35"  colspan="4">��ͬǩ���������(�ɶ�ѡ)<br>
			<input type="checkbox" disabled ="disabled"
				name="SACheckBox1" value="1"
				<%="1".equals(xwgf.getSA_QUAL_FLAG())
					? "checked='checked'"
					: ""%>>�Է��ʸ�;�Ӫ��Χ</input><br>
				<input type="checkbox" disabled ="disabled" name="SACheckBox2" value="1"
				<%="1".equals(xwgf.getSA_VALID_FLAG())
					? "checked='checked'"
					: ""%>>
				�Է��Ϸ���</input> <br><input type="checkbox" disabled ="disabled" name="SACheckBox3" value="1"
				<%="1".equals(xwgf.getSA_CREDIT_FLAG())
					? "checked='checked'"
					: ""%>>
				�Է�����״��</input><br> <input type="checkbox" disabled ="disabled" name="SACheckBox4" value="1"
				<%="1".equals(xwgf.getSA_PERFORM_FLAG())
					? "checked='checked'"
					: ""%>>
				�Է���Լ����</input>
			
			</td>
		</tr>

		<tr>
			<td align="center" rowspan="3">��ͬ������̨�˹���</td>
			<td align="center" height="35" >���޺�ͬ����������</td>
			<td align="center" colspan="3"><c:choose>
					<c:when test='<%="1".equals(xwgf.getMNG_ORG_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							checked="checked" value="1">��</input>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="0">��</input>
					</c:when>
					<c:when test='<%="0".equals(xwgf.getMNG_ORG_FLAG())%>'>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="1">��</input>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="0" checked="checked">��</input>
					</c:when>
					<c:otherwise>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="1">��</input>
						<input type="radio"  disabled ="disabled"name="MNG_ORG_FLAG" id="MNG_ORG_FLAG"
							value="0">��</input>
					</c:otherwise>
				</c:choose></td>


		</tr>

		<tr>
			<td align='left' height="35"  colspan="4">̨�˵Ǽ���ʽ<br><%=xwgf.getACCTFORMTYPEVIEW()%></td>

		</tr>

		<tr>
			<td height="35"  align="left" colspan="4">̨������(�ɶ�ѡ)<br>
			<input type="checkbox" disabled ="disabled"
				name="ACCTCheckBox1" value="1"
				<%="1".equals(xwgf.getACCT_SERIAL_FLAG())
					? "checked='checked'"
					: ""%>>
				��ͬ���</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox2" value="1"
				<%="1".equals(xwgf.getACCT_GUEST_FLAG())
					? "checked='checked'"
					: ""%>>
				�ͻ�����</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox3" value="1"
				<%="1".equals(xwgf.getACCT_WHEN_FLAG())
					? "checked='checked'"
					: ""%>>
				ǩ��ʱ��</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox4" value="1"
				<%="1".equals(xwgf.getACCT_UNDLY_FLAG())
					? "checked='checked'"
					: ""%>>
				��ͬ���</input> <br><input type="checkbox" disabled ="disabled" name="ACCTCheckBox5" value="1"
				<%="1".equals(xwgf.getACCT_QTY_FLAG())
					? "checked='checked'"
					: ""%>>
				��ͬ����</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox6" value="1"
				<%="1".equals(xwgf.getACCT_CAP_FLAG())
					? "checked='checked'"
					: ""%>>
				��ͬ���</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox7" value="1"
				<%="1".equals(xwgf.getACCT_PLAN_TIME_FLAG())
					? "checked='checked'"
					: ""%>>
				Ӧ����ʱ��</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox8" value="1"
				<%="1".equals(xwgf.getACCT_REAL_TIME_FLAG())
					? "checked='checked'"
					: ""%>>
				ʵ������ʱ��</input><br> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox9" value="1"
				<%="1".equals(xwgf.getACCT_PLAN_CAP_FLAG())
					? "checked='checked'"
					: ""%>>
				Ӧ���н��</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox10" value="1"
				<%="1".equals(xwgf.getACCT_REAL_CAP_FLAG())
					? "checked='checked'"
					: ""%>>
				ʵ�����н��</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox11" value="1"
				<%="1".equals(xwgf.getACCT_PERFOM_CERT_FLAG())
					? "checked='checked'"
					: ""%>>
				����ƾ֤</input> <input type="checkbox" disabled ="disabled" name="ACCTCheckBox12" value="1"
				<%="1".equals(xwgf.getACCT_CHANGE_FLAG())
					? "checked='checked'"
					: ""%>>
				���������</input>
			</td>

		</tr>

		<tr>
			<td align='center' height="35"  rowspan="3">�ͻ��������ʹ���</td>
			<td align='left' colspan="4" height="35" >�ͻ�������Ϣ���ݽ�����ʽ<br><%=xwgf.getGUESTINFOTYPEVIEW()%></td>

		</tr>

		<tr>
			<td align="left" height="35"  colspan="4">�ͻ����Ź���(�ɶ�ѡ)<br><input type="checkbox" disabled ="disabled"
				name="GCTCheckBox1" value="1"
				<%="1".equals(xwgf.getGC_RECORD_FLAG())
					? "checked='checked'"
					: ""%>>
				�е���</input> <input type="checkbox" disabled ="disabled" name="GCTCheckBox2" value="1"
				<%="1".equals(xwgf.getGC_THIRD_PART_FLAG())
					? "checked='checked'"
					: ""%>>
				���������ű�</input> <input type="checkbox" disabled ="disabled" name="GCTCheckBox3" value="1"
				<%="1".equals(xwgf.getGC_RESERCH_FLAG())
					? "checked='checked'"
					: ""%>>
				ʵ�ص��鱨��</input></td>

		</tr>

		<tr>
			<td align='left' height=30  colspan="4">���˹���(�ɶ�ѡ)<br><input type="checkbox" disabled ="disabled"
				name="AMCheckBox1" value="1"
				<%="1".equals(xwgf.getAM_RECV_AGE_FLAG())
					? "checked='checked'"
					: ""%>>
				��Ӧ���˿�������з���</input> <input type="checkbox" disabled ="disabled" name="AMCheckBox2" value="1"
				<%="1".equals(xwgf.getAM_OVERDUE_FLAG())
					? "checked='checked'"
					: ""%>>
				�������˿���з���</input> <input type="checkbox" disabled ="disabled" name="AMCheckBox3" value="1"
				<%="1".equals(xwgf.getAM_SPEC_RECOVER_FLAG())
					? "checked='checked'"
					: ""%>>
				��ר�˸����˿�׷��</input> <input type="checkbox" disabled ="disabled" name="AMCheckBox4" value="1"
				<%="1".equals(xwgf.getAM_RECV_SUM_FLAG())
					? "checked='checked'"
					: ""%>>
				��Ӧ���˿���з���</input></td>

		</tr>

		<tr align="center" height="40">
			<td rowspan="7" align="center">��ͬ������������</td>
			<td colspan="2" width="40%">��Ŀ/���</td>
			<td ><%=REPORT_YEAR1%>��</td>
			<td ><%=REPORT_YEAR2%>��</td>
		</tr>
		<tr>
		<td align='center' rowspan="2">��ΥԼ�����ĺ�ͬ����</td>
			<td align='center' height="35" >����ΥԼ����</td>
			<td align='center' ><%=sl1.getLAST_DFT_OUR_QTY() %></td>
			<td align='center' ><%=sl2.getLAST_DFT_OUR_QTY() %></td>
		</tr>
		<tr>
			<td align='center' height="35" >�Է�ΥԼ����</td>
			<td align='center' ><%=sl1.getLAST_DFT_THEY__QTY() %></td>
			<td align='center' ><%=sl2.getLAST_DFT_THEY__QTY() %></td>

		</tr>

		<tr>
			<td align='center' rowspan="4">��ͬ������</td>
			<td align='center' height="35" >�ͽ����</td>
			<td align='center' ><%=sl1.getDISP_COMP_QTY() %></td>
			<td align='center' ><%=sl2.getDISP_COMP_QTY() %></td>
			<%-- <td align='center' colspan="2"><%=xwgf.getDISP_COMP_QTY()%></td> --%>
		</tr>
		<tr>
			<td align='center' height="35" >�������</td>
			<td align='center' ><%=sl1.getDISP_MED_QTY() %></td>
			<td align='center' ><%=sl2.getDISP_MED_QTY() %></td>
			<%-- <td align='center' colspan="2"><%=xwgf.getDISP_MED_QTY()%></td> --%>
		</tr>

		<tr>
			<td align='center' height=35 >�ٲü���</td>
			<td align='center' ><%=sl1.getDISP_ARB_QTY() %></td>
			<td align='center' ><%=sl2.getDISP_ARB_QTY() %></td>
			<%-- <td align='center' colspan="2"><%=xwgf.getDISP_ARB_QTY()%></td> --%>
		</tr>

		<tr>
			<td align='center' height=35 >���ϼ���</td>
			<td align='center' ><%=sl1.getDISP_LAW_QTY() %></td>
			<td align='center' ><%=sl2.getDISP_LAW_QTY() %></td>
			<%-- <td align='center' colspan="2"><%=xwgf.getDISP_LAW_QTY()%></td> --%>
		</tr>
	</table>
	<p class="PageNext"><br>
	
	<table border="1" width="90%" align="center" bordercolor="#000000">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>��ͬ����״��</center></b><br>
			</caption>

			<tr align='center' height=20>
				<td  colspan="3" rowspan="2">��Ŀ/���</td>
				<td  colspan="2"><%=REPORT_YEAR1%>��</td>
				<td  colspan="2"><%=REPORT_YEAR2%>��</td>
			</tr>
			<tr align='center' height=20>
				<td >�����Ժ�ͬ</td>
				<td >֧���Ժ�ͬ</td>
				<td >�����Ժ�ͬ</td>
				<td >֧���Ժ�ͬ</td>
			</tr>

			<tr>
				<td align='center' height="20" width="20%" rowspan="2" colspan="2">�����ͬ����</td>
				<td align="center" height="20" width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align="center" height="20" width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height="20" width="20%" rowspan="2" colspan="2">����:����ǩ���������ͬ</td>
				<td align="center" height="20" width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getLAST_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align="center" height="20" width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getLAST_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height="20" width="20%" rowspan="2" colspan="2">����Ӧ�����к�ͬ</td>
				<td align="center" height="20" width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getPLAN_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getPLAN_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getPLAN_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getPLAN_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align="center" height="20" width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getPLAN_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getPLAN_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getPLAN_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getPLAN_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height="20" width="20%" rowspan="2" colspan="2">����ʵ�����к�ͬ</td>
				<td align="center" height="20" width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getREAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getREAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getREAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getREAL_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align="center" height="20" width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getREAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getREAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getREAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getREAL_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height="20" width="20%" rowspan="2" colspan="2">������ͬ</td>
				<td align="center" height="20" width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getCANCEL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getCANCEL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getCANCEL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getCANCEL_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align="center" height="20" width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getCANCEL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getCANCEL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getCANCEL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getCANCEL_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height="20" width="20%" rowspan="2" colspan="2">Э������ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCOMP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCOMP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCOMP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCOMP_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCOMP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCOMP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCOMP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCOMP_CONT_RMB_W()%></td>
			</tr>


			<tr>
				<td align='center' height="20" width="20%" rowspan="2" colspan="2">������ʽ�����ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOTHER_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOTHER_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOTHER_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOTHER_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOTHER_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOTHER_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOTHER_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOTHER_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height="20" width="20%" rowspan="2"colspan="2">�����ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCHANGE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCHANGE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCHANGE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCHANGE_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCHANGE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCHANGE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCHANGE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCHANGE_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height="20" width="20%" rowspan="2" colspan="2">����δ���еĺ�ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOVERDUE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOVERDUE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOVERDUE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOVERDUE_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOVERDUE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOVERDUE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOVERDUE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOVERDUE_CONT_RMB_W()%></td>
			</tr>

			<tr>
				<td rowspan="6" align='center' >����</td>
				<td align='center' height="20" width="20%" rowspan="2">����ΥԼ��ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_OUR_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_OUR_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_OUR_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_OUR_QTY()%></td>
			</tr>


			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_OUR_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_OUR_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_OUR_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_OUR_RMB_W()%></td>
			</tr>

			<tr>
				<td align='center' height="20" width="20%" rowspan="2">�Է�ΥԼ��ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_THEY_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_THEY_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_THEY_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_THEY_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_THEY_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_THEY_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_THEY_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_THEY_RMB_W()%></td>
			</tr>
			<tr>
				<td align='center' height="20" width="20%" rowspan="2">�򲻿ɿ���δ���к�ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_GOD_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_GOD_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_GOD_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_GOD_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_GOD_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_GOD_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_GOD_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_GOD_RMB_W()%></td>
			</tr>

			<tr align='center' >
				<td rowspan="2" colspan="2">���������ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getLAST_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_DISP_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getLAST_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_DISP_CONT_RMB_W()%></td>
			</tr>

			<tr align='center' >
				<td rowspan="2" style="width: 2%" colspan="2">�ۼ������ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_DISP_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_DISP_CONT_RMB_W()%></td>
			</tr>

			<tr align='center' >
				<td rowspan="2" style="width: 2%" colspan="2">��������ͬ</td>
				<td align='center' height="20" width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getSOLVE_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getSOLVE_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getSOLVE_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getSOLVE_DISP_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height="20" width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getSOLVE_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getSOLVE_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getSOLVE_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getSOLVE_DISP_CONT_RMB_W()%></td>
			</tr>
			
		</table>
		<br>
		<p class="PageNext">
			<br><br>
		<table border="1" width="90%" align="center" bordercolor="#000000">

			<tr align='center' height=44>
				<td  colspan="2" >��Ŀ/���</td>
				<td  ><%=REPORT_YEAR1%>��</td>
				<td  ><%=REPORT_YEAR2%>��</td>
			</tr>
			
			<tr>
				<td align='center' height=44 colspan="2">���������Ժ�ͬʵ����Լ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getRECV_PRFM_QTY_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getRECV_PRFM_QTY_RATE()%> %</td>
			</tr>
			
			<tr>
				<td align='center' height=44 colspan="2">����֧���Ժ�ͬʵ����Լ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getPAY_PRFM_QTY_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getPAY_PRFM_QTY_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">��ĩӦ�տ�ռ�����Ժ�ͬ�ܶ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getRECV_AMT_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getRECV_AMT_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">��ĩӦ����ռ֧���Ժ�ͬ�ܶ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getPAY_AMT_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getPAY_AMT_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">��ͬ������</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getREVOKE_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getREVOKE_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44  colspan="2">Э������ͬ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getCOMP_RQTE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getCOMP_RQTE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">������ʽ�����ͬ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getOTHER_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getOTHER_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44  colspan="2">��ͬ�����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getCHANGE_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getCHANGE_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">����δ���еĺ�ͬ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getOVERDUE_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getOVERDUE_RATE()%> %</td>
			</tr>
			
			<tr>
			<td rowspan="3" align='center' >����</td>
				<td align='center' height=44 >����ΥԼ��ͬ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDFT_OUR_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDFT_OUR_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 >�Է�ΥԼ��ͬ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDFT_THEY_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDFT_THEY_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 >�򲻿ɿ�������δ���к�ͬ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getGOD_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getGOD_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44  colspan="2">��ͬ������</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDISP_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDISP_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44  colspan="2">��ͬ��������</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getSOLVE_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getSOLVE_RATE()%> %</td>
			</tr>
		</table>
		<br><p class="PageNext"><br>
		
		<table border="1" width="90%" align="center" bordercolor="#000000">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>��ҵ��ӪЧ��</center></b><br>
				<br>
			</caption>

			<tr align="center" height="44">
			<td class="lc1">��Ŀ/���</td>
			<td class="lc1"><%=REPORT_YEAR1%>�꣨%��</td>
			<td class="lc1"><%=REPORT_YEAR2%>�꣨%��</td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">Ӫҵ����������(%)</td>
			<td align='center'><%=jyxy.getREVE_GROW_RATE()%></td>
			<td align='center'><%=jyxy1.getREVE_GROW_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">��Ӫҵ��������(%)</td>
			<td align='center'><%=jyxy.getPRI_GROW_RATE()%></td>
			<td align='center'><%=jyxy1.getPRI_GROW_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">���ʲ�������(%)</td>
			<td align='center'><%=jyxy.getNET_ASSET_RATE()%></td>
			<td align='center'><%=jyxy1.getNET_ASSET_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">�ʲ���ծ��(%)</td>
			<td align='center'><%=jyxy.getDEBT_ASSET_RATE()%></td>
			<td align='center'><%=jyxy1.getDEBT_ASSET_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">�ٶ�����(%)</td>
			<td align='center'><%=jyxy.getQUICK_ACT_RATE()%></td>
			<td align='center'><%=jyxy1.getQUICK_ACT_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">Ӧ���˿���ת��(%)</td>
			<td align='center'><%=jyxy.getRECV_TNOV_RATE()%></td>
			<td align='center'><%=jyxy1.getRECV_TNOV_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">�����˿�ռӦ���˿����(%)</td>
			<td align='center'><%=jyxy.getRCV_OVERDUE_RATE()%></td>
			<td align='center'><%=jyxy1.getRCV_OVERDUE_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">�����˿�ռӦ���˿����(%)</td>
			<td align='center'><%=jyxy.getPAY_OVERDUE_RATE()%></td>
			<td align='center'><%=jyxy1.getPAY_OVERDUE_RATE()%></td>
		</tr>


		</table>
		<br><p class="PageNext"><br>
		
		<table border="1" width="90%" align="center" bordercolor="#000000">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>��ҵ������κ�����</center></b><br>
				<br>
			</caption>

			<tr>
				<td align='center' rowspan="3">�Ͷ�����</td>

				<td align='center' height=44>��ǷԱ������</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getLP_ARR_WAGE_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="1"
								checked="checked">��</input>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getLP_ARR_WAGE_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="LP_ARR_WAGE_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>��Ա����ǩ���Ͷ���ͬ</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getLP_ALL_CONT_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getLP_ALL_CONT_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="LP_ALL_CONT_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>������ᱣ��</td>
				<td align='center'><c:choose>
						<c:when
							test='<%="1".equals(SZCP_SQ_ZRXY.getLP_SOC_INSRC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="0">��</input>
						</c:when>
						<c:when
							test='<%="0".equals(SZCP_SQ_ZRXY.getLP_SOC_INSRC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="LP_SOC_INSRC_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>��˰����</td>
				<td align='center'>����˰��</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getTAX_VOLITE_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getTAX_VOLITE_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="TAX_VOLITE_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>

			<tr>
				<td align='center' height=44 rowspan="2">��������</td>
				<td align='center' height=44>������ӪΥ���������ɷ���</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getECO_OPR_DMG_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getECO_OPR_DMG_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="ECO_OPR_DMG_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>��Ʒ�����Υ�������涨</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getECO_PRO_DMG_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getECO_PRO_DMG_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="ECO_PRO_DMG_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>

			<tr>
				<td align='center' height=44 rowspan="2">��ȫ����</td>
				<td align='center' height=44>�ش�ȫ�¹�</td>
				<td align='center'><c:choose>
						<c:when
							test='<%="1".equals(SZCP_SQ_ZRXY.getSP_MAJOR_ACC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="0">��</input>
						</c:when>
						<c:when
							test='<%="0".equals(SZCP_SQ_ZRXY.getSP_MAJOR_ACC_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="SP_MAJOR_ACC_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>�����첿�Ų鴦</td>
				<td align='center'><c:choose>
						<c:when
							test='<%="1".equals(SZCP_SQ_ZRXY.getSP_ORG_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="0">��</input>
						</c:when>
						<c:when
							test='<%="0".equals(SZCP_SQ_ZRXY.getSP_ORG_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="SP_ORG_INVEST_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="1">��Ʒ����</td>
				<td align='center'>��Ʒ����Υ����Ϊ</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getQS_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getQS_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="QS_INVEST_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>�����Ŵ�</td>
				<td align='center'>�������д���</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getBANK_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getBANK_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="BANK_INVEST_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td align='center' height=44>��������</td>
				<td align='center'>������Υ����Ϊ</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getCSTM_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getCSTM_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="CSTM_INVEST_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<%-- <tr>
				<td align='center' height=44>��������</td>
				<td align='center'>���蹤��Υ��Υ����Ϊ</td>
				<td align='center'><c:choose>
						<c:when test='<%="1".equals(SZCP_SQ_ZRXY.getCE_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="0">��</input>
						</c:when>
						<c:when test='<%="0".equals(SZCP_SQ_ZRXY.getCE_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="CE_INVEST_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr> --%>
			<tr>
				<td align='center' height=44 colspan="2">δִ�з�Ժ�þ����ö�����</td>
				<td align='center'><%=REPORT_YEAR1%>��: <%=gyjz_last.getLAST_COURT_INVEST_QTY() %> �� &nbsp;&nbsp; 
					<%=REPORT_YEAR2%>��: <%=gyjz_next.getLAST_COURT_INVEST_QTY() %> ��</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">δִ���ٲû����þ�����</td>
				<td align='center'><%=REPORT_YEAR1%>��: <%=gyjz_last.getLAST_ARBIT_INVEST() %> �� &nbsp;&nbsp; 
					<%=REPORT_YEAR2%>��: <%=gyjz_next.getLAST_ARBIT_INVEST() %> ��</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">����Υ��Υ����Ϊ</td>
				<td align='center'><c:choose>
						<c:when
							test='<%="1".equals(SZCP_SQ_ZRXY.getOTHER_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" checked="checked"
								value="1">��</input>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="0">��</input>
						</c:when>
						<c:when
							test='<%="0".equals(SZCP_SQ_ZRXY.getOTHER_INVEST_FLAG())%>'>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="0"
								checked="checked">��</input>
						</c:when>
						<c:otherwise>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="1">��</input>
							<input type="radio"  disabled ="disabled"name="OTHER_INVEST_FLAG" value="0">��</input>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr height="44" align="center">
				<td>�������</td>
				<td>�����ۺϽ��</td>
				<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<%=REPORT_YEAR1%>��:&nbsp;<%=gyjz_last.getLAST_DONT_RMB_W() %>��Ԫ
						&nbsp;&nbsp;&nbsp;&nbsp;<%=REPORT_YEAR2%>��:&nbsp;<%=gyjz_next.getLAST_DONT_RMB_W() %>��Ԫ 
				</td>
			</tr>
		</table>
		<br><p class="PageNext"><br>
		
		<table border="1" width="90%" align="center" bordercolor="#000000">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>�������</center></b><br>
				<br>
			</caption>

			<tr align='center' height=44 width="20%">
				<td>��������</td>
				<td>��������</td>
				<td>֤����</td>
				<td>���赥λ</td>
				<td>��������</td>
				<td>��Ч����</td>
				<td>˵��</td>
			</tr>
			<c:if test="<%=list.size() == 0%>">
				<tr align='center' height=44 width="20%">
					<td colspan="8"></td>
				</tr>
			</c:if>
			<c:if test="<%=list.size() != 0%>">
				<c:forEach items="<%=list%>" var="temp">
					<tr align='center' height=44 width="20%">
						<td>${temp.HONOR_LEVEL_TYPE_VIEW}</td>
						<td>${temp.CERT_NAME}</td>
						<td>${temp.CERT_NO}</td>
						<td>${temp.AUTH_ORG_DESC}</td>
						<td>${temp.ISSUE_DATE}</td>
						<td>${temp.VALID_TO_DATE}</td>
						<td align='left' style="word-break : break-all; width: 50">${temp.HONORDESC}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br><br><br><br><br><br><br><br>

		<table border="1" width="90%" align="center" bordercolor="#000000">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>���֤��</center></b><br>
				<br>
			</caption>

			<tr align='center' height=44 width="20%">
				<td>֤������</td>
				<td>֤�����</td>
				<td>��֤����</td>
				<td>��֤����</td>
				<td>��Ч����</td>
			</tr>
			<c:if test="<%=list1.size() == 0%>">
				<tr>
					<td colspan="8" height=44></td>
				</tr>
			</c:if>
			<c:if test="<%=list1.size() != 0%>">
				<c:forEach items="<%=list1%>" var="temp">
					<tr align='center' height=44 width="20%">
						<td>${temp.CERT_NAME}</td>
						<td>${temp.CERT_NO}</td>
						<td>${temp.AUTH_ORG_DESC}</td>
						<td>${temp.ISSUE_DATE}</td>
						<td>${temp.VALID_TO_DATE}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br> 
			<div class="scroll" id="scroll" style="display:none;">
				�ص�����
			</div>
		<script>
		//radioĬ��ѡ��
		function init(){
			initRadio();
				var aValue = <%=SZCP_SQ_JBXX.getENT_TYPE() %>;
				var radio_oj = document.getElementsByName("ENT_TYPE");
				var r = <%= SZCP_SQ_JBXX.getENT_SCALE_TYPE()%>;
				var a = document.getElementsByName("ENT_SCALE_TYPE");
				change(radio_oj,aValue); //
				guimo(a,r);
			}

		function change(radio_oj,aValue){//����һ������
			for(var i=0;i<radio_oj.length;i++) {//ѭ��
		       if(radio_oj[i].value==aValue){  //�Ƚ�ֵ
			            radio_oj[i].checked=true; //�޸�ѡ��״̬
			            break; //ֹͣѭ��
				 }
			}
		}
		function guimo(radio_oj,aValue){//����һ������
			for(var i=0;i<radio_oj.length;i++) {//ѭ��
		       if(radio_oj[i].value==aValue){  //�Ƚ�ֵ
			            radio_oj[i].checked=true; //�޸�ѡ��״̬
			            break; //ֹͣѭ��
				 }
			}
		}
		
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
		function change(radio_oj,aValue){//����һ������
			   for(var i=0;i<radio_oj.length;i++) {//ѭ��
			        if(radio_oj[i].value==aValue){  //�Ƚ�ֵ
			            radio_oj[i].checked=true; //�޸�ѡ��״̬
			            break; //ֹͣѭ��
			        }
			   }
			}
		</script>
<script language="javascript" src="<%=request.getContextPath() %>/szcp/js/jquery-2.0.3.min.js"></script>		
<script type="text/javascript">
	$(function(){
		showScroll();
		function showScroll(){
			$(window).scroll( function() { 
				var scrollValue=$(window).scrollTop();
				scrollValue > 100 ? $('div[class=scroll]').fadeIn():$('div[class=scroll]').fadeOut();
			} );	
			$('#scroll').click(function(){
				$("html,body").animate({scrollTop:0},200);	
			});	
		}
	})
</script>
	<style type="text/css">
	article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { 
		display: block;
	}
/* 	body{
		font-family:"΢���ź�",Verdana, Arial, Helvetica, sans-serif;	
		position:relative;	
	} */
	img,input{
		outline:none;
	}
	ul{
		list-style:none;
	}
	a:link{
		text-decoration:none;
		color:#545454;
	}
	a:visited{
		color:#525252;
	}
	a:hover{
		color:#4D4D4D;
	}
	.clear{
	  clear:both;
	}
	.ui-page { 
		-webkit-backface-visibility: hidden; 
	}
	.container{
		padding:5px;
		min-width:320px;
	}
	#one{
		width:100%;
		
	}
	#one li{
	float:left;
	}
	#one li .a-1{
		
		min-height:70px;
		
	}
	#one li a{
		display:block;
		margin:5px;
		background:yellow;
	}
	#one li img{
		width:100%;
		min-height:70px;
		vertical-align: middle;
	}
	.scroll{
		width:60px;
		height:60px;
		background-image:url("../js/hddb.png");
		color:#fff;
		line-height:100px;
		text-align:center;
		position:fixed;
		right:20px;
		bottom:400px;
		cursor:pointer;
		font-size:14px;
	}
	</style>
</body>
</html>