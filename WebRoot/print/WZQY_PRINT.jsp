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
<html><head><title>����Ͷ�ʹ�˾�����Ǽ�������</title>
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
<p align="center"><span style="font-size: 24pt; font-family: ����" >����Ͷ�ʹ�˾�����Ǽ�������</td>
</tr>
<tr>
<td>
<table border="0" width="80%" bordercolor="#000000" style="border-collapse: collapse" align=center>
  <TR>
   <TD COLSPAN=4><br>
   <p style="line-height:40px;"><%=SysSystem.toUnderlineStr("","center",15)%>������������(��)�֣�<br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹���˾���������л����񹲺͹�������ʾ�Ӫ��ҵ���������л����񹲺͹����������Ӫ��ҵ���������л����񹲺͹�������ҵ�����͡��л����񹲺͹���˾�Ǽǹ������������йع涨��
   �����������Ǽǣ������׼��ͬʱ��ŵ�����ύ���ļ����йظ�����ʵ���Ϸ�����Ч����ӡ�ı���ԭ��һ�£��������ύ����ļ��������ĺ���е��������Ρ�
   </p><br>
   </TD>
</TR>
</table></td></tr>
<tr>
<td height="388" align="center">
<table border="0" width="70%" height="234">
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">��������˾����</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">���η���������ǩ��</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>			
	<tr>
		<td width="200"><font style="font-size: 15pt">��   ��   ��   ��</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>
</table><br></td></tr>
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
&nbsp;&nbsp;&nbsp;&nbsp;��ָ��/ί��<%=SysSystem.toUnderlineStr(CONSIGNER,"left",30)%>������˾�����Ǽ����ˡ�<br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ָ��/ί�е���Ч���ޣ���<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> ��<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %><br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ί���� ��<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%><br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%><br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%><br></p>
<p align="right">
��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ע��ί����ָȫ��Ͷ���ߡ�<br>&nbsp;&nbsp;&nbsp;&nbsp;(��Ͷ�ʸ������������˻�����Ȩ��ǩ�ָ��£�Ͷ����Ϊ��Ȼ�˵��ɱ���ǩ�֡�)&nbsp;&nbsp;</p>
<span style="font-size: 16pt"><p align="center">ָ�������ί�д�������Ϣ</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"><%=CONSIGNER %></td>
    <td width="60%" rowspan="4" align="center">���֤����ӡ��ճ����</td>
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
<span style="font-size: 16pt"><p align="center">��������˾���̵Ǽ�����Ա��Ϣ</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"><%=llrname %></td>
    <td width="60%" rowspan="7" align="center">���֤����ӡ��ճ����</td>
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
<span style="font-size: 16pt"><p align="center"><b>����Ͷ�ʵĹ�˾�����Ǽ������ύ���ļ�</b></p></span>
<table border="1" width="100%" height="600" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center"  >
		<p >���</td>
		<td >
		<p align="center" >�ļ�����</td>
	</tr>
	<tr>
		<td width="67" align="center"  >1</td>
		<td >���η���������ǩ��ġ�����Ͷ�ʵĹ�˾�����Ǽ������顷</td>
	</tr>
	<tr>
		<td width="67" align="center"  >2<font face="����">*</font></td>
		<td >�������ص���׼�ļ�����������׼֤�鸱��1��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >3<font face="����">*</font></td>
		<td >��˾�³�</td>
	</tr>
	<tr>
		<td width="67" align="center"  >4<font face="����" >*</font></td>
		<td >������Ԥ�Ⱥ�׼֪ͨ�顷</td>
	</tr>
	<tr>
		<td width="67" align="center"  >5<font face="����">*</font></td>
		<td >Ͷ���ߵ������ʸ�֤������Ȼ�����֤��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >6<font face="����">*</font></td>
		<td >���¡����º;������ְ�ļ������֤����ӡ��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >7<font face="����">*</font></td>
		<td >������������ְ�ļ������֤����ӡ��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >8<font face="����">*</font></td>
		<td >�������������ʻ������ߵ�����֤��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >9<font face="����">*</font></td>
		<td >�ɶ��״γ����Ƿǻ��ҲƲ��ģ��ύ�Ѱ���Ʋ�Ȩת��������֤���ļ�</td>
	</tr>
	<tr>
		<td width="67" align="center"  >10<font face="����">*</font></td>
		<td >��˾ס��֤��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >11<font face="����">*</font></td>
		<td >�������Ļ����¼</td>
	</tr>
	<tr>
		<td width="67" align="center"  >12<font face="����">*</font></td>
		<td >ǰ�������ļ���֤��</td>
	</tr>
	<tr>
		<td width="67" align="center"  >13<font face="����">*</font></td>
		<td >�����ļ��ʹ���Ȩί����</td>
	</tr>
	<tr> 
		<td width="67" align="center"  >14</td>
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
	         <p style="line-height: 25px"><font face="����_GBK">�������ύ���ļ�����������д�����ύ�����뱾�����ӸǷ��뵥λӡ�¡�</font></li>
	      </ol>
	    </td>
	 </tr>
