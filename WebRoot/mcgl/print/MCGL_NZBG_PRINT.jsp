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
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="QYDJ_CZXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS"/>
<%	
	
	//String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	
	QYDJ_JBXX_ZS.doSelectBySql("SELECT * FROM QYDJ_JBXX_ZS WHERE PRIPID='"+MCGL_JBXX.getPRIPID()+"'");
	
	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_SQWT.doSelect();
	String checkBox = "□";
	String selected= "√";
	String DQENTNAME=MCGL_JBXX.getENTNAME();
	
	ArrayList tzrList=QYDJ_CZXX_ZS.getList(" WHERE PRIPID='"+MCGL_JBXX.getPRIPID()+"'");
%>
<html><head><title>内资投资企业名称变更申请书</title>
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
	<span style="font-size: 16pt">内资企业名称<br/>变更核准申请书 
</b><br><br></caption>
<tr>
<td width="140px" rowspan="2" align="center">原企业<br/>名称
</td>
<td width="120px" align="center" height=30>企业名称</td>
<td colspan="2"><%=QYDJ_JBXX_ZS.getENTNAME() %></td>
</tr>

<tr>
<td align="center" height=30 width="120px">企业住所</td>
<td colspan="2"><%=QYDJ_JBXX_ZS.getDOM() %></td>
</tr>
<tr>
<td align="center" height=30 width="120px">注册资本</td>
<td><%=QYDJ_JBXX_ZS.getREGCAP() %>万元</td>
<td align="center" width="120px">企业类型</td>
<td><%=icms.getSysDm("ENTTYPE", QYDJ_JBXX_ZS.getENTTYPE()) %></td>
</tr>
<tr>
<td height="180px" align="center" width="120px">经营范围</td>
<td colspan="3"><%=QYDJ_JBXX_ZS.getBUSSCOPE() %></td>
</tr>

<tr>
<td rowspan="2" align="center" width="120px">拟变更名称</td>
<td height=30 align="center" width="120px">企业名称</td>
<td colspan="2"><%=MCGL_JBXX.getENTNAME() %></td>
</tr>


<tr>
<td rowspan="2" align="center" width="120px">备选名称</td>
<td colspan="2"><%=MCGL_JBXX.getENTNAME1() %></td>
</tr>

</table>
<table border="1" width="100%" align="center" bordercolor="#000000" style="border-top-style:none;border-top-width:0px">
<tr>
<td height=30 style="border-top-style:none;border-top-width:0px" align="center">名称或姓名</td>
<td style="border-top-style:none;border-top-width:0px" align="center">证照号码</td>
</tr>
<%
int tzrNum=tzrList.size();
if(tzrNum>4){
	tzrNum=4;
}
for(int i=0;i<tzrNum;i++){
	com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS tzrxx=(com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS)tzrList.get(i);
%>
<tr>
<td height=30 align="center"><%=tzrxx.getINV() %></td>
<td align="center"><%=tzrxx.getCERNO().equals("")?tzrxx.getBLICNO():tzrxx.getCERNO() %></td>
</tr>
<%
}
for(int i=0;i<(4-tzrNum);i++){
%>
<tr>
<td height=30></td>
<td></td>
<%	
}
%>
</table>

<table border="1" width="100%" align="center" style="border-top-style:none;border-top-width:0px" bordercolor="#000000">
<tr>
<td style="border-top-style:none;border-top-width:0px" align="center">企业登记机关<br/>初审意见
</td>
<td style="border-top-style:none;border-top-width:0px">
<br/>
<br/>
<br/>
<br/><br/>
<p align="right">
（企业登记机关印章）
 &nbsp;&nbsp;&nbsp;&nbsp;
<br/>
 年 &nbsp;&nbsp; 月 &nbsp;&nbsp; 日
 &nbsp;&nbsp;&nbsp;&nbsp;
</p>
</td>
</tr>
</table>
<br/>
<center>
注：投资人写不下的，可另备页面载明并加盖企业登记机关印章。
</center>
<%
if(tzrList.size()>4){
%>
<br><p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" align="center" bordercolor="#000000" >
<tr>
<td  height=30 align="center">名称或姓名</td>
<td  align="center">证照号码</td>
</tr>
<%
for(int i=4;i<tzrList.size();i++){
	com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS tzrxx=(com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS)tzrList.get(i);
%>
	<tr>
	<td height=30 align="center"><%=tzrxx.getINV() %></td>	
	<td align="center"><%=tzrxx.getCERNO().equals("")?tzrxx.getBLICNO():tzrxx.getCERNO() %></td>
	</tr>
<%
}
%>
</table>
<%	
}
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="WZ_SQWT.inc"%>
</body>
</html>