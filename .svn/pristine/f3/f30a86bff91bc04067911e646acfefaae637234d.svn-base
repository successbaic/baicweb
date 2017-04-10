<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="SYS_DMDZ" scope="page"  class="com.macrosoft.icms.util.SYS_DMDZ"/>

<%
String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
String SIGN=SysUtility.doPreProcess(request.getParameter("SIGN"));
String MCID="";
String ENTTYPE="";
String ENTCLASS="";
String ENTNAME=""; 
String IFELEC ="";
if(OPENO.equals("")){OPENO=Page.getOPENO();}
if(!OPENO.equals("") && Page.getENTNAME().equals("")){
QYDJ_JBXX_SQ jbxx=new QYDJ_JBXX_SQ();
jbxx.setOPENO(OPENO);
jbxx.doSelect();
Page.setMCXH(jbxx.getMCXH());
Page.setXGBH(jbxx.getSPANAME());
Page.setENTNAME(jbxx.getENTNAME());
Page.setENTCLASS(jbxx.getENTCLASS());
Page.setIFELEC(jbxx.getIFELEC());
Page.setENTTYPE(icms.getSysRemark("ENTTYPE",jbxx.getENTTYPE()));
}
MCID=Page.getXGBH();
ENTTYPE=Page.getENTTYPE();
ENTCLASS=Page.getENTCLASS();
ENTNAME=Page.getENTNAME(); 
IFELEC= Page.getIFELEC();

boolean needMCYH = false;
String XZQH=webuser.getXZQH();
boolean ifDzh=SYS_DMDZ.ifDzh(XZQH);

%>
<html>
<head>
<title>选择企业类型</title>
<script type="text/javascript">
var needMCYH=<%=needMCYH%>;
function ifmc(lx){
	if(lx=="Y"){
		document.getElementById("y_mc").style.display="";
		document.getElementById("n_mc").style.display="none";		
		document.getElementById("radio_y_mc").checked="checked";
	}else{
		document.getElementById("y_mc").style.display="none";
		document.getElementById("n_mc").style.display="";		
		document.getElementById("radio_n_mc").checked="checked";
	}
}

function IsFullElec(){
	var fullElec = document.getElementById("ifelec_y");
	var noFullElec = document.getElementById("ifelec_n");
	if(fullElec.checked){
		Elecxx.style.setAttribute("display", ""); 
	}
	if(noFullElec.checked){
		Elecxx.style.setAttribute("display", "none"); 
	}
}

function body_load(){
	var OPENO="<%=OPENO%>";
	var ENTTYPE="<%=ENTTYPE%>";
	var MCID="<%=MCID%>";
	var ENTNAME="<%=ENTNAME%>";
	var ENTCLASS="<%=ENTCLASS%>";
	var IFELEC="<%=IFELEC%>";

	if(ENTNAME==""){
		ifmc('Y');
		document.getElementById("radio_y_mc").checked="checked";
	}else{
		if(MCID==""){
			ifmc('N');
			document.myform.qyname2.value=ENTNAME;
		}else{
			ifmc('Y');
			document.myform.mcid.value=MCID;
			document.myform.qyname1.value=ENTNAME;
		}
	}	
	if(IFELEC=="1"){
		document.getElementById("ifelec_y").checked=true;
	}else if(IFELEC=="0"){
		document.getElementById("ifelec_n").checked=true;
	}
	if(OPENO!=""){
		var a=document.getElementsByTagName("input");
		for(var i=0;i<a.length;i++){
			a[i].disabled=true;
		}
	}
}
function doSub(){
	var ifDzh="<%=ifDzh%>";
	if(ifDzh==="true"){
		var ifelec_y = document.getElementById("ifelec_y").checked;
		var ifelec_n = document.getElementById("ifelec_n").checked;
		var ifagree = document.getElementById("ifagree").checked;
	}
	if(document.getElementById("radio_y_mc").checked){
		if(document.myform.mcid.value==""){
			alert("请录入名称预先核准通知书文号！");return;
		}
		if($.trim(document.myform.mcid.value).length<0){
			alert("名称预先核准通知书文号不应小于4位！");return;
		}
		if(document.myform.qyname1.value==""){
			alert("请录入企业名称！");return;
		}
		document.myform.QYLX.value="HZS";
		document.myform.ENTNAME.value=document.myform.qyname1.value;
	}else{
		if(document.myform.qyname2.value==""){
			alert("请录入企业名称");
			return;
		}else{
				if(!validateZh(document.myform.qyname2.value)){
					alert("名称中不能含有拼音、数字等特殊字符！");
					return;
				}
		}
		document.myform.ENTNAME.value=document.myform.qyname2.value;
		
		//document.myform.QYLX.value="HZSFZ";
		document.myform.QYLX.value=$("input[type='radio'][name='R1']:checked").val();
	}

	if(ifelec_y==false && ifelec_n==false){
		alert("请选择是否全程电子化！");return;
	}
	if(ifelec_y==true && ifagree==false){
		alert("请选择同意以上服务协议条款！");return;
	}
	document.getElementById("subid").disabled=true;
	document.getElementById("waitdiv").style.display="";
	myform.submit();
}
//校验名称
function validateZh(entname){
	var myReg = /^[\u4e00-\u9fa5]+$/;
		if (!(myReg.test($.trim(entname)))){
			return false;
		}
		return true;
}
$(function(){
	if(needMCYH){
		$("#hasYxhz").hide();
		$("#isStepTwo").text("请录入名称信息");
	}
});


