<%@ page contentType="text/html; charset=GBK" %>
<%@ include file="../jspheader.inc"%>
<html><head><title>�ϴ��ļ���Ϣ</title>
<script language="javascript">
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
function clickclose(){
   var fileObj = document.files;
   if(fileObj.file.value=="")
   {
	  return window.close();
   }else if(confirm("����д���ļ�������û���ϴ����Ƿ�ȷ�Ϲرգ�")==true){
	  return window.close();
   }
}
function clicksubmit(){
    if(form2.FILENAME.value==""){
       alert("����д�ļ����ƣ�");
       return false;
    }else if(form2.FILEDES.value==""){
       alert("����д�ļ�˵����");
       return false;
    }else if(form2.file.value==""){
  		alert("����ѡ��һ���ļ������ϴ���");
  		return false;
  	}else{
  	    return true;
  	}
}
</script>
</head>
<body>
<%
String OPENO=request.getParameter("OPENO");
%>
<form id="form1" name="form1" method="post" ENCTYPE="multipart/form-data" action="mcgl_fjxx_action.jsp" target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<br>
<table border="1" width="100%" cellpadding="0" cellspacing="0" align="center" id="table2" rules="rows">	
	<tr>
		<td class='lc1'>�ļ����ƣ�</td>
		<td class='lc2'>
		<input type="text" id="FILENAME" name="FILENAME" style="width:300px"/>
		<font color="#FF0000">*</font></td>
	</tr>

	<tr>
		<td class='lc1'>������</td>
		<td class='lc2'>	
		<input type="file" name="file" value="���..." onChange="return checkFileType(this);" style="width:350px">&nbsp;&nbsp;&nbsp;
		<input type="submit" name="sub1" value="��  ��" onclick="clicksubmit()">
		</td>
	</tr>
	<tr>
		<td class='lc2' colspan="2">	
		<p align="left"><font color="#ff0000">˵����
		<br>&nbsp;&nbsp;&nbsp;&nbsp;1.�����Ե��"���..."��ť��ѡ����Ҫ�ϴ����ļ���
		<br>&nbsp;&nbsp;&nbsp;&nbsp;2.ֻ�����ϴ�jpg,gif,tif,txt,word,excel,pdf��ʽ���ļ���
		<br>&nbsp;&nbsp;&nbsp;&nbsp;3.�ϴ��ļ��Ĵ�С���ó���10M��</font></p>
		</td>
	</tr>	
</table>
<IFRAME height="350" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align="middle"  frameborder="0"></IFRAME>
</form>
</body></html>