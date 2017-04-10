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
<title>选择企业类型</title>
<script language='javascript'>
function doSub(){
       var MORREGCNO=document.getElementById("MORREGCNO").value;
       var MORTGAGO=document.getElementById("MORTGAGO").value;
        var REGORUN=document.getElementById("REGORUN").value;
       if(MORREGCNO==""){
		alert("请填写抵押登记证号！");
		return ;
	   }
	   if(MORTGAGO==""){
		alert("请填写抵押人或企业名称！");
		return ;
	   }
	   if(REGORUN==""){
		alert("请填写统一社会信用代码/注册号！");
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
&nbsp;&nbsp;业务办理说明：
</font>
<br/>
&nbsp;&nbsp;
请录入完整的抵押登记证号，抵押人或企业名称，统一社会信用代码/注册号，然后点击“下一步”按钮，进行动产抵押变更登记申请。如果所填信息与登记信息不符，系统将不予受理！
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
            &nbsp; 待办动产抵押信息
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		 抵押登记证号:
	    </td>
	    <td class="lc2">
		  <input type="text" name="MORREGCNO" id="MORREGCNO" size="30"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   抵押人或企业名称:
	    </td>
	    <td class="lc2">
		   <input type="text" name="MORTGAGO" id="MORTGAGO" size="30"/>
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		统一社会信用代码/注册号:
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
  <div class="subImgs" onclick="window.location.href='wsdj_tbxx.jsp'">下一步</div>
  <%
  }else{
  %>
  <div class="subImgs" onclick="doSub()">下一步</div>  
  <%
  }
  %>
</CENTER>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<%@include file="/bottom.inc"%>
</body>
</html>
<script>
//定义“获得指定dom节点”的函数，因为其重用率高
function $(d){return document.getElementById(d);}
var v;
//控制div逐渐显示
var i = 0;
function change_show(){
   var obj = $("Layer2");
   i=i+5; //逐渐显示速度
   obj.style.filter = "Alpha(Opacity=" + i + ")"; //透明度逐渐变小
   obj.style.opacity = i/100; //兼容FireFox
   obj.style.height = i*2 + "px"; //高度逐渐变大
   if(i>=100){
    clearInterval(s);
    i=0;
    $("Layer2").innerHTML=v;
   }
}
//控制change_show()行为
var s;
function show(x,a){
   v=a;
   if(s){clearInterval(s);}
   $(x).innerHTML="";
   $(x).style.display="block";
   s = setInterval(change_show,30);
}
</script>