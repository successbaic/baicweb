<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>��Ӫ����Ϣ</title></head>
<jsp:useBean id="HWGG_JBXX" scope="page" class="com.macrosoft.icms.gggl.HWGG_JBXX_SQ"/>
<jsp:useBean id="HWGG_FBZXX" scope="page" class="com.macrosoft.icms.gggl.HWGG_FBZXX_SQ">
   <jsp:setProperty name="HWGG_FBZXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<body>
<%
	String OPENO = HWGG_FBZXX.doPreProcess(request.getParameter("OPENO"));
    HWGG_FBZXX.setOPENO(OPENO);
	boolean bl=false;
	if(HWGG_FBZXX.doCount())//�޸�
	{
		bl=HWGG_FBZXX.doModify();		
	}else{//����  	    		
		bl=HWGG_FBZXX.doAdd();		
	}
	if(bl){
		out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//��ҳ�ѱ��棬���Խ�����һҳ
	}
	else{
		out.print(SysUtility.setAlertScript("ҵ���걨���ݱ���ʧ��!",""));
	}
%>
</body></html>