</script>
</head>
<BODY style="margin: 0px" onload="body_load()">
<%@include file="top.inc"%>
<%
StepShow stepShow= new StepShow();
%>
<%=stepShow.getStep("1",Page.getDL()+Page.getOPETYPE(),Page.getOPENO())%>

<table border='1' width='100%' align='center'><tr>
<td class="yxsm">
&nbsp;业务办理说明</td></tr><tr><td class=lc2 valign='top'>
&nbsp;&nbsp;&nbsp;
一、如果您申请设立的农民专业合作社、农民专业合作社分支机构需要办理前置许可及名称预先核准，
请在<strong>【是否有名称核准书】</strong>一栏中点击<font color='red' style='font-size:15px;'><strong>有</strong></font>。
<br/>&nbsp;&nbsp;&nbsp;
二、如果您申请设立的企业类型是不需要办理前置许可的农民专业合作社分支机构，
请在<strong>【是否有名称核准书】</strong>一栏中点击<font color='red' style='font-size:15px;'><strong>无。</strong></font> 
<br>&nbsp;&nbsp;&nbsp;&nbsp;三、名称预先核准通知书文号：如（济）登记内名预核字[2011]第01xxx6号，只要填写01xxx6即可。<br>&nbsp;&nbsp;&nbsp;
四、企业名称：企业名称应填写完整。填写时应使用半角输入。<br></td></tr></table>

<FORM NAME="myform" METHOD="POST" ACTION="web/sl_select_action.jsp" target="editframe">
<input type="hidden" name="DL" value="HZSDJ">
<input type="hidden" name="ENTCLASS" value="6">
<input type="hidden" name="QYLX">
<input type="hidden" name="ENTNAME">
<table id="hasYxhz" style ="display:block" border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
  <tr>
    <td colspan="3" class="yxsm">一、请选择是否有名称预先核准通知书</td>
  </tr>
  <tr>
    <td class="lc1" width="180px">是否有名称预先核准通知书</td>
    <td colspan="2" class="lc2">
      有：<input type="radio" name="radio_mc" id="radio_y_mc" value="1" onClick="ifmc('Y')"/>
	  无：<input type="radio" name="radio_mc" id="radio_n_mc" value="2" onClick="ifmc('N')"/>	</td>
  </tr>
