
<%@page import="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"%><%
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
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
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
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String checkBox = "��";
	String selected= "��";
	String WTYW="���ƺ�׼�������������������ע�����������̡���Ȩ���ʡ��������������������������ע�� �����������Ǽǡ�";
	
	String NEW_DS="";
	String OLD_DS="";
	boolean TZRBA=false;//Ͷ���˱���
	boolean DSBA=false;//���±���
	boolean ZCBA=false;//�³̱���
	boolean ZCXGBA=false;//�³��޸ı���
	String ZCXZA="";//�³���������
	String NEW_FZJG="";
	String NEW_QSZ_CY="";//�����鲿��--��Ա
	String NEW_QSZ_FZR="";//������
	String NEW_QSZ_TEL="";//�绰
	String NEW_QSZ_TXDZ="";//ͨѶ��ַ
	String NEW_QSZ_ZJLX="";//֤������
	String NEW_QSZ_ZJHM="";//֤������
	String NEW_QSZ_YZBM="";//��������
	
	String NEW_WJSD_NAME="";//�ļ��ʹ��˲���--����
	String NEW_WJSD_ADDR="";//��ϵ��ַ
	String NEW_WJSD_GDTEL="";//�̶��绰
    String NEW_WJSD_YDTEL="";//�ƶ��绰
    String NEW_WJSD_EMAIL="";//��������
    String NEW_WJSD_POST="";
    String NEW_WJSD_LINKMAN="";//����Ȩ����ϵ��
    
    String NEW_QTSX="";
    
	boolean FGSBA=false;//�ֹ�˾����
	boolean IFBA=false;
	boolean MCBG=false;//���Ʊ��
	boolean DOMBG=false;//ס�����
	boolean FDDBRBG=false;//���������˱��
	boolean REGCAPBG=false;//Ͷ���ܶע���ʱ����
	boolean RECCAPBG=false;//ʵ���ʱ����
	boolean ENTTYPEBG=false;//��˾���ͱ��
	boolean BUSSCOPEBG=false;//��Ӫ��Χ���
	boolean OPDATETOBG=false;//Ӫҵ���ޱ��
	int fzjgSize=0;
	
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		
		if(bgsx.getALTITEM().equals("70")){//���¡����¡�����/ίԱ
			DSBA=true;
		}
		if(bgsx.getALTITEM().equals("73")){//�³�
			ZCBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("74")){//�³�������
			ZCXZA=bgsx.getALTAF();
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
		if(bgsx.getALTITEM().equals("131")){//�����鸺����֤������
			NEW_QSZ_ZJLX=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("132")){//�����鸺����֤������
			NEW_QSZ_ZJHM=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("87")){//�����鸺������ϵ�绰
			NEW_QSZ_TEL=bgsx.getALTAF();
			IFBA=true;
		}

		if(bgsx.getALTITEM().equals("63")){//�ļ��ʹ������
            ArrayList wjsdlist=QYDJ_WZWJSD.getList(" WHERE OPENO='"+OPENO+"'");
            if(wjsdlist.size()>0){
              com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ wjsd=(com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ)wjsdlist.get(0); 
              NEW_WJSD_NAME=wjsd.getNAME();
              NEW_WJSD_ADDR=wjsd.getADDR();
              NEW_WJSD_GDTEL=wjsd.getTEL();
              NEW_WJSD_YDTEL=wjsd.getMOBTEL();
              NEW_WJSD_EMAIL=wjsd.getEMAIL();
              NEW_WJSD_LINKMAN=wjsd.getLINKMAN();
              NEW_WJSD_POST=wjsd.getPOSTALCODE();
            }
			IFBA=true;
		}
		if((bgsx.getALTITEM().equals("81") 
		|| bgsx.getALTITEM().equals("82") 
		||bgsx.getALTITEM().equals("83"))
		&&!FGSBA){//�ֹ�˾
			ArrayList addFzjg=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' "); 
			 for (int j=0;j<addFzjg.size();j++){
			com.macrosoft.icms.qydj.QYDJ_FZJG_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)addFzjg.get(j);
			NEW_FZJG+=bTable.getBRNAME()+" ; ";
			 }
			FGSBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("99") ){
			NEW_QTSX=bgsx.getALTAF();
			IFBA=true;
		}
	}
%>
<html><head><title>����Ͷ����ҵ����������</title>
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
<br>
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">����Ͷ����ҵ����������</b>	
	<br></caption><br>
<tr><td colspan="3" align="right"  style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">ע��ţ�<%=QYDJ_JBXX.getREGNO() %></td></tr>	
</table>

<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" width="50%" height=30 colspan=3>ԭ���¡����¡�����/ίԱ</td>
	<td align="center" width="50%" height=30 colspan=3>����������¡����¡�����/ίԱ</td>
</tr>
	<%if(DSBA){
		ArrayList dsxxOldList = QYDJ_RYXX_ZS.getList(" where field002='sub02_01' and field001='"+QYDJ_JBXX.getPRIPID()+"'");
		ArrayList dsxxNewList = QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'"); 
		int listSize = dsxxOldList.size()>dsxxNewList.size()?dsxxNewList.size():dsxxOldList.size();
		for (int j = 0; j<dsxxOldList.size();j++){
			com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS gdxxOld=(com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS)dsxxOldList.get(j);
			OLD_DS+=gdxxOld.getNAME()+":"+icms.getSysDm("POSITION",gdxxOld.getPOSITION())+"<br/>";
		}
		for( int k=0; k<dsxxNewList.size();k++){
			com.macrosoft.icms.qydj.QYDJ_RYXX_SQ gdxxNew = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)dsxxNewList.get(k);
			NEW_DS+=gdxxNew.getNAME()+":"+icms.getSysDm("POSITION",gdxxNew.getPOSITION())+"<br/>";				
		}
	%>
	
	<% }%>
