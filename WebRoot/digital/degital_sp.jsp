<%@include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>

<jsp:useBean id="DIGITAL_SQ" scope="page" class="com.macrosoft.icms.digital.DIGITAL_SQ">
</jsp:useBean>
<%
String id =request.getParameter("id");
DIGITAL_SQ.setID(id);
DIGITAL_SQ.doSelect();
%>
<script type="text/javascript">
<!--
//-->
function checkFileType(obj){
    var path = obj.value;
  	if(path==""){
  		return false;
  	}
  	var msg = "�ļ���ʽ���ԣ�ֻ�����ϴ�jpg,gif,txt,pdf,tif,word��excel��ʽ���ļ��Լ�ѹ���ļ���";
  	var lastDotLocation = path.lastIndexOf('.');
  	if(lastDotLocation<1){
  		alert(msg);
        obj.outerHTML=obj.outerHTML.replace(/value=\w/g,'');
  		return false;
  	}
  	var fileType = path.substring(lastDotLocation+1,path.length);
  	if("rar,zip,jpg,gif,txt,doc,docx,xlsx,xls,tif,bmp,pdf,TIF,JPG,GIF,TXT,DOC,XLS,BMP,PDF".indexOf(fileType) < 0){
  		alert(msg);
  		obj.outerHTML=obj.outerHTML.replace(/value=\w/g,'');
  		return false;
  	} 	
}
function openUpload(){
	var param = window.showModalDialog("file_Upload_do.jsp");
	document.getElementsByName("PICPATH")[0].value=param;
	document.getElementsByName("pic")[0].src="<%=request.getContextPath()%>/commin_upload/"+param;
}
</script>
<html>
<head>
<title>֤������</title>
</head>
<body>
<br/>
<form name="form1" method="POST" action='degital_sq_action.jsp' target="editframe">
<input type='hidden' name='ID' value='<%= DIGITAL_SQ.getID() %>'>  
<input type='hidden' name='PICPATH' value='<%= DIGITAL_SQ.getPICPATH() %>' />   
<input type='hidden' name='SQDATE' value='<%= DIGITAL_SQ.getSQDATE() %>' />   

<table width="100%" align="center">
<tr width="100%" align="center">
<td width="100%" align="center">
<img src='degital.jpg'></img>
<font size='4'>�� �� ֤ �� �� �� ��</font>
<td>
</tr>
</table>

<table border="1" width="100%" align="center">
<tr>
<td class="lc1" rowspan='5'  width='55'>��<br>��<br>��<br>��<br>��</td>
<td class="lc1">��λ���ƣ�</td><td class="lc2">
<input type="text" style="width:240px" name="ENTNAME"  disabled value='<%=DIGITAL_SQ.getENTNAME() %>'><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">����ע���:</td><td class="lc2">
<input type="text" style="width:240px" name="ENTREGNO"  disabled value='<%=DIGITAL_SQ.getENTREGNO() %>'><font color='red'>*</font>
</td>
</tr>
<tr>
<td class="lc1">�����ˣ�</td><td class="lc2">
<input type="text" style="width:240px" name="ENTFZR" disabled value='<%=DIGITAL_SQ.getENTFZR() %>'><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">ͨ�ŵ�ַ��</td>
<td class="lc2"><input type="text" style="width:240px" name="ENTADD" disabled value='<%=DIGITAL_SQ.getENTADD() %>'><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">��λ�绰��</td><td class="lc2">
<input type="text" style="width:240px" name="ENTTEL" disabled value='<%=DIGITAL_SQ.getENTTEL() %>'><font color='red'>*</font></td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" rowspan='2'  width='55'>������<br>����</td>
<td class="lc1">������</td><td class="lc2">
<input type="text" style="width:240px" name="PNAME" disabled value='<%=DIGITAL_SQ.getPNAME() %>'>
<font color='red'>*</font></td>
<td class="lc1">���֤�ţ�</td><td class="lc2">
<input type="text" style="width:240px" name="PCODE" disabled value='<%=DIGITAL_SQ.getPCODE() %>'>
<font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">��ϵ�绰:</td><td class="lc2">
<input type="text" style="width:240px" name="PTEL" disabled value='<%=DIGITAL_SQ.getPTEL() %>'>
<font color='red'>*</font></td>
<td class="lc1">�����ʼ�:</td><td class="lc2">
<input type="text" style="width:240px" name="EMAIL"  disabled value='<%=DIGITAL_SQ.getEMAIL() %>'></td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" width='55' height='155'>ӡ<br>��<br>��<br>Ϣ</td>

<td style="vertical-align:bottom">
<img name='pic' width='150' height='150' src=<%=request.getContextPath()+"/commin_upload/"+DIGITAL_SQ.getPICPATH()%> >
</img>
<br>
<input type='hidden' name='PICPATH' id='PICPATH'/>
</td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" width='55'>��<br>��</td>
<td class="lc2">
1������λΪ����֤����ṩ��������ȫ��ʵ����Ը��е������ṩ���������ʧʵ�����µ�һ�к����
<br>2������λ�������Ķ���ͬ������ɽ��ʡ����֤����֤�������޹�˾�ġ�ɽ��CA����֤���û�Э�顷�еĸ���涨��
</td>
</tr>
</table>

<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" width='55' rowspan='2'>����<br>����</td>
<td align='center' >
<table border='1' width='90%'>
	<tr><td class="lc1" align='center'>ҵ������Ա����</td><td  class="lc1" align='center'>����ҵ������淶�������Ѿ������뵥λ�ύ��ȫ���������Ͻ�������ˡ�</td></tr>
	<tr><td class="lc1" >����Ա��<input type='text' name='ACCPTER' value='<%=webuser.getUSERNAME() %>'><br>
	             ��������:<input type="text" name="SLDATE" title="��������"   value='<%=DIGITAL_SQ.getSLDATE() %>'
	             disblank maxlength=10 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})"></font>
		  <br>
		  <input type="radio" name='STATUS' value='2'  checked = '<%="2".equals(DIGITAL_SQ.getSTATUS()) %>' />ͨ��
		  <input type="radio" name='STATUS' value='3'  checked = '<%="3".equals(DIGITAL_SQ.getSTATUS()) %>' />����
  
	</td>
	<td class="lc1">
		<textarea  name='SQYJ' cols='110' rows='6' ><%=DIGITAL_SQ.getSQYJ() %> </textarea>
	</td></tr>
</table>
</td>
</tr>
<tr>
<td class="lc2">
֤�����ͣ�  <input type="radio" name='SQLX' value='1' checked = '<%="1".equals(DIGITAL_SQ.getSQLX()) %>' />1���°� 
		<input type="radio" name='SQLX' value='2'  checked = '<%="2".equals(DIGITAL_SQ.getSQLX()) %>' />2������   
		<input type="radio" name='SQLX' value='3'  checked = '<%="3".equals(DIGITAL_SQ.getSQLX()) %>' />3������ <br>
��ͨӦ�ã�  <input type="radio" name='YYLX' value='1'  checked = '<%="1".equals(DIGITAL_SQ.getYYLX()) %>' />1������  
		<input type="radio" name='YYLX' value='2'  checked = '<%="2".equals(DIGITAL_SQ.getYYLX()) %>' />2������ 

</td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
	<td colspan="4" align='center'><INPUT name="saveinfo" id="saveinfo" type="submit" value="��  ��" class="butontType"></td>
</tr>
</table>

<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe>
</form>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();	
	out.print(ec.ErrorCheckScript());

	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
 	out.print(vf.ValueDefaultScript());
%>
</body>
</html>	