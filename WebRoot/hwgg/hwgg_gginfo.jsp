<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<jsp:useBean id="HD0403" scope="page" class="com.macrosoft.icms.gsnw.HD0403"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String SIGN=Page.getSIGN();
String OPENO=Page.getOPENO();
String CDDL=Page.getDL();
String OPETYPE="";
String REGNO="";
String XGBH="";
String v0="变更";
String ADNAME="";
String ADREGCNO="";
if(!OPENO.equals("")){
	
}
REGNO=Page.getREGNO();
XGBH=Page.getXGBH();
OPETYPE=Page.getOPETYPE();
%>
<html>
<head>
<title>选择企业类型</title>
<script language='javascript'>
function doSub(){
	
       var ADNAME=document.getElementById("ADNAME").value;
       var ADREGCNO=document.getElementById("ADREGCNO").value;
      
       if(ADNAME==""){
		alert("请填写户外广告名称！");
		return ;
	   }
	   if(ADREGCNO==""){
		alert("请填写户外广告登记证号！");
		return ;
	   }
	  
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
<%@include file="/top.inc"%>
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
&nbsp;&nbsp;
请录入完整的户外广告名称，以及户外广告登记证号，然后点击“下一步”按钮，进行变更登记申请。如果所填信息与登记信息不符，系统将不予受理！
<br></td></tr></table>

<FORM NAME="form1" METHOD="POST" ACTION="action/hwgg_gginfo_action.jsp" target="editframe">
<input type="hidden" name="CDDL" value="<%=CDDL%>"/>
<input type="hidden" name="OPETYPE" value="<%=OPETYPE%>"/>
<input type="hidden" name="DL" value="QYBG"/>

    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; 待办户外广告信息
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		   户外广告名称:
	    </td>
	    <td class="lc2">
		  <input type="text" name="ADNAME" id="ADNAME" size="30" value="<%=ADNAME%>"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   户外广告登记证号:
	    </td>
	    <td class="lc2">
		   <input type="text" name="ADREGCNO" id="ADREGCNO" size="30" value="<%=ADREGCNO%>"/>
	    </td>
     </tr>
   </table>
  <br/>
  <CENTER>
  <%
  if(!OPENO.equals("")){
  %>
  <div class="subImgs" onclick="window.location.href='hwgg_xgcl.jsp'">下一步</div>
  <%
  }else{
  %>
  <div class="subImgs" onclick="doSub()">下一步</div>  
  <%
  }
  %>
</CENTER>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
<%@include file="/bottom.inc"%>
</body>
</html>