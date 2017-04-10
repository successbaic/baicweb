<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String SIGN=Page.getSIGN();
String OPENO=Page.getOPENO();
String CDDL=Page.getDL();
String OPETYPE="";
String REGNO="";
String XGBH="";
String XZQH=webuser.getXZQH();
String v0="变更";
if(OPETYPE.equals("40")){
	v0="备案";
}else if(OPETYPE.equals("50")){
	v0="注销";
}
String v1="企业";
if(CDDL!=null && CDDL.equals("HZS")){
	v1="农民专业合作社";
}
if(!OPENO.equals("")){
	QYDJ_JBXX_SQ jbxx=new QYDJ_JBXX_SQ();
	jbxx.setOPENO(OPENO);
	jbxx.doSelect();
	REGNO=jbxx.getUNISCID();
	if(REGNO.equals("")){
		REGNO=jbxx.getREGNO();
	}	
	XGBH=jbxx.getSPANAME();
	Page.setREGNO(REGNO);
	Page.setXGBH(XGBH);
	Page.setENTNAME(jbxx.getENTNAME());
	Page.setENTCLASS(jbxx.getENTCLASS());
	Page.setENTTYPE(icms.getSysRemark("ENTTYPE",jbxx.getENTTYPE()));
}
REGNO=Page.getREGNO();
XGBH=Page.getXGBH();
OPETYPE=Page.getOPETYPE();
%>
<html>
<head>
<title>选择企业类型</title>
<script type="text/javascript">
function doSub(){
	
       var cerno=document.getElementById("CERNO").value;
       var regno=document.getElementById("REGNO").value;
       var opetype=document.getElementById("OPETYPE").value;
       var cddl=document.getElementById("CDDL").value;
       if(regno==""){
		alert("请填写企业注册号或社会信用代码！");
		return ;
	   }
	   if(cerno==""){
		alert("请填写法定代表人（负责人）的证件号码！");
		return ;
	   }
	   if(opetype=="50" && cddl=="1"){
	   //alert("公司办理注销业务时，请先完成清算组等信息的备案！");
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
<%@include file="top.inc"%>
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
请录入完整的企业注册号或社会信用代码，以及企业法定代表人（负责人）的证件号码，合伙企业请录入执行事务合伙人的证件（照）号码，然后点击“下一步”按钮，进行<%=v0%>登记申请。如果所填信息与登记信息不符，系统将不予受理！
<br></td></tr></table>

<FORM NAME="form1" METHOD="POST" ACTION="web/qyinfo_select_action.jsp" target="editframe">
<input type="hidden" name="CDDL" value="<%=CDDL%>"/>
<input type="hidden" name="OPETYPE" value="<%=OPETYPE%>"/>
<input type="hidden" name="DL" value="QYBG"/>
<input type="hidden" name="XZQH" value="<%=XZQH%>">

    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; 待办<%=v1 %>信息
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		    注册号/社会信用代码:
	    </td>
	    <td class="lc2">
		  <input type="text" name="REGNO" id="REGNO" size="30" value="<%=REGNO%>"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   法定代表人（负责人）证件号码:
	    </td>
	    <td class="lc2">
		   <input type="text" name="CERNO" id="CERNO" size="30" value="<%=XGBH%>"/>
	    </td>
     </tr>
   </table>
  <br/>
  <CENTER>
  <div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
  <br/>
  数据查询中，请等待...<br/>&nbsp;
  </div>
  <%
  if(!OPENO.equals("")){
  %>
  <div class="subImgs" onclick="window.location.href='wsdj_tbxx.jsp'">下一步</div>
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
<%@include file="bottom.inc"%>
</body>
</html>