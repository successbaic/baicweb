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
<%@ page import="com.macrosoft.icms.util.TwoDimensionCode" %>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="QYDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_ZXXX_SQ"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	String opetype=QYDJ_JBXX.getOPETYPE();
	
	String checkBox = "��";
	String selected= "��";
	String WTYW="���ƺ�׼���������̡��������ע����������������Ȩ���ʡ��������������������������ע�� �����������Ǽǡ�";
	
	QYDJ_ZXXX.setOPENO(OPENO);
	QYDJ_ZXXX.doSelect();
	
	String sflx="";
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>�������������ҵ���й����ڴ���������Ӫ��Ǽ�������</title>
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


<table border="1" width="80%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">�������������ҵ���й����ڴ���<br/>������Ӫ��Ǽ�������</span></b><br>
	<span style="font-size: 12pt">ע������ϸ�Ķ��������顶��д˵��������Ҫ����д��</span>
	</caption>
	<!-- ������Ϣ -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="4">
					<B><%out.print(selected);%>������Ϣ</B>
				</td>  
			</tr>
			<tr>
				<td align="center" height=28 width="15%">��    ��</td>
				<td width="35%"><%=QYDJ_JBXX.getENTNAME()%></td>
			
				<td width="15%" align="center" height=50>����Ԥ�Ⱥ�׼��<br/>��ע���/ͳһ���<br/>���ô���</td>
				<td width="35%"><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
				
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >��     ַ<br/>��Ӫҵ������</td>
				<td colspan="3" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>ʡ����/��������
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>�У�����/��/�����ݣ�
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> �أ�������/��/������/��/����
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>�磨������/��/�ֵ���
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>�壨·/������<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>��
				</td>
			</tr>
			<tr>
				<td align="center" height=28 nowrap="nowrap">��ϵ�绰</td>
				<td width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=28 nowrap="nowrap">��������</td>
				<td width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>
			</tr>
		</table>
	</td>
</tr>
	<!-- ���� -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
		<tr>
				<td align="center" height=30 colspan="4">
					<B><%=checkBox%>��ҵ</B>
				</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" width="15%" height=28>��ҵ����</td>
				<td width="35%">&nbsp;</td>
				<td align="center" nowrap="nowrap" width="15%">���ܲ���</td>
				<td width="35%">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=28>��������</td>
				<td>&nbsp;</td>
				<td align="center" nowrap="nowrap">��׼����</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=28>������</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="120px">���й�����<br/>��Ӫ��Χ</td>
				<td colspan="3" style="font-size:15px;">&nbsp;</td>
			</tr>	
			<tr>
				<td align="center" height=28 width="15%">�ʽ�����<br/>����Ԫ��</td>
				<td width="35%">&nbsp;��Ԫ</td>
				
				<td align="center" height=28  width="15%">����</td>
				<td  width="35%">&nbsp;</td>
			</tr>
			<tr>
			    <td align="center" height=28 >Ӫҵ����</td>
				<td align="center" colspan="3">
				 ��_________��______��______�� ��_________��______��______��
				</td>				
			</tr>
			
			<tr>
				<td align="center" nowrap="nowrap" height="40px">�а����̻�Ӫ<br/>������Ŀ</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="40px">�������������<br/>ҵ����</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="40px">�������������<br/>ҵ����ס��</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="100px">�������������<br/>ҵ��Ӫ��Χ</td>
				<td colspan="3" style="font-size:15px;">&nbsp;</td>
			</tr>
		</table>
	</td>
</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<p class="PageNext"><br></p>

<table border="1" width="80%" height="75%" align="center" bordercolor="#000000">
	<!-- ��� -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(checkBox);%>���/����</B>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height=28 width="20%" >���/������Ŀ</td>
				<td align="center" colspan="2" width="40%">ԭ�Ǽ�/��������</td>
				<td align="center" colspan="2" width="40%">����/��������</td>
			</tr>
			<% 	
				for(int i=0;i<5;i++){
					out.print("<tr><td height='28' colspan='2'></td><td colspan='2'></td><td colspan='2'></td></tr>");
				 }
			%>	
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="4">
					<B><%out.print(selected);%>ע��</B>
				</td>
			</tr>
			<tr>
				<td align="center" width="15%">ע��ԭ��</td>
				<td colspan="3" height="150px">
				<%=icms.getSysDm("CANREA",QYDJ_ZXXX.getCANREA()) %>
				</td>
			</tr>
			<tr>
				<td align="center" >��˰���</td>
				<td colspan="3" >
					&nbsp;&nbsp;
					<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> ��������� &nbsp;&nbsp;
					<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> δ�漰��˰����
				</td>
			</tr>
			<tr>
			<td align="center" nowrap="nowrap">��������<br/>������</td>
			<td colspan="3" nowrap="nowrap" >&nbsp;&nbsp;
			<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCUSTOMSETTLEMENT())){out.print(selected);}else{out.print(checkBox);}%> �Ѱ������ &nbsp;&nbsp;
			<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCUSTOMSETTLEMENT())){out.print(selected);}else{out.print(checkBox);}%> δ�漰��������
			</td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap">��׼����</td>
			<td colspan="3"><%=QYDJ_ZXXX.getSANAUTH() %></td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap" width="15%">��׼�ĺ�</td>
			<td width="35%"><%=QYDJ_ZXXX.getSANDOCNO() %></td>
			<td align="center" nowrap="nowrap" width="15%">��׼����</td>
			<td width="35%"><%=QYDJ_ZXXX.getSANDATE() %></td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap">����ծȨ<br/>ծ��λ</td>
			<td colspan="3"><%=QYDJ_ZXXX.getDECLECOMP() %></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
				<tr>
					<td align="center" height=28 colspan="6">
						<B><%out.print(selected);%>����������</B>
					</td>
				</tr>
				<tr>
					<td COLSPAN=6>
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;����ҵ������ط��ɷ����йع涨���뿪ҵ�Ǽǣ��ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;�������������ҵ��Ȩǩ����ǩ�֣�
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">��ӡ�£���&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font style="float:right">
								��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/><br/>
						</p> 
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>
</body></html>