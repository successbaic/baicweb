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
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String opetype=QYDJ_JBXX.getOPETYPE();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	
	String WTYW="�������������ע����������";
	String WTYW1="�� ����Ԥ�Ⱥ�׼   �� ����    �� ���    �� ע��    �� ����    �� ��������Ǽ�";
	String WTYW2="�� ��Ȩ���� ��������    �����    �� ע��    ���������� ����";
	
	String checkBox = "��";
    String selected = "��";
    
    String sflx="";//ɾ���л����񹲺͹�ʡ��֤�е��л����񹲺͹�����

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

<br><br><br><br>
<table border="1" width="80%" align="center" height="75%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">��˾�Ǽǣ�������������</span></b><br><br>
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
				<td align="center" height=30>��    ��</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=28 nowrap="nowrap">����Ԥ�Ⱥ�׼<br/>�ĺŻ�ע���</td>
				<td colspan=5 ><%=QYDJ_JBXX.getREGNO()%></td>
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
					<B><%if("20".equals(opetype)){out.print(selected);}else{out.print(checkBox);}%>����</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%">����������<br>����</td>
				<td colspan="2" align="center" ></td>
				<td align="center" >ְ  ��</td>
				<td align="center" colspan="2" >
					<%out.print(checkBox);%>���³�
					<%out.print(checkBox);%>ִ�ж���
					<%out.print(checkBox);%>����
				</td>
			</tr>
			<tr>
				<td align="center" height=30 >ע���ʱ�</td>
				<td align="center" colspan="2"><%=SysSystem.toUnderlineStr("","center",9)%>��Ԫ</td>
				<td align="center" nowrap="nowrap">��˾����</td>
				<td align="center" colspan="2"></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=30 >������ʽ</td>
				<td align="center" colspan=5>
					<%out.print(checkBox);%>��������
					<%out.print(checkBox);%>ļ������
				</td>
			</tr>
			<tr>
			    <td align="center" height=100 >��<br>Ӫ<br>��<br>Χ</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;">
					<br><%out.print(QYDJ_JBXX.getBUSSCOPE());%><br>
				</td>
			</tr>
			<tr>
			    <td align="center" height=30 >Ӫҵ����</td>
				<td align="center" colspan="2" >
				 <% 
					out.print(checkBox);%><%=SysSystem.toUnderlineStr("","center",4)%>
					<%out.print("��");
					out.print(checkBox+"����");
					
			        %>
				</td>
				<td align="center" colspan=1 >���븱������</td>
				<td colspan=2 align="center" ><%=SysSystem.toUnderlineStr("","center",5)%>��</td>
			</tr>
 					<!-- ������Ϣ -->
 			<tr>
 				<td colspan="6">
		 			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			 			<tr>
							<td rowspan="8" width='15%' nowrap="nowrap" align='center' height=30>�ɶ�<br/>�������ˣ�</td> 
							<td align="center" width='30%' nowrap="nowrap" style="font-size:14px;" height=30>���ƻ�����</td>
							<td align="center" width='30%' style="font-size:14px;" height=30>֤�պ���</td>
							<td align="center" width='25%' style="font-size:14px;" height=30>��ע</td>
						</tr>
						<% 
						 for(int i=0;i<7;i++) 
						 {
							out.print("<tr><td height='40'></td><td></td><td></td></tr>");
						 }
						%>	
					</table>	
				</td>
 			</tr>			
		</table>
	</td>
</tr>
</table>
<p class="PageNext"><br></p>

