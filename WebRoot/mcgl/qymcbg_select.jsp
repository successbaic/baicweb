<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String SIGN=Page.getSIGN();
String OPENO=Page.getOPENO();
String CDDL=Page.getDL();
String REGNO="";
String OPETYPE="";
String XGBH="";
String v0="���";
String v1="����";
if(!OPENO.equals("")){
	QYDJ_YWSB_SQ ywsb=new QYDJ_YWSB_SQ();
	ywsb.setOPENO(OPENO);
	ywsb.doSelect();
	XGBH=ywsb.getCERNO();
	REGNO=ywsb.getREGNO();
	Page.setXGBH(XGBH);
	Page.setENTNAME(ywsb.getENTNAME());
	Page.setENTCLASS(ywsb.getENTCLASS());
	Page.setENTTYPE(icms.getSysRemark("ENTTYPE",ywsb.getENTTYPE()));
}
XGBH=Page.getXGBH();
OPETYPE=Page.getOPETYPE();
REGNO=Page.getREGNO();
%>
<html>
<head>
<title>���Ʊ��</title>
<script language='javascript'>
function doSub(){
	
       var cerno=document.getElementById("CERNO").value;
       var regno=document.getElementById("REGNO").value;
       var opetype=document.getElementById("OPETYPE").value;
       var cddl=document.getElementById("CDDL").value;
       if(regno==""){
		alert("����д��ҵע��ţ�");
		return ;
	   }
	   if(cerno==""){
		alert("����д���������ˣ������ˣ���֤�����룡");
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
&nbsp;&nbsp;ҵ�����˵����
</font>
<br/>
&nbsp;&nbsp;
��¼����������ҵע��ţ��Լ���ҵ���������ˣ������ˣ���֤�����룬Ȼ��������һ������ť������<%=v0%>�Ǽ����롣���������Ϣ��Ǽ���Ϣ������ϵͳ����������
<br></td></tr></table>

<FORM NAME="form1" METHOD="POST" ACTION="qymcbg_select_action.jsp" target="editframe">
<input type="hidden" name="CDDL" value="<%=CDDL%>"/>
<input type="hidden" name="OPETYPE" value="<%=OPETYPE%>"/>
<input type="hidden" name="DL" value="QYBG"/>

    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; ����<%=v1 %>��Ϣ
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		   ע���/������ô���:
	    </td>
	    <td class="lc2">
		  <input type="text" name="REGNO" id="REGNO" size="30" value="<%=REGNO%>"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   ���������ˣ������ˣ�֤������:
	    </td>
	    <td class="lc2">
		   <input type="text" name="CERNO" id="CERNO" size="30" value="<%=XGBH%>"/>
	    </td>
     </tr>
   </table>
  <br/>
  <CENTER>
   <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
	<br/>
	���ݲ�ѯ�У���ȴ�...<br/>&nbsp;
  </div>
  <%
  if(!OPENO.equals("")){
  %>
  <div class="subImgs" onclick="window.location.href='mcbg_clsm.jsp'">��һ��</div>
  <%
  }else{
  %>
  <div class="subImgs" id="subid" onclick="doSub()">��һ��</div>  
  <%
  }
  %>
</CENTER>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
<%@include file="../bottom.inc"%>
</body>
</html>