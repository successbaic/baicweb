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

<script language="javascript" src="<%=request.getContextPath()%>/support/list.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/Calendar.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/window.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/value.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/valid.js"></script>

<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER"/>

<html>
<head>
<title>用户档案信息修改</title>
<style type="text/css">
.title{FONT-WEIGHT: bold; FONT-SIZE: 10.5pt; COLOR: #000099; LINE-HEIGHT: 16pt; FONT-FAMILY: 宋体}
</style>
</head>
<body>

<TABLE style="BORDER-RIGHT: #000000 1px solid; BORDER-LEFT: #000000 1px solid"
cellSpacing=0 cellPadding=0 width=778 align=center bgColor=#ffffff>
 <TR>
   <TD>
    <table width="600" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td><img src="../images/yhxx.gif" width="567" height="50"></td>
       </tr>
   </table>
<FORM name="yhxxform" id="yhxxform" action="modify_main_action.jsp" method="POST">
<p align="center" style="FONT-SIZE:10.5pt;"><STRONG><font color="#FF0000" >用户档案信息修改</font></STRONG></p>
<table width="577" border="0" align="center" cellpadding="0" cellspacing="0" 
       style="FONT-SIZE:10pt;COLOR:black;FONT-FAMILY:宋体;TEXT-DECORATION:none">
  <tr>
    <td style="color:#FF550B"><span style="color: #999999;font-weight: bold;">&nbsp;帐户信息</span></td>
  </tr>
  <tr>
    <td><img src="../images/xuline.gif" width="577" height="14"></td>
  </tr>
</table>
<table width="577"  border="0" align="center" cellpadding="6" cellspacing="1" bgcolor="#999999"  
       style="FONT-SIZE:9pt;FONT-FAMILY:宋体">
  <tr bgcolor="#B4B4B4">
    <td width="118" height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">用户名：</div>      </td>
    <td width="432" valign="middle" bgcolor="#FDFDFD">
      <input type="text" name="LOGINID"  title='用户名' maxlength=15>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">密&nbsp;&nbsp;码：</div></td>
    <td width="432" valign="middle" bgcolor="#FDFDFD">
      <div align="left">
      <a href="modify_pwd2.jsp?loginid=<%=webuser.getLOGINID() %>" style="FONT-SIZE: 9pt; FONT-FAMILY: 宋体; TEXT-DECORATION: none"><u>修改密码</U></a>
      </div>
    </td>
  </tr>
</table>
<br>
<table width="577" border="0" align="center" cellpadding="0" cellspacing="0" 
       style="FONT-SIZE:10pt;COLOR:black;FONT-FAMILY:宋体;TEXT-DECORATION:none">
  <tr>
    <td style="color:#FF550B"><span style="color: #999999;font-weight: bold;">&nbsp;用户档案信息</span></td>
  </tr>
  <tr>
    <td><img src="../images/xuline.gif" width="577" height="14"></td>
  </tr>
</table>
<table width="577"  border="0" align="center" cellpadding="6" cellspacing="1" bgcolor="#999999" 
       style="FONT-SIZE: 9pt; FONT-FAMILY: 宋体">
  
	  <tr bgcolor="#B4B4B4">
	    <td width="118" height="20" valign="middle" bgcolor="#EEEEEE" align="center">真实姓名：</td>
	    <td colspan="2" width="140" valign="middle" bgcolor="#FDFDFD">
	      <input type="text" id="USERNAME" name="USERNAME" disblank size="18" title='真实姓名' maxlength=15 onblur="checkcolumn(this.id,this.name,'真实姓名不能为空！')">&nbsp;<font color=red>*</font>
	    </td>	    
	  </tr>
	  <tr bgcolor="#FFFFFF">
	    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">密码提问问题：</div></td>
	    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
	     <input type="text" id="QUESTION" name="QUESTION" disblank size="18" title='密码提问问题' maxlength=32 onblur="checkcolumn(this.id,this.name,'密码提问问题不能为空！')">
	     &nbsp;<font color=red>*</font>
	    </td>
	  </tr>
	  		 
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">问题答案：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
     <input type="text" id="ANSWER" name="ANSWER" disblank size="18" title='问题答案' maxlength=32 onblur="checkcolumn(this.id,this.name,'问题答案不能为空！')">&nbsp;<font color=red>*</font>
	 &nbsp;<font style="FONT-SIZE:9pt;COLOR:red;FONT-FAMILY:宋体;TEXT-DECORATION:none">用于找回密码，请牢记自己的答案</font>
   </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">联系电话：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
    <input type="text" name="TEL" disblank size="18" title='联系电话' datatype="TEL" maxlength=20 onblur="checktel()">
    &nbsp;<font color=red>*</font>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">邮 编：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD"><input type="text" name="POSTALCODE" size="18" style="width:200px" maxlength=6 title='邮 编'></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">电子邮箱：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
    <input type="text" name="EMAIL" disblank size="18" style="width:200px" datatype="EMAIL" title='电子邮箱'  maxlength=30 onblur="checkemail()">
    &nbsp;<font color=red>*</font>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">用户地址：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
    <input type="text" id="ADDR" name="ADDR" disblank size="18" maxlength=35 style="width:200px" title='用户地址'  maxlength=100 onblur="checkcolumn(this.id,this.name,'用户地址不能为空！')">
    &nbsp;<font color=red>*</font>
    </td>
  </tr>
  <tr>
<td bgcolor="#EEEEEE" align="center">行政区划：</td>
<td height="20" valign="middle" bgcolor="#FFFFFF">
<select size="1" name="XZQH" style="width:200" title="行政区划" disblank>
 <option>---请选择办理业务的地市---</option>
	<%=icms.getSysDmList("XZQH")%>
</select>&nbsp;<font color=red>*</font>
</td>
</tr>  
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">证件名称：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
      <select size="1" id="CERTYPE" name="CERTYPE" disblank style="width:200" title="证件名称" onblur="checkcolumn(this.id,this.name,'证件名称不能为空！')">
        <option></option>
	    <%=icms.getSysDmList("CERTYPE")%>
</select>&nbsp;<font color=red>*</font> 
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">证件号码：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
    <input type="text" id="CERNO" name="CERNO" disblank size="18" title='证件号码' maxlength=18 onblur="checkcolumn(this.id,this.name,'证件号码不能为空！')">
    &nbsp;<font color=red>*</font>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">注册日期：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
    <input type="text" name="REGDATE" size="18" title='注册日期' disabled="disabled" maxlength=10 datatype='DATE'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="20" valign="middle" bgcolor="#EEEEEE"><div align="center">备 注：</div></td>
    <td colspan="2" valign="middle" bgcolor="#FDFDFD">
    <textarea rows="4" name="REMARK" maxlength="100" style="width:200px" title='备 注'></textarea>
  </tr>
</table>
<br>
<table width="577" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
    <div align="center">
       <input type="image" name="Submit" src="../images/dl-xg.gif" width="57" height="21" style="cursor:pointer">&nbsp;&nbsp;&nbsp;
       <img name="Back" src="../images/dl-qx.gif" width="57" height="21" style="cursor:pointer" onclick="javascript:window.close();"/>
    </div>
    </td>
  </tr>
</table>
<br>
<script language="javascript">
//公用的方法，验证输入内容不为空
function checkcolumn(columnId,columnName,message){
    var columnvalue=document.getElementById(columnId).value;
    if(columnvalue==""){
       alert(message);
       document.all.item(columnName).focus();
       return false;
    }
}
//验证联系电话
function checktel(){
   var tel=yhxxform.TEL.value;
   if(tel==""){
      alert("联系电话不能为空！");
      document.all.item("TEL").focus();
      return false;
   }else{
      var i,j,strTemp;
	  strTemp="0123456789-()#";
	  if(tel.length<6) {
	     alert("联系电话的长度应大于等于6位！");
         document.all.item("TEL").focus();
         return false;
	  };  //联系电话小于6位的，校验不通过
	  for (i=0;i<tel.length;i++) 
	  {
		j=strTemp.indexOf(tel.charAt(i));
		if (j==-1)
		{
		  alert("联系电话中含有非法字符！");
          document.all.item("TEL").focus();
          return false;
		}
	}
   }  
}
//验证email
function checkemail(){
   var email=yhxxform.EMAIL.value;
   var e_flag=0; //校验标识，0：不通过；1：通过
   if(email==""){
      alert("邮箱不能为空！");
      document.all.item("EMAIL").focus();
      return false;
   }else{
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
	    alert("邮箱格式不正确！");
        document.all.item("EMAIL").focus();
        return false;	
	}
   }
}
</script>
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>

</html>
<%	//------------提交表单赋初值---------------------  
	ValueDefault vf=new ValueDefault();
	vf.setFormName("yhxxform");
    WEB_USER.setLOGINID1(webuser.getLOGINID());
	vf.setData(WEB_USER.getData());
	vf.disableText("LOGINID");	
	out.print(vf.ValueDefaultScript());
%>
<%   //-----------提交表单输入错误检查----------------
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("yhxxform");		
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	dbc.close();
%>
