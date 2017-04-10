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

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath()%>/support/list.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/Calendar.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/window.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/value.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/valid.js"></script>

<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%
//取当前时间
	java.util.Date date=new java.util.Date();
	int Years=date.getYear()+1900;
	int Months=date.getMonth()+1;
	int Days=date.getDate();
	String DATE = Years+"-"+Months+"-"+Days;	
%>

<html>
<head>
<title>用户注册情况</title>
<%
String YWLX=WEB_USER.doPreProcess(request.getParameter("YWLX"));
%>
</head>
<body>
<form method="POST" action="regist_action.jsp" name="form1" target="editframe" id="form1">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="500" id="AutoNumber3" align=center Rules=rows>	
	<caption>数字证书用户注册</caption>

<tr>
	<td class="lc1"  width="30%">用户名：</td>
	<td class="lc2">		
	 <input type="text" name="LOGINID" size="25" style="width:200px" disblank title='用户名' maxlength=15 onblur="findloginid()">&nbsp;<font color=red>*</font></td>
	 <input type="hidden" name="u_flag" id="u_flag" value="0"/>
	<td class="lc2" >
        <img src="../images/blank.gif" id="imgName" />
        <label id="nameres" style="background-color: #F6F9FF;"></label>       		
	</td>
</tr>
<tr>
	<td class="lc1">真实姓名：</td>
	<td class="lc2">
	<input type="text" name="USERNAME" size="25" style="width:200px"  disblank title='真实姓名' maxlength=15>&nbsp;<font color=red>*</font></td>
    <td class="lc2"></td>
</tr>		
<tr>
	<td class="lc1">用户密码：</td>
	<td class="lc2">
	<input type="password" name="PASSWORD" size="25" style="width:200px" disblank title='用户密码' maxlength=12 onKeyUp="checkPassword(this.value);">&nbsp;<font color=red>*</font></td>
    <td class="lc2">
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
<tr>
	<td class="lc1">确认密码：</td>
	<td class="lc2">
	<input type="password" name="PASSWORDCONFORM" size="25" style="width:200px" disblank title='确认密码' maxlength=12 onblur="checkpasswd()" datatype="PWCONFORM">&nbsp;<font color=red>*</font></td>
    <td class="lc2"><label id="passres" style="background-color: #F6F9FF;"></label> </td>
</tr>

<tr>
	<td class="lc1">密码提问问题：</td>
	<td class="lc2">
	<input type="text" name="QUESTION" size="25" style="width:200px" disblank title='密码提问问题' maxlength=32>&nbsp;<font color=red>*</font></td>
    <td class="lc2">用于找回密码，请牢记自己的问题</td>
</tr>

<tr>
	<td class="lc1">问题答案：</td>
	<td class="lc2">
	<input type="text" name="ANSWER" size="25" style="width:200px" disblank title='问题答案' maxlength=32>&nbsp;<font color=red>*</font></td>
    <td class="lc2">用于找回密码，请牢记自己的答案</td>
</tr>
<tr>
	<td class="lc1">联系电话：</td>
	<td class="lc2">
	<input type="text" name="TEL" size="25" style="width:200px" disblank title='联系电话' datatype="TEL" maxlength=20 onblur="checktel()">&nbsp;<font color=red>*</font></td>
    <td class="lc2"><label id="telres" style="background-color: #F6F9FF;"></label> </td>
</tr>
<tr>
	<td class="lc1">邮 编：</td>
	<td class="lc2"><input type="text" name="POSTALCODE" size="25" style="width:200px" maxlength=6 title='邮 编'>&nbsp;</td>
    <td class="lc2"></td>
</tr>
<tr>
	<td class="lc1">电子邮箱：</td>
	<td class="lc2"><input type="text" name="EMAIL" size="25" disblank style="width:200px"  datatype="EMAIL" title='电子邮箱'  maxlength=30 onblur="checkemail()">&nbsp;<font color=red>*</font></td>
    <td class="lc2"><label id="mailres" style="background-color: #F6F9FF;"></label></td>
