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
	
	String checkBox = "��";
    String selected = "��";
    String WTYW="�������������ע����������";
	String WTYW1="�� ����Ԥ�Ⱥ�׼   �� ����    �� ���   �� ע��    �� ����    �� ��������Ǽ�";
	String WTYW2="�� ��Ȩ���� ��������    �����    �� ע��    ���������� ����";
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>Ӫҵ��λ�Ǽ�������</title>
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
<table border="1" width="80%" align="center" height="75%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">Ӫҵ��λ�Ǽ�������</span></b><br>
	<span style="font-size: 12pt">ע������ϸ�Ķ��������顶��д˵��������Ҫ����д��</span>
	</caption>
	<!-- ������Ϣ -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(selected);%>������Ϣ</B>
				</td>
			</tr>
			<tr>
				<td align='center' height=28 nowrap="nowrap">������λ<br/>����ҵ��</td>
				<td colspan="2"><%=QYDJ_JBXX.getSUPENTNAME()%></td>
				
				<td align='center' height=28 >ע���/ͳһ<br/>������ô���</td>
				<td colspan="2"><%=QYDJ_JBXX.getSUPREGNO()%></td>
			</tr>
			<tr>
				<td align='center' height=28 width="20%" nowrap="nowrap">Ӫҵ��λ����</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=28 nowrap="nowrap">����Ԥ�Ⱥ�׼<br/>�ĺ�ע���/<br/>ͳһ������ô���</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
				
			</tr>
			<tr>
				<td width="20%" align="center" height=28 >��ַ</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>ʡ����/��������
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>�У�����/��/�����ݣ�
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> �أ�������/��/������/��/����
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>�磨������/��/�ֵ���
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>�壨·/������<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>��
				</td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >������Ӫ��</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROPROVINCE().length()==6?QYDJ_JBXX.getPROPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>ʡ����/��������
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCITY()),"center",6)%>�У�����/��/�����ݣ�
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCOUNTY()),"center",8)%> �أ�������/��/������/��/����
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROTOWN(),"center",15)%>�磨������/��/�ֵ���
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROVILLAGE(),"center",15)%>�壨·/������<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROHOUSENUMBER(),"center",5)%>��
				</td>
			</tr>
			<tr>
				<td align="center" height=28 nowrap="nowrap">��ϵ�绰</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>

				<td align="center" height=28 nowrap="nowrap">��������</td>
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
				<td align="center" height=28 colspan="6">
					<B><%out.print(checkBox);%>��ҵ</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="20%">������</td>
				<td colspan="2" align="center" ></td>
				
				<td align='center' height=28 width="20%">��ϵ�绰</td>
				<td colspan=2 align="center"></td>
			</tr>
			<tr>
				<td align='center' height=28 width="20%">�ʽ�����</td>
				<td colspan="2" align="center" ><%=SysSystem.toUnderlineStr("","center",9)%>��Ԫ</td>
				
				<td align="center" colspan=1 nowrap="nowrap">����ִ�ո�������</td>
				<td colspan=2 align="center" ><%=SysSystem.toUnderlineStr("","center",5)%>��</td>
			</tr>
			
			<tr>
			    <td align="center" height=70 nowrap="nowrap">��Ӫ��Χ</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;"><br>
					<br><br>
				</td>
			</tr> 	
			<tr>
			    <td align="center" height=30 nowrap="nowrap">���㷽ʽ</td>
				<td colspan="5" align="center">
					<%
					String CALCULATIONMETHOD=QYDJ_JBXX.getCALCULATIONMETHOD();
					String HS_DLHS=checkBox;
					String HS_FDLHS=checkBox;
					
					%>
					<%=HS_DLHS%> �������� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=HS_FDLHS%> �Ƕ������� 
				</td>
			</tr>		
		</table>
	</td>
</tr>
	<!-- ��� -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan=3>
					<B><%out.print(checkBox);%>���/����</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="20%" >���/������Ŀ</td>
				<td align="center" width="40%">ԭ���/��������</td>
				<td align="center" width="40%">����/��������</td>
			</tr>
			<% 	
				for(int i=0;i<3;i++){
					out.print("<tr><td height='28'></td><td></td><td></td></tr>");
				 }
			%>	
			</table>
		</td>
	</tr>
	<!-- ע�� -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="2">
					<B><%out.print(selected);%>ע��</B>
				</td>
			</tr>
			<tr>
				<td align="center" >ע��ԭ��</td>
				<td colspan="5" ><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 1��������ҵ����Ъҵ;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if("60".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 2��������λ��������;<br>
					&nbsp;&nbsp;&nbsp;&nbsp;<%if("50".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%>  3�����Ǽǻ���������������;
					&nbsp;&nbsp;&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 4������ԭ��<br><br>
				</td>
			</tr>
			<tr> 
				<td align="center" height=28>ծȨծ������</td>
				<td>&nbsp;
					<%if("2".equals(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%>���ܲ��Ż���������֯��������ծȨծ��
					<%if("1".equals(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> ծ���������
				</td>
			</tr>
			<tr>
				<td align="center" height=40  colspan="1" nowrap="nowrap">��˰���</td>
				<td colspan="5" nowrap="nowrap" >&nbsp;&nbsp;
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> ��������� &nbsp;&nbsp;&nbsp;&nbsp;
				<br/>&nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> δ�漰��˰����</td>
			</tr>
			<tr>
				<td align="center" height=28>�ɻع������</td>
				<td >&nbsp;
					<%if("1".equals(QYDJ_ZXXX.getCAREVST())){out.print(selected);}else{out.print(checkBox);}%> �ѽɻ� &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
					<%if("2".equals(QYDJ_ZXXX.getCAREVST())){out.print(selected);}else{out.print(checkBox);}%> δ�ɻ� 
				</td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ҵ���ա���ҵ���˵Ǽǹ���������������ҵ���˵Ǽǹ�������ʩ��ϸ�򡷼���ع涨����Ǽǣ��ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��
						<br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������ǩ�֣�
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">������λ����ҵ�����£�&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font style="float:right">
								��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							</font>
						</p> 
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<br>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>