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
<html><head><title>��˾ע���Ǽ�������</title>
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
		<span style="font-size: 16pt">��˾ע���Ǽ�������</span></b><br><br></caption>
</table>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<tr>
	<td align="center" height=40 nowrap="nowrap">��   ��</td>
	<td colspan="2" nowrap="nowrap"><%=QYDJ_JBXX.getENTNAME()%></td>
	
	<td align="center" height=40 nowrap="nowrap">ע���/ͳһ<br/>������ô���</td>
	<td colspan="2" nowrap="nowrap"><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
</tr>
<tr>
	<td align="center" height="40" nowrap="nowrap">��˾����</td>
	<td colspan="2"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>

    <td align="center" height="40" nowrap="nowrap" >�����鱸��<br/>֪ͨ���ĺ�</td>
	<td colspan="2"><%=QYDJ_ZXXX.getAFFWRITNO()%></td>
</tr>
<tr>
	<td align="center" nowrap="nowrap">����ע��<br>�� �� ��<br>ԭ   ��</td>
	<td colspan="5"><br>
		&nbsp;&nbsp;<%if("10".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 1����˾�³̹涨��Ӫҵ���޽�����������ɢ���ɳ���;<br>
		&nbsp;&nbsp;<%if("20".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 2���ɶ��������ɶ��ᡢ�ɶ��������ɢ;<br>
		&nbsp;&nbsp;<%if("70".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 3����˾�ϲ����߷�����Ҫ��ɢ;<br>
		&nbsp;&nbsp;<%if("50".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 4������������Ӫҵִ�ա�����رջ��߱�����;<br>
		&nbsp;&nbsp;<%if("30".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 5������Ժ�������Խ�ɢ;<br>
		&nbsp;&nbsp;<%if("40".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 6����˾�����������Ʋ�;<br>
		&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 7�����ɡ���������涨��������ɢ����:
		<%=SysSystem.toUnderlineStr("","center",10) %>��<br><br>
	</td>
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">����Ͷ��<br/>�������</td>
	<td colspan="2" width="30%" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ���������&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> �޶���Ͷ��</td>
	
	<td align="center" height=40  colspan="1" nowrap="nowrap" nowrap="nowrap">�ֹ�˾ע��<br/>�Ǽ����</td>
	<td colspan="2" width="30%" nowrap="nowrap">&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> �Ѱ������&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> �޷ֹ�˾</td>
	
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">ծȨծ��<br/>�������</td>
	<td colspan="5" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ��������� &nbsp;&nbsp;&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ��ծȨծ��</td>
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">��˰���</td>
	<td colspan="5" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> ��������� &nbsp;&nbsp;&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> δ�漰��˰����</td>
</tr>

<tr>
	<td align="center" >�������</td>
	<td align="center" height="40">���汨ֽ����</td>
    <td width="15%" nowrap="nowrap"><%=QYDJ_ZXXX.getPUBNEWSNAME()%></td>

    <td align="center" height="40">��������</td>
    <td nowrap="nowrap"><%=QYDJ_ZXXX.getPUBDATE()%></td>
</tr>
<tr>
	<td align="center">����������</td>
	<td colspan="5">
	   <br><p style="line-height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;����˾���ա���˾����������˾�Ǽǹ�������������ע���Ǽǣ��ύ������ʵ��Ч��</p><br><br>
		<p >
			<font  style="float:left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩ�֣�
				<span class="NOPRINT" style="color:#CCCCCC"></span>
			</font>
		
			<font  style="float:right">��˾���£�&nbsp;
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
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@ include file="public/GS_WTDL.inc" %>
</html>