</tr>
<tr>
	<td class="lc1">用户地址：</td>
	<td class="lc2"><input type="text" name="ADDR" size="25" style="width:200px" title='用户地址'  maxlength=70>&nbsp;</td>
    <td class="lc2"></td>
</tr>
<tr>
<td class="lc1"  maxlength="20">证件名称</td>
<td class="lc2" >
<select size="1" name="CERTYPE" style="width:200" title="证件名称" disblank>
 <option></option>
	<%=icms.getSysDmList("CERTYPE")%>
</select>&nbsp;<font color=red>*</font>
</td>
<td class="lc2"></td>
</tr>  
<tr>
	<td class="lc1">证件号码：</td>
	<td class="lc2"><input type="text" name="CERNO" size="25" style="width:200px" title='证件号码'  maxlength=18 disblank onblur="checkcerno()" datatype='CERNO'>&nbsp;<font color=red>*</font></td>
    <td class="lc2"><label id="cernores" style="background-color: #F6F9FF;"></label></td>
</tr>
<tr>
	<td class="lc1">注册日期：</td>
	<td class="lc2"><input type="text" name="REGDATE" size="25" style="width:200px" title='注册日期' maxlength=10 datatype='DATE'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" disblank>&nbsp;<font color=red>*</font></td>
    <td class="lc2"></td>
</tr>
<tr>
	<td class="lc1">备 注：</td>
	<td class="lc2">
	<textarea rows="4" name="REMARK"  style="width:200px" title='备 注'></textarea></td>
    <td class="lc2"></td>
</tr>

<tr>
	<td colspan="4" class="fc">
	<p align="center"><input type="submit" value="提  交" name="sub" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">&nbsp; &nbsp;

&nbsp;&nbsp;<input type='button' value='关  闭' onClick="javascript:window.close();" name="close" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">

