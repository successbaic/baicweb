<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>��Ӫ����Ϣ</title></head>
<jsp:useBean id="HWGG_GGZXX" scope="page" class="com.macrosoft.icms.gggl.HWGG_GGZXX_SQ">
   <jsp:setProperty name="HWGG_GGZXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<body>
<%
	String OPENO = HWGG_GGZXX.doPreProcess(request.getParameter("OPENO"));
    HWGG_GGZXX.setOPENO(OPENO);
	boolean bl=false;
	if(HWGG_GGZXX.doCount())//�޸�
	{
		bl=HWGG_GGZXX.doModify();		
	}else{//����  	    		
		bl=HWGG_GGZXX.doAdd();		
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