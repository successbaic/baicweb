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
//REGNO=Page.getREGNO();
//XGBH=Page.getXGBH();
%>
<html>
<head>
<title>ѡ����ҵ����</title>
<script language='javascript'>
function doSub(){
       var MORREGCNO=document.getElementById("MORREGCNO").value;
       var MORTGAGO=document.getElementById("MORTGAGO").value;
        var REGORUN=document.getElementById("REGORUN").value;
       if(MORREGCNO==""){
		alert("����д��Ѻ�Ǽ�֤�ţ�");
		return ;
	   }
	   if(MORTGAGO==""){
		alert("����д��Ѻ�˻���ҵ���ƣ�");
		return ;
	   }
	   if(REGORUN==""){
		alert("����дͳһ������ô���/ע��ţ�");
		return ;
	   }
	document.form1.submit();
}
function body_load(){
	
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
��¼�������ĵ�Ѻ�Ǽ�֤�ţ���Ѻ�˻���ҵ���ƣ�ͳһ������ô���/ע��ţ�Ȼ��������һ������ť�����ж�����Ѻ����Ǽ����롣���������Ϣ��Ǽ���Ϣ������ϵͳ����������
<br></td></tr></table>
<FORM NAME="form1" METHOD="POST" ACTION="action/htgl_dcdyinfo_nm_action.jsp" target="editframe">
<input type="hidden" name="OPETYPE" value="30"/>
<input type="hidden" name="DL" value="GTBG"/>
<table border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
 <tr>
 <td colspan="2">
    <table id="mc"  border="0" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; ���춯����Ѻ��Ϣ
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		 ��Ѻ�Ǽ�֤��:
	    </td>
	    <td class="lc2">
		  <input type="text" name="MORREGCNO" id="MORREGCNO" size="30"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   ��Ѻ�˻���ҵ����:
	    </td>
	    <td class="lc2">
		   <input type="text" name="MORTGAGO" id="MORTGAGO" size="30"/>
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		ͳһ������ô���/ע���:
	    </td>
	    <td class="lc2">
		   <input type="text" name="REGORUN" id="REGORUN" size="30"/>
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