<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="GA_ZJXX" scope="page"
	class="com.macrosoft.icms.bean.GA_ZJXX" />
<jsp:useBean id="QYDJ_JBXX" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" />
<html>
<head>
<title>������Ϣ����</title>
<%
	String OPENO = Page.getOPENO();
	String SIGN = Page.getSIGN(); //1�鿴��2�޸�   
	String ENTTYPE = Page.getENTTYPE();
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
%>
<style type="text/css">
.checkbox {
	vertical-align: middle;
}
</style>
<script type="" src="<%=request.getContextPath()%>/support/basic.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%@include file="top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<form name="form1" method="POST" action='web/wsdj_ga_action.jsp'
		target="editframe">
		<input type="hidden" name="OPENO" value="<%=OPENO%>"> 
		<input type="hidden" name="CONSIGNER"> 
		<input type="hidden" name="TIME_STAMP"> 

		<table width="95%" border=1 cellpadding="0" cellspacing="0">
			<tr>
				<td class="yxsm" colspan="5">&nbsp;������Ϣ����</td>
			</tr>
			<tr>
				<td class="lc1" colspan="2">����</td>
				<td class="lc2"><input type="text" name="ENTNAME" size="29"
					title='����' maxlength='100' value="<%=QYDJ_JBXX.getENTNAME()%>"
					readonly="readonly" disblank disabled="disabled"></td>
			<tr>
				<td class="lc1" colspan="2">��������</td>
				<td class="lc2" colspan="3">
						  ������:<input class="checkbox" id="XZZ_GZ" name="XZZ_GZ" title='������' type="checkbox" value="1"> 
					&nbsp;����ר����:<input class="checkbox" id="CW_GZ" name="CW_GZ" title='����ר����' type="checkbox" value="1">
					&nbsp;��ͬר����:<input class="checkbox" id="HT_GZ" name="HT_GZ" title='��ͬר����' type="checkbox" value="1"> 
					&nbsp;��Ʊר����:<input class="checkbox" id="FP_GZ" name="FP_GZ" title='��Ʊר����' type="checkbox" value="1"> 
					&nbsp;����/��������:<input class="checkbox" id="FR_GZ" name="FR_GZ" title='����/��������' type="checkbox" value="1">
				</td>
			</tr>
		</table>
		<br />
		<center>
			<%
				if (SIGN.equals("1")) {
			%>
			<div class="subImgs"
				onclick="window.location.href='<%=Page.getNextPage()[0]%>'">��һҳ</div>
			<%
				} else {
			%>
			<div class="subImgs"
				onclick="if(form1errorCheck()){document.form1.submit();}">��һҳ</div>
			<%
				}
			%>
		</center>
	</form>
	<%@include file="bottom.inc"%>
	<iframe height="0" width="100" name="editframe" src="" id="editframe"
		scrolling="no" border="1" align='center' frameborder="0"></iframe>
</body>
<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
</html>

<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());

	ValueDefault vf = new ValueDefault();
	vf.setFormName("form1");
	GA_ZJXX.setOPENO(OPENO);

	vf.setData(GA_ZJXX.getData());

	out.print(vf.ValueDefaultScript());
%>

