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
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
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
	String opetype=QYDJ_JBXX.getOPETYPE();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	
	String WTYW="�������������ע����������";
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
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE->�ļ�->ҳ������"�н�"ҳü"���)</font>

<%
 ArrayList fddbr_SL=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN='1'");  
 String NAME_SL="",TEL_SL="",POSITION_SL="",APPOUNIT_SL="",CERTYPE_SL="",CERNO_SL=""; 
 if(fddbr_SL.size()>0){
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)fddbr_SL.get(0);
 NAME_SL=bTable.getNAME();
 TEL_SL =bTable.getTEL();
 POSITION_SL=bTable.getPOSITION();
 APPOUNIT_SL=bTable.getAPPOUNIT();
 CERTYPE_SL=bTable.getCERTYPE();
 CERNO_SL=bTable.getCERNO();
 }
%>
<%
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");	
	boolean ZGBM=false;
	boolean ZCBA=false;//�³̱���
	boolean ZCXGBA=false;//�³��޸ı���
	boolean IFBA=true;
	boolean LLY=false;
	boolean CWFZR=true;
	String NEW_LERPER="";
	List bgsxList=new ArrayList();
	boolean addBgsxFlag=false;
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//�ֹ�˾����
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
		if(bgsx.getALTITEM().equals("13")){//��Ӫ����
			temp.add("��Ӫ����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("03")){//����������
			NEW_LERPER = bgsx.getALTAF();
			temp.add("����������");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("04")){//��������==��ҵ����
			temp.add("��������");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("05")){//ע���ʱ�
			temp.add("ע���ʱ�");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("08")){//��Ӫ����
			temp.add("��Ӫ����");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("12")){//��ɾ�Ӫ��Ŀ
			temp.add("��Ӫ��Χ");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("55")||bgsx.getALTITEM().equals("56")
		   ||bgsx.getALTITEM().equals("57")||bgsx.getALTITEM().equals("58")){//���ܲ���(������)����--����--
			ZGBM=true;
			IFBA=true;
		}
		if(temp.size()!=0){
			bgsxList.add(temp);
		}
		if(bgsx.getALTITEM().equals("73")){//�³�
			ZCBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("74")){//�³�������
			ZCXGBA=true;
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
	%>
<br>
<table border="1" width="80%" align="center" height="75%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">�ǹ�˾��ҵ���˵Ǽǣ�������������</span></b><br><br>
	<span style="font-size: 12pt">ע������ϸ�Ķ��������顶��д˵��������Ҫ����д��</span>
	</caption>
	<!-- ������Ϣ -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=46 colspan="6">
					<B><%out.print(selected);%>������Ϣ</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=46>��    ��</td>
				<td colspan="5"><%=DQENTNAME%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=46 nowrap="nowrap">����Ԥ�Ⱥ�׼��<br/>��/ע���/ͳһ<br/>������ô���</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=46 >ס    ��</td>
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
				<td align="center" height=46 nowrap="nowrap">��ϵ�绰</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=46 nowrap="nowrap">��������</td>
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
				<td align="center" height=46 colspan="6">
					<B><%out.print(checkBox);%>��ҵ</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=46 width="20%">����������</td>
				<td colspan="2" align="center" width="25%"></td>
				<td align="center" >ְ  ��</td>
				<td align="center" colspan="2" width="25%"></td>
			</tr>
			<tr>
				<td align="center" height=46 >ע���ʽ�</td>
				<td align="center" colspan="2"><%=SysSystem.toUnderlineStr("","center",9)%>��Ԫ</td>
				<td align="center" nowrap="nowrap">��������</td>
				<td align="center" colspan="2"></td>
			</tr>
			<tr>
			    <td align="center" height=46 >Ӫҵ����</td>
				<td align="center" colspan="2" >
				 <% 
					out.print(checkBox);%><%=SysSystem.toUnderlineStr("","center",5)%><%out.print("��");%>
					<%
					out.print(checkBox+"����");
					
			        %>
				</td>				<td align="center" >���븱������</td>
				<td colspan=2 align="center" ><%=SysSystem.toUnderlineStr("","center",5)%>��</td>
			</tr>

			<tr>
			    <td align="center" height=220 >��Ӫ��Χ</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;"><br>
					<br><br><br><br>
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

<p class="PageNext"><br></p>

<table border="1" width="80%" align="center" bordercolor="#000000">
	
	<!-- ��� -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="5">
					<B><%out.print(selected);%>���</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%" >�����Ŀ</td>
				<td align="center" width="40%" colspan=2>ԭ�Ǽ�����</td>
				<td align="center" width="40%" colspan=2>��������</td>
			</tr>
			<% 	
				bgsxList.toArray();
				for(int i=0;i<bgsxList.size();i++){
					List temp = (List)bgsxList.get(i);
					%>
					<tr>
						<td height='30' align="center" ><%=temp.get(0) %></td>
						<td align="center" colspan=2><%=temp.get(1) %></td>
						<td align="center" colspan=2><%=temp.get(2) %></td>
					</tr>
			<%
				 }
				if(bgsxList.size()<9){
					for(int i=bgsxList.size();i<9;i++){
						out.print("<tr><td height='30'></td><td colspan=2></td><td colspan=2></td></tr>");
					}
				}
			 boolean addFzjgFlag=false;
			 ArrayList fzjgList=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' AND (REGULATION in ('0','1')) "); 
			 if(fzjgList.size()>0){
				 if(fzjgList.size()>1){
					 addFzjgFlag=true;
				 }
				 com.macrosoft.icms.qydj.QYDJ_FZJG_SQ fzjgBa=(com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(0);		
			 %>	
			 <tr>
				<td align="center" height=60 rowspan="2">��֧����</td>
				<td align="center" width="15%">����</td>
				<td align="center">����</td>
				<td align="center">�Ǽǻ���</td>
				<td align="center">�Ǽ�����</td>
			</tr>
			<tr>
				<td align="center"><%=fzjgBa.getBRNAME()%></td>
				<td align="center"><%if(fzjgBa.getREGTYPE().equals("0")){out.print(selected);}else{out.print(checkBox);} %>���� &nbsp;<%if(fzjgBa.getREGTYPE().equals("1")){out.print(selected);}else{out.print(checkBox);} %>�Ƿ���</td>
				<td align="center"><%=fzjgBa.getREGORG() %></td>
				<td align="center"><%if(fzjgBa.getREGULATION().equals("0")){out.print(selected);}else{out.print(checkBox);} %>���� &nbsp;<%if(fzjgBa.getREGULATION().equals("1")){out.print(selected);}else{out.print(checkBox);} %>����</td>
			</tr>
			 <%				 
			 } else {
 			 %>
			<tr>
				<td align="center" height=60 rowspan="2">��֧����</td>
				<td align="center" width="15%">����</td>
				<td align="center">����</td>
				<td align="center">�Ǽǻ���</td>
				<td align="center">�Ǽ�����</td>
			</tr>
			<tr>
				<td align="center"></td>
				<td align="center"><%out.print(checkBox); %>���� &nbsp;&nbsp;<%out.print(checkBox); %>�Ƿ���</td>
				<td align="center"></td>
				<td align="center"><%out.print(checkBox); %>���� &nbsp;&nbsp;<%out.print(checkBox); %>����</td>
			</tr>
			<%} %>
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
			 ArrayList czxxList=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
			 if(czxxList.size()>0){
				 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ czxxBa=(com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)czxxList.get(0);		
			 %>	
			<tr>
				<td align="center" rowspan="4" nowrap="nowrap">���ܲ���<br>�������ˣ�</td>
				<td align="center" height=30>����</td>
				<td colspan=3 width="60%"><%=czxxBa.getINV() %></td>
			</tr>
			<tr>
				<td align="center" height=30>��������</td>
				<td colspan=3><%=icms.getSysDm("INVTYPE",czxxBa.getINVTYPE()) %></td>
			</tr>
			<tr>
				<td align="center" height=30>�Ǽǻ���</td>
				<td colspan=3><%=czxxBa.getINVPERAREA() %></td>
			</tr>
			<tr>
				<td align="center" height=30>֤�պ���</td>
				<td colspan=3><%=czxxBa.getCERNO()+czxxBa.getBLICNO() %></td>
			</tr>
			<%} else { %>
			<tr>
				<td align="center" rowspan="4" nowrap="nowrap">���ܲ���<br>�������ˣ�</td>
				<td align="center" height=30>����</td>
				<td colspan=3 width="60%"></td>
			</tr>
			<tr>
				<td align="center" height=30>��������</td>
				<td colspan=3></td>
			</tr>
			<tr>
				<td align="center" height=30>�Ǽǻ���</td>
				<td colspan=3></td>
			</tr>
			<tr>
				<td align="center" height=30>֤�պ���</td>
				<td colspan=3></td>
			</tr>
			<%} %>
			<tr>
				<td align="center" height="30">�³�</td>
				<td align="center">
					<%if(ZCBA){out.print(selected);}else{out.print(checkBox);}%>�³� &nbsp;
					<%if(ZCXGBA){out.print(selected);}else{out.print(checkBox);} %>�³�������    
				</td>
				<td align="center" height="28">����</td>
				<td align="center">
					<%if(CWFZR){out.print(selected);}else{out.print(checkBox);}%>�������� &nbsp;
					<%if(LLY){out.print(selected);}else{out.print(checkBox);}%>����Ա    
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
						&nbsp;&nbsp;&nbsp;&nbsp;����ҵ���ա���ҵ���˵Ǽǹ���������������ҵ���˵Ǽǹ�������ʩ��ϸ�򡷼���ع涨����Ǽǡ��������ύ������ʵ��Ч��
						<br><br><br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�齨�����ˣ��򷨶������ˣ�ǩ�֣� 
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right"> ��ҵ���˸��£�&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font style="float:right">
								��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p> 
						<br/><br/>
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
<%if(!NEW_LERPER.equals("")){%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FDDBR.inc"%>
<%} %>
<br>
<%if(addFzjgFlag){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/NZFR_FZJG_BG.inc"%>
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
<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>