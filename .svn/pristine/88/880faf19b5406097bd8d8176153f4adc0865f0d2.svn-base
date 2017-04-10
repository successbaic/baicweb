<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="GQDJ_JBXX" scope="page"  class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ"/>
<jsp:useBean id="GSGSJIN_BASIS02" scope="page"  class="com.macrosoft.icms.gsnw.GSGSJIN_BASIS02"/>
<html>
<head>
<title>基本情况</title>
</head>
<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<%@include file="/top.inc"%>
<%	
	//  
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SIGN = Page.getSIGN();	//-1数据未保存,1已开业
	String REGNO=Page.getREGNO();
	String OPENO =Page.getOPENO();	
	String OPETYPE =Page.getOPETYPE();
	String MCXH=Page.getMCXH();
	String MCID=Page.getXGBH();
	String PRIPID=Page.getPRIPID();
	String ID=Page.getpageKey(); //企业主表ID关联人员信息
	if(PRIPID.equals("")){
		PRIPID=MCXH;
	}
%> 
<form name="form1" method="POST" action='gqdj_jbxx_action.jsp' target="editframes">
<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:400px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:#c6dbec">
<table width="100%">
<tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; "> 请选择</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">关闭&nbsp;</span> </td></tr>
</table>
<IFRAME height="400" width="770px" name="editframe" src="" id="editframe" scrolling="no" border="0" align='center'  frameborder="0"></IFRAME>
</div>
</div>
<input type="hidden" name="action" value="1">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="OPETYPE" value=<%=OPETYPE%>>
<input type="hidden" name="PRIPID" value=<%=PRIPID%>>
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>"> 
<input type="hidden" name="CDDL" value="4">
<input type="hidden" name="ID" value="<%=ID%>">
<input type="hidden" name="HOLDERTYPE">
<input type="hidden" name="HOLDERSHARE">
<input type="hidden" name="INSDATE">
<input type="hidden" name="APPRDATE">
<input type="hidden" name="SN">

<%@include file="/public/gqdj_jbxx.inc" %>
<br>
<CENTER>
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
%>
</CENTER>
</form>
<iframe height="0" width="0" name="hiddenframe" src="" id="hiddenframe"></iframe>
<iframe height="0" width="0" name="editframes" src="" id="hiddenframe"></iframe>
<%@include file="/bottom.inc"%>
</body>  
</html>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	if (OPENO.equals(""))	
	{
	   vf.setFormData("ENTNAME",Page.getENTNAME());
	   vf.setFormData("REGNO",Page.getREGNO());
	}
	else 
	{
		GQDJ_JBXX.setOPENO(OPENO);
		vf.setData(GQDJ_JBXX.getData());
	}
	out.print(vf.ValueDefaultScript());
%>