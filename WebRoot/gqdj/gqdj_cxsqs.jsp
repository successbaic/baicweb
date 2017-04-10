<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="GQDJ_JBXX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ"/>
<jsp:useBean id="GQDJ_CXXX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_CXXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<%	
	String OPENO =GQDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	GQDJ_JBXX.setOPENO(OPENO);
	GQDJ_JBXX.doSelect();
	GQDJ_CXXX.setOPENO(OPENO);
	GQDJ_CXXX.doSelect();
	
	String checkBox = "□";
    String selected = "√";
%>
<html><head><title>股权出质注销登记申请书</title>
<%out.print(pageshow.pagesetup_default()); %>
</head>
<body onload="pagesetup_default()" style="text-align: center">
<style>table{border-collapse: collapse;}
</style>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-before: always;}
tr{font-size: 12pt;}
.tr9{font-size: 9pt;}
.tdprint{text-align: left;text-indent: 2;}
</style>
<input type="button" value="打印申请书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉"清空)</font>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<caption align="center"><b>
	<span style="font-size: 16pt">股权出质注销登记申请书</b><br><br></caption>
   <tr>
    <td align="left" height="30">股权所在公司名称：</td>
    <td><%=GQDJ_JBXX.getENTNAME()%></td>
  </tr>
  <tr>
    <td align="left" height="30">股权所在公司注册号：</td>
    <td><%=GQDJ_JBXX.getREGNO() %></td>
  </tr>
  <tr>
    <td align="left" height="30">出质人姓名（名称）及证照号码：</td>
    <td><%=GQDJ_JBXX.getEXPMOR()%><BR><%=GQDJ_JBXX.getEXPMORBLICNO()%>   </td>
  </tr>
  <tr>
    <td align="left" height="30">质权人姓名（名称）及证照号码：</td>
    <td><%=GQDJ_JBXX.getIMPMOR()%><BR><%=GQDJ_JBXX.getIMPMORBLICNO()%>  </td>
  </tr>
  <tr>
    <td align="left" height="30">出质股权数额</td>
    <td><%=GQDJ_JBXX.getEXPSHARAM()%>万元/万股</td>
  </tr>
  <tr>
    <td>申<br />请 <br />人 <br />声 <br /> 明</td>
    <td>申请人依法申请股权出质撤销登记，因提交材料实质内容违反法律规定产生的经济纠纷和法律责任，由申请人负责。</td>
  </tr>
</table>

<table width="90%">
  <tr>
    <td align="left" height=46><b>&nbsp;&nbsp;&nbsp;&nbsp;附：质权合同被依法确认无效或者被撤销的法律文件 </b></td>
  </tr>
  <tr>
    <td align="left" height=46>&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",100)%>。</td>
  </tr>
  <tr>
    <td align="right" height=50><p>申请人签字（盖章） </p></td>
  </tr>
  <tr>
    <td align="right" height=46>&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp; 月 &nbsp;&nbsp;&nbsp;日</td>
  </tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="../public/gqdj_sqwtsqs.inc" %>
</body>
</html>