<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String SIGN=Page.getSIGN();
String OPENO=Page.getOPENO();
String CDDL=Page.getDL();
String OPETYPE="";
String REGNO="";
String XGBH="";
if(!OPENO.equals("") || REGNO.equals("")){

}
OPETYPE=Page.getOPETYPE();
REGNO=Page.getREGNO();
XGBH=Page.getXGBH();
%>
<html>
<head>
<title>ѡ����Ȼ������</title>
<script language='javascript'>
function doSub(){
       var cerno=document.getElementById("CERNO").value;
       var regno=document.getElementById("REGNO").value;
       if(regno==""){
		alert("����дͳһ������ô���/ע��ţ�");
		return ;
	   }
	   if(cerno==""){
		alert("����д���������˵�֤�����룡");
		return ;
	   }
	document.form1.submit();
}
function body_load(){
	var OPENO="<%=OPENO%>";
	var REGNO="<%=REGNO%>";
	var XGBH="<%=XGBH%>";
	document.getElementById("CERNO").value=XGBH;
    document.getElementById("REGNO").value=REGNO;
  
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
��¼��������ͳһ������ô���/ע��ţ��Լ����������˵�֤�����룬Ȼ��������һ������ť��������ҵ����Ӫҵִ�ձ������롣���������Ϣ��Ǽ���Ϣ������ϵͳ����������
<br></td></tr></table>
<FORM NAME="form1" METHOD="POST" ACTION="action/business_bainfo_action.jsp" target="editframe">
<input type="hidden" name="OPETYPE" value="30"/>
<input type="hidden" name="DL" value="YEZZ"/>
<table border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
 <tr>
 <td colspan="2">
    <table id="mc"  border="0" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; ����Ӫҵִ�ձ�������
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		    ͳһ������ô���/ע���:
	    </td>
	    <td class="lc2">
		  <input type="text" name="REGNO" id="REGNO" size="30"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   ����������֤������:
	    </td>
	    <td class="lc2">
		   <input type="text" name="CERNO" id="CERNO" size="30"/>
	    </td>
     </tr>
   </table>
  </td></tr></table>
</form>
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
<%@include file="/bottom.inc"%>
</body>
</html>
<script>
//���塰���ָ��dom�ڵ㡱�ĺ�������Ϊ�������ʸ�
function $(d){return document.getElementById(d);}
var v;
//����div����ʾ
var i = 0;
function change_show(){
   var obj = $("Layer2");
   i=i+5; //����ʾ�ٶ�
   obj.style.filter = "Alpha(Opacity=" + i + ")"; //͸�����𽥱�С
   obj.style.opacity = i/100; //����FireFox
   obj.style.height = i*2 + "px"; //�߶��𽥱��
   if(i>=100){
    clearInterval(s);
    i=0;
    $("Layer2").innerHTML=v;
   }
}
//����change_show()��Ϊ
var s;
function show(x,a){
   v=a;
   if(s){clearInterval(s);}
   $(x).innerHTML="";
   $(x).style.display="block";
   s = setInterval(change_show,30);
}
</script>