<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<%--jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/--%>
<jsp:useBean id="GGGL_JYDW_HDSX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_HDSX"/>
<%
String ADBULICNO=Page.getpageKey();
int INSYEAR=Page.getipageKey();
boolean bl=false;
for(int i=1;i<=12;i++){
	String ti="0"+i;
	if(i>=10) ti=""+i;
	String T=GGGL_JYDW_HDSX.doPreProcess(request.getParameter("T"+ti));
	GGGL_JYDW_HDSX.setINSYEAR(INSYEAR);
	GGGL_JYDW_HDSX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_HDSX.setADINSCHEPRO(ti);
	GGGL_JYDW_HDSX.setMATSIGN(T);
	if(T.equals("2")){
		GGGL_JYDW_HDSX.setINSACST(GGGL_JYDW_HDSX.doPreProcess(request.getParameter("V"+ti)));		
	}
	if(GGGL_JYDW_HDSX.doCount()){
		bl=GGGL_JYDW_HDSX.doModify();
		if(!bl){
			out.print("<script>javascript:alert('信息修改失败！');parent.window.location.reload();</script>");
			return;
		}
	}else{
		bl=GGGL_JYDW_HDSX.doAdd();
		if(!bl){
			out.print("<script>javascript:alert('信息添加失败！');parent.window.location.reload();</script>");
			return;
		}
	}
}
//bl=GGGL_JYDW_JBXX.doModifyBySql("UPDATE GGGL_JYDW_JBXX SET ANCHETYPE='0' WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR);
//if(!bl){
//	out.print("<script>javascript:alert('当前状态修改失败！');parent.window.location.reload();</script>");
//	return;
//}
if(bl){
	//Page.setMusted(0);	//该页已保存，可以进入下一页
	out.print("<script>javascript:alert('操作成功！');parent.window.location.reload();</script>");	
}
%>