<tr>
	<td width="50%" align="center" height=30 colspan=3>����:ְ��</td>
	<td width="50%" align="center" height=30 colspan=3>����:ְ��</td>
</tr>
<tr>
	<td width="50%" align="center" height=90 colspan=3><%=OLD_DS%></td>
	<td width="50%" align="center" height=90 colspan=3><%=NEW_DS%></td>
</tr>
<tr>
    <td align="center" height=30 style="width:15%">�³��޸�</td>
    <td colspan="5" style="width:65%"><%=ZCXZA%></td>
  </tr>
  <tr>
    <td align="center" height=30 style="width:15%">��֧����</td>
    <td colspan="5" style="width:65%"><%=NEW_FZJG %></td>
  </tr>
  <tr>
  <td rowspan="3" style="width:15%"  align="center" height=60>�����飨�ˣ�</td>

  <td rowspan="2" style="width:15%"  align="center" height=30> ������</td>
  <td style="width:15%"  align="center" height=30>����</td>
  <td style="width:20%;"> <%=NEW_QSZ_FZR%></td>
  <td style="width:15%"  align="center" height=30>֤������</td>
  <td style="width:20%"><%=icms.getSysDm("CERTYPE",NEW_QSZ_ZJLX) %></td>
  </tr>
  <tr>
  <td  align="center" height=30>��ϵ�绰</td>
  <td><%=NEW_QSZ_TEL%></td>
  <td  align="center" height=30>֤������</td>
  <td><%=NEW_QSZ_ZJHM %></td>
  </tr>
  <tr>
  <td  align="center" height=30>��Ա����</td>
  <td colspan="4"> <%=NEW_QSZ_CY%></td>
  </tr>
  
 <%--  <tr>
    <td colspan=2 align="center" height=35>�������Ա</td>
    <td colspan="6"><%=NEW_QSZ_CY%></td>
  </tr>
  <tr>
    <td colspan=2 rowspan=2 align="center">�����鸺����</td>
    <td colspan="2" rowspan=2><%=NEW_QSZ_FZR%></td>
    <td colspan=2 align="center" height=35>ͨ�ŵ�ַ</td>
    <td colspan="2"><%=NEW_QSZ_TXDZ%></td>
  </tr>
  <tr> 
    <td colspan=2 align="center" height=35>��ϵ�绰</td>
    <td colspan=2><%=NEW_QSZ_TEL%></td>
  </tr>--%>

  <%-- <tr>
    <td rowspan=3 align="center">���Ͷ����<br>�����ļ�<br>�ļ��ʹ������</td>
    <td align="center" height=35 nowrap="nowrap">����Ȩ��<br>���ƻ�����</td>
    <td colspan=2 align="center" nowrap="nowrap">����Ȩ��<br>��ַ</td>
    <td align="center" nowrap="nowrap">����Ȩ��<br>��ϵ�绰</td>
    <td align="center" nowrap="nowrap">��������</td>
   
  </tr>--%>
  
  <tr>
  <td rowspan="3" style="width:15%"  align="center" >���Ͷ����<br>�����ļ�<br>�ʹ������</td>
  <td  align="center" height=30>����Ȩ��<br>���ƻ�����</td>
  <td colspan="4"><%=NEW_WJSD_NAME %></td>
  
  </tr>
  <tr>
  <td  align="center" height=30>����Ȩ��<br>��ַ</td>
  <td colspan="4"><%=NEW_WJSD_ADDR %></td>
  
  </tr>
  <tr>
  <td  align="center" height=30>����Ȩ��<br>�绰
  </td>
  <td colspan="2"><%=NEW_WJSD_YDTEL %></td>
  <td  align="center" height=30>��������</td>
  <td colspan="1"><%=NEW_WJSD_POST %></td>

  </tr>
<tr>
<td style="width:15%"  align="center" height=80>��������</td>
<td colspan="5"><%=NEW_QTSX %></td>
</tr>
<TR><TD COLSPAN=6>&nbsp;&nbsp;&nbsp;&nbsp;����ҵ������ط��ɷ����йع涨�������Ǽǣ��ύ������ʵ��Ч��<br><br><br>
<p align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������ǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br></p>
<p align="right">&nbsp;����˾���£�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

</TD></TR>
</table>
<P>ע������δ�г��ĵǼ�������仯�Ļ����뱸������ģ����ڡ��������������д���˱�������д�ģ��ɸ�ӡ�ձ���д��</P>

<%if(IFBA){
String DSJSJLXX="";
ArrayList ryList=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'");
for(int p=0;p<ryList.size();p++){
	com.macrosoft.icms.qydj.QYDJ_RYXX_SQ ryxxBa=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)ryList.get(p);
	if(DSJSJLXX.equals("")){
		DSJSJLXX=icms.getSysDm("POSITION",ryxxBa.getPOSITION())+"  "+ryxxBa.getNAME();
	}else{
		DSJSJLXX="��"+icms.getSysDm("POSITION",ryxxBa.getPOSITION())+"  "+ryxxBa.getNAME();
	}
}
}

%>
<%if(DSBA){ %>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_DSQK_PRINT.inc" %>
<%} %>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>

</body></html>