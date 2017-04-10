<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id='MCGL_BGSX' scope='page' class='com.macrosoft.icms.mcgl.MCGL_BGSX_SQ'/>
<jsp:useBean id='MCGL_JBXX_SQ' scope='page' class='com.macrosoft.icms.mcgl.MCGL_JBXX_SQ'/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head>
<title>延期信息</title>
<script language=javascript>	
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
function doSub(){
	if(form1errorCheck()){
		document.getElementById("subid").disabled=true;
		document.getElementById("waitdiv").style.display="";
		document.form1.submit();
	}
}
</script>
</head>
<body>
<%@include file="../top.inc"%>
<%	
	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();
 	String SIGN =Page.getSIGN();
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SPANAME=Page.getXGBH();
	
	String NAMEID="";
	if(OPENO.equals("")){
		NAMEID=Page.getPRIPID();
	}else{
		MCGL_JBXX_SQ.setOPENO(OPENO);
		MCGL_JBXX_SQ.doSelect();
		SPANAME=MCGL_JBXX_SQ.getSPANAME();
		NAMEID=MCGL_JBXX_SQ.getNAMEID();
	}
	MCGL_JBXX_ZS.setNAMEID(NAMEID);
	MCGL_JBXX_ZS.doSelect();		
%>
<form name="form1" method="POST" action="mcgl_tzxx_action.jsp" target="editframe">
<input type="hidden" name = "PRIPID" value=<%=PRIPID%>>
<input type="hidden" name = "OPENO" value="<%=OPENO%>">
<input type="hidden" name = "SIGN" value="<%=SIGN%>">
<input type="hidden" name = "NAMEID" value="<%=NAMEID%>">
<input type="hidden" name="SPANAME" value="<%=SPANAME%>">
<input type="hidden" name="REGORG" value="<%=MCGL_JBXX_ZS.getPREREGORG() %>">
<input type="hidden" name="STATUS">
<table border="1" width="100%" >
<caption>名称调整事项</caption>
 <tr>
	<td class="yxsm" align="center" colspan="2">项目</td>
	<td class="yxsm" align="center">调整前事项</td>
	<td class="yxsm" align="center">调整后事项</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>名称保留期延期至</td>
	<td class='lc2'>
	<input type="text" size="45" disabled name="ALTBE08" title="名称保留期至调整前内容" maxlength='50'></td>
	<td class='lc2'>
	<input type="text" size="45" disabled name="ALTAF08" title="名称保留期至调整后内容" maxlength='50'></td>
</tr>
</table>
<br>
<CENTER>
    <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
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
<div class="subImgs" id="subid" onclick="doSub()">下一页</div>
<%
}
%>
</CENTER>
<input type="hidden" name="CDDL" value="0">
</form>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="../bottom.inc"%>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("blankCheck()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	MCGL_BGSX.setOPENO(OPENO);
	vf.setData(MCGL_BGSX.getDataList());
	vf.setFormData("ALTBE08",MCGL_JBXX_ZS.getSAVEPERTO());//保留期至
	vf.setFormData("ALTAF08",SysUtility.getCalDate(MCGL_JBXX_ZS.getSAVEPERTO(),0,6,0));//保留期至
	out.print(vf.ValueDefaultScript());
%>