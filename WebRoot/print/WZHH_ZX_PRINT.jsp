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
<jsp:useBean id="MCGL_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
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
	
	String checkBox = "��";
    String selected = "��";
    
    String WTYW="�������������ע����������";
    String WTYW1="�� ����Ԥ�Ⱥ�׼   �� ����    �� ���    �� ע��    �� ����    �� ��������Ǽ�";
	String WTYW2="�� ��Ȩ���� ��������    �����    �� ע��    ���������� ����";
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>����Ͷ�ʺϻ���ҵ�Ǽ�������</title>
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
<br>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">����Ͷ�ʺϻ���ҵ�Ǽ�������</span></b><br><br>
	<span style="font-size: 12pt">ע������ϸ�Ķ��������顶��д˵��������Ҫ����д��</span>
	</caption>
	<!-- ������Ϣ -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="6">
					<B><%out.print(selected);%>������Ϣ</B>
				</td>
			</tr>
			
			<tr>
				<td align="center" height=28>��    ��</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>����Ԥ�Ⱥ�׼��<br/>��/ע���/ͳһ<br/>������ô���</td>
				<td colspan=5><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >��Ҫ��Ӫ����</td>
				<td colspan="5" style="font-size:13px;">
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>ʡ����/��������
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>�У�����/��/�����ݣ�
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> �أ�������/��/������/��/����
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>�磨������/��/�ֵ���
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>�壨·/������<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>��
				</td>
			</tr>
			
			<tr>
				<td width="20%" align="center" height=70 >������Ӫ��</td>
				<td colspan="5" style="font-size:13px;">
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROPROVINCE().length()==6?QYDJ_JBXX.getPROPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>ʡ����/��������
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCITY()),"center",6)%>�У�����/��/�����ݣ�
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCOUNTY()),"center",8)%> �أ�������/��/������/��/����
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROTOWN(),"center",15)%>�磨������/��/�ֵ���
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROVILLAGE(),"center",15)%>�壨·/������<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROHOUSENUMBER(),"center",5)%>��
				</td>
			</tr>
			
			<tr>
								
				<td align="center" height=30 nowrap="nowrap">��ϵ�绰</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=30 nowrap="nowrap">��������</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>
				
			</tr>
		</table>
	</td>
</tr>
	<!-- ���� -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="6">
					<B><%out.print(checkBox);%>����</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%">ִ������ϻ�<br/>�˻�ί�ɴ���</td>
				<td align="center" >����������</td>
				<td align="center" >&nbsp;</td>
				<td align="center" width="15%">�� ��<br/>���� ����</td>
				<td align="center" colspan="2" width="25%">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%">�Ͻɳ��ʶ�<br/>����Ԫ��</td>
				<td width="10%">&nbsp;</td>
				<td align="center" width="20%">ʵ�ɳ��ʶ�<br/>����Ԫ��</td>
				<td width="10%">&nbsp;</td>
				<td align="center" width="15%">����</td>
				<td width="25%">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%">��ҵ����</td>
				<td colspan="5">&nbsp;</td>
			</tr>	
			<tr>
			    <td align="center" height=100 nowrap="nowrap">��Ӫ��Χ</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;"><br>
					<br>&nbsp;<br>
				</td>
			</tr>
			
			<tr>
				<td align="center" height="30px">�ϻ�����</td>
				<td align="center" colspan=2>
				��	________�� &nbsp;&nbsp; �� ����
				</td>
				<td align="center" colspan=2 nowrap="nowrap">����ִ�ո�������</td>
				<td align="center" > _______��</td>
			</tr>
		</table>
	</td>
</tr>
	<!-- ��� -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="3">
					<B><%out.print(checkBox);%>���</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%" >�����Ŀ</td>
				<td align="center" width="40%">ԭ�Ǽ�����</td>
				<td align="center" width="40%">�������Ǽ�����</td>
			</tr>
			<% 	
				for(int i=0;i<4;i++){
					out.print("<tr><td height='30'></td><td></td><td></td></tr>");
				 }
			%>	
			</table>
		</td>
	</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<p class="PageNext"><br></p>

