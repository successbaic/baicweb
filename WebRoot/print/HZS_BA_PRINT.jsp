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
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();	
	String DQENTNAME =QYDJ_JBXX.getENTNAME();
	String checkBox = "��";
	String selected= "��";
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	boolean CYBA=false;//��Ա����
	boolean ZCBA=false;//�³̱���
	boolean ZCXGBA=false;//�³��޸ı���
	
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		if(bgsx.getALTITEM().equals("10")){//��Ա
			CYBA=true;
		}
		if(bgsx.getALTITEM().equals("73")){//�³�
			ZCBA=true;
		}
		if(bgsx.getALTITEM().equals("74")){//�³�������
			ZCXGBA=true;
		}
	}
	String WTYW1="�� ����Ԥ�Ⱥ�׼   �� ����    �� ���    �� ע��    �� ����    �� ��������Ǽ�";
	String WTYW2="�� ��Ȩ���� ��������    �����    �� ע��    ���������� ����";
%>
<html><head><title>ũ��רҵ�����籸���Ǽ�������</title>
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

<%
 int No=0;
 ArrayList rsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int temp = rsdwtz.size();
%>
<table align="center" width="90%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">ũ �� ר ҵ �� �� �� �� �� ��</b><br><br></caption>	
<tr>
<td align="right">
ע��ţ�<%=QYDJ_JBXX.getREGNO() %></td></tr>	
</table>
<table align="center" border="1" width="90%" bordercolor='#000000'>
 <tr>
   <td align="center" height=40>����</td>
   <td colspan=2><%=QYDJ_JBXX.getENTNAME() %></td>
 </tr>
 <tr>
   <td align="center" height=40>��������</td>
   <td align="center">�ύ�Ĳ���</td>
   <td align="center">����</td>
 </tr>
 <tr>
   <Td rowspan=2 align="center">1����Ա�������<%if(CYBA){out.print(selected);}else{out.print(checkBox);} %></Td>
   <td align="center" height=40>����������ǩ����޸ĺ�ĳ�Ա����</td>
   <td></td>
 </tr>
 <tr>
   <td align="center" height=40>�³�Ա�����֤��</td>
   <td></td>
 </tr>
 <tr>
   <Td rowspan=2 align="center">2���³��޸�δ��<br>���Ǽ������ 
   <%if(ZCBA||ZCXGBA){out.print(selected);}else{out.print(checkBox);} %></Td>
   <td align="center" height=40>����������ǩ����޸ĺ���³�</td>
   <td></td>
 </tr>
 <tr>
   <td align="center" height=40>����������ǩ����޸ĺ���³�������</td>
   <td></td>
 </tr>
  <tr>
  <td colspan="3" height=100>
&nbsp;&nbsp;&nbsp;&nbsp;��ũ��רҵ���������ա��л����񹲺͹�ũ��רҵ������Ǽǹ������������йع涨�ύ�������ϣ��ύ������ʵ��Ч��������ʵ�Գе����Ρ�
<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;����������ǩ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ũ��רҵ��������£�<p>
<br>
 <p align="right"> ��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;</p> 
  </td>
  </tr>
  <tr>
    <td colspan="3" align="center" height=40><b>�����ɵǼǻ�����д</b></td>
  </tr>
  <tr>
    <td align="center" height=80>����<br>���<br>���</td>
    <td align="center" colspan=2><br><br><br>���������Աǩ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     ��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� </td>
  </tr>
  <tr>
    <td align="center" height=40>������ִ�ĺ�</td>
    <td colspan=2></td>
  </tr>
</table>
<br>
<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						��֪��1����ѡ������� �� �д�̡�
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2�����ύ���ϵķ���������д�ύ���ϵ�ʵ�ʷ�����
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3���ύ�ļ���֤����ӡ��Ӧ��ʹ��A4ֽ��
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4��Ӧ��ʹ�øֱʡ�ë�ʻ�ǩ�ֱʹ�������д����ǩ����
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;5��������ǩ��ģ�ũ��רҵ�������ԱΪ��Ȼ�˵��ɱ���ǩ������Ȼ������������˼Ӹǹ��¡�
					</P>
				</td>
			</tr>
			
