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
	String checkBox = "��";
	String selected= "��";
	String DQENTNAME=MCGL_JBXX.getENTNAME();
	
	ArrayList tzrList=QYDJ_CZXX_ZS.getList(" WHERE PRIPID='"+MCGL_JBXX.getPRIPID()+"'");
%>
<html><head><title>����Ͷ����ҵ���Ʊ��������</title>
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

<input type="button" value="��ӡ������" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="��   ��" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE->�ļ�->ҳ������"�н�"ҳüҳ��"���)</font>


<p></p>
<!--########### -->
<table border="1" width="100%" align="center" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">������ҵ����<br/>�����׼������ 
</b><br><br></caption>
<tr>
<td width="140px" rowspan="2" align="center">ԭ��ҵ<br/>����
</td>
<td width="120px" align="center" height=30>��ҵ����</td>
<td colspan="2"><%=QYDJ_JBXX_ZS.getENTNAME() %></td>
</tr>

<tr>
<td align="center" height=30 width="120px">��ҵס��</td>
<td colspan="2"><%=QYDJ_JBXX_ZS.getDOM() %></td>
</tr>
<tr>
<td align="center" height=30 width="120px">ע���ʱ�</td>
<td><%=QYDJ_JBXX_ZS.getREGCAP() %>��Ԫ</td>
<td align="center" width="120px">��ҵ����</td>
<td><%=icms.getSysDm("ENTTYPE", QYDJ_JBXX_ZS.getENTTYPE()) %></td>
</tr>
<tr>
<td height="180px" align="center" width="120px">��Ӫ��Χ</td>
<td colspan="3"><%=QYDJ_JBXX_ZS.getBUSSCOPE() %></td>
</tr>

<tr>
<td rowspan="2" align="center" width="120px">��������</td>
<td height=30 align="center" width="120px">��ҵ����</td>
<td colspan="2"><%=MCGL_JBXX.getENTNAME() %></td>
</tr>


<tr>
<td rowspan="2" align="center" width="120px">��ѡ����</td>
<td colspan="2"><%=MCGL_JBXX.getENTNAME1() %></td>
</tr>

</table>
<table border="1" width="100%" align="center" bordercolor="#000000" style="border-top-style:none;border-top-width:0px">
<tr>
<td height=30 style="border-top-style:none;border-top-width:0px" align="center">���ƻ�����</td>
<td style="border-top-style:none;border-top-width:0px" align="center">֤�պ���</td>
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
<td style="border-top-style:none;border-top-width:0px" align="center">��ҵ�Ǽǻ���<br/>�������
</td>
<td style="border-top-style:none;border-top-width:0px">
<br/>
<br/>
<br/>
<br/><br/>
<p align="right">
����ҵ�Ǽǻ���ӡ�£�
 &nbsp;&nbsp;&nbsp;&nbsp;
<br/>
 �� &nbsp;&nbsp; �� &nbsp;&nbsp; ��
 &nbsp;&nbsp;&nbsp;&nbsp;
</p>
</td>
</tr>
</table>
<br/>
<center>
ע��Ͷ����д���µģ�����ҳ���������Ӹ���ҵ�Ǽǻ���ӡ�¡�
</center>
<%
if(tzrList.size()>4){
%>
<br><p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" align="center" bordercolor="#000000" >
<tr>
<td  height=30 align="center">���ƻ�����</td>
<td  align="center">֤�պ���</td>
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