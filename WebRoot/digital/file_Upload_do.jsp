<%@ page contentType="text/html; charset=GBK" %>
<html><head><title>上传文件信息</title>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath() %>/support/list.js"></script>
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
    if(form1.FILENAME.value==""){
       alert("请填写文件名称！");
       return false;
    }else if(form1.file.value==""){
  		alert("至少选择一个文件才能上传！");
  		return false;
  	}else{
  	    return true;
  	}
}
function uploadSucess(param){
	window.returnValue=param;
}
</script>
</head>
<body>
<%
%>
<form id="form1" name="form1" method="post" ENCTYPE="multipart/form-data" action="file_Upload_action.jsp" target="editframe">
<br>
<table border="1" width="100%" cellpadding="0" cellspacing="0" align="center" id="table2" rules="rows">	
<input type='hidden' id='YWLX' name='YWLX' value=<%="ZSSQ" %> />
	<tr>
		<td class='lc1'>文件名称：</td>
		<td class='lc2'>
		<input type="text" id="FILENAME" name="FILENAME" disabled value='印章' style="width:300px"/>
		<font color="#FF0000">*</font>
		</td>
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
		<br>&nbsp;&nbsp;&nbsp;&nbsp;2.只允许上传jpg,gif等图片格式的文件。
		</td>
	</tr>	
</table>
<IFRAME height="350" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align="middle"  frameborder="0"></IFRAME>
</form>
</body></html>