</table>
<p class="PageNext"></p>
<!--########### -->
<table border="0" width="100%" height="700" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td height="700" valign="top">
<ol start="4">
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��2��������Ӧ���յ���׼֤��֮����90���ڵ��Ǽǻ��ذ���Ǽ�ע������;����������������̺��ʡ����̶�����ʽ������˾�ģ�������Ӧ���յ���׼֤��֮����30���ڵ��Ǽǻ��ذ���Ǽ�ע������;ļ����ʽ�����Ĺɷ����޹�˾�������й�Ʊ�ģ���Ӧ�ύ����Ժ֤ȯ�ල��������ĺ�׼�ļ�ԭ������Ч��ӡ����</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��3�˾�³���Ͷ�ʸ������������˻�����Ȩ��ǩ�֡����µ�ԭ����Ͷ����Ϊ��Ȼ�˵��ɱ���ǩ�֡��ύ�Ĺ�˾�³�Ӧ������������׼����һ�¡�</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��4�����Ԥ�Ⱥ�׼֪ͨ�顷Ӧ����Ч���ڣ�����������������˾�������������Ǻϡ�</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��5���з�Ͷ����Ӧ�ύ�ɱ���λ�Ӹǹ��µ�Ӫҵִ��/��ҵ��λ���˵Ǽ�֤��/������巨�˵Ǽ�֤/������ҵ��λ֤�鸴ӡ����Ϊ�����ʸ�֤�������Ͷ���ߵ�����
�ʸ�֤�������֤��Ӧ���䱾�����ܻ��ع�֤�����ҹ�פ�ù�ʹ(��)����֤�����䱾�����ҹ�û���⽻��ϵ����Ӧ�������ҹ����⽻��ϵ�ĵ�����פ�ù�ʹ���죩����֤�������ҹ�פ�õ�����ʹ���죩����֤��ĳЩ���ҵĺ������س��ߵ����飬
Ӧ���ڸ����ذ��׹�֤���پ��ù��⽻������֤��������ҹ�פ�ù�ʹ���죩����֤����ۡ����ź�̨�����Ͷ���ߵ������ʸ�֤�������֤��Ӧ������ר��涨��Э�������ṩ���ع�֤�����Ĺ�֤�ļ���</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��6���7��������ˡ����¡����º;���Ĳ���Ӧ���Ϲ�˾�³̵Ĺ涨��</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��8��9��������ڹɷ����޹�˾�ͽ��ڡ�֤ȯ�������๫˾���������˾��������ʱ����Ӧ��һ���Խɸ�ȫ�����ʵ����޹�˾���Լ�����ʱ�ɸ�ȫ���򲿷�ע���ʱ��������������޹�˾��</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��10�����з����ύ��Ȩ֤��ӡ��,���ύԭ���˶ԣ����޷����ύ����Э��ԭ�������ⷽ�Ĳ�Ȩ֤��ӡ�������ϲ����ṩ��Ȩ֤��ӡ���ģ��ύ�ܹ�֤����Ȩ�������������ݲ�Ȩʹ��֤����ӡ�������ⷽΪ���ݡ�����ģ���Ӧ�ύ���ݡ������Ӫҵִ�ո�ӡ����</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��11�����������ļ����ʽ�����Ĺɷ����޹�˾��</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��12��ָ�й�ǰ����ɵ���׼�ļ��������֤�鸴ӡ�������֤���������ھ�Ӫ��Χ���з��ɡ���������͹���Ժ�����涨�����ڵǼ�ǰ������׼����Ŀ������Ͷ�ʵĹ�˾��</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��13������ļ��ʹ���Ȩί���顱�����Ͷ���ߣ���Ȩ�ˣ��뾳�ڷ����ļ��ʹ�����ˣ�����Ȩ�ˣ�ǩ�𡣸�ί����Ӧ����ȷ��Ȩ���ڱ���Ȩ�˴�Ϊ���ܷ����ļ��ʹ����������Ȩ�˵�ַ����ϵ��ʽ������Ȩ�˿��������Ͷ���������ķ�֧�������������Ĺ�˾������Ȩ��Ϊ�������Ĺ�˾�ģ���˾������ί����Ч���������������йص�λ����ˡ�</font><br>	
	</li>
