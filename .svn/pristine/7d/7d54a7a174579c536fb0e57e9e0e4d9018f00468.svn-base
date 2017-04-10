<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id='QYDJ_BGSX' scope='page' class='com.macrosoft.icms.qydj.QYDJ_BGSX_SQ'/>
<jsp:useBean id='QYDJ_JBXX_SQ' scope='page' class='com.macrosoft.icms.qydj.QYDJ_JBXX_SQ'/>
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head>
<title>变更信息</title>
<%

	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();
 	String sENTTYPE = Page.getENTTYPE();
 	String SIGN =Page.getSIGN();
 	String SPANAME=Page.getXGBH();
	if(SPANAME.equals("")){
		QYDJ_JBXX_SQ.setOPENO(OPENO);
		QYDJ_JBXX_SQ.doSelect();
		SPANAME=QYDJ_JBXX_SQ.getSPANAME();
	}
	QYDJ_JBXX_ZS.setPRIPID(PRIPID);
	QYDJ_JBXX_ZS.doSelect();
	String enttype = Page.getENTTYPE();
	String title = "分支机构";
	String[] enttypes ={"GS","WZGS","WZQY"};
	List<String> list_enttype = Arrays.asList(enttypes);
	if(list_enttype.contains(enttype)){
		title = "分公司";
	};
 	String XZQH=webuser.getXZQH();
 	boolean isMcyh = false;
 	String bgEntname = "";
 %>
<script type="text/javascript">
var isMcyh = "<%=isMcyh%>";
var bgEntname = "<%=bgEntname%>";
var sENTTYPE = "<%=sENTTYPE%>";
function doblurregcap()
{
	var ALTAF05 = document.form1.ALTAF05.value;
	if (fucCheckNUM(ALTAF05))
	{
		if (Math.abs(ALTAF05)>999999999999)
		{
			alert('注册资本变更后内容超过系统最大精度！');
			return false;
		}		
	}
	else
	{
		alert('注册资本变更后内容应为数字！');
		return false;
	}
}	
function doblurreccap(){
	var ALTAF27 = document.form1.ALTAF27.value;
	if (fucCheckNUM(ALTAF27))
	{
		if (Math.abs(ALTAF27)>999999999999)
		{
			alert('实收资本变更后内容超过系统最大精度！');
			return false;
		}
		else
			return true;
	}
	else
	{
		alert('实收资本变更后内容应为数字！');
		return false;
	}
	var ALTAF20 = document.form1.ALTAF20.value;
	if (fucCheckNUM(ALTAF20))
	{
		if (Math.abs(ALTAF20)>999999999999)
		{
			alert('投资总额变更后内容超过系统最大精度！');
			return false;
		}
		else
			return true;
	}
	else
	{
		alert('投资总额变更后内容应为数字！');
		return false;
	}
}
function blankCheck()
{
	var elements = form1.elements;
	var nLength;
	var eleput;
	nLength=elements.length;	
	for (var j=0; j<nLength; j++)
	{
		if (elements[j].type=="checkbox")
		{	
			if (elements[j].checked)
			{			
				eleput=elements[j+2];
				if (eleput!=null)
				{	
					if(((eleput.type=="text")||(eleput.type=="select-one")||(eleput.type=="textarea"))&&fucCheckLength(eleput.value)<=0)
					{
						eleput.focus();
						alert("请填写"+eleput.title+"!");						
						return false;
					}
				}
   		
			}
		}
	}
	return(true);
}
function setBusscope()
{
document.form1.ALTAF12.value="许可经营项目："+document.form1.ALTAF06.value + "一般经营项目："+document.form1.ALTAF07.value;
}
function getMc(){
	var feature="dialogHeight:300px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:550px;center:yes;help:no;resizable:no;status:no";
	var url="getMc.jsp";
	var ret=window.showModalDialog(url,"",feature);
	if(ret!=undefined && ret!=null){
		document.form1.ALTAF01.value=ret[0];
		document.form1.IFPROVINCENAME.value=ret[1];
	}	
}
function checkeMc(){
	//var url="mcgl/zhcc.jsp";
	//window.open(url,'_blank','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=yes,left=0,top=0, height=600,width=800 fullscreen=no');
}
function setDis(){
    var altitem = form1.ALTITEM;
	var nLength;
	nLength=altitem.length;	
	for (var j=0; j<nLength; j++)
	{
		if (altitem[j].type=="checkbox"){	
			if (altitem[j].checked){
			   eval("document.form1.ALTAF"+altitem[j].value+".disabled=false");
			}else{
			   eval("document.form1.ALTAF"+altitem[j].value+".value=''");
	           eval("document.form1.ALTAF"+altitem[j].value+".disabled=true"); 
			}
	     }
	}
}
function setvalue(obj)
{
	if(obj.checked){
	   eval("document.form1.ALTAF"+obj.value+".disabled=false");
	}else{
	   eval("document.form1.ALTAF"+obj.value+".value=''");
	   eval("document.form1.ALTAF"+obj.value+".disabled=true");
	}	
}

