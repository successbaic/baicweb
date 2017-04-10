<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>经营者信息</title></head>
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
	if(HWGG_FBZXX.doCount())//修改
	{
		bl=HWGG_FBZXX.doModify();		
	}else{//新增  	    		
		bl=HWGG_FBZXX.doAdd();		
	}
	if(bl){
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//该页已保存，可以进入下一页
	}
	else{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!",""));
	}
%>
</body></html>