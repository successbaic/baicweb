<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<%  	
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);		
	int INSYEAR=Page.getipageKey();
	String SIGN=Page.getpageKey1();
	GGGL_JYDW_JBXX.setADBULICNO(Page.getpageKey());
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();
	
%>
<html>
<head>
<title>封面信息</title>
</head>
<body>
<br/>
<form name="form1" method="POST" action='ggxkz_fmxx_action.jsp' target="editframe">
<input type="hidden" name="ANCHETYPE" value="0">
<input type="hidden" name="INSYEAR" value="<%=INSYEAR%>">
<table border="1" width="100%" align="center">
<CAPTION>封面信息</CAPTION>
<tr>
<td class="lc1">单位名称：</td>
<td class="lc2"><input type="text" style="width:240px" name="ADBUENT" value="<%=GGGL_JYDW_JBXX.getADBUENT() %>" disabled></td>
</tr>
<tr>
<td class="lc1">许可证号：</td>
<td class="lc2"><input type="text" style="width:240px" name="ADBULICNO" value="<%=GGGL_JYDW_JBXX.getADBULICNO() %>" disabled></td>
</tr>
<tr>
<td class="lc1">住 &nbsp; 所：</td>
<td class="lc2"><input type="text" style="width:240px" name="DOM" title="住所" value="<%=GGGL_JYDW_JBXX.getDOM() %>" disblank><font color="red">*</font></td>
</tr>
<tr>
<td class="lc1">邮政编码：</td>
<td class="lc2"><input type="text" style="width:120px" name="POLCODE" title="邮政编码" value="<%=GGGL_JYDW_JBXX.getPOLCODE() %>" disblank><font color="red">*</font></td>
</tr>
<tr>
<td class="lc1">联系电话：</td>
<td class="lc2"><input type="text" style="width:120px" name="TEL" title="联系电话" value="<%=GGGL_JYDW_JBXX.getTEL() %>" disblank><font color="red">*</font></td>
</tr>
<tr>
<td class="lc1">申报日期：</td>
<td class="lc2"><input type="text" style="width:120px" name="DECDATE" datatype='date' onclick="dropdowndate(this)" title="申报日期" value="<%=GGGL_JYDW_JBXX.getDECDATE() %>" disblank><font color="red">*</font></td>
</tr>
</table>
<%
if(SIGN.equals("1")){

}else{
%>
<table border="1" width="100%" align="center">
<tr>
	<td colspan="4" align='center'><INPUT name="saveinfo" id="saveinfo" type="submit" value="保  存" class="butontType"></td>
</tr>
</table>
<%}%>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe>
</form>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();	
	out.print(ec.ErrorCheckScript());

	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
 	out.print(vf.ValueDefaultScript());
%>
</body>
</html>	