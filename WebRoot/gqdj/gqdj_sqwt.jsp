<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="GQDJ_JBXX" scope="page"  class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ"/>
<html>
<head>
<title>指定代表或者共同委托代理人的证明</title>
</head>
<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<%@include file="../top.inc"%>
<%
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String OPENO =Page.getOPENO();
	String PRIPID=Page.getPRIPID();
    String SIGN = Page.getSIGN();	//1查看，2修改   
 %> 
<form name="form1" method="POST" action='gqdj_sqwt_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>
<input type="hidden" name="SIGN" value=0>
<input type="hidden" name="PRIPID" value=<%=PRIPID%>
<input type="hidden" name="action"  value="1">
 <%@ include file="../public/gqdj_sqwt_ini.inc" %>
 <br><CENTER>
 <%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一页</div>
<%
}
%></CENTER>
</form>
<%@include file="../bottom.inc"%>
<iframe height="0" width="100" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0"></iframe>
</body>      
<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
</html>      

<%  
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	ErrorCheck ec = new ErrorCheck();

	ec.setFormName("form1");
	ec.dateOrderCheck("CONFROM","CONTO","有效期限终止日期应该大于等于起始日期!");
	ec.FormErrorCheck();

	out.print(ec.ErrorCheckScript());
	QYDJ_SQWT.setOPENO(OPENO);
	GQDJ_JBXX.setOPENO(OPENO);
	GQDJ_JBXX.doSelect();
	vf.setFormData("ENTNAME",GQDJ_JBXX.getENTNAME());
	vf.setData(QYDJ_SQWT.getData());
	
	out.print(vf.ValueDefaultScript());
%>
 
