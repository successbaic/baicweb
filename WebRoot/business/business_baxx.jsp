<%@page import="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"%>
<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_JBXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<html>
<head>
<title>亮照备案基本信息</title>
</head>

<body>
<%@include file="/top.inc"%>
<%
String pageheader=Page.pageheader(request.getRequestURI());

out.println(pageheader);
String SIGN = Page.getSIGN();	//-1数据未保存,1已开业
String OPENO =Page.getOPENO();
String OPETYPE =Page.getOPETYPE();
String pripid=Page.getPRIPID();
QYDJ_JBXX_SQ.doSelectBySql("SELECT * FROM QYDJ_JBXX_SQ WHERE PRIPID='"+pripid+"'");
QYDJ_RYXX_SQ.doSelectBySql("SELECT * FROM QYDJ_RYXX_SQ WHERE PRIPID='"+pripid+"' AND LEREPSIGN='1'");
String entname=QYDJ_JBXX_SQ.getENTNAME();
String regno=QYDJ_JBXX_SQ.getREGNO();
String uniscid=QYDJ_JBXX_SQ.getUNISCID();
String tel=QYDJ_RYXX_SQ.getTEL();
String llr=QYDJ_RYXX_SQ.getNAME();
%>
<br/>
<form name="form1" action="action/business_baxx_action.jsp" method="post" target="editframe">
<input type="hidden" name="MORTGAGOTYPE">
<input type="hidden" name="STATUS">
<input type="hidden" name="APPDATE" value="<%=webuser.getCurrentDate()%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
<input type="hidden" name="OPETYPE" value="20">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<table border="1" width="100%" >
<caption>>亮照备案基本信息</caption>
<tr>
	<td class="lc1"  >企业名称</td>
	<td class="lc2" colspan="6"   >
	<input id="entname" type="text" name="MORTGAGO" size="30"  title="企业名称" ></td>
</tr> 
<tr> 
	<td class="lc1" >统一社会信用代码</td>
	<td class="lc2"  colspan="1" >
	<input id="uniscid" type="text" name="UNISCID" size="30"  title="统一社会信用代码" ></td>
	 
	<td class="lc1" >注册号</td>
	<td class="lc2"  colspan="4" >
	<input id="regno" type="text" name="REGORUN" size="30"  title="注册号" ></td>
</tr>
<tr>      
	<td class="lc1"  >联络人</td>
	<td class="lc2" colspan="1"   >
	<input id="llr" type="text" name="MORTGAGO" size="30"  title="企业名称" ></td>
	 
	<td class="lc1" >联络方式</td>
	<td class="lc2"  colspan="4" >
	<input id="tel" type="text" name="REGORUN" size="30"  title="统一社会信用代码/注册号" ></td>
</tr>
<tr>      
	<td class="lc1"  >网店名称</td>
	<td class="lc2" colspan="1"   >
	<input id="storeOl" type="text" name="STOREOL" size="30"  title="网店名称" ></td>
	 
	<td class="lc1" >网店链接域名</td>
	<td class="lc2"  colspan="4" >
	<input id="storeOl_url" type="text" name="STOREOL_URL" size="30"  title="网店链接域名" ></td>
</tr>
</table>
<center>
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
</center>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<%@include file="/bottom.inc"%>
</body>
<script language='javascript'>
    var entname="<%=entname%>";
	var regno="<%=regno%>";
    var uniscid="<%=uniscid%>";
	var tel="<%=tel%>";
    var llr="<%=llr%>";
	if(entname!=""){
		document.getElementById("entname").value=entname;
		document.getElementById("entname").disabled="disabled";
	}
	if(uniscid!=""){
		document.getElementById("uniscid").value=uniscid;
		document.getElementById("uniscid").disabled="disabled";
	}
	if(regno!=""){
		document.getElementById("regno").value=regno;
		document.getElementById("regno").disabled="disabled";
	}
	
	if(tel!=""){
		document.getElementById("tel").value=cerno;
		document.getElementById("tel").disabled="disabled";
	}
	if(llr!=""){
		document.getElementById("llr").value=name;
		document.getElementById("llr").disabled="disabled";
	}
</script>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	//ec.setUserFunction("checkMORTGAGOTYPE()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	System.out.println("OPENO="+OPENO);
	if ("".equals(OPENO)||OPENO==null||"null".equals(OPENO)){

	}else{
	   DCDY_JBXX.setOPENO(OPENO);
	   vf.setData(DCDY_JBXX.getData());
	}	
	//vf.setUserFunction("showDylx()");
	out.print(vf.ValueDefaultScript());
%>