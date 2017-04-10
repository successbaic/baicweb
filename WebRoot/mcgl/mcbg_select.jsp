<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<%@ page import="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String SIGN=Page.getSIGN();
String OPENO=Page.getOPENO();
String CDDL=Page.getDL();
String OPETYPE="";
String ENTNAME="";
String APPRNO="";
String XZQH=webuser.getXZQH();
if(!OPENO.equals("")){
	MCGL_JBXX_SQ jbxx=new MCGL_JBXX_SQ();
	jbxx.setOPENO(OPENO);
	jbxx.doSelect();
	ENTNAME=jbxx.getENTNAME();
	APPRNO=jbxx.getSPANAME();
	Page.setXGBH(APPRNO);
	Page.setENTNAME(jbxx.getENTNAME());
	Page.setENTCLASS(jbxx.getENTCLASS());
	Page.setENTTYPE(icms.getSysRemark("ENTTYPE",jbxx.getENTTYPE()));
}
ENTNAME=Page.getENTNAME();
APPRNO=Page.getXGBH();
OPETYPE=Page.getOPETYPE();
String v0="调整";
if(OPETYPE.equals("11")){
	v0="调整";
}else if(OPETYPE.equals("12")){
	v0="延期";
}else if(OPETYPE.equals("13")){
	v0="变更";
}
%>
<html>
<head>
<title>名称<%=v0 %></title>
<script language='javascript'>
function doSub(){
     var apprno=document.getElementById("XGBH").value;
     var entname=document.getElementById("ENTNAME").value;
     var opetype=document.getElementById("OPETYPE").value;
     var cddl=document.getElementById("CDDL").value;
     if(entname==""){
		alert("请填写名称！");
	return ;
 	 }
	if(apprno==""){
		alert("请填写名称预先核准通知书文号！");
		return ;
	}
	document.getElementById("subid").disabled=true;
	document.getElementById("waitdiv").style.display="";
	form1.submit();
}
function body_load(){
	var OPENO="<%=OPENO%>";
	if(OPENO!=""){
		var a=document.getElementsByTagName("input");
		for(var i=0;i<a.length;i++){
			a[i].disabled=true;
		}
	}
}

</script>
</head>
<BODY style="margin: 0px" onload="body_load()">
<%@include file="../top.inc"%>
<%
StepShow stepShow=new StepShow();
out.println(stepShow.getStep("1",Page.getDL()+Page.getOPETYPE(),Page.getOPENO()));
%>
<br/>
<table border='1' width='100%' align='center'>
<tr>
<td class=lc2 valign='top'>
<font style='font-size:11pt;color:red;font-weight: bold'>
&nbsp;&nbsp;业务办理说明：
</font>
<br/>
一、请录入完整的名称，以及名称预先核准通知书的文号，然后点击“下一步”按钮，进行<%=v0%>申请。如果所填信息与名称信息不符，系统将不予受理！
<br>
二、名称预先核准通知书文号：如（青）登记内名预核字[2011]第01xxx6号，只要填写01xxx6即可。
</td></tr></table>

<FORM NAME="form1" METHOD="POST" ACTION="mcinfo_select_action.jsp" target="editframe">
<input type="hidden" name="CDDL" value="<%=CDDL%>"/>
<input type="hidden" name="OPETYPE" value="<%=OPETYPE%>"/>
<input type="hidden" name="DL" value="MCTZ"/>
<input type="hidden" name="XZQH" value="<%=XZQH%>">

    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; 待办名称信息
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		    名  称:
	    </td>
	    <td class="lc2">
		  <input type="text" name="ENTNAME" id="ENTNAME" size="30" value="<%=ENTNAME%>"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   名称预先核准通知书文号:
	    </td>
	    <td class="lc2">第<input type="text" name="XGBH" id="XGBH" size="30" value="<%=APPRNO%>"/>号
	    </td>
     </tr>
   </table>
  <br/>
  <CENTER>
    <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
  </div>
  <%
  if(!OPENO.equals("")){
  %>
  <div class="subImgs" onclick="window.location.href='mcbg_clsm.jsp'">下一步</div>
  <%
  }else{
  %>
  <div class="subImgs" id="subid" onclick="doSub()">下一步</div>  
  <%
  }
  %>
</CENTER>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
<%@include file="../bottom.inc"%>
</body>
</html>