</ol>
</td>
</tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">����Ͷ�ʵĹ�˾���������Ǽ�����</b><br><br></caption>
<tr>   
	<td align='center' height=40 nowrap="nowrap" width="15%">����</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getENTNAME()%></td>   

    <td align='center' height=40 nowrap="nowrap" width="15%">��ϵ�绰</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getTEL()%></td>       
</tr>
<tr>	
	<td align='center' height=40 nowrap="nowrap" width="15%">ס��</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getOPLOC()%></td>
 	
 	<td align='center' height=40 width="15%">��������</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getPOSTALCODE()%></td> 	
</tr>
<tr>	
	<td align='center' height=40 nowrap="nowrap" width="15%">��˾����</td>   
	<td colspan="3" width="40%"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>
 	
 	<td align='center' rowspan="2" nowrap="nowrap" width="10%">����������<br>����</td>   
	<td colspan="3" rowspan="2" width="35%"><%=QYDJ_RYXX.getNAME()%></td> 	
</tr>
<tr>
    <td align='center' height=40 width="15%">������ʽ</td>
	<td colspan="3" width="40%"><%=icms.getSysDm("INSFORM",QYDJ_JBXX.getINSFORM())%></td>
</tr>
<tr> 
	<td align='center' height=40 width="15%">Ͷ���ܶ�</td>   
	<td colspan="3" width="40%"><%=QYDJ_JBXX.getCONGRO()%></td> 
	
	<td align='center' nowrap="nowrap" width="10%">Ӫҵ����</td>   
	<%-- <td colspan="3" width="35%">��<%=QYDJ_JBXX.getOPFROM()%>��<%=QYDJ_JBXX.getOPTO()%></td>--%>
	<td colspan="3" width="35%">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td> 
</tr> 
<tr>
	<td align='center' rowspan="2" width="15%">ע���ʱ�</td> 
	<td align='left' rowspan="2" width="20%">����:<%=icms.getSysDm("CURRENCY",QYDJ_JBXX.getREGCAPCUR())%></td>
	<td align='center' nowrap="nowrap" height=40 width="10%">�з�</td> 
	<td align='center' width="10%"><%=QYDJ_JBXX.getDOMEREGCAP()%></td>  
	<td align='center' nowrap="nowrap" width="10%">������Ԫ</td>
	<td align='center' width="15%"><%=QYDJ_JBXX.getDOMEREGCAPUSD()%></td>
	<td align='center' nowrap="nowrap" width="10%">��ռ����</td>
	<td align='center' width="10%"><%=QYDJ_JBXX.getDOMEREGCAPINVRAT()%></td>
</tr> 
<tr>
    <td align='center' nowrap="nowrap" height=40>�ⷽ</td> 
	<td align='center'><%=QYDJ_JBXX.getFORREGCAP()%></td>  
	<td align='center' nowrap="nowrap">������Ԫ</td>
	<td align='center'><%=QYDJ_JBXX.getFORREGCAPUSD()%></td>
	<td align='center' nowrap="nowrap">��ռ����</td>
	<td align='center'><%=QYDJ_JBXX.getFORREGCAPINVRAT()%></td>    
</tr>
<tr>
    <td align='center' rowspan="2">ʵ���ʱ�</td> 
    <td align='left' rowspan="2">����:<%=icms.getSysDm("CURRENCY",QYDJ_JBXX.getRECCAPCUR())%></td>
    <td align='center' nowrap="nowrap" height=40 width="10%">�з�</td> 
	<td align='center'><%=QYDJ_JBXX.getDOMERECCAP()%></td>  
	<td align='center' nowrap="nowrap">������Ԫ</td>
	<td align='center'><%=QYDJ_JBXX.getDOMERECCAPUSD()%></td>
	<td align='center' nowrap="nowrap">��ռ����</td>
	<td align='center'><%=QYDJ_JBXX.getDOMERECCAPCONPROP()%></td>