</table>
<%if(CYBA){ %>
<p class="PageNext"><br>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CZXX.inc"%>

<span style="font-size: 16pt"><p align="center"><b>��дũ��רҵ�������Ա�����嵥��֪</b></p></span>
<table border="0" width="100%" height="700" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td height="700" valign="top">
<ol >
	<li>
	<p style="line-height: 25px"><font face="����_GBK">���ʷ�ʽ��ũ��רҵ�������Ա�Ի�����Ϊ���ʵ���д�����ҡ�����ʵ�֪ʶ��Ȩ�ȿ����û��ҹ��۲���������ת�õķǻ��ҲƲ���Ϊ���ʵģ���д�ǻ��ҲƲ��ľ������࣬�緿�ݡ�ũҵ��е��ע���̱�ȡ�</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">���ʶ��ǳ�Ա�Ի��ҳ��ʵ�������߳�Ա�Էǻ��ҲƲ�������ȫ���Ա�������۵Ļ������</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">���ʳ�Ա����Ȼ�˵�����ǩ�����ǵ�λ��������¡���λ���¿��ԼӸ��ڳ����嵥�Ŀհ״���</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">����ʳ�Ա������嵥д���µģ�����ҳ��������</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">Ӧ��ʹ�øֱʡ�ë�ʻ�ǩ�ֱʹ�������д����ǩ����</font></li>
</ol>
</td>
</tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CYXX.inc" %>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CYZM.inc" %>
<br>
<p class="PageNext"></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>��дũ��רҵ�������Ա������֪</b></p></span>
<table border="0" width="100%" height="700" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td height="700" valign="top">
<ol >
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��λ��Ա�����ʸ񣺷��ϡ�ũ��רҵ������Ǽǹ�����������ʮ�����涨��������ҵ����ҵ��λ����������壬���Գ�Ϊũ��רҵ������ĳ�Ա����ҵ����ҵ��λ�����������ķ�֧����������Ϊũ��רҵ������ĳ�Ա��ũҵֲ��վ��ũҵ�����ƹ�վ����������վ�Լ���������վ��ˮ�ļ��վ�Ⱦ��й���������ְ�ܵĵ�λ���ó�Ϊũ��רҵ�������Ա��</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">֤�����Ƽ����룺��ԱΪ��Ȼ�˵ģ���д���������֤��������룻��ԱΪ��λ�ģ���д�����ʸ�֤�鼰����롣</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">ס����ũ��רҵ�������Ա����Ȼ�˵�ס��Ϊ��ס��������ҵ����ҵ��λ����������ԱΪ�Ǽ�֤����������ס����</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��Ա����:��Ϊũ���Ա����ũ���Ա�͵�λ��Ա����ҵ����ҵ��λ��������壩���ࡣ</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">��Ա���֤����ӡ����ũ���ԱӦ���ύũҵ�˿ڻ��ڲ���ӡ������ط������ƶȸĸ��ԭ�����ύũҵ�˿ڻ��ڲ���ӡ���ģ������ύ�������֤��ӡ�����Լ����سа���ӪȨ֤��ӡ�����ߴ���ίԱ����ߵ����֤������ũ���ԱӦ���ύ�������֤��ӡ������ҵ����ҵ��λ������������ԱӦ���ύ��Ǽǻ��ذ䷢����ҵӪҵִ�ջ��ߵǼ�֤�鸴ӡ������Ա���֤����ӡ��ճ����ճ�����µģ�����ҳ��ճ����</font></li>
    <li>
	<p style="line-height: 25px"><font face="����_GBK">��ũ��רҵ�������Ա���ᡷд���µģ�����ҳ��������</font></li>
    <li>
	<p style="line-height: 25px"><font face="����_GBK">֤����ӡ��Ӧ��ע������ԭ��һ�¡����ɱ���ǩ�����ߵ�λ���¡�</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">�ύ�ļ���֤����ӡ��Ӧ��ʹ��A4ֽ��</font></li>
	<li>
	<p style="line-height: 25px"><font face="����_GBK">Ӧ��ʹ�øֱʡ�ë�ʻ�ǩ�ֱʹ�������д����ǩ����</font></li>
</ol>
</td>
</tr>
</table>
<%}%>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>