<table border="1" width="80%" align="center" bordercolor="#000000">
			<!-- ������Ϣ��ҳ -->
	<tr>
		<td colspan="6">
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			 	<tr>
					<td rowspan="3" width='15%' nowrap="nowrap" align='center' height=30>�ɶ�<br/>�������ˣ�</td> 
					<td height=30></td><td></td><td></td>
				</tr>
				<% 
				 for(int i=0;i<2;i++) 
				 {
					out.print("<tr><td height='30'></td><td></td><td></td></tr>");
				 }
				%>	
			</table>
		</td>
	</tr>
	<!-- ��� -->
	<%
	boolean DSBA=false;//���±���
	boolean JSBA=false;//���±���
	boolean JLBA=false;//������
	boolean ZCBA=false;//�³̱���
	boolean ZCXGBA=false;//�³��޸ı���
	String NEW_QSZ_CY="";//�����鲿��--��Ա
	String NEW_QSZ_FZR="";//������
	String NEW_QSZ_TEL="";//�绰
	String NEW_QSZ_TXDZ="";//ͨѶ��ַ
	String NEW_QSZ_YZBM="";//��������
	String NEW_GD="";	//�ɶ�
	String NEW_GDMC="";  //������������������
	String NEW_LERPER="";  //����������
	boolean FGSBA=false;//�ֹ�˾����
	boolean IFBA=false;
	int fzjgSize=0;
	List bgsxList=new ArrayList();
	boolean addFzjgFlag=false;
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
	
		if(bgsx.getALTITEM().equals("10")){//�ɶ�-���ʷ�ʽ-����ʱ��
			NEW_GD = bgsx.getALTAF();
			temp.add("�ɶ�");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("160")){//������������������
			NEW_GDMC = bgsx.getALTAF();
			temp.add("������������������");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("17")){//����ʱ��
			temp.add("����ʱ��");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("15")){//���ʷ�ʽ
			temp.add("���ʷ�ʽ");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(temp.size()!=0){
			bgsxList.add(temp);
		}
		if(bgsx.getALTITEM().equals("70")){//����
			DSBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("71")){//����
			JSBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("72")){//����
			JLBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("73")){//�³�
			ZCBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("74")){//�³�������
			ZCXGBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("79")){//�������Ա
			NEW_QSZ_CY=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("84")){//�����鸺����
			NEW_QSZ_FZR=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("86")){//�����鸺����ͨѶ��ַ
			NEW_QSZ_TXDZ=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("87")){//�����鸺������ϵ�绰
			NEW_QSZ_TEL=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("81") 
		|| bgsx.getALTITEM().equals("82") 
		||bgsx.getALTITEM().equals("83")){//�ֹ�˾
			FGSBA=true;
			IFBA=true;
		}
	}
	%>
	
	
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="6">
					<B><%out.print(checkBox);%>���</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%" >�����Ŀ</td>
				<td align="center" width="40%">ԭ�Ǽ�����</td>
				<td align="center" width="40%">��������</td>
			</tr>
			<% 	
				for(int i=0;i<10;i++){
					%>
					<tr>
						<td height='30' align="center" ></td>
						<td align="center" ></td>
						<td align="center" ></td>
					</tr>
			<%
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
				<td align="center" height=30 colspan="5">
					<B><%if(IFBA){out.print(selected);}else{out.print(checkBox);}%>����</B>
				</td>
			</tr>
			 <%
			 ArrayList fzjgList=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' AND regtype='����' "); 
			 if(fzjgList.size()>0){
				 if(fzjgList.size()>1){
					 addFzjgFlag=true;
				 }
				 com.macrosoft.icms.qydj.QYDJ_FZJG_SQ fzjgBa=(com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(0);		
			 %>
				<tr>
					<td align="center" rowspan="2">����ֹ�˾</td>
					<td align="center" height=30>����</td>
					<td width="20%"><%=fzjgBa.getBRNAME()%></td>
					<td align="center" height=30>ע���</td>
					<td width="20%"><%=fzjgBa.getREGNO() %></td>
				</tr>
				<tr>
					<td align="center" height=30>�Ǽǻ���</td>
					<td ><%=fzjgBa.getREGORG()%></td>
					<td align="center">�Ǽ�����</td>
					<td><%=fzjgBa.getREGDATE() %></td>
				</tr>
			<%				 
			 } else {
 			 %>
				<tr>
					<td align="center" rowspan="2">����ֹ�˾</td>
					<td align="center" height=30>����</td>
					<td width="20%"></td>
					<td align="center" height=30>ע���</td>
					<td width="20%"></td>
				</tr>
				<tr>
					<td align="center" height=30>�Ǽǻ���</td>
					<td ></td>
					<td align="center">�Ǽ�����</td>
					<td></td>
				</tr>
			<%} %>
			<tr>
				<td align="center" rowspan="2">������</td>
				<td align="center" height="30" >��Ա</td>
				<td colspan="3"><%=NEW_QSZ_CY %></td>
			</tr>
			<tr>
				<td align="center" height=30>������</td>
				<td><%=NEW_QSZ_FZR%></td>
				<td align="center">��ϵ�绰</td>
				<td ><%=NEW_QSZ_TEL%></td>
			</tr>
			<tr>
				<td align="center" height="30">����</td>
				<td align="center" colspan="4">
					<%
					if(DSBA){out.print(selected);}else{out.print(checkBox);}%>
					����
					
					<%
					if(JSBA){out.print(selected);}else{out.print(checkBox);}%>
					����
					
					<%
					if(JLBA){out.print(selected);}else{out.print(checkBox);}%>
					����
					
					<%
					if(ZCBA){out.print(selected);}else{out.print(checkBox);}%>
					�³�
					
					<%
					if(ZCXGBA){out.print(selected);}else{out.print(checkBox);}%>
					�³�������
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
							<span class="NOPRINT" style="color:#CCCCCC">δ֪</span></font>
							
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

<%
if(!NEW_LERPER.equals("")
   ||DSBA
   ||JSBA
   ||JLBA){
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_RYXX.inc"%>
<br>
<%}%>

<%--<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FDDBR.inc"%>
<br><br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_RYXX.inc" %>
--%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%> 
<%if(addFzjgFlag){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FZJG_BG.inc"%>
<br><br>
<%}%>
</body></html>