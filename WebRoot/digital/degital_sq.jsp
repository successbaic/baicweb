<%@include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>

<jsp:useBean id="DIGITAL_SQ" scope="page" class="com.macrosoft.icms.digital.DIGITAL_SQ">
</jsp:useBean>

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
function save(){
	document.getElementById('STATUS').value='0';
	if(!checkData()){
		return ;
	}
	form1.submit();
}
function tj(){
	document.getElementById('STATUS').value='1';
	if(!checkData()){
		return ;
	}
	form1.submit();
}
function checkData(){
var sucess=true;
	if(!isValidate('ENTNAME')){
		sucess=false;
		alert("��λ���Ʋ���Ϊ��");
		return sucess;
	}
	if(!isValidate('ENTREGNO')){
		sucess=false;
		alert("ע��Ų���Ϊ��");
		return sucess;
	}
	if(!isValidate('ENTFZR')){
		sucess=false;
		alert("�����˲���Ϊ��");
		return sucess;
	}
	if(!isValidate('ENTADD')){
		sucess=false;
		alert("ͨ�ŵ�ַ����Ϊ��");
		return sucess;
	}
	if(!isValidate('ENTTEL')){
		sucess=false;
		alert("��λ�绰����Ϊ��");
		return sucess;
	}
	if(!isValidate('PNAME')){
		sucess=false;
		alert("�����˲���Ϊ��");
		return sucess;
	}
	if(!isValidate('PCODE')){
		sucess=false;
		alert("���������֤����Ϊ��");
		return sucess;
	}
	if(!isValidate('PTEL')){
		sucess=false;
		alert("�����˵绰����Ϊ��");
		return sucess;
	}
	if(!isValidate('PICPATH')){
		sucess=false;
		alert("��λӡ�²���Ϊ��");
		return sucess;
	}
	if(!isValidate('SQLX')){
		sucess=false;
		alert("֤�����Ͳ���Ϊ��");
		return sucess;
	}
	if(!isValidate('YYLX')){
		sucess=false;
		alert("��ͨӦ�ò���Ϊ��");
		return sucess;
	}
	return sucess;
}
function isValidate(name){
	var val = document.getElementsByName(name)[0].value;
	if(null==val||'null'==val||''==val){
		document.getElementsByName(name)[0].focus();
		return false;
	}else{
		return true;
	}
}
</script>
<html>
<head>
<title>֤������</title>
</head>
<body>
<br/>
<form name="form1" method="POST" action='degital_sq_action.jsp' target="editframe">
<input type='hidden' name='STATUS' id='STATUS'/>
<input type='hidden' name='ID' value='<%= DIGITAL_SQ.getID() %>'>  

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
<td class="lc1">��λ���ƣ�</td><td class="lc2"><input type="text" style="width:240px" name="ENTNAME"  ><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">����ע���:</td><td class="lc2"><input type="text" style="width:240px" name="ENTREGNO"><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">�����ˣ�</td><td class="lc2"><input type="text" style="width:240px" name="ENTFZR"><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">ͨ�ŵ�ַ��</td><td class="lc2"><input type="text" style="width:240px" name="ENTADD"><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">��λ�绰��</td><td class="lc2"><input type="text" style="width:240px" name="ENTTEL"><font color='red'>*</font></td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" rowspan='2'  width='55'>������<br>����</td>
<td class="lc1">������</td><td class="lc2">
<input type="text" style="width:240px" name="PNAME" value='<%=webuser.getUSERNAME() %>'>
<font color='red'>*</font></td>
<td class="lc1">���֤�ţ�</td><td class="lc2">
<input type="text" style="width:240px" name="PCODE" value='<%=webuser.getPOSTALCODE() %>'>
<font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">��ϵ�绰:</td><td class="lc2">
<input type="text" style="width:240px" name="PTEL"  value='<%=webuser.getTEL() %>'>
<font color='red'>*</font></td>
<td class="lc1">�����ʼ�:</td><td class="lc2">
<input type="text" style="width:240px" name="EMAIL"  value='<%=webuser.getEMAIL() %>'></td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" width='55' height='155'>ӡ<br>��<br>��<br>Ϣ</td>

<td style="vertical-align:bottom">
<img name='pic' width='150' height='150' src=<%=request.getContextPath()+"/commin_upload/nopic.jpg" %>>
</img>
<br>
<input type='hidden' name='PICPATH' id='PICPATH'/>
<input type="button" onclick="openUpload()"  value='�ϴ�ӡ��'/>
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
<td class="lc1" width='55' rowspan='1'>����<br>����</td>

<td class="lc2">
֤�����ͣ�  <input type="radio" name='SQLX' value='1' checked />1���°� 
		<input type="radio" name='SQLX' value='2'/>2������   
		<input type="radio" name='SQLX' value='3'/>3������ <br>
��ͨӦ�ã�  <input type="radio" name='YYLX' value='1'  checked/>1������  
		<input type="radio" name='YYLX' value='2'/>2������ 

</td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
	<td colspan="4" align='center'>
	<INPUT  type="button" value="��  ��" class="butontType" onclick='save()'>
	<INPUT  type="button" value="��  ��" class="butontType" onclick='tj()'></td>	
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