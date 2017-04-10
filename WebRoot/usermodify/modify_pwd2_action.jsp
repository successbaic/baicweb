<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
	<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<html>
<head>
<title>修改密码情况</title>
</head>
<%
    String loginid=WEB_USER.convertCode(WEB_USER.doPreProcess(request.getParameter("LOGINID")));
    String oldpass=WEB_USER.doPreProcess(request.getParameter("OLDPWD"));
    String newpass=WEB_USER.doPreProcess(request.getParameter("NEWPWD"));
    System.out.println(loginid+"--"+oldpass+"--"+newpass);
    String str;
    oldpass=WEB_USER.doPreProcess3(WEB_USER.encryptPassword(oldpass));
    ArrayList user=WEB_USER.getList(" where LOGINID='"+loginid+"' and password="+oldpass);
    if(user.size()==0){
       str="<script language='javascript'>";
       str+="alert('您输入的原密码不正确，请重新输入！');";
       //str+="parent.document.all.item('OLDPWD').focus();";
       str+="window.history.back(-1)";
       str+="</script>";
       out.print(str); 
    }else{
       boolean p=WEB_USER.doModifyPwd(dbc,loginid,newpass);
       if(p){
          str="<script language='javascript'>";
          str+="window.location.href='modify_pwd2_success.jsp';";
          str+="</script>";
          out.print(str);
       }else{
         str="<script language='javascript'>";
         str+="alert('密码重设失败，请重试！');";
         str+="</script>";
         out.print(str);
     }
    }
%>
</html>
<%
dbc.close();
%>
