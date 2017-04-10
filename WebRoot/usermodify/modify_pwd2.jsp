<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<script language="javascript" src="<%=request.getContextPath()%>/support/valid.js"></script>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%@ page contentType="text/html; charset=GBK"%>

<html>
<head>
<title>用户修改密码</title>
</head>
<body >
<TABLE style="BORDER-RIGHT: #000000 1px solid; BORDER-LEFT: #000000 1px solid"   
       cellSpacing=0 cellPadding=0 width=778 align=center bgColor=#ffffff> 
<TR> 
<TD vAlign=top align=left width=608 bgColor=#ffffff height="600">
  <TABLE cellSpacing=0 cellPadding=0 width=750 border=0 valign="center">
    <TBODY>
      <TR>
        <TD vAlign=top >
          <TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=0 width=750
                 align=center borderColorLight=#000000 border=0>
            <TBODY>
              <TR align=middle bgColor=#ffffff>
                <TD valign="top" height="600">
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                      <td><img src="../images/yhxx.gif" width="567" height="50"></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="top">
                        <p>&nbsp;</p>
<center>
<br>
<script>
function passform_check()
{
	if(document.passfrim.OLDPWD.value=="")
	{
		alert("原密码不能为空！");
		document.all.item("OLDPWD").focus();
		return false;
	}
	if(document.passfrim.NEWPWD.value==""){
    alert("新密码不能为空！");
    document.all.item("NEWPWD").focus();
    return false;
  }
  if(document.passfrim.NEWPWD2.value!=document.passfrim.NEWPWD.value){
    alert("两次输入的密码不一致！！");
    document.all.item("NEWPWD2").focus();
    return false; 
  }
}
</script>
<form name="passfrim" method="POST" action="modify_pwd2_action.jsp" onsubmit="javascript:return passform_check();">
<p align="center"><STRONG><span><font color="#FF0000">修改密码</font></span></STRONG></p>
<table width="350"  border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#999999" style="FONT-SIZE: 9pt; FONT-FAMILY: 宋体">
  <tr bgcolor="#B4B4B4">
    <td width="118" height="20" valign="middle" bgcolor="#EEEEEE" nowrap="nowrap"><div align="center">用户名：</div></td>
    <td valign="middle" bgcolor="#FDFDFD" colspan="2">
      <div align="left">
        <input type="text" name="LOGINID" id="LOGINID" size="20" readonly>
      </div></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center"> 原密码：</div></td>
    <td valign="middle" bgcolor="#FDFDFD" colspan="2"> <div align="left"><input type="password" name="OLDPWD" size="20"></div></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"> <div align="center">新密码：</div></td>
    <td valign="middle" bgcolor="#FDFDFD"> 
    <div align="left">
    <input type="password" name="NEWPWD" size="20" onKeyUp="checkPassword(this.value);">
    </div>
    </td>
    <td>
             <table border="0" cellpadding="0" cellspacing="0">
		       <tr>
			     <td nowrap="nowrap" valign="middle" width="80">密码强度：</td>
			     <td nowrap="nowrap" valign="top" align="left" width="90" height="19">
			     <font size="0" face="Arial, sans-serif" color="#808080">
				    <div id="passwdRating" class="STYLE13">&nbsp;</div>
			     </font></td>
		      </tr>
		      <tr>
			    <td colspan="2">
			       <table id="passwdBar" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="180">
				     <tr>
				       <td height="4" bgcolor="#e0e0e0" width="0%" id="posBar"></td>
				       <td height="4" bgcolor="#e0e0e0" width="100%" id="negBar"></td>
				     </tr>
			      </table>									
			   </td>
		     </tr>
	      </table>
          </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center"> 重新输入新密码：</div></td>
    <td valign="middle" bgcolor="#FDFDFD" colspan="2"> 
    <div align="left">
    <input type="password" name="NEWPWD2" size="20">
    </div>
    </td>
  </tr>
</table>
<br>
<br>
<table width="577" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>
    <div align="center" >
    <input type="image" name="submit" src="../images/dl-xg.gif" width="57" height="21" style="cursor:pointer;">&nbsp;&nbsp;&nbsp;
    <img src="../images/dl-qx.gif" width="57" height="21" onclick="javascript:history.back();" style="cursor:pointer;"/>&nbsp;
    </div>
   </td>
  </tr>
</table>
</form>
<br>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</center>
</td>
</tr>
</table>
</TD>
</TR>
</TBODY>
</TABLE>
</TD>
</TR>
</TBODY>
</TABLE>
</TD>
</TR>
</TABLE>

<IFRAME height="0" width="0" name="editframe" src="" id="editframe" scrolling="no" border="0" align="center" frameborder="0"></IFRAME>

</body>
</html>
<%	//------------提交表单赋初值---------------------  
	ValueDefault vf=new ValueDefault();
	vf.setFormName("passfrim");
	String logid=WEB_USER.convertCode(WEB_USER.doPreProcess(request.getParameter("loginid")));
	String str="<script language='javascript'>";
	       str+="document.getElementById('LOGINID').value='"+logid+"'";
	       str+="</script>";
	out.print(str);	
%>
