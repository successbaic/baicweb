<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<jsp:useBean id="SZCP_LCZT"    scope="page"  class="com.macrosoft.icms.szcp.SZCP_LCZT" />
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<%@page import="com.macrosoft.icms.szcp.SZCP_LCZT" %>    
<%
	request.setCharacterEncoding("GBK");
	String REGNO = request.getParameter("REG_NO");
	QYDJ_JBXX_ZS.doSelectBySql("SELECT * FROM QYDJ_JBXX_ZS WHERE  REGNO='"+REGNO+"'");
	String PRIPID=QYDJ_JBXX_ZS.getPRIPID();
	QYDJ_RYXX_ZS.setPRIPID(PRIPID);
	QYDJ_RYXX_ZS.doSelectByPripid();
	String CERNO = QYDJ_RYXX_ZS.getCERNO();
	if(CERNO != null && !"".equals(CERNO)) {
		out.print(CERNO);
		
	}
%>
 