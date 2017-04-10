<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<%@ page import="java.util.*"%>	
	<%
	//取年检年份
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR) - 1;
%>
	<head>
<title>密码找回</title>
<LINK href="css/globle.css" type="text/css" rel="stylesheet">

<script language="javascript" src="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/list.js"></script>
<script language="javascript" src="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/Calendar.js"></script>
<script language="javascript" src="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/window.js"></script>
<script language="javascript" src="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/value.js"></script>
<script language="javascript" src="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/valid.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript">
function getValue(param){
	return document.getElementById(param).value;
}
/*通过异步传输XMLHTTP发送参数到ajaxServlet，返回符合条件的XML文档*/ 
function doSub(){ 
var url = '<%=request.getContextPath() %>'+"/digital/doResetPassword.jsp?&username="+getValue("username")
			+"&question="+getValue("question") 			
			+"&answer="+getValue("answer");
			
  if (window.XMLHttpRequest){ 
   req = new XMLHttpRequest(); 
  }else if (window.ActiveXObject) 
  { 
   req = new ActiveXObject("Microsoft.XMLHTTP"); 
  } 
  if(req) 
  { 
   req.open("GET",url, true); 
   req.onreadystatechange = complete; 
   req.send(null); 
  } 
} 
/*分析返回的XML文档*/ 
function complete(){ 
  if (req.readyState == 4) 
  { 
   if (req.status == 200){ 
    var password = req.responseText;
     document.getElementById("password").innerHTML="<center><font color='red'>原密码:"+password+"</font></center>"; 
   } 
  } 
} 
function getQuestion(){
var url = '<%=request.getContextPath() %>'+"/digital/doResetPassword.jsp?&username="+getValue("username")
			+"&opt=getQuestion";
			
  if (window.XMLHttpRequest){ 
   req = new XMLHttpRequest(); 
  }else if (window.ActiveXObject) 
  { 
   req = new ActiveXObject("Microsoft.XMLHTTP"); 
  } 
  if(req) 
  { 
   req.open("GET",url, true); 
   req.onreadystatechange = getComplete; 
   req.send(null); 
  } 
}
function getComplete(){ 
  if (req.readyState == 4) 
  { 
   if (req.status == 200){ 
    var question = req.responseText;
     document.getElementById("question").value=question; 
   } 
  } 
} 
</script>	
		


</head>
<body>
<form name="form1" action="doResetPassword.jsp" method="post">
<table width="100%" height="100%" align="center" border="1">
		<tr height='15px'>
			<td align="center" colspan='2'  class="lc1">
  				<label>密码找回
  				</label>
  			</td>
		</tr>
		<tr height='15px'>
			<td  class="lc1">用户名：</td>
			<td  class="lc2">
			       <input type="text" id="username" name="username" onchange='getQuestion()' />
			       <font color='red'>*</font>
			</td>
		</tr>
		<tr height='15px'>
			<td class="lc1">问题：</td>
			<td class="lc2">
			       <input type="text" id="question" name="question"/>
			       <font color='red'>*</font>     
			</td>
		</tr>
		<tr height='15px'>
			<td class="lc1">回答：</td>
			<td class="lc2">
			       <input type="text" id="answer" name="answer" />
		   		   <font color='red'>*</font>
			</td>
		</tr>
		
		<tr height='15px'>
			<td align="center" colspan='2' class="lc1">
  				<input type=button value="确 &nbsp; 定" onclick="doSub()">
  			</td>
		</tr>
		<tr>
			<td  align="center" colspan='2' id='password' class="lc2"><font color='red'></font>
			</td>
		</tr>
	</table>
</form>
</table>
</form>
</body>
</html>