</tr>
<tr>
    <td align='center' nowrap="nowrap" height=40>�ⷽ</td> 
	<td align='center'><%=QYDJ_JBXX.getFORRECCAP()%></td>  
	<td align='center' nowrap="nowrap">������Ԫ</td>
	<td align='center'><%=QYDJ_JBXX.getFORRECCAPUSD()%></td>
	<td align='center' nowrap="nowrap">��ռ����</td>
	<td align='center'><%=QYDJ_JBXX.getFORRECCAPCONPROP()%></td>    
</tr>
<tr>
	<td height="100" align="center">��<br>Ӫ<br>��<br>Χ</td>
	<td colspan="7" height="100"><%=QYDJ_JBXX.getBUSSCOPE()%></td>
</tr>
<tr> 
	<td align='center' nowrap="nowrap" height=40 colspan="2">ƾ��ɾ�Ӫ��Ŀ</td>   
	<td colspan="2"><%=QYDJ_JBXX.getABUITEMCO()%></td>
	<td align='center' nowrap="nowrap" height=40>��Ŀ����</td>
	<td colspan="3"><%=icms.getSysDm("PROTYPE",QYDJ_JBXX.getPROTYPE())%></td>		
</tr>
<tr>
	<td height="40" align="center"></td>
	<td height="40" align="center">Ͷ����<br>���ƻ�����</td>
	<td height="40" align="center">�Ͻ�<br>���ʶ�</td>
	<td height="40" align="center">����<br>��ʽ</td>
	<td height="40" align="center">��ռ<br>����</td>
	<td height="40" align="center">ʵ��<br>���ʶ�</td>
	<td height="40" align="center">����<br>��ʽ</td>
	<td height="40" align="center">����<br>ʱ��</td>
	</tr>
<%
	ArrayList rsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'");
	int temp = rsdwtz.size();
	if(temp>0){
     for (int i=0;i<temp;i++)
      {
        com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)rsdwtz.get(i);
        String CONDATE=bTable.getCONDATE();
		if(CONDATE.length()>10)
			CONDATE=CONDATE.substring(0,10);
		String BALDELTERM=bTable.getBALDELTERM();
		if(BALDELTERM.length()>10)
			BALDELTERM=BALDELTERM.substring(0,10);
%>
	<tr>
		<td  rowspan="3" align="center" >
		<%
			if(bTable.getCOUNTRY().trim().equals("156"))
				out.print("�з�");
			else
				out.print("�ⷽ");
		%>
		</td>
		<td align="center" height="40"><%=bTable.getINV()%></td>
		<td align="center" height="40"><%=String.valueOf(bTable.getSUBCONAM())%></td>
		<td align="center" height="40"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>
		<td align="center" height="40"><%=String.valueOf(bTable.getCONPROP())%></td>
		<td align="center" height="40"><%=String.valueOf(bTable.getACCONAM())%></td>
		<td align="center" height="40"><%=icms.getSysDm("CONFORM",bTable.getACCONFORM())%></td>
		<td align="center" height="40"><%=bTable.getACCONDATE()%></td>
	</tr>
	<tr>
		<td align="center" height="40">����(����)</td>
		<td height="40" colspan="2"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
		<td colspan="2" align="center" nowrap="nowrap" height="40">��������</td>
		<td colspan="2" height="40"><%=bTable.getBALDELTERM()%></td>
	</tr>
	<tr>
		<td align="center" height="40">Ͷ��������</td>
		<td height="40"><%=icms.getSysDm("INVTYPE",bTable.getINVTYPE())%></td>
		<td colspan="2" align="center" nowrap="nowrap" height="40">֤�����ͼ�����</td>
		<td colspan="3" height="40"><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%><br><%=bTable.getCERNO()%></td>
	</tr>
<%
	  }
	}else{			
%>
<tr>
		<td  rowspan="3" align="center" ></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
	</tr>
	<tr>
		<td align="center" height="40">����(����)</td>
		<td height="40" colspan="2"></td>
		<td colspan="2" align="center" nowrap="nowrap" height="40">��������</td>
		<td colspan="2" height="40"></td>
	</tr>
	<tr>
		<td align="center" height="40">Ͷ��������</td>
		<td height="40"></td>
		<td colspan="2" align="center" nowrap="nowrap" height="40">֤�����ͼ�����</td>
		<td colspan="3" height="40"><br></td>
	</tr>
<%} %>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_FDDBR.inc" %>
<br><p class="PageNext"><br>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0" height="750">
<caption align="center"><b>
	<span style="font-size: 16pt">����������������</span></b><br><br>
