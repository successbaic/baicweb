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
	QYDJ_ZXXX.setOPENO(OPENO);
	QYDJ_ZXXX.doSelect();
	
	String WTYW="�������������ע����������";
	String WTYW1="�� ����Ԥ�Ⱥ�׼   �� ����    �� ���   �� ע��    �� ����    �� ��������Ǽ�";
	String WTYW2="�� ��Ȩ���� ��������    �����    �� ע��    ���������� ����";
	
	String checkBox = "��";
    String selected = "��";
    
    TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>�ǹ�˾��ҵ���˵Ǽǣ�������������</title>
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
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE-&gt;�ļ�-&gt;ҳ������&quot;�н�&quot;ҳüҳ��&quot;���)</font>

<br><br>
<table width="90%" align="center" bordercolor="#000000">         
	<caption ><b>
		<span style="font-size: 16pt">�ǹ�˾��ҵ����ע���Ǽ�������</span></b><br><br></caption>
</table>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<tr>
	<td align="center" height=40>��   ��</td>
	<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
</tr>
<tr>	
	<td align="center" height=40>ע���/ͳһ<br/>������ô���</td>
	<td colspan="5"><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
</tr>
<tr>
    <td align="center" height="40" nowrap="nowrap" >���ܲ���<br/>�������ˣ�</td>
	<td colspan="5"><%=QYDJ_JBXX.getDEPINCHA()%></td>
</tr>
<tr>
	<td align="center" height="40">��������</td>
	<td colspan="5"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>
</tr>
<tr>
	<td align="center">ע��ԭ��</td>
	<td colspan="5"><br>
		&nbsp;&nbsp;<%if("10".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 1����ҵ����Ъҵ;<br>
		&nbsp;&nbsp;<%if("50".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 2��	����������Ӫҵִ�ա�����ر�;<br>
		&nbsp;&nbsp;<%if("32".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 3��������;<br>
		&nbsp;&nbsp;<%if("40".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 4������Ժ�����Ʋ�;<br>
		&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 5������ԭ����ֹӪҵ:
		<%=SysSystem.toUnderlineStr("","center",20) %>��<br><br>
	</td>
</tr>


<tr>
	<td align="center" height=40  nowrap="nowrap">ծȨծ���������</td>
	<td colspan="5">&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ���ܲ��Ż���������֯��������ծȨծ��
	 <br/>&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ծ���������</td>
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">��˰���</td>
	<td colspan="5" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> ��������� &nbsp;&nbsp;&nbsp;&nbsp;
	<br/>&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> δ�漰��˰����</td>
</tr>

<tr>
	<td align="center" height=40 >�ɻع������</td>
	<td colspan="5">&nbsp;&nbsp;
	<%if("1".equals(QYDJ_ZXXX.getCAREVST())){out.print(selected);}else{out.print(checkBox);}%> �ѽɻ� &nbsp;&nbsp;&nbsp;&nbsp;
	<%if("2".equals(QYDJ_ZXXX.getCAREVST())){out.print(selected);}else{out.print(checkBox);}%> δ�ɻ� &nbsp;&nbsp;</td>
</tr>
<tr>
	<td align="center">����������</td>
	<td colspan="5">
	   <br><p style="line-height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;����ҵ���ա���ҵ���˵Ǽǹ���������������ҵ���˵Ǽǹ�������ʩ��ϸ������ע���Ǽǣ��ύ������ʵ��Ч��</p><br><br>
		<p >
			<font  style="float:left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩ�֣�
				<span class="NOPRINT" style="color:#CCCCCC"></span>
			</font>
		
			<font  style="float:right">��ҵ���˸��£�&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</font>
		<br><br>
		</p>
	   <p align="right">��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   </p>
	   <br/><br/> 
	</td>
</TR>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@ include file="public/GS_WTDL.inc" %>
</html>