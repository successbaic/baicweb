<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX">
	<jsp:setProperty name="GGGL_JYDW_JBXX" property="*"/>
</jsp:useBean>
<%

boolean bl=GGGL_JYDW_JBXX.doModifyBySql("UPDATE GGGL_JYDW_JBXX SET ANCHETYPE='0',DOM="+GGGL_JYDW_JBXX.convertCode(GGGL_JYDW_JBXX.doPreProcess3(request.getParameter("DOM")))
+", POLCODE="+GGGL_JYDW_JBXX.doPreProcess3(request.getParameter("POLCODE"))
+", TEL="+GGGL_JYDW_JBXX.doPreProcess3(request.getParameter("TEL"))
+", DECDATE=to_date("+GGGL_JYDW_JBXX.doPreProcess3(request.getParameter("DECDATE"))+",'yyyy-mm-dd')"
+" WHERE ADBULICNO="+GGGL_JYDW_JBXX.doPreProcess3(request.getParameter("ADBULICNO"))
+" AND INSYEAR="+GGGL_JYDW_JBXX.doPreProcess(request.getParameter("INSYEAR"))
);
if(!bl){
	out.print("<script>javascript:alert('信息保存失败！');parent.window.location.reload();</script>");
	return;
}else{
	if(Page.getpageKey3().equals("WW")){
		Page.setMusted(0);	
		Page.setVerify(1);
		Page.setVerify(2);
		Page.setVerify(3);
		Page.setVerify(4);
		Page.setVerify(5);
		Page.setVerify(6);
		Page.setVerify(7);
		Page.setVerify(8);
	}
	out.print("<script>javascript:alert('信息保存成功！');parent.window.location.reload();</script>");
	return;
}
%>