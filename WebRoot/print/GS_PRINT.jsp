<%@ page contentType="text/html;charset=GBK"%>
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
<%@ page import="com.macrosoft.icms.util.TwoDimensionCode" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String opetype=QYDJ_JBXX.getOPETYPE();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	

	MCGL_JBXX_ZS.setNAMEID(QYDJ_JBXX.getPRIPID());
	MCGL_JBXX_ZS.doSelect();
	String WH=MCGL_JBXX_ZS.getAPPRNO();

//	String WTYW="�������������ע����������";
	String WTYW1="�� ����Ԥ�Ⱥ�׼   �� ����    �� ���    �� ע��    �� ����    �� ��������Ǽ�";
	String WTYW2="�� ��Ȩ���� ��������    �����    �� ע��    ���������� ����";

	String checkBox = "��";
    String selected = "��";
    
    String sflx="";//ɾ���л����񹲺͹�ʡ��֤�е��л����񹲺͹�����
    
    TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>��˾�Ǽǣ�������������</title>
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
<table border="1" width="80%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">��˾�Ǽǣ�������������</span></b><br>
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
				<td align="center" height=28>��    ��</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>����Ԥ�Ⱥ�׼�ĺ�ע���/ͳһ������ô���</td>
				<td colspan=5 ><%=WH%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >ס    ��</td>
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
					<B><%if("20".equals(opetype)){out.print(selected);}else{out.print(checkBox);}%>����</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=50>����������<br>����</td>
				<td colspan="2" align="center" ><%=QYDJ_JBXX.getLEREP()%></td>
				<td align="center" >ְ  ��</td>
				<td align="center" colspan="2" >
				<%
					String sl1=checkBox,sl2=checkBox,sl3=checkBox;
					if("431A".equals(QYDJ_JBXX.getPOSITION()) || "431B".equals(QYDJ_JBXX.getPOSITION())){
						sl1=selected;
					}else if("432K".equals(QYDJ_JBXX.getPOSITION())){
						sl2=selected;
					}else if("434Q".equals(QYDJ_JBXX.getPOSITION()) || "434R".equals(QYDJ_JBXX.getPOSITION()) || "436A".equals(QYDJ_JBXX.getPOSITION())){
						sl3=selected;
					}else if ("410A".equals(QYDJ_JBXX.getPOSITION())){
						sl1=selected;
						sl3=selected;
					}else if ("410C".equals(QYDJ_JBXX.getPOSITION())){
						sl2=selected;
						sl3=selected;
					}
				%>
				<%=sl1%>���³�
				<%=sl2%>ִ�ж���
				<%=sl3%>����
				</td>
			</tr>
			<tr>
				<td align="center" height=28 >ע���ʱ�</td>
				<td align="center" colspan="2"><%=SysSystem.toUnderlineStr(QYDJ_JBXX.getREGCAP()+"","center",9)%>��Ԫ</td>
				<td align="center" nowrap="nowrap">��˾����</td>
				<td align="center" colspan="2"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=28 >������ʽ<br/>���ɷݹ�˾��д��</td>
				<td align="center" colspan=5>
					<%if("01".equals(QYDJ_JBXX.getINSFORM())){out.print(selected);}else{out.print(checkBox);}%>��������
					<%if("07".equals(QYDJ_JBXX.getINSFORM())){out.print(selected);}else{out.print(checkBox);}%>ļ������
				</td>
			</tr>
			<tr>
			    <td align="center" height=100 >��<br>Ӫ<br>��<br>Χ</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;">
					<br><%out.print(QYDJ_JBXX.getBUSSCOPE());%><br>
				</td>
			</tr>
			<tr>
			    <td align="center" height=28 >Ӫҵ����</td>
				<td align="center" colspan="2">
				 <% String yyqx=(String)QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getOPDATETO());
				 if("����".equals(yyqx)){
					out.print(checkBox);%><%=SysSystem.toUnderlineStr("","center",4)%><%out.print("��");%>
					<%
					out.print(selected+"����");
				 }else {
					 if("".equals(yyqx)){
						 out.print(checkBox);%><%=SysSystem.toUnderlineStr("","center",4)%><%out.print("��");%>
							<%
							out.print(selected+"����");
					 }else{
						 out.print(selected);%><%=SysSystem.toUnderlineStr(yyqx,"center",4)%><%out.print("��");%>
							<%
							out.print(checkBox+"����");
					 }
				 }
			        %>
				</td>
				<td align="center" >���븱������</td>
				<td colspan=2 align="center" ><%=SysSystem.toUnderlineStr(QYDJ_JBXX.getCOPYNUM()+"","center",5)%>��</td>
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
					<B><%out.print(checkBox);%>���</B>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height=28 width="20%" >�����Ŀ</td>
				<td align="center" colspan="2" width="40%">ԭ�Ǽ�����</td>
				<td align="center" colspan="2" width="40%">��������</td>
			</tr>
			<% 	
				for(int i=0;i<7;i++){
					out.print("<tr><td height='28' colspan='2'></td><td colspan='2'></td><td colspan='2'></td></tr>");
				 }
			%>	
			</table>
		</td>
	</tr>
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
				<td align="center" height=28>ע���/ͳһ������ô���</td>
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
				<td align="center" height="28" >��Ա</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td align="center" height=28>������</td>
				<td></td>
				<td align="center">��ϵ�绰</td>
				<td ></td>
			</tr>
			<tr>
				<td align="center" height="28">����</td>
				<td align="center" colspan="4">
					<%out.print(checkBox); %>����  &nbsp;   
					<%out.print(checkBox); %>����  &nbsp;   
					<%out.print(checkBox); %>����  &nbsp;   
					<%out.print(checkBox); %>�³�  &nbsp;   
					<%out.print(checkBox); %>�³�������  &nbsp;   
					<%out.print(checkBox); %>��������  &nbsp;  
					<%out.print(checkBox); %>����Ա &nbsp;
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
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;����˾���ա���˾����������˾�Ǽǹ�����������ع涨����Ǽǡ��������ύ������ʵ��Ч��
						ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;����������ǩ�֣�
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">��˾���£�&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font  style="float:left">&nbsp;&nbsp;&nbsp;�������鸺���ˣ�ǩ�֣�
							<span class="NOPRINT" style="color:#CCCCCC"></span></font>
							
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
<br>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FDDBR.inc"%>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_RYXX.inc" %>


<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_CZXX.inc" %>

<p class="PageNext"><br>
<%@include file="public/GS_CWFZR.inc" %>
<p class="PageNext"><br>
<%@include file="public/GS_LLY.inc" %>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>