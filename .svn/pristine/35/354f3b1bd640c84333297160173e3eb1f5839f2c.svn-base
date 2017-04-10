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
<%!static String loginid; //静态变量 用户名 loginid
   static String question;//静态变量 密码提示问题 question
   static String answer;  //静态变量 问题答案 answer
%>
<%
    //从modify_pwd1.jsp获取标志位flag
    String flag=WEB_USER.doPreProcess(request.getParameter("flag"));
    String str;
    //flag=1,从数据库中获取该用户的密码提示问题和问题答案(找不到该用户时提示错误),把密码提示问题显示在页面上,让用户填写答案
    if(flag.equals("1")){
      loginid=WEB_USER.doPreProcess(SysUtility.convertCode(request.getParameter("LOGINID")));
      ArrayList user=WEB_USER.getList(" where LOGINID='"+loginid+"'");
      if(user.size()==0){
         str="<script language='javascript'>";
         str+="alert('您输入的用户名不存在，请重新输入！');";
         str+="parent.document.all.item('LOGINID').focus();";
         str+="</script>";
         out.print(str);        
      }else{
         Iterator It=user.iterator();
         while(It.hasNext()){
           com.macrosoft.icms.qydj.WEB_USER webuser=(com.macrosoft.icms.qydj.WEB_USER)It.next();
           question=webuser.getQUESTION();
           answer=webuser.getANSWER();
           str="<script language='javascript'>";
           str+="parent.document.getElementById('flag').value='2';";
           str+="parent.document.getElementById('resetpwd').src='../images/resetpwd2.jpg';";
           str+="parent.document.getElementById('resetstep').innerHTML='&nbsp;第二步：请回答密保问题';";
           str+="parent.document.getElementById('step1').style.display='none';";
           str+="parent.document.getElementById('step2').style.display='';";
           str+="parent.document.getElementById('question').innerHTML='"+question+"';";              
           str+="</script>";
           out.print(str);
      }
      }   
    }
    //flag=2,根据已经从数据库中查询到的问题答案，比对用户填写的答案，一样则允许重置密码，否则提示错误
   if(flag.equals("2")){
     String youranswer=WEB_USER.doPreProcess(request.getParameter("ANSWER"));
     youranswer=new String(youranswer.getBytes("ISO-8859-1"));
     if(!youranswer.equals(answer)){
        str="<script language='javascript'>";
        str+="alert('您输入的问题答案错误！请重新输入');";
        str+="parent.document.all.item('ANSWER').focus();";
        str+="</script>";
        out.print(str);
     }else{
        str="<script language='javascript'>";
        str+="parent.document.getElementById('flag').value='3';";
        str+="parent.document.getElementById('resetpwd').src='../images/resetpwd3.jpg';";
        str+="parent.document.getElementById('resetstep').innerHTML='&nbsp;第三步：重设密码';";
        str+="parent.document.getElementById('step2').style.display='none';";
        str+="parent.document.getElementById('step3').style.display='';";
        str+="</script>";
        out.print(str);
     }
   }
   //flag=3,重置密码，更新数据库中该用户的密码，成功显示成功，失败提示
   if(flag.equals("3")){
     String password=WEB_USER.doPreProcess(request.getParameter("NEWPWD"));
     boolean p=WEB_USER.doModifyPwd(dbc,loginid,password);
     if(p){
       str="<script language='javascript'>";
       str+="parent.document.getElementById('flag').value='4';";
       str+="parent.document.getElementById('resetpwd').src='../images/resetpwd4.jpg';";
       str+="parent.document.getElementById('resetstep').innerHTML='&nbsp;第四步：操作成功';";
       str+="parent.document.getElementById('step3').style.display='none';";
       str+="parent.document.getElementById('step4').style.display='';";
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
