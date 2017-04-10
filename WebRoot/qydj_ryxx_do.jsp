<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_RYXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<html>
<head>
<title>人员信息</title>
<script language="javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<SCRIPT LANGUAGE="JavaScript">
	function checkSFZH()
	{		
		var ret=true;
		if (document.form1.CERTYPE.value=="10")	// 身份证
		{
			ret=validatezjhm(document.form1.CERNO.value);
			if(ret){
			
			}else{
				document.form1.btSave.disabled=false;
			}
		}
		return ret;
	}
	
	function getSelDm(id,type){
		var url = "support/doSelDm.jsp?type="+type;
		var info="dialogHeight:580px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
		var ret = window.showModalDialog(url,"",info);
		if(ret!=undefined){
			var testId=id+"_TEXT"
			document.getElementById(id).value=ret[0];
			document.getElementById(testId).value=ret[1];		
		}
	}
</SCRIPT>
</head> 
<%
	String action = SysUtility.doPreProcess(request.getParameter("action"));
  	String RECID = SysUtility.doPreProcess(request.getParameter("RECID"));
  	String OPENO = SysUtility.doPreProcess(request.getParameter("OPENO"));
  	String LEREPSIGN=SysUtility.doPreProcess(request.getParameter("LEREPSIGN"));  	
	String PRIPID="";String fddbrFlag ="disabled";
	String ENTTYPE=Page.getENTTYPE();
	ArrayList ryList=null;
	if(action.equals("2")||action.equals("4")){
		QYDJ_RYXX.setRECID(RECID);
		QYDJ_RYXX.setOPENO(OPENO);
		ryList=QYDJ_RYXX.getData();
	}	
%>
<body>
<form name="form1" method="POST" action='web/qydj_ryxx_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" name="RECID" value=<%=RECID%>>
<input type="hidden" name="action" value="<%=action%>" >
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<caption></caption>
</table>
<%String sENTTYPE=Page.getENTTYPE();
  if(sENTTYPE.equals("WZGS")||sENTTYPE.equals("WZQY"))
  {%>
     <%@ include file="public/qydj_wzryxx_ini.inc" %>
<%}else if(sENTTYPE.equals("WGDB"))
  {%>
     <%@ include file="public/qydj_wgdb_dbxx.inc" %>
<%}else if(sENTTYPE.equals("WZFR"))
  {%>
     <%@ include file="public/qydj_wzfr_ryxx.inc" %>
<%}else
  {%>
     <%@ include file="public/qydj_ryxx_ini.inc" %>
<%}%>
<br>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
<%
		if (action.equals("4"))
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
//	ec.setUserFunction("loadrzrq()");
//	ec.dateOrderCheck("OFFHFROM","OFFHTO","任职日期终止日期应该大于等于起始日期!");
	ec.FormErrorCheck();	
	ec.setUserFunction("checkSFZH()");
	out.print(ec.ErrorCheckScript());

	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	
	if(action.equals("2")||action.equals("4"))//action=4 查看
	{
		vf.setData(ryList);
		vf.setFormData("COUNTRY_TEXT", icms.getSysDm("COUNTRY",QYDJ_RYXX.getCOUNTRY()));
	}	
	if(QYDJ_RYXX.getPOSITION() == "" && sENTTYPE.equals("WGDB")){
		vf.setFormData("POSITION", "491B");
	}
	vf.setFormData("LEREPSIGN",LEREPSIGN);	
 	out.print(vf.ValueDefaultScript());
%>