</caption>
 <tr>
   <td>
	 <p  style="line-height:30px; word-spacing: 1px; margin-top: 5px"> &nbsp;&nbsp;&nbsp;&nbsp; ����飬���������˷����йط��ɡ�����涨����ְ�ʸ񣬲��������������</p>
	  <ol>
	   <li>
		 <p style="line-height: 30px; word-spacing: 1px">
		   <span style="vertical-align: top">��������Ϊ������������������Ϊ�����ģ�</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">���ڱ�ִ���̷��������ڱ�ִ������ǿ�ƴ�ʩ�ģ�</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">���ڱ��������ػ��߹��Ұ�ȫ����ͨ���ģ�</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">����̰�ۻ�¸��ַ��Ʋ�������ƻ���������г�������������д��̷���ִ������δ������ģ�������������д��̷���ִ������δ������ģ��������ﱻ�д���������Ȩ����ִ������δ������ģ�</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">������Ӫ�����Ʋ��������ҵ�ķ��������˻��߶��¡��������Ը���ҵ���Ʋ����и������Σ��Ը���ҵ�Ʋ��������֮����δ������ģ�</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">������Υ��������Ӫҵִ�յ���ҵ�ķ��������ˣ����Ը���ҵΥ����Ϊ���и������Σ��Ը���ҵ������Ӫҵִ��֮����δ������ģ�</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">���˸�ծ����ϴ󣬵���δ�峥�ģ�</span></p>
	   </li>
	   <li>
		  <p style="line-height: 30px">
		   <span style="vertical-align: top">�з��ɺ͹���Ժ�涨���õ��η��������˵��������Ρ�</span></p>
	   </li>
	</ol>
		<p>��</p>
		<p>��</p>
		<p>��</p>
		<p><span style="vertical-align: top">����˸��£�ǩ�֣���</span><p>��<p>��<p>��</td>
	</tr>
</table>
<p><span style="font-size: 11pt"><font face="����_GBK"><span style="vertical-align: top">ע��<font face="����_GBK"><span style="font-size: 11pt">������ˡ�ָѡ�١�ί�ɡ�ָ�����������������˵Ķ��»ᡢ�ɶ��ᡢͶ���˵ȡ�
</span></font></span></font></span></p>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="90%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">��˾���¡����¡����������</b><br><br>
</caption>	
<%
 int Nu=0;
 ArrayList rstz=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int rytemp = rstz.size();
 for (int i=0;i<rytemp;i++){
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)rstz.get(i);

 Nu=Nu+1;
%>  
 <tr><td align='center' colspan=3 height=120>
   <table align="center" border="1" width="100%" bordercolor='#000000' frame="void" height="100%">
      <tr>  
		  <td height="40" align="center" rowspan="2" width="15%">�� ��</td>
		  <td align="center" rowspan="2" width="10%" nowrap="nowrap">ְ ��</td>  
		  <td rowspan="2" width="10%"><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>
		  <td align="center" rowspan="2" width="10%" nowrap="nowrap">������ʽ</td>  
		  <td rowspan="2" width="10%"><%=icms.getSysDm("POSBRFORM",bTable.getPOSBRFORM())%></td>
		  <td align="center" rowspan="2" width="10%">���<br>֤��</td>
		  <td align="center" width="10%" nowrap="nowrap">����</td>
		  <td width="25%"><%=bTable.getCERNO()%></td>
	   </tr>
	   <tr>
		  <td align="center">����</td>
		  <td><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%></td>
	  </tr>
	  <tr>
	      <td height="40"><%=bTable.getNAME()%></td>
	      <td align="center" width="10%">����<br>(����)</td>  
		  <td width="10%"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
		  <td align="center" width="10%">�ɳ���λ</td> 
		  <td colspan="2"><%=bTable.getACCDSIDE()%></td>
		  <td align="center" width="10%">סַ</td>
		  <td width="25%"><%=bTable.getHOUSEADD()%></td>
	  </tr>
   </table>
 </td></tr>
