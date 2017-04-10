<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GQDJ_CXXX_SQ" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_CXXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="WR0212" scope="page"  class="com.macrosoft.icms.gsnw.WR0212"/>
<jsp:useBean id='GQDJ_JBXX_SQ' scope='page' class='com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ'/>
<%@include file="../top.inc"%>
<%	
	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();
 	String sENTTYPE = Page.getENTTYPE();
 	String SIGN =Page.getSIGN();
 	String NWID=Page.getXGBH();
 	String NWSN=Page.getpageKey(); 	
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);

	if((SIGN.equals("1")||SIGN.equals("0"))&&!OPENO.equals(""))
 	{
		GQDJ_JBXX_SQ.setOPENO(OPENO);
		GQDJ_JBXX_SQ.doSelect();
 		NWID=GQDJ_JBXX_SQ.getNWID();
 		NWSN=GQDJ_JBXX_SQ.getNWSN();
 	}
	WR0212.doSelect(NWID,NWSN);

%>
<html><head>
<title>撤销信息</title>
</head>
<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<form name="form1" method="POST" action="gqdj_cxxx_action.jsp" target="editframe">
<input type="hidden" name = "PRIPID" value=<%=PRIPID%>>
<input type="hidden" name = "ENTTYPE" value=<%=sENTTYPE%>>
<input type="hidden" name = "OPENO" value="<%=OPENO%>">
<input type="hidden" name = "OPETYPE" value="60">
<input type="hidden" name = "SIGN" value="<%=SIGN%>">
<input type="hidden" name="REGORG" value="<%=WR0212.getDJJG()%>">
<input type="hidden" name="STATUS" value="">
<input type="hidden" name="TYPE" value="2">
<input type="hidden" name="NWID" value="<%=NWID%>">
<input type="hidden" name="NWSN" value="<%=NWSN%>">

<%@include file="../public/gqdj_info.inc"%>
<table border="1" cellpadding="0" cellspacing="0" width="100%" >
<caption align="left">股权质押撤销信息</caption>

<input type='hidden' name='MORREGNO' >
<input type='hidden' name='PRIPID' >
<input type='hidden' name='OPENO' >

<tr class="lc1">
	<td width="15%"  class="lc1" align="right">撤销原因</td>
	<td width="20%"  class="lc2">
	<select size="1" name="CANREA" style="width:150" >
	<option value=''>请选择撤销原因</option><%=icms.getSysDmList("MORCANCELREA")%>
	</select>

	</td>
	<td width="15%"  class="lc1" align="right">撤销日期</td>
	<td width="18%"  class="lc2">
	<input type="text" name="CANDATE" size="16" onclick="dropdowndate(this)" disblank title="撤销日期" datatype=DATE>
	</td>
	<td width="15%"  class="lc1" align="right">申请人</td>
	<td class="lc2">
	<input type="text" name="APPPER" size="20" maxlength=40  disblank title="申请人">
	</td>
 </tr>
<tr class="lc2">
	<td class="lc1" align="right">备注</td>
	<td class="lc2" colspan="6">
		<textarea rows="4" cols="70" name="REMARK" title="备注" maxlength='500'></textarea>
	</td>
</tr>
</table>
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
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="../bottom.inc"%>
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
	GQDJ_CXXX_SQ.setOPENO(OPENO);
	vf.setData(GQDJ_CXXX_SQ.getData());
	out.print(vf.ValueDefaultScript());
%>