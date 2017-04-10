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
	//�ж��Ƿ񳬳������
	if(!SZCP_SXSZ.validateEndDate(new HashMap())){
		out.print(SysUtility.setAlertGo("�����걨�Ѿ����������ڼ�����ʼ�������ڴ���","index.jsp"));
        return;
	}
	SZCP_YSB ysbInfo = SZCP_YSB.queryIsYsb(REGNO,CERNO);
	if(ysbInfo == null) {
		QYDJ_JBXX_ZS.doSelectBySql(" SELECT * FROM QYDJ_JBXX_ZS WHERE  (REGNO= "+"'"+REGNO+"'  OR  UNISCID="+"'"+REGNO+"')");
		String PRIPID=QYDJ_JBXX_ZS.getPRIPID();
		if(PRIPID.equals("")){
			out.print(SysUtility.setAlertGo("ע���/ͳһ������ô��벻���ڻ�ǰ��ҵ��ע�������뱣֤ע���/ͳһ������ô����׼ȷ�������ԣ����������룡","index.jsp"));
	        return;
		}else{
			Map ryxx_zs = SZCP_LCZT.queryByPripid(PRIPID);
			if(ryxx_zs.get(CERNO) == null){
				out.print(SysUtility.setAlertGo("���������ˣ������ˣ���֤��������Ǽ���Ϣ��һ�£����飡","index.jsp"));
				return;
			}else {
				out.print(SysUtility.setAlertGo("���߱��걨�ʸ�,�������Ǽǻ�����������ҵԤ�걨","index.jsp"));
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
			out.print(SysUtility.setAlertGo("�����걨�ʸ�","index.jsp"));
        	return;
		}
	}
%>
</body>
</html>
