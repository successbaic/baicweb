<%@ page contentType="text/html; charset=GBK" %>
<%@ include file="../jspheader.inc"%>
<html><head><title>上传文件信息</title>
<script language="javascript">
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
function clickclose(){
   var fileObj = document.files;
   if(fileObj.file.value=="")
   {
	  return window.close();
   }else if(confirm("您填写了文件名，但没有上传。是否确认关闭？")==true){
	  return window.close();
   }
}
function clicksubmit(){
    if(form2.FILENAME.value==""){
       alert("请填写文件名称！");
       return false;
    }else if(form2.FILEDES.value==""){
       alert("请填写文件说明！");
       return false;
    }else if(form2.file.value==""){
  		alert("至少选择一个文件才能上传！");
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
		<td class='lc1'>文件名称：</td>
		<td class='lc2'>
		<input type="text" id="FILENAME" name="FILENAME" style="width:300px"/>
		<font color="#FF0000">*</font></td>
	</tr>

	<tr>
		<td class='lc1'>操作：</td>
		<td class='lc2'>	
		<input type="file" name="file" value="浏览..." onChange="return checkFileType(this);" style="width:350px">&nbsp;&nbsp;&nbsp;
		<input type="submit" name="sub1" value="添  加" onclick="clicksubmit()">
		</td>
	</tr>
	<tr>
		<td class='lc2' colspan="2">	
		<p align="left"><font color="#ff0000">说明：
		<br>&nbsp;&nbsp;&nbsp;&nbsp;1.您可以点击"浏览..."按钮，选择需要上传的文件。
		<br>&nbsp;&nbsp;&nbsp;&nbsp;2.只允许上传jpg,gif,tif,txt,word,excel,pdf格式的文件。
		<br>&nbsp;&nbsp;&nbsp;&nbsp;3.上传文件的大小不得超过10M。</font></p>
		</td>
	</tr>	
</table>
<IFRAME height="350" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align="middle"  frameborder="0"></IFRAME>
</form>
</body></html>