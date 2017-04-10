<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id='GQDJ_BGSX' scope='page' class='com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ'/>
<jsp:useBean id='GQDJ_JBXX' scope='page' class='com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ'/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="GSGSJIN_BASIS02" scope="page"  class="com.macrosoft.icms.gsnw.GSGSJIN_BASIS02"/>
<jsp:useBean id="WR0212" scope="page"  class="com.macrosoft.icms.gsnw.WR0212"/>
<html><head>
<title>变更信息</title>
</head>
<script type='text/javascript' src='<%=request.getContextPath()%>/support/engine.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/support/util.js'></script>
<script lang=javascript>
function doblurregcap()
{
	var ALTAF07 = dwr.util.getValue("ALTAF07");
	if (fucCheckNUM(ALTAF07))
	{
		if (Math.abs(ALTAF07)>999999999999)
		{
			alert('出质股权数额变更后内容超过系统最大精度！');
			return false;
		}	
		else
			return true;
	}
	else
	{
		alert('出质股权数额变更后内容应为数字！');
		return false;
	}
}
</script>
<script language="javascript">
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
				{	if(((eleput.type=="text")||(eleput.type=="select-one")||(eleput.type=="textarea"))&&fucCheckLength(eleput.value)<=0)
					{
						//if ("ALTAF64"!=eleput.name  &&  "ALTAF08"!=eleput.name)
						{
							eleput.focus();
							alert("请填写"+eleput.title+"!");						
							return false;  
						}
					}
				}   		
			}
		}
	}
	return(true);
}
</script>
<body gcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<%@include file="../top.inc"%>
<%	
	String OPENO =Page.getOPENO();
	String NWID =Page.getXGBH();
	String NWSN	=Page.getpageKey();
 	String sENTTYPE = Page.getENTTYPE();
 	String SIGN =Page.getSIGN();
 	String REGNO=Page.getREGNO();
 	if((SIGN.equals("1")||SIGN.equals("0"))&&!OPENO.equals(""))
 	{
 		GQDJ_JBXX.setOPENO(OPENO);
 		GQDJ_JBXX.doSelect();
 		NWID=GQDJ_JBXX.getNWID();
 		NWSN=GQDJ_JBXX.getNWSN();
 	}
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
%>
<form name="form1" method="POST" action="gqdj_bgsx_action.jsp" target="editframe">
<input type="hidden" name = "ENTTYPE" value=<%=sENTTYPE%>>
<input type="hidden" name = "OPENO" value="<%=OPENO%>">
<input type="hidden" name = "SIGN" value="<%=SIGN%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>"> 
<input type="hidden" name="REGORG">
<input type="hidden" name="STATUS">

<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
   <td class="yxsm" colspan="6" align="center">
      <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>股权出质变更信息</font></p>
   </td>
</tr>
<tr class='tc'>
	<td colspan="2">项目</td>
	<td>原登记事项</td>
	<td>申请变更登记事项</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>股权所在公司名称</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE01" disabled title="名称变更前内容" maxlength='50'></td>
	<td class='lc2'><input type="text" size="45"  name="ALTAF01" title="名称变更后内容" maxlength='50'></td>
	<input type="hidden" name = "REMARK01" >
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>股权所在公司注册号</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE02" disabled title="注册号变更前内容" maxlength='50'></td>
	<td class='lc2'><input type="text" size="45"  name="ALTAF02" title="注册号变更后内容" maxlength='13'></td>
	<input type="hidden" name = "REMARK02" >
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="03" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>出质人姓名</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE03" disabled title="出质人姓名变更前内容" maxlength='45'></td>
	<td class='lc2'><input type="text" size="45"  name="ALTAF03"  title="出质人姓名变更后内容" maxlength='20'></td>
	<input type="hidden" name = "REMARK03" >
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="05" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>出质人证照号码</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE05"  disabled title="出质人证照号码变更前内容" maxlength='20'></td>
	<td class='lc2'><input type="text" size="45" name="ALTAF05"  title="出质人证照号码变更后内容" maxlength='20'></td>
	<input type="hidden" name = "REMARK05" >
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>质权人姓名</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE04" disabled title="质权人姓名变更前内容" maxlength='20'></td>
	<td class='lc2'><input type="text" size="45" name="ALTAF04" title="质权人姓名变更后内容" maxlength='45'></td>
	<input type="hidden" name = "REMARK04" >
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="06" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>质权人证照号码</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE06" disabled title="质权人证照号码变更前内容" maxlength='20'></td>
	<td class='lc2'><input type="text" size="45"  name="ALTAF06"  title="质权人证照号码变更后内容" maxlength='20'></td>
	<input type="hidden" name = "REMARK06" >
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM"  value="07" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>出质股权数额</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE07" disabled title="出质股权数额变更前内容" maxlength='12' datatype="NUM"> 万元/万股</td>
	<td class='lc2'><input type="text" size="20"  name="ALTAF07" onblur='doblurregcap()' title="出质股权数额变更后内容" maxlength='14' datatype="NUM"> 万元/万股</td>
	<input type="hidden" name = "REMARK07" >
</tr>
</table>
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
<input type="hidden" name="CDDL">
<script language=javascript>
function setvalue(obj)
{
	if (obj.checked)
	{		
		eval("document.form1.ALTAF"+obj.value+".disabled=false");
		/*
		if (obj.value=='01')//名称变更
		{
			alert("鼠标双击『申请变更登记事项名称项』获取已核准的名称信息！");
		}
		else if (obj.value=='03')//法定代表人变更
		{
			alert("变更法定代表人,请同时选择『股东变更』！");
		}
		*/
	}
	else
	{
		eval("document.form1.ALTAF"+obj.value+".value=''");
		eval("document.form1.REMARK"+obj.value+".value=''");
		eval("document.form1.ALTAF"+obj.value+".disabled=true");
	}	
}

</SCRIPT>
</form>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="../bottom.inc"%>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	//ec.checkedCheck("ALTITEM","请选择变更事项！");
	ec.setUserFunction("blankCheck()");
	ec.setUserFunction("doblurregcap()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	GQDJ_BGSX.setOPENO(OPENO);
	ArrayList list=GQDJ_BGSX.getDataList();
	vf.setData(list);
	
	WR0212.doSelect(NWID,NWSN);
	vf.setFormData("ALTBE01",WR0212.getENTERPRISENAME());
	vf.setFormData("ALTBE02",WR0212.getENTERPRISENO());
	vf.setFormData("ALTBE03",WR0212.getEXPORG());
	vf.setFormData("ALTBE05",WR0212.getEXPORGNO());
	vf.setFormData("ALTBE04",WR0212.getIMPORG());
	vf.setFormData("ALTBE06",WR0212.getIMPORGNO());
	vf.setFormData("ALTBE07",WR0212.getIMPAM());
	vf.setFormData("REGORG",WR0212.getDJJG());
	out.print(vf.ValueDefaultScript());
%>