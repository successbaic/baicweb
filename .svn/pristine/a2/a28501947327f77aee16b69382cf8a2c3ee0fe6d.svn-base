<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id='MCGL_JBXX' scope='page' class='com.macrosoft.icms.gsnw.MCGL_JBXX_ZS'/>
<html>
<head>
<title>企业名称查询</title>
<script language="javascript">
function ifMc(ifmc){
	if(ifmc=="y"){
		document.getElementById("mcy").style.display="";
		document.getElementById("mcn").style.display="none";
	}else{
		document.getElementById("mcy").style.display="none";
		document.getElementById("mcn").style.display="";
	}
}
function doSub(){
	//if(document.getElementById("mcy").style.display==""){
	
		var entname=document.getElementById("ENTNAME").value;
		var mcid=document.getElementById("MCID").value;
		if(mcid==""){
			alert("请输入名称预先核准通知书文号");
			return;
		}
		if(entname==""){
			alert("请输入企业名称");
			return;
		}
		document.myform.submit();
	
	/**}else{
		var qymc=document.getElementById("QYMC").value;
		if(qymc==""){
			alert("请输入企业名称");
			return;
		}
		window.returnValue =qymc;
		window.close();
	}*/
}
</script>	
</head>
<body>
<form name="myform" action="#" method="POST" target="editframe">
<%--
<table border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
<caption>业务办理</caption>
<tr>
 <td class="lc1"  align="center" width="145px">
 是否有名称预先核准通知书
 </td>
 <td class="lc2" align="left">
 有：<input type="radio" name="IFMC" value="1" id="IFMC1" checked onclick="ifMc('y')">
 无：<input type="radio" name="IFMC" value="2" id="IFMC2" onclick="ifMc('n')">
 </td>
</tr>
</table>--%>
<br/>
<table id="mcy"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
 <caption>名称信息</caption>
 <tr>
    <td class="lc1" align="center" width="145px">
	    是否冠省名:
    </td>
    <td class="lc2">
	<input type="radio" name="IFGSM" value="N" checked>否
	&nbsp;&nbsp;
	<input type="radio" name="IFGSM" value="Y">是
    </td>
 </tr>
  <tr>
    <td class="lc1" align="center" width="145px">
	    名称预先核准通知书文号:
    </td>
    <td class="lc2">第
	  <input type="text" name="MCID" id="MCID" size="25"/>号	    
    </td>
 </tr>
 <tr>
    <td class="lc1" align="center" width="145px">
	   企业名称:
    </td>
    <td class="lc2">
	   <input type="text" name="ENTNAME" id="ENTNAME" size="30"/>
    </td>
 </tr>
 <tr>
 <td class="lc2" colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">说明：</font>
1、名称预先核准通知书文号：如（济）登记内名预核字[2011]第01xxx6号，只要填写01xxx6即可。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2、企业名称：企业名称应填写完整。填写时应使用半角输入。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3、填写完名称预先核准通知书文号及企业名称后，点击“确定”按钮即可。
 </td>
 </tr>
</table>
<%--<br/>
<table id="mcn"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center" style= "display:none ">
 <caption>请录入变更后的企业名称：</caption>       
  <tr>
	<td class="lc1" align="center" width="145px">
	  企业名称:
	</td>
	<td class="lc2">
	<input type="text" name="QYMC" id="QYMC" size="30"/>
	</td>
  </tr>	  	  
</table>
<br/>--%>
<table border="1" width="100%" cellspacing='0' cellpadding='0' >
  <tr>
	  <td align="center" class="lcmd"> 
      <input type="button" value="确   定" onclick="doSub();">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="取   消" onclick="window.close();">
    </td>
  </tr>
</table>
<input type="hidden" name="model" value="1">
</form>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%
String model=SysUtility.doPreProcess(request.getParameter("model"));
String IFPROVINCENAME="";
if(!model.equals("")){
	String MCID=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("MCID")));
	String dMCID=MCID+"号";
	String ENTNAME=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("ENTNAME")));
	String IFGSM=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("IFGSM")));
	if(IFGSM.equals("Y")){
		IFPROVINCENAME="1";
		MCGL_JBXX.doSelectBySqlSJ("SELECT * FROM MCGL_JBXX_ZS WHERE ENTNAME='"+ENTNAME+"' AND ISENTNAMEALT ='1' AND NAMESTATUS=2 AND apprno is not null  AND saveperto IS NOT NULL AND saveperto >= sysdate  "+ContrInfo.getMczssql_shengju(icms.getSjCode(),webuser.getXZQH()));
	}else{
		MCGL_JBXX.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE ENTNAME='"+ENTNAME+"' AND ISENTNAMEALT ='1' AND NAMESTATUS=2 AND apprno is not null  AND saveperto IS NOT NULL AND saveperto >= sysdate "+ContrInfo.getMczssql_dishi(webuser.getXZQH()));
	}
		
	if(!MCGL_JBXX.getNAMEID().equals("")){		
		if(MCGL_JBXX.getAPPRNO().indexOf(dMCID)>0){
			
		}else{
			out.print(SysUtility.setAlertScript("企业名称与名称预先核准通知书问号不匹配！",""));
			return;
		}
    }else{
    	out.print(SysUtility.setAlertGo("名称库中没有该名称信息或该名称信息状态不符合要求！",""));
		return;
    }
%>

<script language="javascript">
var name="<%=ENTNAME%>";
var ret= new Array();
ret[0]=name;
ret[1]="<%=IFPROVINCENAME%>";
window.returnValue =ret;
window.close();
</script>
<%
}

%>
</body>
</html>
