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
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
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
	
	String DQENTNAME =QYDJ_JBXX.getENTNAME();
	String checkBox = "��";
    String selected = "��";
     String WTYW1="�� ����Ԥ�Ⱥ�׼   �� ����    �� ���    �� ע��    �� ����    �� ��������Ǽ�";
	String WTYW2="�� ��Ȩ���� ��������    �����    �� ע��    ���������� ����";
	
	
	boolean CWFZR=false;
	boolean LLY=false;
	boolean addBgsxFlag=false;
	String NEW_LERPER="";  //�� �� ��
	List bgsxList=new ArrayList();
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//����
			temp.add("����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			DQENTNAME=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("02")){//��Ӫ����
			temp.add("��Ӫ����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("50")){//�绰
			temp.add("�绰");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("69")){//�ʱ�
			temp.add("�ʱ�");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("12")){//ҵ��Χ
			temp.add("ҵ��Χ");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("03")){//������
			temp.add("������");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			NEW_LERPER = bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("081")){//��Ӫ������
			temp.add("��Ӫ������");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(temp.size()!=0){
			bgsxList.add(temp);
		}
		
		if(bgsx.getALTITEM().equals("780")){
			LLY=true;
		}if(bgsx.getALTITEM().equals("790")){
			CWFZR=true;
		}
	}
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>ũ��רҵ�������֧��������Ǽ�������</title>
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
	<span style="font-size: 18pt">ũ��רҵ�������֧�����Ǽǣ�������������</span></b><br>
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
				<td width="20%" align="center" height=50>����Ԥ�Ⱥ�׼��<br/>��ע���/ͳһ<br/>������ô���</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >��Ӫ����</td>
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
					<B><%out.print(checkBox);%>����</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28>����������</td>
				<td colspan="5" align="left" >&nbsp;</td>
			</tr>
			<tr>
			    <td align="center" height=30 nowrap="nowrap">���㷽ʽ</td>
				<td colspan="5" align="center">
					<%
					String HS_DLHS=checkBox;
					String HS_FDLHS=checkBox;
					%>
					<%=HS_DLHS%> �������� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=HS_FDLHS%> �Ƕ������� 
				</td>
			</tr>	
			<tr>
			    <td align="center" height=260 >��<br>Ӫ<br>��<br>Χ</td>
				<td colspan="6" align="left" class="tdprint" valign="top" style="font-size:13px;">
					<br>&nbsp;<br>
				</td>
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
				bgsxList.toArray();
			int bgsxSize = bgsxList.size();
			if(bgsxList.size()>6){
				bgsxSize = 6;
				addBgsxFlag=true;
			}
				for(int i=0;i<bgsxSize;i++){
					List temp = (List)bgsxList.get(i);
					if(temp.get(2)!=null&&temp.get(2)!=""){
					%>
					<tr>
						<td height='28' align="center" colspan="2"><%=temp.get(0) %></td>
						<td align="center" colspan="2"><%=temp.get(1) %></td>
						<td align="center" colspan="2"><%=temp.get(2) %></td>
					</tr>
			<%		}
				 }
				if(bgsxList.size()<6){
					for(int i=bgsxList.size();i<6;i++){
						out.print("<tr><td height='28' colspan='2'></td><td colspan='2'></td><td colspan='2'></td></tr>");
					}
				}
			%>	
			</table>
	</td>		
	</tr>		
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="6">
					<B><%out.print(checkBox);%>ע��</B>
				</td>
			</tr>
			<tr>
				<td align="center" >ע��ԭ��</td>
				<td colspan="5" height="250px">
						
				</td>
			</tr>
			<tr>
				<td align="center" >��˰���</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%> ��������� 
					&nbsp;&nbsp;<%out.print(checkBox);%> δ�漰��˰����
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
						&nbsp;&nbsp;&nbsp;&nbsp;�������������֧���������������ע���Ǽǣ��ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ϢΪ�����ṩ����������Ϣ����Ϣ��ʵ����Ч��
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;����������ǩ�֣�
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						</p>
						<br><br>
						<p> 
							<font  style="float:left">&nbsp;&nbsp;&nbsp;�����鸺����ǩ����
							<span class="NOPRINT" style="color:#CCCCCC"></span></font>
							<br/>
							<br/>
							<font  style="float:right">ũ��רҵ��������£�&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
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

<br>
<%
if(!NEW_LERPER.equals("")){
%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZSFZ_FZR.inc"%>
<%}if(CWFZR){
%>
<p class="PageNext"><br>
<%@include file="public/GS_CWFZR.inc" %>
<%
}
if(LLY){
%>
<p class="PageNext"><br>
<%@include file="public/GS_LLY.inc" %>
<%
}
%>
<%--if(addFzjgFlag){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FZJG_BG.inc"%>
<br><br>
<%}--%>
<%if(addBgsxFlag){%>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="80%" bordercolor='#000000'>
	<caption><p align="center"><b>
		<span style="font-size: 16pt">���������Ϣ</b><br><br>
	</caption>	
<tr>    
	<td align='center' width='15%' nowrap="nowrap" style="font-size:14px;">�����Ŀ</td>
	<td align="center" width='30%' height="30" style="font-size:14px;">ԭ�Ǽ�����</td>
	<td align="center" width='30%' height="30" style="font-size:14px;">��������</td>
</tr>

	<%
	int bgsxNo=0;
	 for (int i=6;i<bgsxList.size();i++){
		 List temp = (List)bgsxList.get(i);
		//	if(temp.get(2)!=null&&temp.get(2)!=""){
			%>
			<tr>
				<td height='30' align="center" ><%=temp.get(0) %></td>
				<td align="center" ><%=temp.get(1) %></td>
				<td align="center" ><%=temp.get(2) %></td>
			</tr>
			<% 
		//	}
 }

 while (bgsxNo<15) 
 {
	out.print("<tr><td height='30'></td><td></td><td></td></tr>");
	bgsxNo++;
 }
%>	
</table>
<br>


<br><br>
<%}%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>