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
  	var msg = "文件格式不对！只允许上传jpg,gif,txt,pdf,tif,word和excel格式的文件以及压缩文件！";
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
		alert("单位名称不能为空");
		return sucess;
	}
	if(!isValidate('ENTREGNO')){
		sucess=false;
		alert("注册号不能为空");
		return sucess;
	}
	if(!isValidate('ENTFZR')){
		sucess=false;
		alert("负责人不能为空");
		return sucess;
	}
	if(!isValidate('ENTADD')){
		sucess=false;
		alert("通信地址不能为空");
		return sucess;
	}
	if(!isValidate('ENTTEL')){
		sucess=false;
		alert("单位电话不能为空");
		return sucess;
	}
	if(!isValidate('PNAME')){
		sucess=false;
		alert("经办人不能为空");
		return sucess;
	}
	if(!isValidate('PCODE')){
		sucess=false;
		alert("经办人身份证不能为空");
		return sucess;
	}
	if(!isValidate('PTEL')){
		sucess=false;
		alert("经办人电话不能为空");
		return sucess;
	}
	if(!isValidate('PICPATH')){
		sucess=false;
		alert("单位印章不能为空");
		return sucess;
	}
	if(!isValidate('SQLX')){
		sucess=false;
		alert("证书类型不能为空");
		return sucess;
	}
	if(!isValidate('YYLX')){
		sucess=false;
		alert("开通应用不能为空");
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
<title>证书申请</title>
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
<font size='4'>数 字 证 书 申 请 表</font>
<td>
</tr>
</table>

<table border="1" width="100%" align="center">
<tr>
<td class="lc1" rowspan='5'  width='55'>申<br>请<br>者<br>资<br>料</td>
<td class="lc1">单位名称：</td><td class="lc2"><input type="text" style="width:240px" name="ENTNAME"  ><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">工商注册号:</td><td class="lc2"><input type="text" style="width:240px" name="ENTREGNO"><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">负责人：</td><td class="lc2"><input type="text" style="width:240px" name="ENTFZR"><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">通信地址：</td><td class="lc2"><input type="text" style="width:240px" name="ENTADD"><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">单位电话：</td><td class="lc2"><input type="text" style="width:240px" name="ENTTEL"><font color='red'>*</font></td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" rowspan='2'  width='55'>经办人<br>资料</td>
<td class="lc1">姓名：</td><td class="lc2">
<input type="text" style="width:240px" name="PNAME" value='<%=webuser.getUSERNAME() %>'>
<font color='red'>*</font></td>
<td class="lc1">身份证号：</td><td class="lc2">
<input type="text" style="width:240px" name="PCODE" value='<%=webuser.getPOSTALCODE() %>'>
<font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">联系电话:</td><td class="lc2">
<input type="text" style="width:240px" name="PTEL"  value='<%=webuser.getTEL() %>'>
<font color='red'>*</font></td>
<td class="lc1">电子邮件:</td><td class="lc2">
<input type="text" style="width:240px" name="EMAIL"  value='<%=webuser.getEMAIL() %>'></td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" width='55' height='155'>印<br>章<br>信<br>息</td>

<td style="vertical-align:bottom">
<img name='pic' width='150' height='150' src=<%=request.getContextPath()+"/commin_upload/nopic.jpg" %>>
</img>
<br>
<input type='hidden' name='PICPATH' id='PICPATH'/>
<input type="button" onclick="openUpload()"  value='上传印章'/>
</td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" width='55'>声<br>明</td>
<td class="lc2">
1、本单位为申请证书而提供的资料完全真实，并愿意承担由于提供的资料虚假失实而导致的一切后果。
<br>2、本单位已认真阅读并同意遵守山东省数字证书认证管理有限公司的《山东CA数字证书用户协议》中的各项规定。
</td>
</tr>
</table>

<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" width='55' rowspan='1'>受理<br>审批</td>

<td class="lc2">
证书类型：  <input type="radio" name='SQLX' value='1' checked />1、新办 
		<input type="radio" name='SQLX' value='2'/>2、更新   
		<input type="radio" name='SQLX' value='3'/>3、其他 <br>
开通应用：  <input type="radio" name='YYLX' value='1'  checked/>1、工商  
		<input type="radio" name='YYLX' value='2'/>2、其他 

</td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
	<td colspan="4" align='center'>
	<INPUT  type="button" value="保  存" class="butontType" onclick='save()'>
	<INPUT  type="button" value="提  交" class="butontType" onclick='tj()'></td>	
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