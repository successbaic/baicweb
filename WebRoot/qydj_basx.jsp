<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id='QYDJ_BGSX' scope='page' class='com.macrosoft.icms.qydj.QYDJ_BGSX_SQ'/>
<jsp:useBean id='QYDJ_JBXX_SQ' scope='page' class='com.macrosoft.icms.qydj.QYDJ_JBXX_SQ'/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<html><head>
<title>备案信息</title>
<style type="text/css">
#yxsm2 {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
   font-size:10pt;
   font-family: 锟斤拷锟斤拷;
   color:#000080; 
}
</style>
<script language=javascript>
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
	if(ret!=undefined && ret!=""){
		form1.ALTAF01.value=ret;
	}	
}
function setvalue(obj)
{
	/**if (obj.checked)
	{		
		eval("document.form1.ALTAF"+obj.value+".disabled=false");
		if (obj.value=='01')//名称变更
		{
			//alert("鼠标双击『申请变更登记事项名称项』获取已核准的名称信息！");
		}
		else if (obj.value=='03')//法定代表人变更
		{
			alert("变更法定代表人,请同时选择『股东变更』！");			
		}
		else if (obj.value=='06')//许可经营项目变更
		{
			alert("变更许可经营项目，请同时变更『经营范围』和『一般经营项目』，同时选择『变更行业代码』！");
		}
		else if (obj.value=='07')//一般经营项目变更
		{
			alert("变更一般经营项目，请同时变更『经营范围』和『许可经营项目』，同时选择『变更行业代码』！");
 		}
		else if (obj.value=='12')//经营范围变更
		{
			alert("变更经营范围，请变更『许可经营项目』和『一般经营项目』，并同时选择『变更行业代码』！");
		}
		else if (obj.value=='10')//股东变更
		{
			
	    }
	}
	else
	{
		eval("document.form1.ALTAF"+obj.value+".value=''");
		if (obj.value=='07'){
			eval("document.form1.ALTAF"+obj.value+".value='(须经审批的，未获批准前不得经营) '");
		}
	}
	selectRela(obj)	;  //关联『许可经营项目』『一般经营项目』和『经营范围』
	**/
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
</script>
</head>
<body>
<%@include file="top.inc"%>
<%	
	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();
 	String sENTTYPE = Page.getENTTYPE();
 	String SIGN =Page.getSIGN();
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SPANAME=Page.getXGBH();
	if(SPANAME.equals("")){
		QYDJ_JBXX_SQ.setOPENO(OPENO);
		QYDJ_JBXX_SQ.doSelect();
		SPANAME=QYDJ_JBXX_SQ.getSPANAME();
	}
	QYDJ_JBXX_ZS.setPRIPID(PRIPID);
	QYDJ_JBXX_ZS.doSelect();
%>
<form name="form1" method="POST" action="web/qydj_bgsx_action.jsp" target="editframe">
<input type="hidden" name = "PRIPID" value=<%=PRIPID%>>
<input type="hidden" name = "ENTTYPE" value=<%=sENTTYPE%>>
<input type="hidden" name = "OPENO" value="<%=OPENO%>">
<input type="hidden" name = "SIGN" value="<%=SIGN%>">
<input type="hidden" name="REGORG" value="<%=QYDJ_JBXX_ZS.getREGORG() %>">
<input type="hidden" name="SPANAME" value="<%=SPANAME%>">
<input type="hidden" name="STATUS">
<%
String sTYPE="1";
if(sENTTYPE.equals("GS")){
%>
<%@ include file="public/gs_basx.inc" %>
<%}else if(sENTTYPE.equals("NZFR")){ 
%>
<%@ include file="public/nzfr_basx.inc" %>
<%}else if(sENTTYPE.equals("HHQY"))
  {%>
<%@ include file="public/hhqy_basx.inc" %>
<%}else if(sENTTYPE.equals("WZGS")){
%>
<%@ include file="public/wzgs_basx.inc" %>
<%}else if(sENTTYPE.equals("WGJY")){
%>
<%@ include file="public/wgjy_basx.inc" %>
<%}else if(sENTTYPE.equals("WGDB")){
%>
<%@ include file="public/wgdb_basx.inc" %>
<%}else if(sENTTYPE.equals("WZHH")){
%>
<%@ include file="public/wzhh_basx.inc" %>
<%}else if(sENTTYPE.equals("HZS")){
sTYPE="3";
%>
<%@include file="public/hzs_basx.inc" %>
<%} %>

<br>
<CENTER>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一页</div>
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
	//ec.checkedCheck("ALTITEM","请选择变更事项！");
	ec.setUserFunction("blankCheck()");
	//ec.setUserFunction("checkSub()");
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
	out.print(vf.ValueDefaultScript());
%>