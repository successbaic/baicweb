<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<script language="javascript" src="<%=request.getContextPath()%>/support/valid.js"></script>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER"/>
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<%@ page contentType="text/html; charset=GBK"%>

<%String flag=WEB_USER.doPreProcess(request.getParameter("flag"));%>
<html>
<head>
<title>用户修改密码</title>
<script language=JavaScript>
//第一层(div="step1")输入:用户名,回车时触发sub1()
function ok1(){
    if(window.event.keyCode==13){
		sub1();
     }
}
//第二层(div="step2")输入:问题答案,回车时触发sub2()
function ok2(){
    if(window.event.keyCode==13){
		sub2();
     }
}
//第三层(div="step3")输入:新密码、确认密码,回车时触发sub3()
function ok3(){
    if(window.event.keyCode==13){
		sub3();
     }
}
//第一层点击”下一步“时,执行方法sub1(),flag=1
function sub1(){
   if(pwdpreform.LOGINID.value==""){
      alert("用户名不能为空！");
      document.all.item("LOGINID").focus();
      return false;
   }
   document.pwdpreform.action="modify_pwd1_action.jsp";
   document.pwdpreform.submit();
}
//第二层点击”下一步“时,执行方法sub2(),flag=2
function sub2(){
   if(pwdpreform.ANSWER.value==""){
      alert("请输入密码提问问题的答案！");
      document.all.item("ANSWER").focus();
      return false;
   }
   document.pwdpreform.action="modify_pwd1_action.jsp";
   document.pwdpreform.submit();
}
//第三层点击”下一步“时,执行方法sub3(),flag=3
function sub3(){
  if(pwdpreform.NEWPWD.value==""){
    alert("新密码不能为空！");
    document.all.item("NEWPWD").focus();
    return false;
  }
  if(pwdpreform.NEWPWD2.value!=pwdpreform.NEWPWD.value){
    alert("两次输入的密码不一致！！");
    document.all.item("NEWPWD2").focus();
    return false; 
  }
  document.pwdpreform.action="modify_pwd1_action.jsp";
  document.pwdpreform.submit();
}
</script>
</head>
<body >
<form method="POST" action="" name="pwdpreform" target="editframe" id="pwdpreform">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse;background-color: #F6F9FF;" bordercolor="#111111" width="60%" id="AutoNumber3" align=center Rules=cols>	
<tr>
   <td >
     <p style="font-family:黑体;color:blue;font-size:20px;">&nbsp;找回密码</p>
   </td>
</tr>
<tr>
    <td align="center">
    <img src="../images/resetpwd1.jpg" id="resetpwd" />
    </td>
</tr>
<tr>
   <td><br><br><input type="hidden" id="flag" name="flag" value=<%=flag%>></td>
</tr>
<tr>
  <td><label id="resetstep" style="font-family:黑体;font-size:14pt;color:blue;"></label></td>
</tr>
<tr>
  <td><br><br><br></td>
