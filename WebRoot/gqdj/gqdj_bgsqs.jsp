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
<jsp:useBean id="GQDJ_JBXX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ"/>
<jsp:useBean id="GQDJ_BGSX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>

<%	
	String OPENO =GQDJ_JBXX.doPreProcess(request.getParameter("OPENO"));

	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_SQWT.doSelect();

	String checkBox = "��";
    String selected = "��";
	ArrayList list=GQDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String sALTITEM01=checkBox;
	String sALTITEM02=checkBox;
	String sALTITEM03=checkBox;
	String sALTITEM04=checkBox;
	String sALTITEM05=checkBox;
	String OLD_ENTNAME="";
	String NEW_ENTNAME="";	
	
	String OLD_REGNO="";
	String NEW_REGNO="";
	
	String OLD_EXPMOR="";
	String NEW_EXPMOR="";
	
	String OLD_EXPMORBLICNO="";
	String NEW_EXPMORBLICNO="";
	
	String OLD_IMPMOR="";
	String NEW_IMPMOR="";
	
	String OLD_IMPMORBLICNO="";
	String NEW_IMPMORBLICNO="";
	
	String OLD_EXPSHARAM="";
	String NEW_EXPSHARAM="";
	
	String OLD_PRICLASECAM="";
	String NEW_PRICLASECAM="";

	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ bgsx=(com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ)list.get(i);
		if(bgsx.getALTITEM().equals("01")){//����
			sALTITEM01=selected;
			OLD_ENTNAME=bgsx.getALTBE();
			NEW_ENTNAME=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("02")){//ע���
			sALTITEM02=selected;
			OLD_REGNO=bgsx.getALTBE();
			NEW_REGNO=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("03")){//����������
			sALTITEM03=selected;
			OLD_EXPMOR=bgsx.getALTBE();
			NEW_EXPMOR=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("05")){//������֤������
			sALTITEM03=selected;
			OLD_EXPMORBLICNO=bgsx.getALTBE();
			NEW_EXPMORBLICNO=bgsx.getALTAF();
		}
		
		if(bgsx.getALTITEM().equals("04")){//��Ȩ������
			sALTITEM04=selected;
			OLD_IMPMOR=bgsx.getALTBE();
			NEW_IMPMOR=bgsx.getALTAF();
		}

		if(bgsx.getALTITEM().equals("06")){//��Ȩ��֤������
			sALTITEM04=selected;
			OLD_IMPMORBLICNO=bgsx.getALTBE();
			NEW_IMPMORBLICNO=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("27")){//���������
			sALTITEM05=selected;
			OLD_EXPSHARAM=bgsx.getALTBE();
			NEW_EXPSHARAM=bgsx.getALTAF();
		}		

	}
%>
<html><head><title>��Ȩ���ʱ���Ǽ�������</title>
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
<table  border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<caption align="center"><b>
	<span style="font-size: 16pt">��Ȩ���ʱ���Ǽ�������</b><br><br></caption>
  <tr>
    <td align="center" height=30 width="20%" colspan="2">�������</td>
    <td align="center" width="40%">ԭ�Ǽ�����</td>
    <td align="center" width="40%">�������Ǽ�����</td>
  </tr>
  <tr>
    <td rowspan="5">�� <br />
      ��<br />
      ��<br />
    ��</td>
    <td align="left" height="30"><%=sALTITEM01 %></>��Ȩ���ڹ�˾����</td>
    <td><%=OLD_ENTNAME %></td>
    <td><%=NEW_ENTNAME %></td>
  </tr>
  <tr>
    <td align="left" height=30><%=sALTITEM02 %>��Ȩ���ڹ�˾ע���</td>
    <td><%=OLD_REGNO %></td>
    <td><%=NEW_REGNO %></td>
  </tr>
  <tr>
    <td align="left" height=30><%=sALTITEM03 %>���������������ƣ���֤�պ��룺</td>
    <td><%=OLD_EXPMOR %><br><%=OLD_EXPMORBLICNO %></td>
    <td><%=NEW_EXPMOR %><br><%=NEW_EXPMORBLICNO %></td>
  </tr>
  <tr>
    <td align="left" height=30><%=sALTITEM04 %>��Ȩ�����������ƣ�
    ��֤�պ��룺 </td>
    <td><%=OLD_IMPMOR %><br><%=OLD_IMPMORBLICNO %></td>
    <td><%=NEW_IMPMOR %><br><%=NEW_IMPMORBLICNO %></td>
  </tr>
  <tr>
    <td align="left" height=30><%=sALTITEM05 %>���ʹ�Ȩ����	            </td>
    <td><%=OLD_EXPSHARAM %>��Ԫ/��� </td>
    <td><%=NEW_EXPSHARAM %>��Ԫ/���</td>
  </tr>
  <tr>
    <td>�걨<br />
    ����</td>
    <td>������ծȨ����	</td>
    <td colspan="2">��Ԫ</td>
  </tr>
  <tr>
    <td>��<br />
      ��<br />
      ��<br />
      ��<br />
    ��</td>
    <td colspan="3">��Ȩ���Ѷ�������Ȩ����Ҫ��飬����Ը��������Ϊ���ʱ�ġ�<br />
      �����������Ȩ���ʵǼǣ�����֪�������ݣ�<br />
      1.������Ӧ����������ϵ���ʵ�ԡ���Ȩ��ͬ�ĺϷ�����Ч�Ը���<br />
      2.���ʹ�Ȩ���ڹ�˾Ϊ�������ι�˾���߹�Ȩδ��֤ȯ�Ǽǽ�������ǼǵĹɷ����޹�˾��<br />
      3.���ʹ�ȨӦ������������ת�õĹ�Ȩ����Ȩ��������δ������Ժ�������ᡣ<br />
      4.���ʹ�Ȩ���ڹ�˾Ϊ�������ι�˾�ģ���˾Ӧ�����ɶ��������������Ƽ�����ʶ���˾�Ǽǻ��صǼǣ��Ǽ����������ģ�Ӧ���������Ǽǡ�δ���Ǽǻ��߱���Ǽǵģ����öԿ������ˡ�<br />
      5.�ɷݹ�˾���ý��ܱ���˾�Ĺ�Ʊ��Ϊ��ѺȨ�ı�ġ�<br />
      6.��˾Ϊ�����ṩ���������չ�˾�³̵Ĺ涨���ɶ��»���߹ɶ��ᡢ�ɶ������飻��˾�³̶Ե������ܶ��������������޶�涨�ģ����ó����涨���޶��˾Ϊ��˾�ɶ�����ʵ�ʿ������ṩ�����ģ����뾭�ɶ�����߹ɶ������顣<br />
    ���ύ����ʵ������Υ�����ɡ���������͹�˾�³̵���ع涨�������ľ��þ��׺ͷ������Σ��������˸���<br /></td>
  </tr>
</table>
<table width="800">
  <tr>
    <td >&nbsp;</td>
    <td align="right" height=50>������ǩ�֣����£�</td>
    <td align="right" height=50>��Ȩ��ǩ�֣����£�</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" height=46>&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</td>
    <td align="right" height=46>&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</td>
  </tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="../public/gqdj_sqwtsqs.inc" %>
</body>
</html>