</table>
<div id="y_mc">
   <table border="1" width="100%" cellspacing='0' cellpadding='0' align="center" style="border-top-width: 0px">
   <tr>
    <td id="isStepTwo" colspan="3" class="yxsm">二、请录入名称信息</td>
  </tr>
  <tr>
    <td class="lc1" width="180px">名称预先核准通知书文号: </td>
    <td colspan="2" class="lc2">第
      <input type="text" name="mcid" id="mcid" />
    号
    </td>
  </tr>
  <tr>
    <td class="lc1" width="180px">企业名称: </td>
    <td colspan="2" class="lc2"><input type="text" name="qyname1" id="qyname1" size="40"/></td>
  </tr>
  <tr>
  	 <td class="lc2" colspan="3"><font color="red" style="font-size:15px"><STRONG>说明:</STRONG></font>
  	 请准确填写<STRONG>【名称预先核准通知书文号】</STRONG>和<STRONG>【企业名称】</STRONG>,如所填信息与实际信息不符，业务人员将<STRONG>驳回</STRONG>申请</td>
  </tr>
  </table>
  
   </div>
   
   <div id="n_mc">
   <table border="1" width="100%" cellspacing='0' cellpadding='0' align="center" style="border-top-width: 0px">
   <tr>
    <td colspan="3" class="yxsm">二、请选择企业类型</td>
  </tr>
  <tr>
    <td class="lc2" colspan="1">
	&nbsp;&nbsp;&nbsp;
	农民专业合作社：
	 <input type="radio" name="R1" value="HZS" checked/>	</td>
    <td class="lc2" colspan="1">
	&nbsp;&nbsp;&nbsp;
	农民专业合作社分支机构：
	 <input type="radio" name="R1" value="HZSFZ"/>	</td>
  </tr>
 </table>
   <table border="1" width="100%" cellspacing='0' cellpadding='0' align="center" id="n_mc" style="border-top-width: 0px">
   <tr>
    <td colspan="3" class="yxsm">三、请录入企业名称</td>
  </tr>  
  <tr>
    <td class="lc1" width="180px">企业名称: </td>
    <td colspan="2" class="lc2"><input type="text" name="qyname2" id="qyname2" size="40"/></td>
  </tr>
  <tr>
  	 <td class="lc2" colspan="3"><font color="red" style="font-size:15px"><STRONG>说明:</STRONG></font>
  	 请准确填写<STRONG>【企业名称】</STRONG>,如所填信息不符合要求，业务人员将<STRONG>驳回</STRONG>申请</td>
  </tr>
  </table></div>
   <%if(ifDzh){ %>
    <div id="iffullelec">
				<table border="1" width="100%" cellspacing='0' cellpadding='0'
					align="center" style="border-top-width: 0px">
					<tr>
					<tr>
						<td colspan="3" class="yxsm">
							请选择是否全程电子化
						</td>
					</tr>
					<tr>
						<td colspan="3"  style="text-align: center;" width="100%">
							<font color="red" > 无需排队！快速办结！选择全程电子化网上办理登记，方便快捷！是否选择？
							</font>
						</td>
					</tr>
					<tr>
                    <td class="lc1" width="22%">是否全程电子化：</td>
                    <td colspan="2" class="lc2">
	                  <input type="radio" name="ifelec" id="ifelec_y" title="是否全程电子化" value="1"  onclick="IsFullElec()">是
	                 <input type="radio" name="ifelec" id="ifelec_n" title="是否全程电子化" value="0"  onclick="IsFullElec()">否
                     </td>
                    </tr>					
				</table>
			</div>
      <br/>
  <div id="Elecxx"  style="display:none; height:200px; overflow:auto;">
     <%@include file="elec_info.jsp"%>
  </div>
  <%} %>
  <br/>
  <CENTER>
   <div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
  <br/>
  数据查询中，请等待...<br/>&nbsp;
  </div>
  <%
  if(SIGN.equals("1") || !OPENO.equals("")){
  %>
  <div class="subImgs" onclick="window.location.href='wsdj_tbxx.jsp'">下一步</div>
  <%
  }else{
  %>
  <div class="subImgs" id="subid" onclick="doSub()">下一步</div>  
  <%
  }
  %></CENTER>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<%@include file="bottom.inc"%>
</body>
</html>