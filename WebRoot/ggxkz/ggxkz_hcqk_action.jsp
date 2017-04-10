<%@include file="jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>核查情况</title></head>
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
		out.print("<script>javascript:alert('请填写并保存封面信息！');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_HDSX WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('核对事项页面尚未填写！');</script>");
		return;
	}

	//if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_ZSXX WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
	//	out.print("<script>javascript:alert('资格证书页面尚未填写！');</script>");
	//	return;
	//}

	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_JYQK WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('经营情况页面尚未填写！');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_GLZD WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('管理制度页面尚未填写！');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_GGJY WHERE PRIPID='"+ADBULICNO+"' AND ANCHEYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('广告统计信息页面尚未填写！');</script>");
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
		out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.href='"+rp+"';"));	   		
	}else{
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	}	
%>
</body></html>
 
