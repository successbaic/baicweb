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
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();	
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	String checkBox = "��";
	String selected = "��";
	String WTYW1="�� ����Ԥ�Ⱥ�׼   �� ����    �� ���    �� ע��    �� ����    �� ��������Ǽ�";
	String WTYW2="�� ��Ȩ���� ��������    �����    �� ע��    ���������� ����";
	
	
	boolean CWFZR=false;
	boolean LLY=false;
	boolean FGSBA=false;//�ֹ�˾����
	boolean IFBA=false;
	int fzjgSize=0;
	String NEW_GD="";	//�ɶ�
	String NEW_GDMC="";  //������������������
	String NEW_LERPER="";  //����������
	List bgsxList=new ArrayList();
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//����
			temp.add("����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			DQENTNAME=bgsx.getALTBE();
		}
		if(bgsx.getALTITEM().equals("02")){//ס��
			temp.add("ס��");
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
		if(bgsx.getALTITEM().equals("30")){//Ͷ����
			NEW_LERPER = bgsx.getALTAF();
			temp.add("Ͷ����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("54")){//Ͷ���˾���
			NEW_LERPER = bgsx.getALTAF();
			temp.add("Ͷ���˾���");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("05")){//ע���ʱ�
			temp.add("Ͷ�ʶ�");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}	
		if(bgsx.getALTITEM().equals("12")){//��Ӫ��Χ
			temp.add("��Ӫ��Χ");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("08")){//��Ӫ����
			temp.add("��Ӫ����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		
		if(temp.size()!=0){
			bgsxList.add(temp);
		}
		if(bgsx.getALTITEM().equals("81") 
		|| bgsx.getALTITEM().equals("82") 
		||bgsx.getALTITEM().equals("83")){//�ֹ�˾
			FGSBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("780")){
			LLY=true;
			IFBA=true;
		}if(bgsx.getALTITEM().equals("790")){
			CWFZR=true;
			IFBA=true;
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
<html><head><title>���˶�����ҵ����Ǽ�������</title>
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
	<span style="font-size: 20pt">���˶�����ҵ�Ǽǣ�������������</span></b><br>
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
				<td align="center" height=28>��������1</td>
				<td colspan="5"> &nbsp;</td>
			</tr>
			<tr>
				<td align="center" height=28>��������2</td>
				<td colspan="5"> &nbsp;</td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>����Ԥ�Ⱥ�׼�ĺ�ע���/ͳһ������ô���</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >��ҵס��</td>
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
				<td align="center" height=28  width="15%">���ʶ�</td>
				<td align="center" colspan="2" width="35%">&nbsp; ��Ԫ</td>
				<td align="center" nowrap="nowrap" width="15%">��ҵ����</td>
				<td align="center" colspan="2" width="35%">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=70 >���ʷ�ʽ</td>
				<td align="left" colspan=5>
					&nbsp;
					<%out.print(checkBox);%>1.�Ը��˲Ʋ�����<br/>
					&nbsp;
					<%out.print(checkBox);%>2.�Լ�ͥ���вƲ���Ϊ���˳��ʡ�<br/>
					&nbsp;
					�����˵ļ�ͥ��Աǩ���� 
				</td>
			</tr>
			<tr>
			    <td align="center" height=110 >��<br>Ӫ<br>��<br>Χ</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;">
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
	<!-- ��� -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="3">
					<B><%out.print(selected);%>���</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="20%" >�����Ŀ</td>
				<td align="center" width="40%">ԭ�Ǽ�����</td>
				<td align="center" width="40%">��������</td>
			</tr>
			<% 	
				bgsxList.toArray();
			int bgsxSize = bgsxList.size();
			boolean addBgsxFlag=false;
			if(bgsxList.size()>4){
				bgsxSize = 4;
				addBgsxFlag=true;
			}
				for(int i=0;i<bgsxSize;i++){
					List temp = (List)bgsxList.get(i);
					if(temp.get(2)!=null&&temp.get(2)!=""){
					%>
					<tr>
						<td height='28' align="center" ><%=temp.get(0) %></td>
						<td align="center" ><%=temp.get(1) %></td>
						<td align="center" ><%=temp.get(2) %></td>
					</tr>
			<%		}
				 }
				if(bgsxList.size()<4){
					for(int i=bgsxList.size();i<7;i++){
						out.print("<tr><td height='28'></td><td></td><td></td></tr>");
					}
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
					<B><%if(IFBA){out.print(selected);}else{out.print(checkBox);}%>����</B>
				</td>
			</tr>
			<%
			 boolean addFzjgFlag=false;
			 String ADDFGS=checkBox;
			 String REMFGS=checkBox;
			 ArrayList fzjgList=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' AND REGULATION IN ('0','1') "); 
			 if(fzjgList.size()>0){
				 if(fzjgList.size()>1){
					 addFzjgFlag=true;
				 }
			for(int i=0;i<fzjgList.size();i++){
				 ADDFGS=checkBox;
			     REMFGS=checkBox;
				 com.macrosoft.icms.qydj.QYDJ_FZJG_SQ fzjgBa=(com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(i);
				 if(fzjgBa.getREGULATION().equals("0")){
				 	ADDFGS=selected;
				 }else if(fzjgBa.getREGULATION().equals("1")){
				 	REMFGS=selected;
				 }
			 %>
				<tr>
					<td align="center" rowspan="2">�ֹ�˾<br/><%=ADDFGS %>���� <%=REMFGS %>ע��</td>
					<td align="center" height=28>����</td>
					<td width="20%"><%=fzjgBa.getBRNAME()%></td>
					<td align="center" height=28>ע���/ͳһ<br/>������ô���</td>
					<td width="20%"><%=fzjgBa.getREGNO() %></td>
				</tr>
				<tr>
					<td align="center" height=28>�Ǽǻ���</td>
					<td ><%=fzjgBa.getREGORG() %></td>
					<td align="center">�Ǽ�����</td>
					<td><%=fzjgBa.getREGDATE() %></td>
				</tr>
			<%				 
			 }
			 }
			  else {
 			 %>
				<tr>
					<td align="center" rowspan="2">�ֹ�˾<br/><%=ADDFGS %>���� <%=REMFGS %>ע��</td>
					<td align="center" height=28>����</td>
					<td width="20%"></td>
					<td align="center" height=28>ע���</td>
					<td width="20%"></td>
				</tr>
				<tr>
					<td align="center" height=28>�Ǽǻ���</td>
					<td ></td>
					<td align="center">�Ǽ�����</td>
					<td></td>
				</tr>
			<%} %>
			
			<tr>
				<td align="center" height="28">����</td>
				<td align="center" colspan="4">
					<%
					if(CWFZR){out.print(selected);}else{out.print(checkBox);}%>��������  &nbsp;  
					<%
					if(LLY){out.print(selected);}else{out.print(checkBox);}%>����Ա &nbsp;
				</td>
			</tr>
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
				<td colspan="5" ><br>
					&nbsp;&nbsp;<%out.print(checkBox);%> Ͷ���˾�����ɢ<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> Ͷ�����������߱������������޼̳��˻��߼̳��˾��������̳�<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> ����������Ӫҵִ��<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> ���ɡ���������涨����������__________________<br>
					<br>
				</td>
			</tr>
			<tr>
				<td align="center" >��֧����<br/>ע�����</td>
				<td colspan="5" >
					
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
						&nbsp;&nbsp;&nbsp;&nbsp; ����ҵ������ط��ɷ���涨����Ǽǡ��������������ע�����ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;Ͷ����ǩ�֣�
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">��ҵ���£�&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font  style="float:left">&nbsp;&nbsp;&nbsp; Ͷ���˻�������ǩ�֣�
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
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

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
	 for (int i=4;i<bgsxList.size();i++){
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
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>


<br><br>
<%}%>
<%if(!NEW_LERPER.equals("")){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GRDZ_FZR.inc"%>
<br><br>
<%}%>

<%
if(CWFZR){
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
<p class="PageNext"><br>
<!--########### -->
<%@ include file="public/GS_WTDL.inc" %>
</body></html>