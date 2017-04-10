<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_GGJY" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_GGJY">
   <jsp:setProperty name="GGGL_GGJY" property="*"/>
</jsp:useBean>
<%
String ADBULICNO=Page.getpageKey();
int INSYEAR=Page.getipageKey();
boolean bl=false;
GGGL_GGJY.setPRIPID(ADBULICNO);
GGGL_GGJY.setANCHEYEAR(INSYEAR);
if(GGGL_GGJY.doCount()){
	bl=GGGL_GGJY.doModify();
	if(!bl){
		out.print("<script>javascript:alert('信息修改失败！');parent.window.location.reload();</script>");
		return;
	}
}else{
	bl=GGGL_GGJY.doAdd();
	if(!bl){
		out.print("<script>javascript:alert('信息添加失败！');parent.window.location.reload();</script>");
		return;
	}
}
if(bl){
	out.print("<script>javascript:alert('操作成功！');parent.window.location.reload();</script>");
}
%>