</tr>
<tr>
   <td>
    <div id="step1">
       <TABLE cellSpacing=0 cellPadding=0 width="40%" align=center border=0>
        <TBODY>
        <TR>
          <TD width="18%">用户名：</TD>
          <TD width="82%"><LABEL><INPUT onkeydown=ok1(); name="LOGINID"> </LABEL></TD>
        </TR>
        <TR>
          <TD><br></TD>
        </TR>
        <TR>
          <TD vAlign=center colSpan=2 height=100>
            <TABLE cellSpacing=0 cellPadding=0 width="70%" align=center border=0>
              <TBODY>
              <TR>
                <TD><LABEL><INPUT onclick=sub1() type=button value=下一步 name=Submit> </LABEL></TD>
                <!-- <TD><INPUT onclick="javascript:window.location.href ='../index.jsp';" type=button value=取消 name=back1></TD>-->
                <TD><INPUT onclick="javascript:window.close();" type=button value=取消 name=back1></TD>
              </TR>
              <TR>
                <TD><br><br><TD>
              </TR> 
              </TBODY>
            </TABLE>
          </TD>
        </TR>
        </TBODY>
       </TABLE>      
    </div>
    
    <div id="step2">
       <TABLE cellSpacing=0 cellPadding=0 width="40%" align=center border=0>
        <TBODY>
        <TR>
          <TD width="18%" nowrap="nowrap">密码提问问题：</TD>
          <TD width="82%"><LABEL id="question"></LABEL></TD>
        </TR>
        <TR>
          <TD width="18%" nowrap="nowrap">&nbsp;&nbsp;&nbsp;&nbsp;问题答案：</TD>
          <TD width="82%"><INPUT name="ANSWER" onkeydown=ok2();></TD>
        </TR>
        <TR>
          <TD><br></TD>
        </TR>
        <TR>
          <TD vAlign=center colSpan=2 height=100>
            <TABLE cellSpacing=0 cellPadding=0 width="70%" align=center border=0>
              <TBODY>
              <TR>
                <TD><LABEL><INPUT onclick=sub2() type=button value=下一步 name=Submit2> </LABEL></TD>
                <!--<TD><INPUT onclick="javascript:window.location.href ='../index.jsp';" type=button value=取消 name=back2></TD>-->
                <TD><INPUT onclick="javascript:window.close();" type=button value=取消 name=back2></TD> 
              </TR>
              <TR>
                <TD><br><br><TD>
              </TR> 
              </TBODY>
            </TABLE>
          </TD>
        </TR>
        </TBODY>
       </TABLE>      
    </div>
    
    <div id="step3">
       <TABLE cellSpacing=0 cellPadding=0 width="40%" align=center border=0>
        <TBODY>
        <TR>
          <TD width="18%" nowrap="nowrap">&nbsp;&nbsp;&nbsp;&nbsp;新密码：</TD>
          <TD width="70%"><LABEL><INPUT name="NEWPWD" type="password" onKeyUp="checkPassword(this.value);"></LABEL></TD>
          <TD width="12%">
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
          </TD>
        </TR>
        <TR>
          <TD width="18%" nowrap="nowrap">确认新密码：</TD>
          <TD width="70%"><LABEL><INPUT name="NEWPWD2" onkeydown=ok3(); type="password"> </LABEL></TD>
          <TD width="12%"></TD>
        </TR>
        <TR>
          <TD><br></TD>
        </TR>
        <TR>
          <TD vAlign=center colSpan=2 height=100 align="center">
            <TABLE cellSpacing=0 cellPadding=0 width="70%" align=center border=0>
              <TBODY>
              <TR>
                <TD><LABEL><INPUT onclick=sub3() type=button value=下一步 name=Submit3> </LABEL></TD>
                <!-- <TD><INPUT onclick="javascript:window.location.href ='../index.jsp';"" type=button value=取消 name=back3></TD> -->
                <TD><INPUT onclick="javascript:window.close();" type=button value=取消 name=back3></TD> 
              </TR>
              <TR>
                <TD><br><br><TD>
              </TR> 
              </TBODY>
            </TABLE>
          </TD>
        </TR>
        </TBODY>
       </TABLE>      
    </div>
    
    <div id="step4">
       <TABLE cellSpacing=0 cellPadding=0 width="40%" align=center border=0>
        <TBODY>
        <TR>
          <TD nowrap="nowrap"><p style="font-size:16px;">您已成功设定新密码，请重新登陆</p></TD>
        </TR>
        <TR>
          <TD><br></TD>
        </TR>
        <TR>
          <TD vAlign=center colSpan=2 height=100 align="center">
            <TABLE cellSpacing=0 cellPadding=0 width="70%" align=center border=0>
              <TBODY>
              <TR>
                <%-- <TD><INPUT onclick="javascript:window.location.href ='../index.jsp';" type=button value=返回登录页面 name=back4></TD>--%>
                <TD><INPUT onclick="javascript:window.close();" type=button value=返回登录页面 name=back4></TD>
              </TR>
              <TR>
                <TD><br><br><TD>
              </TR> 
              </TBODY>
            </TABLE>
          </TD>
        </TR>
        </TBODY>
       </TABLE>      
    </div>
   </td>
</tr>
	
</table>
</form>
<IFRAME height="0" width="0" name="editframe" src="" id="editframe" scrolling="no" border="0" align="center" frameborder="0"></IFRAME>

</body>
</html>
<%	//------------提交表单赋初值---------------------  
	ValueDefault vf=new ValueDefault();
	vf.setFormName("pwdpreform");
	if(flag.equals("1"))
	{		
	    String str="<script language='javascript'>";
	          str+="document.getElementById('resetstep').innerHTML='&nbsp;第一步：请输入您的用户名';";
	          str+="document.getElementById('step2').style.display='none';";
	          str+="document.getElementById('step3').style.display='none';";
	          str+="document.getElementById('step4').style.display='none';";
	          str+="</script>";
	    out.print(str);		
	}	
%>
<%   //-----------提交表单输入错误检查----------------
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("pwdpreform");		
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>