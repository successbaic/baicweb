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
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<%@ page contentType="text/html; charset=GBK"%>

<html>
<head>
<title>用户修改密码成功</title>
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
<br>
<p>&nbsp;</p>
<p style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体">密码修改成功！</p>
<p>&nbsp;</p>
</center>
</td>
</tr>
<tr>
<td valign="top">
<p>&nbsp;</p>
<center>
<br>
<br>
<input type="button" value="关 闭" onclick="javascript:window.close();" name="close"/>
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
</body>
</html>