</td>
</tr>	
</table>
</form>
<IFRAME height="0" width="0" name="editframe" src="" id="editframe" scrolling="no" border="0" align="center" frameborder="0"></IFRAME>
<script language="javascript">
//验证用户名不能为空，不能重复
function findloginid(){
   var loginid=form1.LOGINID.value;
   if(loginid==""){
      document.getElementById("nameres").innerHTML="用户名不能为空！";
      //document.all.item("LOGINID").focus();
      return false;
   }
   if(checkTextEng(form1.LOGINID)){
   		document.frames["hiddenframe"].location="../support/checklogid.jsp?LOGINID="+form1.LOGINID.value;
   }else{
   		document.getElementById("nameres").innerHTML="用户名不能使用汉字！";
   		return false;
   } 
}
//验证确认密码要与密码内容一致
function checkpasswd(){
   var passwd1=form1.PASSWORD.value;
   var passwd2=form1.PASSWORDCONFORM.value;
   if(passwd2!=passwd1){
      document.getElementById("passres").innerHTML="密码不一致！";
      //document.all.item("PASSWORDCONFORM").focus();
      return false;
   }else{
     document.getElementById("passres").innerHTML="";
   }
}
//验证联系电话
function checktel(){
   var tel=form1.TEL.value;
   if(tel!=""){
   //   document.getElementById("telres").innerHTML="联系电话不能为空！";
   //   document.all.item("TEL").focus();
   //   return false;
   //}else{
      var i,j,strTemp;
	  strTemp="0123456789-()#";
	  if(tel.length<6) {
	     document.getElementById("telres").innerHTML="联系电话的长度应大于等于6位！";
         //document.all.item("TEL").focus();
         return false;
	  };  //联系电话小于6位的，校验不通过
	  for (i=0;i<tel.length;i++) 
	  {
		j=strTemp.indexOf(tel.charAt(i));
		if (j==-1)
		{
		  document.getElementById("telres").innerHTML="联系电话中含有非法字符！";
          //document.all.item("TEL").focus();
          return false;
		}
	}
	document.getElementById("telres").innerHTML="";
   //}
   }  
}
//验证email
function checkemail(){
   var email=form1.EMAIL.value;
   var e_flag=0; //校验标识，0：不通过；1：通过
   if(email!=""){
   //   document.getElementById("mailres").innerHTML="邮箱不能为空！";
   //   document.all.item("EMAIL").focus();
   //   return false;
   //}else{
     var i=email.length;
	 var temp = email.indexOf('@');
	 var tempd = email.indexOf('.');
	 if (temp > 1) 
	  {
		if ((i-temp) > 3) 
		{
			if (tempd!=-1) 
			{
				e_flag=1;
			}
		}
	}
	if(e_flag==0){
	    document.getElementById("mailres").innerHTML="邮箱格式不正确！";
        //document.all.item("EMAIL").focus();
        return false;	
	}
	if(e_flag==1){
	    document.getElementById("mailres").innerHTML="";
	}	
   }
}
//验证身份证号
function checkcerno(){
    var certype=form1.CERTYPE.value;
    var cerno=form1.CERNO.value;
    var myDate = new Date();
    if(certype=="1"){//只验证身份证号
      //身份证只能是15或18位
      if(cerno.length!=15&&cerno.length!=18){
         document.getElementById("cernores").innerHTML="身份证号长度应为15位或18位！";
         //document.all.item("CERNO").focus();
         return false;
      }else if(cerno.length==15){//15位身份证依次验证年份、月份、日期是否正确
         var year=cerno.substr(6,2);
         var month=cerno.substr(8,2);
         var day=cerno.substr(10,2);
         //依次校验年份位、月份位、日      
         if(year<'00'||year >'99'||month<'01'||month >'12'||day<'01'||day >'31'){
           document.getElementById("cernores").innerHTML="身份证号中出生日期不正确！";
           //document.all.item("CERNO").focus();
           return false;
         }        
      }else if(cerno.length==18){//18位身份证号码
         var birthday=cerno.substr(6,8);
         if(myDate.getMonth()+1<10)//当前月份小于10月，前边加0凑成2位表示的月份
         {
            var nowdate=myDate.getFullYear()+"0"+(myDate.getMonth()+1)+""+myDate.getDate();
         }else{
            var nowdate=myDate.getFullYear()+""+(myDate.getMonth()+1)+""+myDate.getDate();
         }
         //校验出生日期是否正确      
         if(birthday<'19000101'||birthday>nowdate){
           document.getElementById("cernores").innerHTML="身份证号中出生日期不正确！";
           //document.all.item("CERNO").focus();
           return false;
         } 
      }
    }
	document.getElementById("cernores").innerHTML="";   
}
function checkLoginInfo(){
   var loginid=form1.LOGINID.value;
   if(loginid==""){
      alert("用户名不能为空！");     
      return false;
   }
   if(checkTextEng(form1.LOGINID)){
   		return true;
   }else{
   		alert("用户名不能使用汉字！");
   		return false;
   } 
}
</script>
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>

</html>
<%	//------------提交表单赋初值---------------------  
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	if(YWLX.equals("1"))
	{
		vf.setFormData("REGDATE",DATE);		
	}	
	if(YWLX.equals("2"))
	{
		WEB_USER.setLOGINID1(webuser.getLOGINID());
		vf.setData(WEB_USER.getData());
		vf.disableText("LOGINID");
	}	
	out.print(vf.ValueDefaultScript());
%>
<%   //-----------提交表单输入错误检查----------------
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("checkLoginInfo()");
	ec.FormErrorCheck();	
	
	ec.uflagCheck("用户名已被使用，请更改！");
	out.print(ec.ErrorCheckScript());
%>
<%
	dbc.close();
%>