//关联『许可经营项目』『一般经营项目』和『经营范围』
function selectRela(obj)  
{ 
 	for (var i=0;i<document.form1.ALTITEM.length;i++) 
	{ 
		if (obj.value=='06')
			if(document.form1.ALTITEM[i].value=='12' && obj.checked)
				document.form1.ALTITEM[i].checked = true ;

		if (obj.value=='07')
			if(document.form1.ALTITEM[i].value=='12' && obj.checked)
				document.form1.ALTITEM[i].checked = true ;

		if (obj.value=='12')
			if(document.form1.ALTITEM[i].value=='07' && obj.checked)
				document.form1.ALTITEM[i].checked = true ;
	} 
} 
function checkGd(obj){
	for (var i=0;i<document.form1.ALTITEM.length;i++) 
	{ 
		if(document.form1.ALTITEM[i].value=='10' && obj.checked){
			document.form1.ALTITEM[i].checked = true ;
		}		
	}
}
function getDom(openo){
	var url = "support/getQyDom.jsp?openo="+openo+"&lx=qy";
	var info="dialogHeight:400px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		document.form1.ALTAF02.value=ret[6];
		document.form1.ALTAF161.value=ret[0];
		document.form1.ALTAF162.value=ret[1];
		document.form1.ALTAF163.value=ret[2];
		document.form1.ALTAF164.value=ret[3];
		document.form1.ALTAF165.value=ret[4];
		document.form1.ALTAF166.value=ret[5];
	}
}
//经营期限，长期或者年
function opfyears(t){
	if(t.checked){
		document.getElementById("ALTAF08").value="长期";
		document.getElementById("year").style.display="none";	
	}else{
		document.getElementById("ALTAF08").value="";
		document.getElementById("year").style.display="";	
	} 	
}
function checkIfCq(){
	if(document.getElementById("ALTAF08")!=null){
		if(document.getElementById("ALTAF08").value=="长期"){
			document.getElementById("checkboxInput").checked=true;
			document.getElementById("year").style.display="none";
			}
	}
}
//名称变更自动设置
function nameChange(){
	if(isMcyh == "true"){
		$("input[type='button'][value='查询']").hide();
	}
	$("input[type='checkbox'][name='ALTITEM'][ value='01']").click(function(){
		if($(this).is(":checked")){
			if(bgEntname == ""){
				if(isMcyh == "true"){
					if(sENTTYPE != "WGDB"){
						alert("变更名称请先办理名称变更业务!");
						$(this).attr("checked",false);
						$("input[name='ALTAF01']").attr("disabled","disabled");
						return;
					}else{
						$("input[name='ALTAF01']").attr("readonly",false);
					}
				}
			}else{
				$("input[name='ALTAF01']").val(bgEntname).attr("disabled","disabled");
			}
		}else{
			$("input[name='ALTAF01']").val();
		}
	});
}
</script>
</head>
<body>
<%@include file="top.inc"%>
<%	
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
%>
<form name="form1" method="POST" action="web/qydj_bgsx_action.jsp" target="editframe">
<input type="hidden" name = "IFPROVINCENAME">
<input type="hidden" name = "PRIPID" value=<%=PRIPID%>>
<input type="hidden" name = "ENTTYPE" value=<%=sENTTYPE%>>
<input type="hidden" name = "OPENO" value="<%=OPENO%>">
<input type="hidden" name = "SIGN" value="<%=SIGN%>">
<!--input type="hidden" name = "APPRNO">
<input type="hidden" name="ALTTIME"-->
<input type="hidden" name="SPANAME" value="<%=SPANAME%>">
<input type="hidden" name="REGORG" value="<%=QYDJ_JBXX_ZS.getREGORG() %>">
<input type="hidden" name="STATUS">
<input type="hidden" name="ALTBE161" value="<%=QYDJ_JBXX_ZS.getPROVINCE() %>">
<input type="hidden" name="ALTBE162" value="<%=QYDJ_JBXX_ZS.getCITY() %>">
<input type="hidden" name="ALTBE163" value="<%=QYDJ_JBXX_ZS.getCOUNTY() %>">
<input type="hidden" name="ALTBE164" value="<%=QYDJ_JBXX_ZS.getSTREET() %>">
<input type="hidden" name="ALTBE165" value="<%=QYDJ_JBXX_ZS.getROAD() %>">
<input type="hidden" name="ALTBE166" value="<%=QYDJ_JBXX_ZS.getDOORPLATE() %>">
<input type="hidden" name="ALTAF161">
<input type="hidden" name="ALTAF162">
<input type="hidden" name="ALTAF163">
<input type="hidden" name="ALTAF164">
<input type="hidden" name="ALTAF165">
<input type="hidden" name="ALTAF166">
<%
String sTYPE="1";
if(sENTTYPE.equals("GS")){
%>
<%@ include file="public/gs_bgsx.inc" %>
<%
}else if(sENTTYPE.equals("FGS")){
%>
<%@ include file="public/fgs_bgsx.inc" %>
<%}else if(sENTTYPE.equals("NZFR")){ 
%>
<%@ include file="public/nzfr_bgsx.inc" %>
<%@ include file="public/nzfr_basx.inc" %>
<%}else if(sENTTYPE.equals("NZYY")){
%>
<%@ include file="public/nzyy_bgsx.inc" %>
<%}else if(sENTTYPE.equals("HHQY"))//国家局没有文书，济南局的文书没有备案事项，内网有备案
  {%>
<%@ include file="public/hhqy_bgsx.inc" %>
<%--<%@ include file="public/hhqy_basx.inc" %>--%>
<%}else if(sENTTYPE.equals("HHFZ")){ 
%>
<%@ include file="public/hhfz_bgsx.inc" %>
<%}else if(sENTTYPE.equals("GRDZ")){ 
%>
<%@ include file="public/grdz_bgsx.inc" %>
<%}else if(sENTTYPE.equals("GRDZFZ")){
%>
<%@ include file="public/grdzfz_bgsx.inc" %>
<%}else if(sENTTYPE.equals("WZGS") || sENTTYPE.equals("WZFR")){
%>
<%@ include file="public/wzgs_bgsx.inc" %>
<%@ include file="public/wzgs_basx.inc" %>
<%}else if(sENTTYPE.equals("WZFZ")){ 
%>
<%@ include file="public/wzfz_bgsx.inc" %>
<%}else if(sENTTYPE.equals("WGJY")){
%>
<%@ include file="public/wgjy_bgsx.inc" %>
<%@ include file="public/wgjy_basx.inc" %>
<%}else if(sENTTYPE.equals("WGDB")){
%>
<%@ include file="public/wgdb_bgsx.inc" %>
<%@ include file="public/wgdb_basx.inc" %>
<%}else if(sENTTYPE.equals("WZHH")){
%>
<%@ include file="public/wzhh_bgsx.inc" %>
<%@ include file="public/wzhh_basx.inc" %>
<%}else if(sENTTYPE.equals("WZHHFZ")){
%>
<%@ include file="public/wzhhfz_bgsx.inc" %>
<%}else if(sENTTYPE.equals("HZS")){
sTYPE="3";
%>
<%@include file="public/hzs_bgsx.inc" %>
<%@include file="public/hzs_basx.inc" %>
<%}else if(sENTTYPE.equals("HZSFZ"))
{
sTYPE="3";
%>
<%@include file="public/hzsfz_bgsx.inc" %>
<%} %>