<table border="1" width="90%" height="75%" align="center" bordercolor="#000000">
	<!-- ���� -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="5">
					<B><%out.print(checkBox);%>����</B>
				</td>
			</tr>
			<tr>
				<td align="center" rowspan="2">�ֹ�˾<br/>�������ע��</td>
				<td align="center" height=28>����</td>
				<td width="20%"></td>
				<td align="center" height=28>ע���/ͳһ<br/>������ô���</td>
				<td width="20%"></td>
			</tr>
			<tr>
				<td align="center" height=28>�Ǽǻ���</td>
				<td></td>
				<td align="center">�Ǽ�����</td>
				<td></td>
			</tr>
			<tr>
				<td align="center" rowspan="2">������</td>
				<td align="center" height="28" >��Ա����</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td align="center" height=28>���㸺��<br/>������</td>
				<td></td>
				<td align="center">��ϵ�绰</td>
				<td ></td>
			</tr>
			<tr>
				<td align="center" height="28">����</td>
				<td align="left" colspan="4">
					&nbsp;&nbsp;&nbsp;
					<%out.print(checkBox); %>�ϻ�Э��  &nbsp;   
					<%out.print(checkBox); %>��������  &nbsp;  
					<%out.print(checkBox); %>����Ա &nbsp;
					<%out.print(checkBox); %>���Ͷ���߷����ļ��ʹ������  &nbsp;   
				</td>
			</tr>
			</table>
		</td>
	</tr>
	
	<!-- ע�� -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="5">
					<B><%out.print(selected);%>ע��</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 >ע��ԭ��</td>
				<td colspan="4" ><%=icms.getSysDm("CANREA",QYDJ_ZXXX.getCANREA()) %></td>
			</tr>
			
			<tr>
				<td align="center" height=30>�����˱���֪ͨ����</td>
				<td><%=QYDJ_ZXXX.getAFFWRITNO() %></td>
				<td align="center" height=30>����Ͷ���������</td>
				<td colspan="2">
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ���������&nbsp;&nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> �޶���Ͷ��
				</td>
			</tr>    
			<tr>
				<td align="center" height=30>��֧����ע��<br/>�Ǽ����</td>
				<td>
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> �Ѱ������&nbsp;&nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> �޷�֧����
				</td>
				<td align="center" height=30>ծȨծ���������</td>
				<td colspan="2">
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ��������� &nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ��ծȨծ��</td>
			</tr>
			<tr>
				<td align="center" height=30>��˰���</td>
				<td>
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> ��������� &nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> δ�漰��˰����</td>
				<td align="center" height=30>��������������</td>
				<td colspan="2">
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCUSTOMSETTLEMENT())){out.print(selected);}else{out.print(checkBox);}%> �Ѱ������ &nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCUSTOMSETTLEMENT())){out.print(selected);}else{out.print(checkBox);}%> δ�漰��������</td>
			</tr>
			<tr>
				<td align="center" height=30>�������</td>
				<td align="center" height=30>���汨ֽ����</td>
				<td><%=QYDJ_ZXXX.getPUBNEWSNAME() %></td>
				<td align="center" height=30>��������</td>
				<td><%=QYDJ_ZXXX.getPUBDATE() %></td>
			</tr>
			<tr>
				<td align="center" height=30>��׼������������</td>
				<td><%=QYDJ_ZXXX.getSANAUTH() %></td>
				<td align="center" height=30>��׼���������ĺ�</td>
				<td><%=QYDJ_ZXXX.getSANDOCNO() %></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
				<tr>
					<td align="center" height=30 colspan="6">
						<B><%out.print(selected);%>����������</B>
					</td>
				</tr>
				<tr>
					<td COLSPAN=6>
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;����ҵ������ط��ɷ���涨����Ǽǡ��������ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ִ������ϻ��ˣ�ί�ɴ���ǩ�֣�
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">��ҵӡ�£�&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br>
						<p> 
							<font style="float:left">
							&nbsp;&nbsp;&nbsp;&nbsp;
							���㸺����ǩ�֣�  
							</font>
							<font style="float:right">
								��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p> 
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<p class="PageNext"><br>
<%@include file="public/WZ_WJSDJSR.inc" %>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>