<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id='QYDJ_JBXX_SQ' scope='page' class='com.macrosoft.icms.qydj.QYDJ_JBXX_SQ'/>
<jsp:useBean id="QYDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_ZXXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head>
<title>注销信息</title>
</head>
<body>
<%@include file="top.inc"%>
<%	
	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();
 	String sENTTYPE = Page.getENTTYPE();
 	String SIGN =Page.getSIGN();
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	QYDJ_JBXX_ZS.setPRIPID(PRIPID);
	QYDJ_JBXX_ZS.doSelect();
	
	String t="法定代表人";
	if(sENTTYPE.equalsIgnoreCase("FGS")||sENTTYPE.equalsIgnoreCase("NZYY")||sENTTYPE.equalsIgnoreCase("WZFZ")
	||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("HZSFZ")||sENTTYPE.equalsIgnoreCase("HHFZ")){
	   t="负责人";
	}
	String SPANAME=Page.getXGBH();
	if(SPANAME.equals("")){
		QYDJ_JBXX_SQ.setOPENO(OPENO);
		QYDJ_JBXX_SQ.doSelect();
		SPANAME=QYDJ_JBXX_SQ.getSPANAME();
	}
%>
<form name="form1" method="POST" action="web/qydj_zxxx_action.jsp" target="editframe">
<input type="hidden" name = "PRIPID" value=<%=PRIPID%>>
<input type="hidden" name = "ENTTYPE" value=<%=sENTTYPE%>>
<input type="hidden" name = "OPENO" value="<%=OPENO%>">
<input type="hidden" name = "OPETYPE" value="50">
<input type="hidden" name = "SIGN" value="<%=SIGN%>">
<input type="hidden" name="REGORG" value="<%=QYDJ_JBXX_ZS.getREGORG() %>">
<input type="hidden" name="SPANAME" value="<%=SPANAME%>">
<input type="hidden" name="STATUS" value="<%=QYDJ_JBXX_SQ.getSTATUS()%>">

<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
   <td class="yxsm" colspan="4" align="center">&nbsp;&nbsp;企业信息</td> 
</tr>
<tr> 
   <td class="lc1" nowrap="nowrap" align="center">注册号/统一<br/>社会信用代码</td>
   <td class="lc2">
      <%if(QYDJ_JBXX_ZS.getUNISCID().equals("")){out.println(QYDJ_JBXX_ZS.getREGNO());}else{out.println(QYDJ_JBXX_ZS.getUNISCID());}%>
   </td>
   <td class="lc1" nowrap="nowrap" align="center">企业名称</td>
   <td class="lc2">
     <%=QYDJ_JBXX_ZS.getENTNAME() %>
   </td>
</tr>
</table>
<br/>
<%
String sTYPE="1";
if(sENTTYPE.equals("GS")){
%>
  <%@ include file="public/gs_zxxx.inc" %>
<%}else if(sENTTYPE.equals("FGS")){ 
%>	
  <%@ include file="public/fgs_zxxx.inc" %>
<%} else if(sENTTYPE.equals("NZFR")){
%>
  <%@ include file="public/nzfr_zxxx.inc" %>
<%}else if(sENTTYPE.equals("NZYY")){
%>
  <%@ include file="public/nzyy_zxxx.inc" %>
<%}else if(sENTTYPE.equals("HHQY")){ 
%>
  <%@ include file="public/hhqy_zxxx.inc" %>
<%}else if(sENTTYPE.equals("HHFZ")){ 
%>
  <%@ include file="public/hhfz_zxxx.inc" %>
<%}else if(sENTTYPE.equals("GRDZ")){ 
%>
  <%@ include file="public/grdz_zxxx.inc" %>
<%}else if(sENTTYPE.equals("GRDZFZ")){
%>
  <%@ include file="public/grdzfz_zxxx.inc" %>
<%}else if(sENTTYPE.equals("WZGS")||sENTTYPE.equals("WZQY")){
%>
  <%@ include file="public/wzgs_zxxx.inc" %>
<%}else if(sENTTYPE.equals("WZFR")){
%>
  <%@ include file="public/wzfr_zxxx.inc" %>
<%}else if(sENTTYPE.equals("WZFZ")){
 %>
  <%@ include file="public/wzfz_zxxx.inc" %>
<%}else if(sENTTYPE.equals("WGDB")){
 %>
  <%@ include file="public/wgdb_zxxx.inc" %>
<%}else if(sENTTYPE.equals("WGJY")){ 
%>
  <%@ include file="public/wgjy_zxxx.inc" %>
<%}else if(sENTTYPE.equals("WZHH")){
%>
  <%@ include file="public/wzhh_zxxx.inc" %>
<%}else if(sENTTYPE.equals("WZHHFZ")){
%>
  <%@ include file="public/wzhhfz_zxxx.inc" %>
<%}else if(sENTTYPE.equals("HZS")){
sTYPE="3";
%>
  <%@ include file="public/hzs_zxxx.inc" %>
<%}else if(sENTTYPE.equals("HZSFZ")){
sTYPE="3";
%>
  <%@ include file="public/hzsfz_zxxx.inc" %>
<%} %>
<br>
<CENTER>
<div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
</div>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">下一页</div>
<%
}
%>
</CENTER>

<input type="hidden" name="CDDL" value="<%=sTYPE%>">
</form>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="bottom.inc"%>
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
	QYDJ_ZXXX.setOPENO(OPENO);
	vf.setData(QYDJ_ZXXX.getData());
	out.print(vf.ValueDefaultScript());
%>