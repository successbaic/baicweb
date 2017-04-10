<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_JYXYDao"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<jsp:useBean id="jyxy" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />
<jsp:useBean id="jyxy1" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />
<jsp:useBean id="jyxy2" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />
<jsp:useBean id="CreateHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />
	
	<%
	SZCP_SQ_JYXYDao jyxyDao = new SZCP_SQ_JYXYDao();
	String REGNO = request.getParameter("REGNO");
	String YEAR = request.getParameter("EVAL_YEAR");
	String report_year1= request.getParameter("REPORT_YEAR1");
	String REPORT_YEAR2 = request.getParameter("REPORT_YEAR2");
	
	String CerNO = request.getParameter("CerNO");
	float REVE_GROW_RATE = Float.parseFloat(request.getParameter("REVE_GROW_RATE"));
	float PRI_GROW_RATE = Float.parseFloat(request.getParameter("PRI_GROW_RATE"));
	float NET_ASSET_RATE = Float.parseFloat(request.getParameter("NET_ASSET_RATE"));
	float DEBT_ASSET_RATE = Float.parseFloat(request.getParameter("DEBT_ASSET_RATE"));
	float QUICK_ACT_RATE = Float.parseFloat(request.getParameter("QUICK_ACT_RATE"));
	float RECV_TNOV_RATE = Float.parseFloat(request.getParameter("RECV_TNOV_RATE"));
	float RCV_OVERDUE_RATE = Float.parseFloat(request.getParameter("RCV_OVERDUE_RATE"));
	float PAY_OVERDUE_RATE = Float.parseFloat(request.getParameter("PAY_OVERDUE_RATE"));
	
	float REVE_GROW_RATE1 = Float.parseFloat(request.getParameter("REVE_GROW_RATE1"));
	float PRI_GROW_RATE1 = Float.parseFloat(request.getParameter("PRI_GROW_RATE1"));
	float NET_ASSET_RATE1 = Float.parseFloat(request.getParameter("NET_ASSET_RATE1"));
	float DEBT_ASSET_RATE1 = Float.parseFloat(request.getParameter("DEBT_ASSET_RATE1"));
	float QUICK_ACT_RATE1 = Float.parseFloat(request.getParameter("QUICK_ACT_RATE1"));
	float RECV_TNOV_RATE1 = Float.parseFloat(request.getParameter("RECV_TNOV_RATE1"));
	float RCV_OVERDUE_RATE1 = Float.parseFloat(request.getParameter("RCV_OVERDUE_RATE1"));
	float PAY_OVERDUE_RATE1 = Float.parseFloat(request.getParameter("PAY_OVERDUE_RATE1"));
	jyxy.setREG_NO(REGNO);
	jyxy.setEVAL_YEAR(YEAR);
	jyxy.setREPORT_YEAR(report_year1);
	jyxy.setREVE_GROW_RATE(REVE_GROW_RATE);
	jyxy.setPRI_GROW_RATE(PRI_GROW_RATE);
	jyxy.setNET_ASSET_RATE(NET_ASSET_RATE);
	jyxy.setDEBT_ASSET_RATE(DEBT_ASSET_RATE);
	jyxy.setQUICK_ACT_RATE(QUICK_ACT_RATE);
	jyxy.setRECV_TNOV_RATE(RECV_TNOV_RATE);
	jyxy.setRCV_OVERDUE_RATE(RCV_OVERDUE_RATE);
	jyxy.setPAY_OVERDUE_RATE(PAY_OVERDUE_RATE);
	
	jyxy1.setREG_NO(REGNO);
	jyxy1.setEVAL_YEAR(YEAR);
	jyxy1.setREPORT_YEAR(REPORT_YEAR2);
	jyxy1.setREVE_GROW_RATE(REVE_GROW_RATE1);
	jyxy1.setPRI_GROW_RATE(PRI_GROW_RATE1);
	jyxy1.setNET_ASSET_RATE(NET_ASSET_RATE1);
	jyxy1.setDEBT_ASSET_RATE(DEBT_ASSET_RATE1);
	jyxy1.setQUICK_ACT_RATE(QUICK_ACT_RATE1);
	jyxy1.setRECV_TNOV_RATE(RECV_TNOV_RATE1);
	jyxy1.setRCV_OVERDUE_RATE(RCV_OVERDUE_RATE1);
	jyxy1.setPAY_OVERDUE_RATE(PAY_OVERDUE_RATE1);
	
	
	boolean flag = jyxyDao.executeNextStep(jyxy,jyxy1);
	if(flag) {
		out.print(CreateHeaderUtil.setAlertGo("","szcp_sq_zrxy.jsp?REG_NO="+jyxy.getREG_NO()+"&EVAL_YEAR="+jyxy.getEVAL_YEAR()+"&CerNO="+CerNO));
	}else {
		out.print(SysUtility.setAlertScript("系统出错，请稍后再试",""));
	}
%>    
