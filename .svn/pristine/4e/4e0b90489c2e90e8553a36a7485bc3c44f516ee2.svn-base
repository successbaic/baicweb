<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="com.macrosoft.icms.szcp.CreateHeaderUtil"%>
<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="java.util.Date" %>
<%@page import="com.macrosoft.icms.szcp.SZCP_YSB" %>
<jsp:useBean id="SZCP_YSB" scope="page"  class="com.macrosoft.icms.szcp.SZCP_YSB"/>
<jsp:useBean id="SZCP_LCZT" scope="page"  class="com.macrosoft.icms.szcp.SZCP_LCZT"/>
<jsp:useBean id="SZCP_SXSZ" scope="page"  class="com.macrosoft.icms.szcp.SZCP_SXSZ"/>
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="SysUtility" scope="page"  class="com.macrosoft.icms.system.SysUtility"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title></title>
</head>
<body>
<%	
	String REGNO=SysUtility.doPreProcess(request.getParameter("REGNO")).trim();
	String CERNO=SysUtility.doPreProcess(request.getParameter("CERNO")).trim();
	String XZQH=SysUtility.doPreProcess(request.getParameter("XZQH"));
	String loginid = SysUtility.doPreProcess(request.getParameter("LOGINID"));
	//判断是否超出填报日期
	if(!SZCP_SXSZ.validateEndDate(new HashMap())){
		out.print(SysUtility.setAlertGo("本期申报已经结束！下期即将开始，敬请期待！","index.jsp"));
        return;
	}
	SZCP_YSB ysbInfo = SZCP_YSB.queryIsYsb(REGNO,CERNO);
	if(ysbInfo == null) {
		QYDJ_JBXX_ZS.doSelectBySql(" SELECT * FROM QYDJ_JBXX_ZS WHERE  (REGNO= "+"'"+REGNO+"'  OR  UNISCID="+"'"+REGNO+"')");
		String PRIPID=QYDJ_JBXX_ZS.getPRIPID();
		if(PRIPID.equals("")){
			out.print(SysUtility.setAlertGo("注册号/统一社会信用代码不存在或当前企业已注吊销，请保证注册号/统一社会信用代码的准确及完整性，并重新输入！","index.jsp"));
	        return;
		}else{
			Map ryxx_zs = SZCP_LCZT.queryByPripid(PRIPID);
			if(ryxx_zs.get(CERNO) == null){
				out.print(SysUtility.setAlertGo("法定代表人（负责人）的证件号码与登记信息不一致，请检查！","index.jsp"));
				return;
			}else {
				out.print(SysUtility.setAlertGo("不具备申报资格,请您到登记机关做守重企业预申报","index.jsp"));
				return;
			} 
		}
	}else {
		String STAT_FLAG = ysbInfo.getSTAT_FLAG();
		if(STAT_FLAG != null && STAT_FLAG.equals("1")) {
			String url = request.getContextPath();
			Calendar calendar = Calendar.getInstance();
			int evalYear = calendar.get(Calendar.YEAR);
			url+="/szcp/szcp_qyxx_check.jsp?REG_NO="+REGNO+"&CERNO="+CERNO+"&XZQH="+XZQH+"&LOGINID="+loginid;
			out.print(CreateHeaderUtil.setAlertGo("",url));
		}else {
			out.print(SysUtility.setAlertGo("暂无申报资格！","index.jsp"));
        	return;
		}
	}
%>
</body>
</html>
