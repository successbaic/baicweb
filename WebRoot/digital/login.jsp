<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<%@ page import="java.util.*"%>
	<head>
		<title></title>
<style type="text/css">
body {
font-family: ����;
font-size: 9pt;
background-color: white;
}
input{
font-size: 9pt;
font-family: ����; 
color:black;
padding-left: 2px;
}
table {
font-family: ����;
border-collapse: collapse;
}

td {
font-size: 9pt;
border-color:#A1C3E7;
line-height: 25px;
border-left-style: none;
border-left-width: medium;
border-top-style: none;
border-top-width: medium;
}
a {font-family: ����;font-size: 9pt;text-decoration: none;line-height: 15pt;color: #000066;}
a:link {color: #000066;padding-left: 2px;}
a:visited {color: #000066;padding-left: 2px;}
a:hover {color:red;padding-left: 2px;}
.title_css {
   background-image:url(images/title.jpg);
   background-repeat:repeat-x;
   font-size:12pt;
   font-family: ����;
   color:#000080; 
   font-weight: bold;
}
</style>
</head>
<body>
<%
	//ȡ������
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR) - 1;
%>
<script type="text/javascript">
function openPass(){
	 var url="resetPassWord.jsp";
	 var iWidth=350; //���ڿ��         
	 var iHeight=400;//���ڸ߶�           
	 var iTop=(window.screen.height-iHeight)/2;           
	 var iLeft=(window.screen.width-iWidth)/2;           
	 window.showModalDialog(url,window,"dialogHeight: "+iHeight+"px; dialogWidth: "+iWidth+"px;     dialogTop: "+iTop+"; dialogLeft: "+iLeft+"; resizable: no; status: no;scroll:no");  
}
function login(){
	form1.submit();
}
</script>
<br/><br/>
<form name="form1" action="login_action.jsp" method="post">
<table width="981px" height="95%" align="center">
<tr>
<td height="83px" style="background-image:url(images/banner.jpg);"></td></tr>
  <tr>  
    <td align="center" style=" background-image:url(images/abg.GIF);background-repeat:repeat-x;" valign="top">
		<table width="981px" cellpadding="4" cellspacing="4">  
		  <tr>
			<td align="center" valign="middle" width="300px">
	<table width="270px"><tr><td>	
	<div style="position:relative;">
	<img src="images/login.png" />
	
	<div style="position:absolute; width:90px; height:32px; left: 10px; top: 70px;">  
	  <font style="font-size:15px; color:#626262">�� �� ����</font>
	 </div>
	
	<div style="position:absolute; width:90px; height:32px; left: 10px; top: 110px;">  
	  <font style="font-size:15px; color:#626262">�� &nbsp; �룺</font>
	 </div>
	 
	
	 
	 <div style="position:absolute; width:150px; height:26px; left: 85px; top: 70px;">
       <input type="text" id="QYMC" name="QYMC" onkeypress="return focusNext(this.form, 'PASSWORD', event)" style="width:149px;"/>
</div>
 <div style="position:absolute; width:150px; height:26px; left: 85px; top: 110px;">
   <input type="password" id="PASSWORD" name="PASSWORD" onKeyPress="return submitViaEnter(event)" style="width:149px;"/>
 </div>
 

 
  <div style="position:absolute; width:89px; height:32px; left: 25px; top: 160px;cursor:hand;">
  <img src="images/dl.png"id="logsub" onClick="login()"/></div>
 
  <div style="position:absolute; width:89px; height:32px; left: 140px; top: 160px;cursor:hand;">
  <img src="images/qx.png" onClick="form1.reset()"/></div>
  
  <div style="position:absolute; width:130px; height:32px; left: 80px; top: 270px;">  
  <a href="#" onclick='openPass()' style="cursor:hand;font-size:14px; color:#626262" >��������</a>
  <a href="regist_main.jsp" style="cursor:hand;font-size:14px; color:#626262" >ע��</a>
  
  </div
  
	</div>
	</td></tr>
	</table>
	</td>
    <td  align="center" width="656px" bgcolor="#FFFFFF">

		<table width="95%" bgcolor="#FFFFFF" style="border:solid;border-color:#A1C3E7;border-width:1px;">
		<tr>
		<td class="title_css" align="left">
		&nbsp;&nbsp;�� ֪��</td>
		</tr>
		<tr>
		<td align="left">
&nbsp;&nbsp;&nbsp;&nbsp;1.��һ����������֤����û���Ҫ����ע���û����û�ע�Ṧ�����û���¼���ڵ����档 <br>
&nbsp;&nbsp;&nbsp;&nbsp;2.�û�ע����ɺ���Ҫ��¼ϵͳ����д����������ҵ����Ϣ���ϴ�ӡ����Ϣ��֤�����͵ȱ����ȷ����������ύ��<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.�û���¼ϵͳ�鿴֤�����״̬�������д������Ϣ���淶�ᱻ���أ����ͨ���������ȡ֤�顣<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.����û��������룬����ͨ���û�ע��ʱ��д�����⼰���һ����룬�һ����빦���ڵ�¼���ڵ��·���</td>
		<tr>
		<td style="height: 20px;">
		</td>
		</tr>
		</table>
		<div style="height:20px;">
		
		</div>
		<table width="95%" bgcolor="#FFFFFF" style="border:solid;border-color:#A1C3E7;border-width:1px;">		
		<tr>
		<td class="title_css" align="left">
		&nbsp;&nbsp;�� �� ˵ ����</td>
		</tr><tr>	
			<td align="left">
				<a href="usermesage.doc" target="_blank"><font style="font-size:13px;">
				&nbsp;&nbsp;&nbsp;&nbsp;����֤���û�Э��</font></a>			
			</td>
		</tr>		
		<tr>
		<td style="height: 20px;">
		</td>
		</tr>						
		</table>

	</td>
	<td width="25px">
	
	</td>
  </tr>
 
</table>

		
	</td>
  </tr>
</table>
</form>
</body>
</html>