<br>
<CENTER>
<div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
</div>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">下一页</div>
<%
}
%>
</CENTER>

<input type="hidden" name="CDDL" value="<%=sTYPE%>">
</form>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="bottom.inc"%>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("blankCheck()");
	ec.setUserFunction("checkSub()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	QYDJ_BGSX.setOPENO(OPENO);
	ArrayList list=QYDJ_BGSX.getDataList();
	vf.setData(list);
	vf.setFormData("ALTBE04",QYDJ_JBXX_ZS.getENTTYPE());
	vf.setFormData("ALTBE101",QYDJ_JBXX_ZS.getENTCAT());
	vf.setFormData("ALTBE110",QYDJ_JBXX_ZS.getREGCAPCUR());//注册资本币种
	vf.setFormData("ALTBE112",QYDJ_JBXX_ZS.getRECCAPCUR());//实收资本币种
	vf.setFormData("ALTBE114",QYDJ_JBXX_ZS.getCONGROCUR());
	//vf.setFormData("ALTBE15",GSGSJIN_BASIS02.getFIELD191());
	//vf.setFormData("ALTBE91",GSGSJIN_BASIS02.getFIELD237());
	vf.setUserFunction("setDis()");
	vf.setUserFunction("checkIfCq()");
	//变更是否先做名称变更
	vf.setUserFunction("nameChange()");
	out.print(vf.ValueDefaultScript());
%>