<% 
 if (Nu!=0&&Nu%4==0){ 
  out.print("</table><br><p class='PageNext'><br><table align='center' border='1' width='90%' bordercolor='#000000'>");
 }
 }
	 if(Nu>0 && Nu<4){
	   for (int j=0; j<4-Nu;j++){
%>
  <tr><td align='center' colspan=3 height=120>
    <table align="center" border="1" width="100%" bordercolor='#000000'  frame="void" height="100%">
        <tr>  
		  <td height="40" align="center" rowspan="2" width="15%">�� ��</td>
		  <td align="center" rowspan="2" width="10%" nowrap="nowrap">ְ ��</td>  
		  <td rowspan="2" width="10%"></td>
		  <td align="center" rowspan="2" width="10%" nowrap="nowrap">������ʽ</td>  
		  <td rowspan="2" width="10%"></td>
		  <td align="center" rowspan="2" width="10%">���<br>֤��</td>
		  <td align="center" width="10%" nowrap="nowrap">����</td>
		  <td width="25%"></td>
		 </tr>
		 <tr>
		  <td align="center" width="10%">����</td>
		  <td width="25%"></td>
	     </tr>
	  <tr>
	      <td height="40"></td>
	      <td align="center" width="10%">����<br>(����)</td>  
		  <td width="10%"></td>
		  <td align="center" width="10%">�ɳ���λ</td> 
		  <td colspan="2"></td>
		  <td align="center" width="10%">סַ</td>
		  <td width="25%"></td>
	  </tr>
    </table>
 </td></tr>
<%   
	   }
	 }
 if (Nu==0) out.print("<tr><td colspan=3 align='center'>�޴�������</td></tr>");
%>	
</table>
<br>
<br><p class="PageNext">
<table border="1" width="100%" cellspacing="0" bordercolor="#000000" cellpadding="0" height="850">
<br>
	<p align="center"><b><font size="4">�Ǽǻ��غ˶�����</font></b></p>
	<p align='right' >��λ����Ԫ</p>
	<tr>
		<td height="40" align="center" >����</td>
		<td colspan="5" height="40" align="center" >��</td>
		<td height="40" align="center" >�ʱ�</td>
		<td colspan="3" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td height="40" align="center" >ס��</td>
		<td colspan="5" height="40" align="center" >��</td>
		<td height="40" align="center" nowrap="nowrap">��ϵ�绰</td>
		<td colspan="3" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td height="40" align="center" >����������<br>����</td>
		<td colspan="4" height="40" align="center" >��</td>
		<td height="40" align="center" >��˾����</td>
		<td colspan="4" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td height="40" align="center" >Ͷ���ܶ�</td>
		<td width="38%" colspan="4" height="40" align="center">��</td>
		<td height="40" align="center" >������ʽ</td>
		<td colspan="4" height="40" align="center">��</td>
	</tr>
	<tr>
		<td rowspan="2" height="80" align="center">ע��<br>�ʱ�</td>
		<td height="40" align="left">���֣�</td>
		<td height="40" align="center">�з�</td>
		<td width="7%"  height="40" align="center">��</td>
		<td width="7%"  height="40" align="center">����<br>��ʽ</td>
		<td height="40" align="center">��</td>
		<td height="40" align="center">����Ԫ</td>
		<td width="6%"  height="40" align="center">��</td>
		<td height="40" width="7%" align="center">��ռ<br>����</td>
		<td width="5%"  height="40">��</td>
	</tr>
	<tr>
		<td height="40" align="left">���֣�</td>
		<td height="40" align="center">�ⷽ</td>
		<td width="7%"  height="40" align="center">��</td>
		<td width="7%"  height="40" align="center">����<br>��ʽ</td>
		<td height="40" align="center">��</td>
		<td height="40" align="center">����Ԫ</td>
		<td width="6%"  height="40" align="center">��</td>
		<td height="40" width="7%" align="center">��ռ<br>����</td>
		<td width="5%"  height="40">��</td>
	</tr>
	<tr>
		<td rowspan="2"  height="80" align="center" >ʵ��<br>�ʱ�</td>
		<td height="40" align="left" >���֣�</td>
		<td height="40" align="center" >�з�</td>
		<td width="7%"  height="40" align="center" >��</td>
		<td width="7%"  height="40" align="center" >����<br>��ʽ</td>
		<td  height="40" align="center" >��</td>
		<td  height="40" align="center" >����Ԫ</td>
		<td width="6%"  height="40" align="center" >��</td>
		<td  height="40" width="7%" align="center" >��ռ<br>����</td>
		<td width="5%"  height="40" >��</td>
	</tr>
	<tr>
		<td height="40" align="left" >���֣�</td>
		<td height="40" align="center" >�ⷽ</td>
		<td width="7%"  height="40" align="center" >��</td>
		<td width="7%"  height="40" align="center" >����<br>��ʽ</td> 
		<td height="40" align="center">��</td>
		<td height="40" align="center">����Ԫ</td>
		<td width="6%"  height="40" align="center">��</td>
		<td height="40" width="7%" align="center">��ռ<br>����</td>
		<td width="5%"  height="34">��</td>
	</tr>
	<tr>
		<td  height="140" align="center" ><br>
		��<br>
		Ӫ<br>
		��<br>
		Χ<br>
