<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>经营者信息</title></head>
<jsp:useBean id="HWGG_GGZXX" scope="page" class="com.macrosoft.icms.gggl.HWGG_GGZXX_SQ">
   <jsp:setProperty name="HWGG_GGZXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<body>
<%
	String OPENO = HWGG_GGZXX.doPreProcess(request.getParameter("OPENO"));
    HWGG_GGZXX.setOPENO(OPENO);
	boolean bl=false;
	if(HWGG_GGZXX.doCount())//修改
	{
		bl=HWGG_GGZXX.doModify();		
	}else{//新增  	    		
		bl=HWGG_GGZXX.doAdd();		
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