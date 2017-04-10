<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ" %>
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
if(!OPENO.equals("") || REGNO.equals("")){
	GTDJ_JBXX_SQ jbxx=new GTDJ_JBXX_SQ();
	jbxx.setOPENO(OPENO);
	jbxx.doSelect();
	REGNO=jbxx.getREGNO();
	XGBH=jbxx.getSPANAME1();
	Page.setREGNO(REGNO);
	Page.setXGBH(XGBH);
	Page.setENTNAME(jbxx.getTRANAME());
	Page.setENTCLASS("5");
	Page.setENTTYPE("GT");
}
OPETYPE=Page.getOPETYPE();
REGNO=Page.getREGNO();
XGBH=Page.getXGBH();
%>
<html>
<head>
<title>选择企业类型</title>
<script language='javascript'>
function doSub(){
       var cerno=document.getElementById("CERNO").value;
       var regno=document.getElementById("REGNO").value;
       if(regno==""){
		alert("请填写统一社会信用代码/注册号！");
		return ;
	   }
	   if(cerno==""){
		alert("请填写经营者的证件号码！");
		return ;
	   }
	 
	document.getElementById("subid").disabled=true;
	document.getElementById("waitdiv").style.display="";   
	form1.submit();
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
请录入完整的统一社会信用代码/注册号，以及经营者的证件号码，然后点击“下一步”按钮，进行个体户<%=v0%>登记申请。如果所填信息与登记信息不符，系统将不予受理！
<br></td></tr></table>
<FORM NAME="form1" METHOD="POST" ACTION="web/gtinfo_select_action.jsp" target="editframe">
<input type="hidden" name="OPETYPE" value="30"/>
<input type="hidden" name="DL" value="GTBG"/>
<input type="hidden" name="XZQH" value="<%=XZQH%>">
<table border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
 <tr>
 <td colspan="2">
    <table id="mc"  border="0" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
        <td class="yxsm" colspan="2">
            &nbsp; 待办个体户信息
        </td>
      </tr>
      <tr>
	    <td class="lc1" align="center" width="28%">
		    统一社会信用代码/注 册 号:
	    </td>
	    <td class="lc2">
		  <input type="text" name="REGNO" id="REGNO" size="30"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   经营者证件号码:
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
<%@include file="bottom.inc"%>
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