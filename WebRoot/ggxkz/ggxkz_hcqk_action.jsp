<%@include file="jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>�˲����</title></head>
<jsp:useBean id="GGGL_JYDW_HCQK" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_HCQK">
	<jsp:setProperty name="GGGL_JYDW_HCQK" property="*"/>
</jsp:useBean>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id='SysUrlForm' scope='session' class='com.macrosoft.icms.system.SysUrlForm'/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<body>
<%	
	String ADBULICNO = GGGL_JYDW_HCQK.doPreProcess(request.getParameter("ADBULICNO"));
	int INSYEAR=Integer.parseInt(request.getParameter("INSYEAR"));
	String SIGN=Page.getpageKey1();
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();
	if(GGGL_JYDW_JBXX.getTEL().equals("")
	||GGGL_JYDW_JBXX.getPOLCODE().equals("")
	||GGGL_JYDW_JBXX.getDOM().equals("")
	||GGGL_JYDW_JBXX.getDECDATE().equals("")){
		out.print("<script>javascript:alert('����д�����������Ϣ��');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_HDSX WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('�˶�����ҳ����δ��д��');</script>");
		return;
	}

	//if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_ZSXX WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
	//	out.print("<script>javascript:alert('�ʸ�֤��ҳ����δ��д��');</script>");
	//	return;
	//}

	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_JYQK WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('��Ӫ���ҳ����δ��д��');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_GLZD WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('�����ƶ�ҳ����δ��д��');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_GGJY WHERE PRIPID='"+ADBULICNO+"' AND ANCHEYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('���ͳ����Ϣҳ����δ��д��');</script>");
		return;
	}
	
	GGGL_JYDW_HCQK.setADBULICNO(ADBULICNO);
	GGGL_JYDW_HCQK.setINSYEAR(INSYEAR);
	boolean bl=false;
	if(GGGL_JYDW_HCQK.doCount()){
	   bl=GGGL_JYDW_HCQK.doModify();				   
	}else{
	   bl=GGGL_JYDW_HCQK.doAdd();
	}
	String ANCHETYPE=GGGL_JYDW_HCQK.doPreProcess(request.getParameter("ANCHETYPE"));
	String CHEOPIN=GGGL_JYDW_HCQK.doPreProcess(request.getParameter("CHEOPIN"));
	bl=GGGL_JYDW_JBXX.doModifyBySql("UPDATE GGGL_JYDW_JBXX SET ANCHETYPE='"+ANCHETYPE+"',ADBUSINSRES='"+CHEOPIN+"',ACCDATE=sysdate WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR);
	bl=GGGL_JYDW_JBXX.doModifyBySql("UPDATE gggl_ggjy SET STATUS='"+ANCHETYPE+"' WHERE pripid='"+ADBULICNO+"' AND ancheyear="+INSYEAR);
	if(bl){
		String rp=SysUrlForm.getReturnPage("ggxkz_ys_list.jsp");
		if(SIGN.equals("3")){
			rp=SysUrlForm.getReturnPage("ggxkz_ysbl_list.jsp");
		}
		out.print(SysUtility.setAlertScript("�����޸ĳɹ�!","parent.window.location.href='"+rp+"';"));	   		
	}else{
		out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
	}	
%>
</body></html>
 
