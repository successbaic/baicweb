<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<%@ page import="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String SIGN=Page.getSIGN();
String OPENO=Page.getOPENO();
String CDDL=Page.getDL(); //�ǼǴ���
String OPETYPE="";
String REGNO="";
String XGBH="";
if(!OPENO.equals("")){
	GQDJ_JBXX_SQ jbxx=new GQDJ_JBXX_SQ();
	jbxx.setOPENO(OPENO);
	jbxx.doSelect();
	REGNO=jbxx.getREGNO();
	Page.setREGNO(REGNO);
	Page.setXGBH(XGBH);
}
REGNO=Page.getREGNO();
XGBH=Page.getXGBH();
OPETYPE=Page.getOPETYPE();
%>
<html>
<head>
<title>��ѡ��Ҫ�����Ĺ�Ȩ��Ϣ</title>
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
	   if(opetype=="50" && cddl=="1"){
	   alert("��˾����ע��ҵ��ʱ������������������Ϣ�ı�����");
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
&nbsp;&nbsp;ҵ�����˵����
</font>
<br/>
&nbsp;&nbsp;
��¼����������ҵע��ţ��Լ���ҵ���������ˣ������ˣ���֤�����룬Ȼ��������һ������ť�����������Ǽ����롣���������Ϣ��Ǽ���Ϣ������ϵͳ����������
<br></td></tr></table>

<FORM NAME="form1" METHOD="POST" ACTION="gqinfo_select_action.jsp" target="editframe">
<input type="hidden" name="CDDL" value="<%=CDDL%>"/>
<input type="hidden" name="OPETYPE" value="<%=OPETYPE%>"/>
<input type="hidden" name="DL" value="GQDJ"/>

    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; ������������Ϣ
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		    ע �� ��:
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
  <%
  if(!OPENO.equals("")){
  %>
  <div class="subImgs" onclick="window.location.href='wsdj_tbxx.jsp'">��һ��</div>
  <%
  }else{
  %>
  <div class="subImgs" onclick="doSub()">��һ��</div>  
  <%
  }
  %>
</CENTER>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
<%@include file="/bottom.inc"%>
</body>
</html>