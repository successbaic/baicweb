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
<title>�޸��������</title>
</head>
<%!static String loginid; //��̬���� �û��� loginid
   static String question;//��̬���� ������ʾ���� question
   static String answer;  //��̬���� ����� answer
%>
<%
    //��modify_pwd1.jsp��ȡ��־λflag
    String flag=WEB_USER.doPreProcess(request.getParameter("flag"));
    String str;
    //flag=1,�����ݿ��л�ȡ���û���������ʾ����������(�Ҳ������û�ʱ��ʾ����),��������ʾ������ʾ��ҳ����,���û���д��
    if(flag.equals("1")){
      loginid=WEB_USER.doPreProcess(SysUtility.convertCode(request.getParameter("LOGINID")));
      ArrayList user=WEB_USER.getList(" where LOGINID='"+loginid+"'");
      if(user.size()==0){
         str="<script language='javascript'>";
         str+="alert('��������û��������ڣ����������룡');";
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
           str+="parent.document.getElementById('resetstep').innerHTML='&nbsp;�ڶ�������ش��ܱ�����';";
           str+="parent.document.getElementById('step1').style.display='none';";
           str+="parent.document.getElementById('step2').style.display='';";
           str+="parent.document.getElementById('question').innerHTML='"+question+"';";              
           str+="</script>";
           out.print(str);
      }
      }   
    }
    //flag=2,�����Ѿ������ݿ��в�ѯ��������𰸣��ȶ��û���д�Ĵ𰸣�һ���������������룬������ʾ����
   if(flag.equals("2")){
     String youranswer=WEB_USER.doPreProcess(request.getParameter("ANSWER"));
     youranswer=new String(youranswer.getBytes("ISO-8859-1"));
     if(!youranswer.equals(answer)){
        str="<script language='javascript'>";
        str+="alert('�����������𰸴�������������');";
        str+="parent.document.all.item('ANSWER').focus();";
        str+="</script>";
        out.print(str);
     }else{
        str="<script language='javascript'>";
        str+="parent.document.getElementById('flag').value='3';";
        str+="parent.document.getElementById('resetpwd').src='../images/resetpwd3.jpg';";
        str+="parent.document.getElementById('resetstep').innerHTML='&nbsp;����������������';";
        str+="parent.document.getElementById('step2').style.display='none';";
        str+="parent.document.getElementById('step3').style.display='';";
        str+="</script>";
        out.print(str);
     }
   }
   //flag=3,�������룬�������ݿ��и��û������룬�ɹ���ʾ�ɹ���ʧ����ʾ
   if(flag.equals("3")){
     String password=WEB_USER.doPreProcess(request.getParameter("NEWPWD"));
     boolean p=WEB_USER.doModifyPwd(dbc,loginid,password);
     if(p){
       str="<script language='javascript'>";
       str+="parent.document.getElementById('flag').value='4';";
       str+="parent.document.getElementById('resetpwd').src='../images/resetpwd4.jpg';";
       str+="parent.document.getElementById('resetstep').innerHTML='&nbsp;���Ĳ��������ɹ�';";
       str+="parent.document.getElementById('step3').style.display='none';";
       str+="parent.document.getElementById('step4').style.display='';";
       str+="</script>";
       out.print(str);      
     }else{
       str="<script language='javascript'>";
       str+="alert('��������ʧ�ܣ������ԣ�');";
       str+="</script>";
       out.print(str);
     }
   }
	
%>
</html>
<%
dbc.close();
%>
