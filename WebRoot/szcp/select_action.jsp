<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="com.macrosoft.icms.szcp.CreateHeaderUtil"%>
<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap" %>
<jsp:useBean id="SZCP_YSB" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_YSB" />
<jsp:useBean id="SZCP_LCZT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_LCZT" />
<jsp:useBean id="SZCP_SXSZ" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"
	class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS" />
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"
	class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS" />
<jsp:useBean id="SysUtility" scope="page"
	class="com.macrosoft.icms.system.SysUtility" />
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
	
<html>
<head>
<title></title>
</head>
<body>
	<%	
	String REGNO=SysUtility.doPreProcess(request.getParameter("REGNO")).trim();
	String CERNO=SysUtility.doPreProcess(request.getParameter("CERNO")).trim();
	String XZQH=SysUtility.doPreProcess(request.getParameter("XZQH"));
	String loginid=webuser.getLOGINID();
	Calendar calendar = Calendar.getInstance();
	int evalYear = calendar.get(Calendar.YEAR);
	SZCP_LCZT.doSelectBySql("SELECT * FROM SZCP_LCZT WHERE (REG_NO= '"+REGNO+"' OR UNISCID = '"+REGNO+"' ) AND EVAL_YEAR="+evalYear);
	if(SZCP_LCZT.getREG_NO() == null || "".equals(SZCP_LCZT.getREG_NO())){
		SZCP_YSB.doSelectBySql("SELECT * FROM SZCP_YSB WHERE (REG_NO= '"+REGNO+"' OR UNISCID = '"+REGNO+"' )  AND LEG_REP_CERT_NO = '"+CERNO+"'");
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("REGNO",SZCP_YSB.getREG_NO());
		map.put("UNISCID",SZCP_YSB.getUNISCID());
		map.put("ENT_NAME",SZCP_YSB.getENT_NAME());
		map.put("ADDR_DESC",SZCP_YSB.getADDR_DESC());
		map.put("LOGIN_ID",loginid);
		map.put("LOCAL_ORG_NO",SZCP_YSB.getLOCAL_ORG_CODE());
		map.put("APPR_STAT_FLAG","1");
		map.put("PRO_STAT_FLAG","1");
		map.put("DOM_DISTRICT_CODE",SZCP_YSB.getDOM_DISTRICT_CODE());
		map.put("ESTDATE",SZCP_YSB.getEST_DATE());
		SZCP_LCZT.doAdd(map);
	}
	String url = request.getContextPath();
	url+="/szcp_sqtjcg.jsp?REG_NO="+REGNO+"&EVAL_YEAR="+evalYear;
	out.print(SysUtility.setAlertGo("ÉêÇë³É¹¦",url));
%>
</body>
</html>
