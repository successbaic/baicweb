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
</script>
<html>
<head>
<title>证书申请</title>
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
<font size='4'>数 字 证 书 审 批 表</font>
<td>
</tr>
</table>

<table border="1" width="100%" align="center">
<tr>
<td class="lc1" rowspan='5'  width='55'>申<br>请<br>者<br>资<br>料</td>
<td class="lc1">单位名称：</td><td class="lc2">
<input type="text" style="width:240px" name="ENTNAME"  disabled value='<%=DIGITAL_SQ.getENTNAME() %>'><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">工商注册号:</td><td class="lc2">
<input type="text" style="width:240px" name="ENTREGNO"  disabled value='<%=DIGITAL_SQ.getENTREGNO() %>'><font color='red'>*</font>
</td>
</tr>
<tr>
<td class="lc1">负责人：</td><td class="lc2">
<input type="text" style="width:240px" name="ENTFZR" disabled value='<%=DIGITAL_SQ.getENTFZR() %>'><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">通信地址：</td>
<td class="lc2"><input type="text" style="width:240px" name="ENTADD" disabled value='<%=DIGITAL_SQ.getENTADD() %>'><font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">单位电话：</td><td class="lc2">
<input type="text" style="width:240px" name="ENTTEL" disabled value='<%=DIGITAL_SQ.getENTTEL() %>'><font color='red'>*</font></td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" rowspan='2'  width='55'>经办人<br>资料</td>
<td class="lc1">姓名：</td><td class="lc2">
<input type="text" style="width:240px" name="PNAME" disabled value='<%=DIGITAL_SQ.getPNAME() %>'>
<font color='red'>*</font></td>
<td class="lc1">身份证号：</td><td class="lc2">
<input type="text" style="width:240px" name="PCODE" disabled value='<%=DIGITAL_SQ.getPCODE() %>'>
<font color='red'>*</font></td>
</tr>
<tr>
<td class="lc1">联系电话:</td><td class="lc2">
<input type="text" style="width:240px" name="PTEL" disabled value='<%=DIGITAL_SQ.getPTEL() %>'>
<font color='red'>*</font></td>
<td class="lc1">电子邮件:</td><td class="lc2">
<input type="text" style="width:240px" name="EMAIL"  disabled value='<%=DIGITAL_SQ.getEMAIL() %>'></td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
<td class="lc1" width='55' height='155'>印<br>章<br>信<br>息</td>

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
<td class="lc1" width='55' rowspan='2'>受理<br>审批</td>
<td align='center' >
<table border='1' width='90%'>
	<tr><td class="lc1" align='center'>业务受理员声明</td><td  class="lc1" align='center'>按照业务操作规范，本人已经对申请单位提交的全部申请资料进行了审核。</td></tr>
	<tr><td class="lc1" >受理员：<input type='text' name='ACCPTER' value='<%=webuser.getUSERNAME() %>'><br>
	             受理日期:<input type="text" name="SLDATE" title="受理日期"   value='<%=DIGITAL_SQ.getSLDATE() %>'
	             disblank maxlength=10 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})"></font>
		  <br>
		  <input type="radio" name='STATUS' value='2'  checked = '<%="2".equals(DIGITAL_SQ.getSTATUS()) %>' />通过
		  <input type="radio" name='STATUS' value='3'  checked = '<%="3".equals(DIGITAL_SQ.getSTATUS()) %>' />驳回
  
	</td>
	<td class="lc1">
		<textarea  name='SQYJ' cols='110' rows='6' ><%=DIGITAL_SQ.getSQYJ() %> </textarea>
	</td></tr>
</table>
</td>
</tr>
<tr>
<td class="lc2">
证书类型：  <input type="radio" name='SQLX' value='1' checked = '<%="1".equals(DIGITAL_SQ.getSQLX()) %>' />1、新办 
		<input type="radio" name='SQLX' value='2'  checked = '<%="2".equals(DIGITAL_SQ.getSQLX()) %>' />2、更新   
		<input type="radio" name='SQLX' value='3'  checked = '<%="3".equals(DIGITAL_SQ.getSQLX()) %>' />3、其他 <br>
开通应用：  <input type="radio" name='YYLX' value='1'  checked = '<%="1".equals(DIGITAL_SQ.getYYLX()) %>' />1、工商  
		<input type="radio" name='YYLX' value='2'  checked = '<%="2".equals(DIGITAL_SQ.getYYLX()) %>' />2、其他 

</td>
</tr>
</table>
<br>
<table border="1" width="100%" align="center">
<tr>
	<td colspan="4" align='center'><INPUT name="saveinfo" id="saveinfo" type="submit" value="保  存" class="butontType"></td>
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