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

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_ZXXX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();	
%>
<html><head><title>����Ͷ�ʺϻ���ҵ��֧����ע���Ǽ�������</title>
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

<table border="0" width="100%" style="border-width: 0" cellspacing="0" cellpadding="0" height="880">		
<tr>
<td height="120" align="center" style="line-height: 100px;">			
<p align="center"><span style="font-size: 24pt; font-family: ����" >����Ͷ�ʺϻ���ҵ��֧����<br>ע���Ǽ�������</td>
</tr>
<tr>
<td>
<table border="0" width="80%" bordercolor="#000000" style="border-collapse: collapse" align=center>
  <TR>
   <TD COLSPAN=4><br>
   <p style="line-height:40px;"><%=SysSystem.toUnderlineStr("","center",15)%>������������(��)�֣�<br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹��ϻ���ҵ���������л����񹲺͹��ϻ���ҵ�Ǽǹ���취�����������ҵ��������й����������ϻ���ҵ����취����
   ������Ͷ�ʺϻ���ҵ�Ǽǹ���涨�����йط��ɷ���͹��£��������֧����ע���Ǽǣ������׼��ͬʱ��ŵ�����ύ���ļ���֤����ʵ���Ϸ�����Ч����ӡ�ı���ԭ��һ�£�
   �������ύ����ļ��������ĺ���е��������Ρ�
   </p><br>
   </TD>
