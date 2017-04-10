<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_FZJG" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<html>
<head>
<title>公司股东（发起人）出资信息</title>
</head> 
<%
 	// String OPENO =Page.getpageKey();
	String action = SysUtility.doPreProcess(request.getParameter("action"));
  	String RECID = SysUtility.doPreProcess(request.getParameter("RECID"));
  	String OPENO = SysUtility.doPreProcess(request.getParameter("OPENO"));
	String PRIPID="";
 %>
<body>
<form name="form1" method="POST" action='web/qydj_fzjg_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" name="RECID" value=<%=RECID%>>
<input type="hidden" name="action" value="<%=action%>" >
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<caption></caption>
</table>
<%String sENTTYPE=Page.getENTTYPE();
  if(sENTTYPE.equals("GS")||sENTTYPE.equals("WZHH")||sENTTYPE.equals("HHQY")||sENTTYPE.equals("WZGS")||sENTTYPE.equals("HZS")||sENTTYPE.equals("GRDZ"))
  {%>
     <%@include file="public/qydj_fzjg_ini.inc" %>
<%}else if(sENTTYPE.equals("NZFR")||sENTTYPE.equals("WGJY"))
  {%>
     <%@include file="public/qydj_nzfr_fzjg.inc" %>
<%}%>
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
	ec.FormErrorCheck();   
	out.print(ec.ErrorCheckScript());

	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	
	if(action.equals("2")||action.equals("4"))//action=4 查看
	{
		QYDJ_FZJG.setRECID(RECID);
		QYDJ_FZJG.setOPENO(OPENO);
		vf.setData(QYDJ_FZJG.getData());
	}
	else
	{
		
	}	
 	out.print(vf.ValueDefaultScript());
%>