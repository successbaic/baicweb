<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="HWGG_JBXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_JBXX_SQ"/>
<jsp:useBean id="HWGG_FBZXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_FBZXX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��	
String OPENO = request.getParameter("OPENO");
String OPETYPE = request.getParameter("OPETYPE");
HWGG_JBXX.setOPENO(OPENO);
HWGG_JBXX.doSelect();
HWGG_FBZXX.setOPENO(OPENO);
HWGG_FBZXX.doSelect();
	String checkBox = "��";
    String selected = "��";
%>
<html><head><title>������Ǽ������</title>
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
<p  align="right" >
<input type="button" value="��ӡ������" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="��   ��" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE->�ļ�->ҳ������"�н�"ҳüҳ��"���)</font>
</p>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt"><center>������Ǽ������</center></b><br><br></caption>
��ţ�<%=HWGG_JBXX.getADREGCNO() %>
�������ڣ�<%=HWGG_JBXX.getAPPDATE() %>
<tr>
	<td align='center' height=44 width="10px" rowspan='5'>������λ���</td>
	<td align='center' width='15%'>����</td>
	<td colspan='4'><%=HWGG_FBZXX.getADISSENT() %></td>
</tr>

<tr>
	<td align='center' width='15%'>��ַ</td>
	<td colspan='4'><%=HWGG_FBZXX.getADDR() %></td>
</tr>

<tr>
	<td align='center' width='15%'>����</td>
	<td colspan='2'><%=icms.getSysDm("ENTTYPE",HWGG_FBZXX.getADISSENTTYPE())%>		
	</td>
	<td align='center' width='15%'>�ʱ�</td>
	<td><%=HWGG_FBZXX.getPOSTALCODE() %></td>
</tr>

<tr>
	<td align='center' width='15%'>����������(������)</td>
	<td colspan='2'><%=HWGG_FBZXX.getLEREP() %></td>
	<td align='center' width='15%'>Ӫҵִ�ձ��</td>
	<td><%=HWGG_FBZXX.getBLICNO() %></td>
</tr>

<tr>
	<td align='center' width='15%'>��ϵ��</td>
	<td colspan='2'><%=HWGG_FBZXX.getLINKMAN()%></td>
	<td align='center' width='15%'>��ϵ�绰</td>
	<td><%=HWGG_FBZXX.getTEL() %></td>
</tr>

<tr>
	<td align='center' height=44 width="10px" rowspan='5'>����Ǽ�����</td>
	<td align='center' width='15%'>��淢���ص㼰����λ��</td>
	<td colspan='4'><%=HWGG_JBXX.getADISSSPOT() %></td>
</tr>

<tr>
	<td align='center' width='15%'>��淢������</td>
	<td colspan='4'><%=HWGG_JBXX.getADISSFROM() %>��<%=HWGG_JBXX.getADISSTO() %></td>
</tr>

<tr>
	<td align='center' width='15%'>�����ʽ</td>
	<td colspan='4'>
	<%String adForm  =  HWGG_JBXX.getADFORM();
	String lx="";
	if("01".equals(adForm)){
		lx="չʾ��";
	}
	if("02".equals(adForm)){
		lx="������ʾװ��";
	}
	if("03".equals(adForm)){
		lx="����";
	}
	if("04".equals(adForm)){
		lx="�޺��";
	}
	if("05".equals(adForm)){
		lx="��ͨ����";
	}
	if("06".equals(adForm)){
		lx="ˮ��Ư����";
	}
	if("07".equals(adForm)){
		lx="��������";
	}
	if("08".equals(adForm)){
		lx="������";
	}
	if("09".equals(adForm)){
		lx="ģ��";
	}
	if("10".equals(adForm)){
		lx="ǽ����";
	}
	if("11".equals(adForm)){
		lx="����";
	}
	if("99".equals(adForm)){
		lx="����";
	}
	%>
	<%=lx %>
	</td>
</tr>

<tr>
	<td align='center' width='15%'>������������</td>
	<td colspan='4'><%=HWGG_JBXX.getADSPF() %></td>
</tr>

<tr>
	<td align='center' width='15%'>�������</td>
	<td colspan='4'><%=HWGG_JBXX.getADNAME() %></td>
</tr>
<tr>
<td align='center' height=84 width="10px">�������Ŀ¼</td>
<td colspan='5'>
<%=HWGG_JBXX.getADSTUFF() %>
</td>
</tr>
<tr>
<td colspan='6'>
<p valgn='top' align='left'>����������(������)ǩ��:
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
��λ����:&nbsp&nbsp&nbsp&nbsp&nbsp
</p>
<br><br><br>
<p valgn='bottom' align='right'>��&nbsp&nbsp&nbsp&nbsp��&nbsp&nbsp&nbsp&nbsp��</p>
</td>
</tr>
</table>

<table align="center" border="0" width="90%" >
<tr>
<td>
<p align=left style="font-size:10px">
<font size='2'>
<br>ע��1��������λ����С����͡�һ��Ӧ��ʵ�������д������ҵ��������ҵ��������ҵ��������ҵ��˽Ӫ��ҵ�����幤�̻�������Ͷ����ҵ����Ӫ��ҵ�ȡ�������λΪ����ҵ��λʱ����Ӫҵִ�ձ�š�һ��Ӧ��д����Ӫҵִ�վ���ͬ�ȷ���Ч���ľ�Ӫ�ʸ�֤���ļ������Ƽ���š�
<br>2������Ǽ������С�������ơ�һ��Ӧ��ʵ�������дXX��Ʒ����XX������ȡ�

</font>
</p>
</td>
</tr>
</table>
</body></html>