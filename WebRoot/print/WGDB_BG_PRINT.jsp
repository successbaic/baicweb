<%@ page contentType="text/html;charset=GBK"%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
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
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//����û��Ƿ���Ȩ�޷��ʸ�ҳ��	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String PRIPID=QYDJ_JBXX.getPRIPID();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	
	String checkBox = "��";
	String selected= "��";
	String WTYW="���ƺ�׼����������������̡�ע����������������Ȩ���ʡ��������������������������ע�� �����������Ǽǡ�";
	
	String OLD_ENTNAME="";//����
	String NEW_ENTNAME="";	
	
	String NEW_DOM="";//פ�ڵ�ַ
	String OLD_DOM="";
	
	String OLD_POSTALCODE="";//��������
	String NEW_POSTALCODE="";
	
	String OLD_TEL="";//��ϵ�绰
	String NEW_TEL="";
	
	String OLD_LERPER="";//��ϯ����
	String NEW_LERPER="";
	
	String OLD_DB="";//����
	String NEW_DB="";
	
	String OLD_BUSSCOPE="";//ҵ��Χ
	String NEW_BUSSCOPE="";
	
	String OLD_OPDATETO="";//פ������
	String NEW_OPDATETO="";
	
	String OLD_FORENTNAME="";//��פ��ҵ����
	String NEW_FORENTNAME="";
	
	String OLD_FORENTADD="";//��פ��ҵ��ַ
	String NEW_FORENTADD="";
	
	boolean CWFZR=false;
	boolean LLY=false;
	boolean IFBA=false;
	boolean MCBG=false;//���Ʊ��
	boolean DBBG=false;//����/��ϯ������
	boolean DBBA=false;
	
	List bgsxList=new ArrayList();
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//����
			temp.add("����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			MCBG=true;
			DQENTNAME=OLD_ENTNAME;
		}
		if(bgsx.getALTITEM().equals("02")){//פ�ڵ�ַ
			temp.add("פ�ڵ�ַ");
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
		if(bgsx.getALTITEM().equals("22")){//��ϯ����
			temp.add("��ϯ����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			DBBG=true;
		}

		if(bgsx.getALTITEM().equals("12")){//ҵ��Χ
			temp.add("ҵ��Χ");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("08")){//פ������
			temp.add("פ������");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("150")){//��פ��ҵ����
		   temp.add("��פ��ҵ����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("151")){//��פ��ҵ��ַ
		    temp.add("��פ��ҵ��ַ");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("90")){//�������������ҵ��Ȩǩ��������
			temp.add("��Ȩǩ��������");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("91")){//�������������ҵ��ҵ������ʽ
			temp.add("��ҵ��ҵ������ʽ");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("92")){//�������������ҵ�ʱ����ʲ���
			temp.add("�������������ҵ�ʱ����ʲ���");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("93")){//�������������ҵ��Ӫ��Χ
			temp.add("�������������ҵ��Ӫ��Χ");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("94")){//����
			ArrayList dbOldList = QYDJ_RYXX_ZS.getList(" where PRIPID='"+QYDJ_JBXX.getPRIPID()+"'");
			for (int j = 0; j<dbOldList.size();j++){
				com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS dbOld=(com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS)dbOldList.get(j);
				OLD_DB+=dbOld.getNAME()+" ;  ";
			}
			  ArrayList dbNewList=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' ");  
			  for(int j=0;j<dbNewList.size();j++){
			    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ dTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)dbNewList.get(j);
			    NEW_DB+=dTable.getNAME()+" ;  ";
			    }
			
			temp.add("������Ϣ");
			temp.add(OLD_DB);
			temp.add(NEW_DB);    
			DBBA=true;
			IFBA=true;
		}
		
		if(temp.size()!=0){
			bgsxList.add(temp);
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
<html><head><title>���(����)��ҵ��פ�����������Ǽ�������</title>
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
<br/>


<table border="1" width="80%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">�������������ҵ��פ��������Ǽ�������</span></b><br>
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
				<td align="center" height=28>�����������</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>�Ǽ�֤ע���/ͳ<br/>һ������ô���</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >פ�ڳ���</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>ʡ����/��������
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>�У�����/��/�����ݣ�
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> �أ�������/��/������/��/����
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>�磨������/��/�ֵ���
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>�壨·/������<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>��
				</td>
			</tr>
			<tr>
				<td align="center" height=28 nowrap="nowrap">��ϵ�绰</td>
				<td colspan=2 width="25%" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=28 nowrap="nowrap">��������</td>
				<td colspan=2 width="25%" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>
			</tr>
		</table>
	</td>
</tr>
	<!-- ���� -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="5">
					<B><%=checkBox%>����</B>
				</td>
			</tr>
<tr>
<td align='center' height=25 style="width:15%">��ϯ��������</td>
<td colspan="4"> &nbsp;</td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">��������</td>
<td colspan="4"> &nbsp;</td>
</tr>
<tr>
<td height=100 align='center'>ҵ��Χ</td>
<td colspan="4" align='left' style="font-size:13px"> &nbsp;</td>
</tr>
<tr>
<td align='center' height=25 style="width:15%">פ������</td>
<td colspan="4" >
&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp; �� &nbsp;&nbsp; �� &nbsp;&nbsp;  ��  &nbsp; �� &nbsp;&nbsp;&nbsp; �� &nbsp;&nbsp; �� &nbsp;&nbsp; ��</td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">��׼������������</td>
<td colspan="4" > &nbsp;</td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">��׼פ������</td>
<td colspan="4" >
&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp; �� &nbsp;&nbsp; �� &nbsp;&nbsp;  ��  &nbsp; �� &nbsp;&nbsp;&nbsp; �� &nbsp;&nbsp; �� &nbsp;&nbsp; ��</td>
</tr>

<tr>
<td align='center' height=25 style="width:10%">��׼����</td>
<td style="width:20%" colspan="2"> &nbsp;</td>
<td align='center' height=25 style="width:10%">��׼�ĺ�</td>
<td style="width:20%" > &nbsp;</td>
</tr>

<tr>
<td rowspan="7" align="center" >�����������<br/>��ҵ���</td>
<td height=25 align='center'>��������</td>
<td> &nbsp;</td>
<td align='center'>��������</td>
<td> &nbsp;</td>
</tr>
<tr>
<td align='center' height=25>ס ��</td>
<td colspan="3" > &nbsp;</td>
</tr>
<tr>
<td align='center' height=25>��������</td>
<td colspan="3">&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp; �� &nbsp;&nbsp; �� &nbsp;&nbsp;  ��  &nbsp; �� &nbsp;&nbsp;&nbsp; �� &nbsp;&nbsp; �� &nbsp;&nbsp; ��</td>
</tr>

<tr>
<td align='center' height=25 nowrap>��Ȩǩ��<br/>������</td>
<td colspan="3" > &nbsp;</td>
</tr>

<tr>
<td align='center' height=25 nowrap>��ҵ����<br/>��ʽ</td>
<td colspan="3">
<%out.println("��"); %>
�������� 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%out.println("��"); %>
��������
</td>
</tr>

<tr>
<td align='center' height=25 nowrap>�ʱ�<br/>���ʲ���</td>
<td> &nbsp; &nbsp;
&nbsp;&nbsp;
����Ԫ
</td>
<td align="center">����<br/>��������</td>
<td> &nbsp;</td>
</tr>

<tr>
<td align='center' height=100 nowrap>��Ӫ��Χ</td>
<td colspan="3" align='left' style="font-size:13px"> &nbsp;</td>
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
					<B><%out.print(selected);%>���/����</B>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height=28 width="20%" >���/������Ŀ</td>
				<td align="center" colspan="2" width="40%">ԭ���/��������</td>
				<td align="center" colspan="2" width="40%">����/��������</td>
			</tr>
			<% 	
			int bgsxSize = bgsxList.size();
			boolean addBgsxFlag=false;
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
				<td align="center" width="20%">ע��ԭ��</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%> �������������ҵ�����������<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> �������פ�����޽������ټ�������ҵ��<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> �������������ҵ��ֹ<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> �������������������׼��������ر�<br>
				</td>
			</tr>
			<tr>
				<td align="center" >��˰���</td>
				<td colspan="5"  height=30>
					&nbsp;&nbsp;<%out.print(checkBox);%> ��������� 
					&nbsp;&nbsp;<%out.print(checkBox);%> δ�漰��˰����
				</td>
			</tr>
			
			<tr>
				<td align="center" >��������<br/>������</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%> �Ѱ������
					&nbsp;&nbsp;<%out.print(checkBox);%> δ�漰��������
				</td>
			</tr>
			
			<tr>
				<td align="center"  height=30>��׼����</td>
				<td colspan="5" >
				</td>
			</tr>
			
			<tr>
				<td align="center" width="20%" height=30>��׼�ĺ�</td>
				<td colspan="2" width="30%">&nbsp;</td>
				<td align="center" width="20%">��׼����</td>
				<td colspan="2" width="30%">&nbsp;</td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;������������ط��ɷ���涨����Ǽǡ��������ύ������ʵ��Ч��
						<br><br><br>
						<p ><br>
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;�������������ҵ��Ȩǩ����ǩ�֣�
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">�������ӡ�£�&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br><br>
						<p> 
							<br>
							<font style="float:right">
								��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/><br/><br>
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
	 <%
	 	if(DBBG){
	ArrayList newdbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN='1' ");
  for(int n=0;n<newdbr.size();n++){
    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)newdbr.get(n);    
%>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">�������������ҵ��פ�������<br/>��ϯ����/������Ϣ</b><br><br></caption>	
<tr>
   <td align="center" width="20%" height=50 nowrap="nowrap">��������</td>
   <td width="65%" colspan="5"><%=QYDJ_JBXX.getENTNAME() %></td>
   <td align="center" width="15%" rowspan="3">��<br>Ƭ</td>
</tr>
<tr>
	<td align="center" height=50>��������</td>
	<td><%=bTable.getNAME() %></td>
	
	<td align="center">ְ��</td>
	<td><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>

    <td align="center">����</td>
	<td><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
</tr>
<tr>	
	<td align="center"  height=50>�뾳ʱ��</td>
	<td colspan="3"><%=bTable.getARRCHDATE()%></td>
	<td align="center" height=50>��ϵ�绰</td>
	<td><%=bTable.getTEL()%></td>
</tr>
<tr>	
<td align="center"  height=50 >֤������</td>
	<td COLSPAN=3 width="45%"><%=icms.getSysDm("CERTYPE", bTable.getCERTYPE()) %></td>
    <td align="center"  height=50>֤������</td>
	<td COLSPAN=2 width="45%"><%=bTable.getCERNO()%></td>
</tr>
<tr >
	<td align="center" height=30 colspan="4">���ھ�ס��ַ</td>
	<td colspan="3"><%=bTable.getHOUADDINCHINA()%></td>
</tr>
<tr>
	<td align="center" height=30 colspan="4">����֤��Ч����</td>
	<td colspan="3">
	��
	<%=bTable.getREPCARFROM() %>		
	��
	<%=bTable.getREPCARTO() %>
	</td>
</tr>	
<tr>
 <td align="center" COLSPAN=4 height=350>��ϯ����/�������</td>
 <td align="center" COLSPAN=4 height=350><br/><br/><br/>���֤����ӡ��ճ����</td>
</tr>
<tr>
<td COLSPAN=8 >
<p align="left">
���˳�ŵ�������ڲ��õ�����ϯ����������������Σ�<br/>
 1�������й����Ұ�ȫ������ṫ�����棬���д��̷��ģ�<br/>
 2����������й����Ұ�ȫ������ṫ�������Υ��������������������Ǽǡ������Ǽ�֤���߱��йز�����������رյĴ����������ϯ���������Ա�������������������ر�֮����δ��5��ģ�<br/>
 3�����ҹ������������ֹܾ涨���������Ρ�<br/>
 <br/>
 </p>
 <p align="center">��ϯ����/����ǩ��</p>
 <br/> <br/>
</td>
</tr>
</table>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ע������ɸ�ӡ���</p>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<%	}		
}
	
	 if(!DBBA){
	ArrayList newdbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN!='1' ");
  for(int n=0;n<newdbr.size();n++){
    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)newdbr.get(n);    
%>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">�������������ҵ��פ�������<br/>��ϯ����/������Ϣ</b><br><br></caption>	
<tr>
   <td align="center" width="20%" height=50 nowrap="nowrap">��������</td>
   <td width="65%" colspan="5"><%=QYDJ_JBXX.getENTNAME() %></td>
   <td align="center" width="15%" rowspan="3">��<br>Ƭ</td>
</tr>
<tr>
	<td align="center" height=50>��������</td>
	<td><%=bTable.getNAME() %></td>
	
	<td align="center">ְ��</td>
	<td><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>

    <td align="center">����</td>
	<td><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
</tr>
<tr>	
	<td align="center"  height=50>�뾳ʱ��</td>
	<td colspan="3"><%=bTable.getARRCHDATE()%></td>
	<td align="center" height=50>��ϵ�绰</td>
	<td><%=bTable.getTEL()%></td>
</tr>
<tr>	
<td align="center"  height=30 >֤������</td>
	<td COLSPAN=3 width="45%"><%=icms.getSysDm("CERTYPE", bTable.getCERTYPE()) %></td>
    <td align="center"  height=30>֤������</td>
	<td COLSPAN=2 width="45%"><%=bTable.getCERNO()%></td>
</tr>
<tr >
	<td align="center" height=30 colspan="4">���ھ�ס��ַ</td>
	<td colspan="3"><%=bTable.getHOUADDINCHINA()%></td>
</tr>
<tr>
	<td align="center" height=30 colspan="4">����֤��Ч����</td>
	<td colspan="3">
	��
	<%=bTable.getREPCARFROM() %>		
	��
	<%=bTable.getREPCARTO() %>
	</td>
</tr>	
<tr>
 <td align="center" COLSPAN=4 height=330>��ϯ����/�������</td>
 <td align="center" COLSPAN=4 height=330><br/><br/><br/>���֤����ӡ��ճ����</td>
</tr>
<tr>
<td COLSPAN=8 >
<p align="left">
���˳�ŵ�������ڲ��õ�����ϯ����������������Σ�<br/>
 1�������й����Ұ�ȫ������ṫ�����棬���д��̷��ģ�<br/>
 2����������й����Ұ�ȫ������ṫ�������Υ��������������������Ǽǡ������Ǽ�֤���߱��йز�����������رյĴ����������ϯ���������Ա�������������������ر�֮����δ��5��ģ�<br/>
 3�����ҹ������������ֹܾ涨���������Ρ�<br/>
 </p>
 <p align="center">��ϯ����/����ǩ��</p>
 <br/> 
</td>
</tr>
</table>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ע������ɸ�ӡ���</p>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<%} 
	 }
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
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

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
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>
</body></html>