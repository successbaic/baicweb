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
	
	String checkBox = "��";
    String selected = "��";
%>
<html><head><title>��Ȩ����ע���Ǽ�������</title>
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
<input type="button" value="��ӡ������" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="��   ��" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE->�ļ�->ҳ������"�н�"ҳü"���)</font>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<caption align="center"><b>
	<span style="font-size: 16pt">��Ȩ����ע���Ǽ�������</b><br><br></caption>
   <tr>
    <td align="left" height="30">��Ȩ���ڹ�˾���ƣ�</td>
    <td><%=GQDJ_JBXX.getENTNAME()%></td>
  </tr>
  <tr>
    <td align="left" height="30">��Ȩ���ڹ�˾ע��ţ�</td>
    <td><%=GQDJ_JBXX.getREGNO() %></td>
  </tr>
  <tr>
    <td align="left" height="30">���������������ƣ���֤�պ��룺</td>
    <td><%=GQDJ_JBXX.getEXPMOR()%><BR><%=GQDJ_JBXX.getEXPMORBLICNO()%>   </td>
  </tr>
  <tr>
    <td align="left" height="30">��Ȩ�����������ƣ���֤�պ��룺</td>
    <td><%=GQDJ_JBXX.getIMPMOR()%><BR><%=GQDJ_JBXX.getIMPMORBLICNO()%>  </td>
  </tr>
  <tr>
    <td align="left" height="30">���ʹ�Ȩ����</td>
    <td><%=GQDJ_JBXX.getEXPSHARAM()%>��Ԫ/���</td>
  </tr>
  <tr>
    <td>��<br />�� <br />�� <br />�� <br /> ��</td>
    <td>���������������Ȩ���ʳ����Ǽǣ����ύ����ʵ������Υ�����ɹ涨�����ľ��þ��׺ͷ������Σ��������˸���</td>
  </tr>
</table>

<table width="90%">
  <tr>
    <td align="left" height=46><b>&nbsp;&nbsp;&nbsp;&nbsp;������Ȩ��ͬ������ȷ����Ч���߱������ķ����ļ� </b></td>
  </tr>
  <tr>
    <td align="left" height=46>&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",100)%>��</td>
  </tr>
  <tr>
    <td align="right" height=50><p>������ǩ�֣����£� </p></td>
  </tr>
  <tr>
    <td align="right" height=46>&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp; �� &nbsp;&nbsp;&nbsp;��</td>
  </tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="../public/gqdj_sqwtsqs.inc" %>
</body>
</html>