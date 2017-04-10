<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@page import="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="MCGL_TZRXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS"/>
<%	
	
	//String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	
	GTDJ_JBXX_ZS.doSelectBySql("SELECT * FROM GTDJ_JBXX_ZS WHERE PRIPID='"+MCGL_JBXX.getPRIPID()+"'");
	
	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_SQWT.doSelect();
	String checkBox = "□";
	String selected= "√";
	String DQENTNAME=MCGL_JBXX.getENTNAME();
	
%>
<html><head><title>个体户名称变更申请书</title>
</head>
<body style="text-align: center">
<style>table{border-collapse: collapse;}
</style>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-before: always;}
tr{font-size: 12pt;}
.tr9{font-size: 9pt;}
.tdprint{text-align: left;text-indent: 2;}
</style>

<input type="button" value="打印报告书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉页脚"清空)</font>


<p></p>
<!--########### -->
<table border="1" width="100%" align="center" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">个体户名称<br/>变更核准申请书 
</b><br><br></caption>
<tr>
<td width="140px" align="center">原个体户<br/>名称
</td>
<td width="120px" align="center" height=30>个体户名称</td>
<td colspan="3"><%=GTDJ_JBXX_ZS.getTRANAME() %></td>
</tr>

<tr>
<td align="center" height=30 width="120px">住所</td>
<td colspan="4"><%=GTDJ_JBXX_ZS.getOPLOC()%></td>
</tr>
<tr>
<td height=180 align="center" width="120px">经营范围</td>
<td colspan="4"><%=GTDJ_JBXX_ZS.getBUSSCOANDFORM() %></td>
</tr>

<tr>
<td height=30 align="center" width="120px">拟变更名称</td>
<td colspan="4"><%=MCGL_JBXX.getENTNAME() %></td>
</tr>


<tr>
<td  height=30 align="center" width="120px">备选名称</td>
<td colspan="4"><%=MCGL_JBXX.getENTNAME1() %></td>
</tr>
</table>

<table border="1" width="100%" align="center" style="border-top-style:none;border-top-width:0px" bordercolor="#000000">
<tr>
<td style="border-top-style:none;border-top-width:0px" align="center">登记机关<br/>初审意见
</td>
<td style="border-top-style:none;border-top-width:0px">
<br/>
<br/>
<br/>
<br/><br/>
<p align="right">
（登记机关印章）
 &nbsp;&nbsp;&nbsp;&nbsp;
<br/>
 年 &nbsp;&nbsp; 月 &nbsp;&nbsp; 日
 &nbsp;&nbsp;&nbsp;&nbsp;
</p>
</td>
</tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="WZ_SQWT.inc"%>
</body>
</html>