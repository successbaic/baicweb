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
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
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
<html><head><title>����Ͷ�ʺϻ���ҵ��֧���������Ǽ�������</title>
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
<p align="center"><span style="font-size: 24pt; font-family: ����" >����Ͷ�ʺϻ���ҵ��֧����<br>�����Ǽ�������</td>
</tr>
<tr>
<td>
<table border="0" width="80%" bordercolor="#000000" style="border-collapse: collapse" align=center>
  <TR>
   <TD COLSPAN=4><br>
   <p style="line-height:40px;"><%=SysSystem.toUnderlineStr("","center",15)%>������������(��)�֣�<br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹��ϻ���ҵ���������л����񹲺͹��ϻ���ҵ�Ǽǹ���취�����������ҵ��������й����������ϻ���ҵ����취���͡�����Ͷ�ʺϻ���ҵ�Ǽǹ���涨�����йط��ɷ���͹��£��������֧���������Ǽǣ������׼��
   ͬʱ��ŵ�����ύ���ļ���֤����ʵ���Ϸ�����Ч����ӡ�ı���ԭ��һ�£��������ύ����ļ��������ĺ���е��������Ρ�
   </p>
   </TD>
</TR>
</table></td></tr>
<tr>
<td height="338" align="center">
<table border="0" width="80%" height="234">
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">��������֧��������</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">������ҵ����</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getSUPENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">ִ������ϻ��˻�ί�ɴ���ǩ��</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>			
	<tr>
		<td width="200"><font style="font-size: 15pt">��   ��   ��   ��</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>