</TR>
</table></td></tr>
<tr>
<td height="308" align="center">
<table border="0" width="70%" height="234">
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">�ϻ���ҵ��֧��������</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">��֧����ע���</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getREGNO(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">ִ������ϻ��˻�ί�ɴ���ǩ��</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>			
    <tr>
		<td nowrap="nowrap" colspan=2><font style="font-size: 15pt">��  ��  ��  ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         ��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</font><br></td></tr>
</table><br></td></tr>
<tr><td align="center">
<font style="font-size: 16pt">�л����񹲺͹����ҹ������������ܾ���</font><p align="center">
<font face="Times New Roman">
<span style="font-size: 16pt; font-weight: 700">HTTP://WWW.SAIC.GOV.CN</span><br>
<span style="font-size: 16pt; font-weight: 700">HTTP://QYJ.SAIC.GOV.CN</span></font></td></tr></table>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>ָ�������ί�д�����֤��</b></p></span>
<%
 String CONSIGNER="",CONFROM="",CONTO=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 CONSIGNER =bTable.getCONSIGNER();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;��ָ��/ί��<%=SysSystem.toUnderlineStr(CONSIGNER,"left",30)%>������ҵ��֧����ע���Ǽ����ˡ�<br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ָ��/ί�е���Ч���ޣ���<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> ��<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %><br></p>
<p align="right">
&nbsp;&nbsp;&nbsp;&nbsp;ί���� ��<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<br></p>
<p align="right">
��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ע��ί����Ϊ��֧���������ˡ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<span style="font-size: 16pt"><p align="center">ָ�������ί�д�������Ϣ</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"></td>
    <td width="60%" rowspan="4" align="center">���������֤����ӡ��ճ����</td>
  </tr>
  <tr>
    <td width="20%" align="center">��  λ</td>
    <td align="center" height="45" width="20%"></td>
  </tr>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"></td>
  </tr>
  <tr>
    <td width="20%" align="center">��ϵ�绰</td>
    <td align="center" height="45" width="20%"></td>
  </tr>
</table>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>����Ͷ�ʺϻ���ҵ��֧����ע���Ǽ�<br>�����ύ���ļ�</b></p></span>
<table border="1" width="100%" height="200" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center"  >
		<p >���</td>
		<td >
		<p align="center" >�ļ���ӡ������</td>
	</tr>
	<tr>
		<td width="67" align="center"  >1</td>
		<td >������Ͷ�ʺϻ���ҵ��֧����ע���Ǽ������顷</td>
	</tr>
	<tr>
		<td width="67" align="center"  >2<font face="����">*</font></td>
		<td >������ҵ���������ľ�����</td>
	</tr>
	<tr>
		<td width="67" align="center"  >3</td>
		<td >Ӫҵִ����������</td>
	</tr>
	<tr>
		<td width="67" align="center"  >4</td>
		<td >��������ļ�</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p style="line-height: 30px"><font face="����_GBK"><b>�淶Ҫ��</b></font></p>
         <ol>
	       <li>
	         <p style="line-height: 25px"><font face="����_GBK">������Ӧ�ú�ɫ������ɫ�ֱʡ�ǩ�ֱ���д���ּ�Ӧ�����</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="����_GBK">�����ļ���������ӡ���⣬Ӧ�ύԭ����</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="����_GBK">�����ύ�ļ���Ϊ���ģ����ύ�������ģ����ӸǷ��뵥λ���¡�</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="����_GBK">��2��ָ���ݡ��л����񹲺͹��ϻ���ҵ��ҵ���������л����񹲺͹��ϻ���ҵ�Ǽǹ���취���Լ����л����񹲺͹������ҵ���߸������й����������ϻ���ҵ����취���Լ��ϻ���ҵЭ��涨�����ľ����飬������������������������Ӧ��һ�¡���֧��������������رա�����Ӫҵִ�յģ�Ӧ���ύ������������رա�����Ӫҵִ�յľ�����</font></li>
	      </ol>
	    </td>
	 </tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>����Ͷ�ʺϻ���ҵ��֧����ע���Ǽ�������</b></p></span>
<table align="center" border="1" width="90%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center" height=200>����<br>���</td>
    <td align="center"><br><br><br><br>������ǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     ��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� </td>
  </tr>
  <tr>
    <td width="20%" align="center" height=200>���<br>���</td>
    <td align="center"><br><br><br><br>��׼��ǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     ��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� </td>
  </tr>
   <tr>
    <td width="20%" align="center" height=180>��ע</td>
    <td><br><br><br><br></td>
  </tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<% 
	QYDJ_ZXXX.setOPENO(OPENO);
	QYDJ_ZXXX.doSelect();
 %>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">����Ͷ�ʺϻ���ҵ��֧����ע���Ǽ�������</b><br><br></caption>
<tr>
	<td align="center" height=40>��֧��������</td>
	<td colspan="6"><%=QYDJ_JBXX.getENTNAME()%></td>
</tr>
<tr>
	<td align="center" nowrap="nowrap" height=40>ע �� ��</td>	
	<td colspan="6"><%=QYDJ_JBXX.getREGNO()%></td>
</tr>
<tr>
	<td align="center" height=40>��Ӫ����</td>	
	<td colspan="6"><%=QYDJ_JBXX.getDOM()%></td>
</tr>
<tr>
    <td align="center" height="40" nowrap="nowrap">������</td>
	<td colspan="6"><%=QYDJ_JBXX.getLEREP()%></td>
</tr>
<tr>
    <td align="center" height="40">��Ӫ����</td>
	<td colspan="6">��<%=QYDJ_JBXX.getOPFROM() %>&nbsp;&nbsp;&nbsp;&nbsp;��<%=QYDJ_JBXX.getOPTO()%></td>
</tr>
<tr>
	<td align="center" height="100">ע��ԭ��</td>
	<td colspan="6"><%=icms.getSysDm("CANREA",QYDJ_ZXXX.getCANREA()) %></td>
</tr>
<tr>
	<td align="center" rowspan="2" nowrap="nowrap">֤�ս������</td>
	<td align="center" height="40" nowrap="nowrap" width="15%">Ӫҵִ������</td>
	<td align="center" height="40" nowrap="nowrap" width="10%">����</td>
    <td><%=QYDJ_ZXXX.getBLICREVORINUM()%></td>
    <td align="center" height="40" nowrap="nowrap" width="10%">���</td>
    <td colspan="2"><%=QYDJ_ZXXX.getBLICREVORINO()%></td>
</tr>
<tr>
    <td align="center" height="40">Ӫҵִ�ո���</td>
    <td align="center" height="40">����</td>
    <td><%=QYDJ_ZXXX.getBLICREVDUPCONUM()%></td>
    <td align="center" height="40">���</td>
    <td colspan="2"><%=QYDJ_ZXXX.getBLICREVDUPCONO()%></td>    
</tr>
<tr>
    <td align="center" height="120">��ע</td>
    <td colspan="6"><%=QYDJ_ZXXX.getREMARK()%></td>
</tr>
</table>
<br>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0">
<p>��</p>
<p>��</p>
<caption>
<b><font size="4">�鵵���</font></b>
</caption>
	<tr>
		<td height="40" align="center"  >�� �� ��</td>
		<td height="40" width="478" >��</td>
	</tr>
	<tr>
		<td height="40" align="center"  >�� �� ��</td>
		<td height="40" width="478" >��</td>
	</tr>
	<tr>
		<td height="40" align="center"  >�͵�����</td>
		<td height="40" width="478" >��</td>
	</tr>
	<tr>
		<td height="40" align="center"  >��&nbsp;&nbsp;&nbsp; ע</td>
		<td height="40" width="478" >��</td>
	</tr>
</table>
</html>