��       </td>
		<td  colspan="9" height="150" align="center" >��</td>
	</tr>
	<tr>
		<td  height="40" align="center" >ƾ��ɾ�Ӫ��Ŀ</td>
		<td width="36%"  height="40"  colspan="4" align="center">��</td>
		<td  height="40" align="center" >��Ŀ����</td>
		<td  height="40"  colspan="4" align="center">��</td>
	</tr>
	<tr>
		<td  height="65" align="center" >Ͷ����<br>���ƻ�����</td>
		<td  height="65" align="center" >����<br>��������</td>
		<td  height="65" align="center" >�Ͻ�<br>���ʶ�</td>
		<td width="7%"  height="65" align="center" >����<br>��ʽ</td>
		<td width="7%"  height="65" align="center" >��ռ<br>����</td> 
		<td  height="65" align="center" >ʵ��<br>���ʶ�</td>
		<td  height="65" align="center" >����<br>��ʽ</td>
		<td width="6%"  height="65" align="center" >����<br>ʱ��</td>
		<td  colspan="2" height="65" align="center" >���ɸ�<br>����</td>
	</tr>
	<tr>
		<td  height="40" align="center" >��</td>
		<td  height="40" align="center" >��</td>
		<td  height="40" align="center" >��</td>
		<td width="7%"  height="40" align="center" >��</td>
		<td width="7%"  height="40" align="center" >��</td>
		<td  height="40" align="center" >��</td>
		<td  height="40" align="center" >��</td>
		<td width="6%"  height="40" align="center" >��</td>
		<td  colspan="2" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td  height="40" align="center" >Ͷ��������</td>
		<td  height="40" align="center" colspan="2">��</td>
		<td  height="40" colspan="2" align="center">֤�����ͼ�����</td>
		<td  height="40" align="center" colspan="5">��</td>
	</tr>
	<tr>
		<td  height="40" align="center" >��</td>
		<td  height="40" align="center" >��</td>
		<td  height="40" align="center" >��</td>
		<td width="7%"  height="40" align="center" >��</td>
		<td width="7%"  height="40" align="center" >��</td>
		<td  height="40" align="center" >��</td>
		<td  height="40" align="center" >��</td>
		<td width="6%"  height="40" align="center" >��</td>
		<td  colspan="2" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td  height="40" align="center">Ͷ��������</td>
		<td  height="40" align="center" colspan="2">��</td>
		<td  height="40"  colspan="2" align="center">֤�����ͼ�����</td>
		<td  height="40" align="center" colspan="5">��</td>
	</tr>
	<tr>
		<td  height="40" align="center">��Ӫ����</td>
		<td  colspan="9" height="40" align="center">��</td>
	</tr>
	<tr>
		<td  height="40" align="center">��ҵ����</td>
		<td  width="38%"  colspan="4" height="40" align="center">  </td>
		<td  height="40" align="center">ע���</td>
		<td  colspan="4" height="40" align="center">��</td>
	</tr>
	<tr>
		<td  height="40" align="center" >���ʲ�ҵ����</td>
		<td  width="38%" colspan="4" height="40" align="center" >  </td>
		<td  height="40" align="center" >���������Ʋ�ҵ����</td>
		<td  colspan="4" height="40" align="center" >��</td>
	</tr>
	<tr>
		<td  height="40" align="center" >��ע</td>
		<td  colspan="9" height="40" align="center">��</td>
	</tr>
</table>
<p class="PageNext"><br></p>
<%String lzrtitle="����������"; %>
<%@include file="public/WZGS_LZQD.inc" %>
<br><br>
</body></html>