</table></td></tr>
<tr><td align="center">
<font style="font-size: 16pt">�л����񹲺͹����ҹ������������ܾ���</font><p align="center">
<font face="Times New Roman">
<span style="font-size: 16pt; font-weight: 700">HTTP://WWW.SAIC.GOV.CN</span><br>
<span style="font-size: 16pt; font-weight: 700">HTTP://QYJ.SAIC.GOV.CN</span></font></td></tr></table>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>ָ�������ί�д����˵�֤��</b></p></span>
<%
 String CONSIGNER="",CONFROM="",CONTO="",TEL1="",MOBTEL=""; 
 String llrname="",llrbm="",llrtel="",llrmobtel="",llremail="",llraddr="",llrpos=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 CONSIGNER =bTable.getCONSIGNER();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 TEL1=bTable.getTEL();
 MOBTEL=bTable.getMOBTEL();
 }
 ArrayList wzllr=QYDJ_WZLLR.getList(" where OPENO='"+OPENO+"'");
 if(wzllr.size()>0){
 com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ wzllrTable = (com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ)wzllr.get(0);
 llrname=wzllrTable.getNAME();
 llrbm=wzllrTable.getDEPARTMENT();
 llrtel=wzllrTable.getTEL();
 llrmobtel=wzllrTable.getMOBTEL();
 llremail=wzllrTable.getEMAIL();
 llraddr=wzllrTable.getADDR();
 llrpos=wzllrTable.getPOSTALCODE();
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;��ָ��/ί��<%=SysSystem.toUnderlineStr(CONSIGNER,"left",30)%>������ҵ��֧���������Ǽ����ˡ�<br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ָ��/ί�е���Ч���ޣ���<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> ��<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %><br></p>
<p align="right">
&nbsp;&nbsp;&nbsp;&nbsp;ί���� ��<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<br></p>
<p align="right">
��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ע��ί����ִָ������ϻ��˻�ί�ɴ���<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<span style="font-size: 16pt"><p align="center">ָ�������ί�д�������Ϣ</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"><%=CONSIGNER %></td>
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
    <td align="center" height="45" width="20%"><%=(TEL1.equals("")?MOBTEL:TEL1)%></td>
  </tr>
</table>
<br>
<span style="font-size: 16pt"><p align="center">���̵Ǽ�����Ա��Ϣ</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"><%=llrname %></td>
    <td width="60%" rowspan="7" align="center">���֤��ӡ��ճ����</td>
  </tr>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"><%=llrbm %></td>
  </tr>
  <tr>
    <td width="20%" align="center" rowspan="2">��ϵ�绰</td>
    <td align="left" height="45" width="20%">�̶�:<%=llrtel %></td>
  </tr>
  <tr>
    <td align="left" height="45" width="20%">�ƶ�:<%=llrmobtel %></td>
  </tr>
  <tr>
    <td width="20%" align="center">��������</td>
    <td align="center" height="45" width="20%"><%=llremail %></td>
  </tr>
  <tr>
    <td width="20%" align="center">��ϵ��ַ</td>
    <td align="center" height="45" width="20%"><%=llraddr %></td>
  </tr>
  <tr>
    <td width="20%" align="center">��������</td>
    <td align="center" height="45" width="20%"><%=llrpos %></td>
  </tr>
</table>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>����Ͷ�ʺϻ���ҵ��֧���������Ǽ������ύ���ļ�</b></p></span>
<table border="1" width="100%" height="350" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center"  >
		<p >���</td>
		<td >
		<p align="center" >�ļ�����</td>
	</tr>
	<tr>
		<td width="67" align="center"  >1</td>
		<td >������Ͷ�ʺϻ���ҵ��֧���������Ǽ������顷</td>
	</tr>
	<tr>
		<td width="67" align="center"  >2<font face="����">*</font></td>
		<td >ȫ��ϻ���ǩ���������֧�����ľ�����</td>
	</tr>
	<tr>
		<td width="67" align="center"  >3<font face="����">*</font></td>
		<td >ȫ��ϻ���ǩ���ί��ִ�з�֧�����������˵�ί���鼰�����֤����ӡ��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >4<font face="����" >*</font></td>
		<td >��Ӫ����֤��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >5<font face="����">*</font></td>
		<td >�ӸǺϻ���ҵӡ�µĺϻ���ҵӪҵִ�ո�ӡ��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >6<font face="����">*</font></td>
		<td >ǰ�������ļ���֤��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >7<font face="����">*</font></td>
		<td >�����й��ļ�</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p style="line-height: 30px"><font face="����_GBK"><b>�淶Ҫ��</b></font></p>
         <ol>
	       <li>
	         <p style="line-height: 25px"><font face="����_GBK">��������Ӧ�ú�ɫ������ɫ�ֱʡ�ǩ�ֱ���д���ּ�Ӧ�����</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="����_GBK">�����ļ���������ӡ���⣬Ӧ�ύԭ����</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="����_GBK">�����ļ�����������д�����ύ�ӸǷ��뵥λӡ�µ���Ӧ�����뱾��</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="����_GBK">��2��ָ���ݡ��л����񹲺͹��ϻ���ҵ��ҵ���������л����񹲺͹��ϻ���ҵ�Ǽǹ���취���Լ����л����񹲺͹������ҵ���߸������й����������ϻ���ҵ����취���Լ��ϻ���ҵЭ��涨�����ľ����飬������������������������Ӧ��һ�¡�</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="����_GBK">��4��ָ���з����ύ��Ȩ֤��ӡ�������޷����ύһ����������Э��ԭ�������ⷽ�Ĳ�Ȩ֤��ӡ�������ϲ����ṩ��Ȩ֤��ӡ���ģ��ύ�ܹ�֤����Ȩ�������������ݲ�Ȩʹ��֤����ӡ����</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="����_GBK">��6��ָ�й�ǰ����ɵ���׼�ļ��������֤�鸴ӡ�������֤���������ھ�Ӫ��Χ���з��ɡ���������͹���Ժ�涨�����ڵǼ�ǰ������׼����Ŀ������Ͷ�ʺϻ���ҵ��</font></li>
	      </ol>
	    </td>
	 </tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">����Ͷ�ʺϻ���ҵ��֧�����Ǽ�����</b><br><br></caption>
<tr>   
	<td align='center' height=40 nowrap="nowrap" width="15%">��֧��������</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getENTNAME()%></td>   

    <td align='center' height=40 nowrap="nowrap" width="15%">��ϵ�绰</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getTEL()%></td>       
</tr>
<tr>	
	<td align='center' height=40 nowrap="nowrap" width="15%">��Ӫ����</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getDOM()%></td>
 	
 	<td align='center' height=40 width="15%">��������</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getPOSTALCODE()%></td> 	
</tr>
<tr>	
	<td align='center' height=40 nowrap="nowrap" width="15%">������</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getLEREP()%></td>
 	
 	<td align='center' height=40 width="15%">��ҵ����</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getEMPNUM()%></td> 	
</tr>
<tr>
    <td align='center' height=40 nowrap="nowrap">��Ӫ����</td>
    <%-- <td colspan=7>��<%=QYDJ_JBXX.getOPFROM()%>��<%=QYDJ_JBXX.getOPTO()%></td>--%>
    <td colspan=7>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
</tr>
<tr>
    <td rowspan=3 align='center'>������ҵ</td>
    <td align='center' height=40>����</td> 
    <td colspan=6><%=QYDJ_JBXX.getSUPENTNAME() %></td>
</tr>
<tr>
    <td align='center' height=40>�Ǽǻ���</td>
    <td colspan=6><%=icms.getSysDm("REGORG",QYDJ_JBXX.getSUPREGORG()) %></td>
</tr>
<tr>
    <td align='center' height=40>ע���</td>
    <td colspan=2><%=QYDJ_JBXX.getSUPREGNO() %></td>
    <td align='center'>��������</td>
    <td colspan=3><%=QYDJ_JBXX.getSUPEMAIL() %></td>
</tr>
<tr>
	<td height="100" align="center">��<br>Ӫ<br>��<br>Χ</td>
	<td colspan="7" height="100"><%=QYDJ_JBXX.getBUSSCOPE()%></td>
</tr>
<tr> 
	<td align='center' nowrap="nowrap" height=80>��ɾ�Ӫ��Ŀ</td>   
	<td colspan="7"><%=QYDJ_JBXX.getABUITEMCO()%></td>	
</tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZHHFZ_FZR.inc" %>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>����Ͷ�ʺϻ���ҵ��֧���������Ǽ�������</b></p></span>
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
<p class="PageNext"><br></p>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0">
<br>
	<caption><p><b><font size="4">����Ͷ�ʺϻ���ҵ��֧�������մ浥</font></b></p></caption>
	<tr>
	    <td height="40" align="center" width="20%">��֧��������</td>
		<td align="center" colspan="5">��</td>
	</tr>
	<tr>
		<td height="40" align="center" width="20%">ע���</td>
		<td align="center"  colspan="2">��</td>
		<td align="center"  width="20%">��׼����</td>
		<td align="center"  colspan="2">��</td>
	</tr>
	<tr>
		<td   height="40" align="center" >Ӫҵִ�ձ��</td>
		<td  colspan="5" height="40">
		<p align="left">������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		����1��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		����2��</td>
	</tr>
	<tr>
		<td   height="40" align="center" >�ɷ�����</td>
		<td width="27%" colspan="2" height="40" align="center" >��</td>
		<td height="40" align="center" >�ɷ��վݺ�</td>
		<td colspan="2" height="40" align="center">��</td>
	</tr>
	<tr>
		<td   rowspan="4" height="40" align="center" >
		��<br>
		��<br>
		��</td>
		<td  height="40" align="center" nowrap="nowrap">֤������</td>
		<td  colspan="4" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td  height="40" align="center" >֤������</td>
		<td  colspan="4" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td  height="40" align="center" width="15%">ǩ&nbsp;&nbsp;&nbsp; ��</td>
		<td  colspan="4" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td  height="40" align="center" >��&nbsp;&nbsp;&nbsp; ��</td>
		<td  colspan="4" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td   rowspan="2" height="40" align="center" >�� �� ��</td>
		<td  height="40" align="center" >ǩ&nbsp;&nbsp;&nbsp; ��</td>
		<td  colspan="4" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td  height="40" align="center" >��&nbsp;&nbsp;&nbsp; ��</td>
		<td  colspan="4" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td   height="40" align="center" >��&nbsp;&nbsp;&nbsp; ע</td>
		<td  height="40" colspan="5" align="center" >��</td>
	</tr>
</table>
<p align="left" style="line-height: 150%">
<font face="����_GBK" style="font-size: 11pt">ע��������ӦΪ�����˻�����Ȩ�ˡ�</font></p>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0">
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
<br>
</body></html>