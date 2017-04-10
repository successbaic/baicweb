<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_XKXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_XKXX_SQ"/>
<html>
<head>
<title>许可经营信息</title>
</head> 
<%
 	// String OPENO =Page.getpageKey();
	String action = SysUtility.doPreProcess(request.getParameter("action"));
  	String RECID = SysUtility.doPreProcess(request.getParameter("RECID"));
  	String OPENO = SysUtility.doPreProcess(request.getParameter("OPENO"));
	String PRIPID="";	
 %>
<body>
<form name="form1" method="POST" action='web/qydj_xkxx_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID()%>">
<input type="hidden" name="RECID" value=<%=RECID%>>
<input type="hidden" name="action" value="<%=action%>">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<caption></caption>
</table>
    <%@ include file="public/qydj_xkxx.inc" %>
<table width="100%" border=1 cellpadding="0" cellspacing="0" >
<tr>
<td class="lc2">
<font color="red">说明：</font>
日期格式为：yyyy-MM-dd，如：2015-01-12。
</td>
</tr>
</table>    
<br>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
<%
		if (action.equals("4")) //4 查看
		{
%>
		<input name="btRet" type="button" value="返  回" onclick="parent.window.location.reload();" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
<%
		}
		else
		{
		%>
		<input name="btSave" type="submit" value="保  存" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
		<%
		}
		%>
		</td>
	</tr>
</table>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>     
</html>   

 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");

	ec.dateOrderCheck("VALFROM","VALTO","有效期限终止日期应该大于等于起始日期!");
	
	ec.FormErrorCheck();	
	out.print(ec.ErrorCheckScript());


	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	
	if(action.equals("2")||action.equals("4"))//action=4 查看
	{
		QYDJ_XKXX.setRECID(RECID);
		QYDJ_XKXX.setOPENO(OPENO);
		vf.setData(QYDJ_XKXX.getData());
	}
	else
	{
	//	vf.setFormData("POSBRFORM","03");		
	}
	
 	out.print(vf.ValueDefaultScript());
%>