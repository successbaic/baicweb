
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.TwoDimensionCode" %>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="GTDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"/>
<jsp:useBean id="GTDJ_JYZXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="GTDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_ZXXX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��	
	String OPENO =GTDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	GTDJ_JBXX.setOPENO(OPENO);
	GTDJ_JBXX.doSelect();
	
	GTDJ_JYZXX.setOPENO(OPENO);
	GTDJ_JYZXX.doSelect();
	
	GTDJ_ZXXX.setOPENO(OPENO);
	GTDJ_ZXXX.doSelect();
	
	String checkBox = "��";
    String selected = "��";
    
    TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,GTDJ_JBXX.getTRANAME());
	}
%>
<html><head><title>���幤�̻�ע���Ǽ�������</title>
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
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE->�ļ�->ҳ������"�н�"ҳüҳ��"���)</font>

<table width="90%" align="center" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">���幤�̻�ע���Ǽ�������</b><br><br></caption>
<tr>
    <td colspan="3" align="right" style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">ͳһ������ô��룺<%=GTDJ_JBXX.getUNISCID() %></td>
</tr>	
<tr>
    <td colspan="3" align="right" style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">ע��ţ�<%=GTDJ_JBXX.getREGNO() %></td>
</tr>	
</table>
<table border="1" width="90%" align="center" bordercolor="#000000">
<tr>
	<td align="center" height=40 width="15%">��   ��</td>
	<td colspan="4"><%=GTDJ_JBXX.getTRANAME()%></td>
</tr>
<tr>
	<td align="center" rowspan=3>��Ӫ��</td>
	<td align="center" height=40 width="15%">����</td>
	<td><%=GTDJ_JYZXX.getNAME()%></td>
	<td align="center" width="15%">���֤����</td>
	<td><%=GTDJ_JYZXX.getCERNO()%></td>
</tr>
<tr>
    <td align="center" height=40>ס��</td>
    <td colspan=3><%=GTDJ_JYZXX.getDOM() %></td>
</tr>
<tr>
    <td align="center" height=40>��������</td>
    <td><%=GTDJ_JYZXX.getPOSTALCODE() %></td>
    <td align="center" height=40>��ϵ�绰</td>
    <td><%=GTDJ_JYZXX.getTEL() %></td>
</tr>
<tr>
    <td align="center" height=40>�����ʽ</td>
    <td colspan=4 align="center">���˾�Ӫ<%if("1".equals(GTDJ_JBXX.getCOMPFORM())){out.print(selected);}else{out.print(checkBox);}%>
    &nbsp;&nbsp;&nbsp;&nbsp;��ͥ��Ӫ<%if("2".equals(GTDJ_JBXX.getCOMPFORM())){out.print(selected);}else{out.print(checkBox);}%></td>
</tr>
<tr>
    <td align="center" height=100>ע��ԭ��</td>
	<td colspan="4"><%=icms.getSysDm("TRACANREA",GTDJ_ZXXX.getCANREGREA()) %></td>
</tr><tr>
    <td align="center" height=40>��˰֤���ĺ�</td>
    <td colspan="2"><%=GTDJ_ZXXX.getQSZMWH() %></td>
    <td align="center" height=40>��˰֤������ʱ��</td>
    <td colspan="2"><%=GTDJ_ZXXX.getQSZMKJTIME() %></td>
</tr>
<tr>
    <td align="center" height=40>��ע</td>
	<td colspan="4"><%=GTDJ_ZXXX.getREMARK() %></td>
</tr>
<tr>
   <td colspan="5"><p style="line-height: 25px">&nbsp;&nbsp;&nbsp;&nbsp;�������ա����幤�̻�����������ע���Ǽǣ��ύ�ļ�������ʵ��Ч��������ʵ�Գе����Ρ�</p><br>
   <p align="left"> &nbsp;&nbsp;&nbsp;&nbsp;��Ӫ��ǩ����</p><br>
   <p align="right">��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
	</td>
</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<p class="PageNext"></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>��д���幤�̻�ע���Ǽ���������֪</b></p></span>
<table border="0" width="100%" height="700" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td height="700" valign="top">
<ol >
	<li>
	<p style="line-height: 25px"><font face="����_GBK">���幤�̻�����ע���Ǽǵģ�Ӧ�����ա����幤�̻��������͹��ҹ����ܾ֡����幤�̻��Ǽǹ���취���йع涨���侭Ӫ�������ڵصǼǻ����ύ���پ�Ӫ��ǩ��ġ����幤�̻�ע���Ǽ������顷���ھ�Ӫ�ߵ����֤��ӡ����
	<br>ί�д����˰���ģ���Ӧ���ύ��Ӫ��ǩ��ġ�ί�д�����֤������ί�д��������֤��ӡ����</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��ͥ��Ӫ�ĸ��幤�̻�����ע���Ǽǵģ�Ӧ����ȫ��μӾ�Ӫ��ͥ��Ա�ڡ����幤�̻�ע���Ǽ������顷��Ӫ��ǩ����������ǩ��ȷ�ϡ�</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">���幤�̻�����ע���Ǽǵģ�Ӧ���ɻظ��幤�̻�Ӫҵִ�����������и�����</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">Ӧ��ʹ�øֱʡ�ë�ʻ�ǩ�ֱʹ�������д����ǩ��������ʹ��Բ��ʡ�</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��ѡ������� �� �д�̡�</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">�ύ���������������������Ӧ��ʹ��A4��ֽ��
	<br>���ϸ���δע���ύ��ӡ���ģ�Ӧ���ύԭ�����ύ��ӡ���ģ�Ӧ��ע������ԭ��һ�¡����ɸ��幤�̻���Ӫ�߻�������ί�еĴ�����ǩ�֡�</font></li>
</ol>
</td>
</tr>
</table>


<%--
<p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" cellspacing="0" bordercolor="#000000" cellpadding="0">
	<caption><p align="center"><b><font size="4">���幤�̻�ע���Ǽ���˱�</font></b></p>
	<p align='right' >ע��ţ�<%=SysSystem.toUnderlineStr(GTDJ_JBXX.getREGNO(),"center",30)%></p></caption>
	<tr>
     <td align="center" height="40" width="20%">��  ��</td>
     <td colspan=4><%=GTDJ_JBXX.getTRANAME() %></td>
  </tr> 
  <tr>
     <td align="center" height="40" width="20%">��Ӫ������</td>
     <td colspan=4><%=GTDJ_JBXX.getOPERNAME() %></td>
  </tr>
	<tr>
    <td align="center" height=260>��<br>��<br>��<br>��</td>
    <td align="center" colspan=4><br><br><br><br>������Աǩ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     ��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� </td>
  </tr>
  <tr>
    <td align="center" height=260>��<br>׼<br>��<br>��</td>
    <td align="center" colspan=4><br><br><br><br>��׼��Աǩ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     ��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� </td>
  </tr>
  <tr>
     <td align="center" height="40" colspan=2 width="30%">׼��ע���Ǽ�֪ͨ���ĺ�</td>
     <td colspan=3></td>
  </tr>
  <tr>
     <td align="center" height="40" colspan=2 width="30%">Ӫҵִ�����������ս����</td>
     <td colspan=3>������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������</td>
  </tr>
</table> --%>
<br><p class="PageNext"><br>
<!--########### -->
<%@ include file="public/GT_WTDL.inc" %>

</body></html>