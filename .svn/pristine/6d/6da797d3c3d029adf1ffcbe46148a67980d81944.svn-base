<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<%
String SIGN=Page.getSIGN();
String OPENO=Page.getOPENO();
String CDDL=Page.getDL();
String OPETYPE="";
String REGNO="";
String XGBH="";
String DOMDISTRICT ="";
String XZQH=webuser.getXZQH();
if(!OPENO.equals("")){
	QYDJ_JBXX_SQ jbxx=new QYDJ_JBXX_SQ();
	jbxx.setOPENO(OPENO);
	jbxx.doSelect();
	REGNO=jbxx.getREGNO();
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
<title>守合同重信用企业申请</title>
<script type="text/javascript">
function doSub(){
       var cerno=document.getElementById("CERNO").value;
       var regno=document.getElementById("REGNO").value;
       if(regno==""){
		alert("请填写企业注册号/统一社会信用代码！");
		return ;
	   }
	   if(cerno==""){
		alert("请填写法定代表人（负责人）的证件号码！");
		return ;
	   }
	   
	   
	form1.submit();
}
</script>
</head>
<BODY style="margin: 0px" >
<%@include file="/szcp/top_szcp.inc"%>

<table border='1' width='100%' align='center'>
<tr>
<td class=lc2 valign='top'>
<font style='font-size:11pt;color:red;font-weight: bold'>
&nbsp;&nbsp;业务办理说明：
</font>
<br/>
&nbsp;&nbsp;
请录入完整的企业注册号/统一社会信用代码，以及企业法定代表人（负责人）的证件号码，然后点击“立即申请”按钮，进行守重企业申请。如果所填信息与登记信息不符，系统将不予受理！
<br></td></tr></table>

<FORM NAME="form1" METHOD="POST" ACTION="szhtinfo_select_action.jsp" >
<input type="hidden" name="XZQH" value="<%=XZQH%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">

    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; 待申请企业信息
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		    注册号/统一社会信用代码：
	    </td>
	    <td class="lc2">
		  <input type="text" name="REGNO" id="REGNO" size="30"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   法定代表人（负责人）证件号码:
	    </td>
	    <td class="lc2">
		   <input type="text" name="CERNO" id="CERNO" size="30" />
	    </td>
     </tr>
   </table>
  <br/>
  <CENTER>
  <div class="subImgs" onclick="doSub()">立即申请</div>
</CENTER>
<%@include file="bottom.inc"%>
</body>
</html>