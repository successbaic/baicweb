<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>�ύ������Ϣ</title>
<script language="javascript">
function showSpan(v){
	var id="span_"+v;
	if(document.getElementById(id).style.display=="none"){
		document.getElementById(id).style.display="";
	}else{
		document.getElementById(id).style.display="none";
	}
}
</script>
</head>
<body>
<%@include file="/top.inc"%>
<%
StepShow stepShow= new StepShow();
String num="2";
if(Page.getOPETYPE().equals("20")){
num="1";
}
%>
<%=stepShow.getStep(num,Page.getDL()+Page.getOPETYPE(),Page.getOPENO())%>
<table width="100%" align="center" border="1">
<tr class="lc1">
<td>��Ҫ�ύ�Ĳ���</td>
<td width="60px"></td>
</tr>
<%
if(Page.getOPETYPE().equals("20")){
%>
<tr class="lc2">
<td>
��һ����������Ǽ��������
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
�����������淢����λ�͹������Ӫҵִ�ջ��߾���ͬ�ȷ���Ч���ľ�Ӫ�ʸ�֤���ļ���
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
����������������ĳ��ػ�����ʩ��ʹ��Ȩ֤�����������ػ���ʩ�Ĳ�Ȩ֤����ʹ��Э��ȡ�
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
���ģ�������������
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
���壩���ɡ�����͹��ҹ������������ֹܾ涨��Ҫ�ύ�������ļ���
</td>
<td nowrap>
</td>
</tr>
<%}else if(Page.getOPETYPE().equals("30")){
%>
<tr class="lc2">
<td>
��һ�������������Ǽ������
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
������ԭ��������Ǽ�֤��
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
���������취�ھ����涨�ģ�����������ص��ļ�
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
��Ҫ�ı仧���淢����λ�������淢���ص㼰����λ�õģ������淢����λӦ����ԭ�Ǽǻ��ؽɻء�������Ǽ�֤���������չ涨�������뻧����Ǽǡ�
</td>
<td nowrap>
</td></tr>
<%}%>
</table>
<br/> 
 <CENTER>
  <div class="subImgs" onclick="window.location.href='hwgg_control.jsp'">��һ��</div>
</CENTER> 
<%@include file="/bottom.inc"%>
</body>
</html>