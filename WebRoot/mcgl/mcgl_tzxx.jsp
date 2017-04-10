<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id='MCGL_BGSX' scope='page' class='com.macrosoft.icms.mcgl.MCGL_BGSX_SQ'/>
<jsp:useBean id='MCGL_JBXX_SQ' scope='page' class='com.macrosoft.icms.mcgl.MCGL_JBXX_SQ'/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head>
<title>调整信息</title>
<%	
	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();
 	String SIGN =Page.getSIGN();
	
	String SPANAME=Page.getXGBH();
	
	//首次进入后后期修改获取值会有不同
	String NAMEID="";
	if(OPENO.equals("")){
		NAMEID=Page.getPRIPID();
	}else{
		MCGL_JBXX_SQ.setOPENO(OPENO);
		MCGL_JBXX_SQ.doSelect();
		if(SPANAME.equals("")){
			SPANAME=MCGL_JBXX_SQ.getSPANAME();	
		}
		NAMEID=MCGL_JBXX_SQ.getNAMEID();
	}
	//基本信息获取
	MCGL_JBXX_ZS.setNAMEID(NAMEID);
	MCGL_JBXX_ZS.doSelect();
	String ENTCLASS=MCGL_JBXX_ZS.getENTCAT();
	
	String XZQH=webuser.getXZQH();
	
	
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	
	ArrayList list=MCGL_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	String ALTAF162="";
	String ALTBE162="";
	if(list.size()>0){
		for(int i=0;i<list.size();i++){
			com.macrosoft.icms.mcgl.MCGL_BGSX_SQ bgsx=(com.macrosoft.icms.mcgl.MCGL_BGSX_SQ)list.get(i);			
			if(bgsx.getALTITEM().equals("04")){
				vf.setFormData("ALTAF04",bgsx.getALTAF());
				vf.setFormData("ALTITEM","04");
				vf.setFormData("ALTBE04",bgsx.getALTBE());				
			}else if(bgsx.getALTITEM().equals("161")){
				vf.setFormData("ALTAF161",bgsx.getALTAF());
				vf.setFormData("ALTBE161",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("162")){
				vf.setFormData("ALTAF162",bgsx.getALTAF());
				vf.setFormData("ALTBE162",bgsx.getALTBE());
				ALTAF162=bgsx.getALTAF();
				ALTBE162=bgsx.getALTBE();
			}else if(bgsx.getALTITEM().equals("163")){
				vf.setFormData("ALTAF163",bgsx.getALTAF());
				vf.setFormData("ALTBE163",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("164")){
				vf.setFormData("ALTAF164",bgsx.getALTAF());				
				vf.setFormData("ALTBE164",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("165")){
				vf.setFormData("ALTAF165",bgsx.getALTAF());
				vf.setFormData("ALTBE165",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("166")){
				vf.setFormData("ALTAF166",bgsx.getALTAF());
				vf.setFormData("ALTBE166",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("05")){
				vf.setFormData("ALTAF05",bgsx.getALTAF());
				vf.setFormData("ALTITEM","05");
				vf.setFormData("ALTBE05",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("07")){
				vf.setFormData("ALTAF07",bgsx.getALTAF());
				vf.setFormData("ALTITEM","07");
				vf.setFormData("ALTBE07",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("98")){
				vf.setFormData("ALTAF98",bgsx.getALTAF());				
				vf.setFormData("ALTITEM","98");
				vf.setFormData("ALTBE98_TEXT",icms.getSysDm("INDUSTRYPHY",bgsx.getALTBE()));
				vf.setFormData("ALTBE98",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("11")){
				vf.setFormData("ALTAF11",bgsx.getALTAF());
				vf.setFormData("ALTAF11_TEXT",icms.getSysDm("INDUSTRYCO",bgsx.getALTAF()));
				vf.setFormData("ALTBE11_TEXT",icms.getSysDm("INDUSTRYCO",bgsx.getALTBE()));
				vf.setFormData("ALTBE11",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("12")){
				vf.setFormData("ALTAF12",bgsx.getALTAF());
				vf.setFormData("ALTITEM","12");
				vf.setFormData("ALTBE12",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("06")){
				vf.setFormData("ALTAF06",bgsx.getALTAF());
				vf.setFormData("ALTITEM","06");
				vf.setFormData("ALTBE06",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("114")){
				vf.setFormData("ALTAF114",bgsx.getALTAF());
				vf.setFormData("ALTITEM","114");
				vf.setFormData("ALTAF114_TEXT",icms.getSysDm("CURRENCY",bgsx.getALTAF()));
				vf.setFormData("ALTBE114",bgsx.getALTBE());
				vf.setFormData("ALTBE114_TEXT",icms.getSysDm("CURRENCY",bgsx.getALTBE()));
			}else if(bgsx.getALTITEM().equals("110")){
				vf.setFormData("ALTAF110",bgsx.getALTAF());
				vf.setFormData("ALTITEM","110");
				vf.setFormData("ALTAF110_TEXT",icms.getSysDm("CURRENCY",bgsx.getALTAF()));
				vf.setFormData("ALTBE110",bgsx.getALTBE());
				vf.setFormData("ALTBE110_TEXT",icms.getSysDm("CURRENCY",bgsx.getALTBE()));
			}else if(bgsx.getALTITEM().equals("08")){
				vf.setFormData("ALTAF08",bgsx.getALTAF());
				vf.setFormData("ALTITEM","08");
				vf.setFormData("ALTBE08",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("09")){
				vf.setFormData("ALTAF09",bgsx.getALTAF());
				vf.setFormData("ALTITEM","09");
				vf.setFormData("ALTBE09",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("13")){
				vf.setFormData("ALTAF13",bgsx.getALTAF());
				vf.setFormData("ALTITEM","13");
				vf.setFormData("ALTBE13",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("16")){
				vf.setFormData("ALTAF16",bgsx.getALTAF());
				vf.setFormData("ALTITEM","16");
				vf.setFormData("ALTBE16",bgsx.getALTBE());
			}else if(bgsx.getALTITEM().equals("14")){
				vf.setFormData("ALTAF14",bgsx.getALTAF());
				vf.setFormData("ALTITEM","14");
				vf.setFormData("ALTBE14",bgsx.getALTBE());
			}
		}	
	}
%>
<script language=javascript>
var ENTCLASS='<%=ENTCLASS%>';
function doblurregcap()
{	
	var REGCAP = '';
	if('5'!=ENTCLASS){
		REGCAP = document.form1.ALTAF05.value;
	}else
		REGCAP = document.form1.ALTAF04.value;
	if (fucCheckNUM(REGCAP))
	{
		if (Math.abs(REGCAP)>999999999999)
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

function getHydm(id){
	var aval=document.form1.ALTAF98.value;
	if(aval==""){
		alert("请选择行业门类！");
		return;
	}
	var url = "../support/doSelDm.jsp?type=INDUSTRYCO&remark="+aval;
	var info="dialogHeight:580px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		var testId=id+"_TEXT"
		document.getElementById(id).value=ret[0];
		document.getElementById(testId).value=ret[1];
	}	
}

function getBz(id){
	var url = "../support/doSelDm.jsp?type=CURRENCY";
	var info="dialogHeight:580px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		var testId=id+"_TEXT"
		document.getElementById(id).value=ret[0];
		document.getElementById(testId).value=ret[1];
	}
}

/* function getDom(openo){
	var url = "../support/getDom.jsp?openo="+openo+"&lx=mc";
	var info="dialogHeight:400px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		document.getElementById("ALTAF02").value=ret[6];
		document.getElementById("PROVINCE").value=ret[0];
		document.getElementById("CITY").value=ret[1];
		document.getElementById("COUNTY").value=ret[2];
		document.getElementById("TOWN").value=ret[3];
		document.getElementById("VILLAGE").value=ret[4];
		document.getElementById("HOUSENUMBER").value=ret[5];
	}
} */

function writeDOM(){
	if(document.getElementById("ALTAF161")!=null &&document.getElementById("ALTAF162")!==null
			&&document.getElementById("ALTAF163")!==null&&document.getElementById("ALTAF164")!==null
			&&document.getElementById("ALTAF165")!==null&&document.getElementById("ALTAF166")!==null){
		var proSel = document.getElementById("ALTAF161");
		var ctSel =  document.getElementById("ALTAF162");
		var countySel = document.getElementById("ALTAF163");
		var proText = proSel.options[proSel.selectedIndex].text; 
		var ctText = ctSel.options[ctSel.selectedIndex].text; 
		var countyText = countySel.options[countySel.selectedIndex].text; 
		
		var townm=document.getElementById("ALTAF164").value;
		var Address="";
		if(townm.indexOf("街道办事处")>0
		||townm.indexOf("办事处")>0
		||townm.indexOf("街道")>0
		){
			Address = proText+ctText+countyText+		
			document.getElementById("ALTAF165").value+
			document.getElementById("ALTAF166").value;
		}else{
			Address = proText+ctText+countyText+
			document.getElementById("ALTAF164").value+
			document.getElementById("ALTAF165").value+
			document.getElementById("ALTAF166").value;			
		}	
		 if(document.getElementById("ALTAF04")!=null&&'5'!=ENTCLASS){
			document.getElementById("ALTAF04").value = Address;
		 }
		 if(document.getElementById("ALTAF16")!=null){
			document.getElementById("ALTAF16").value = Address;
		 }
	}
}

function getJYCS(openo){
	var url = "../support/getDom.jsp?openo="+openo+"&lx=mc";
	var info="dialogHeight:400px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		document.getElementById("ALTAF13").value=ret[6];
		document.getElementById("PROVINCE").value=ret[0];
		document.getElementById("CITY").value=ret[1];
		document.getElementById("COUNTY").value=ret[2];
		document.getElementById("TOWN").value=ret[3];
		document.getElementById("VILLAGE").value=ret[4];
		document.getElementById("HOUSENUMBER").value=ret[5];
	}
}

function cityChange(CITY,COUNTY){
	var obje="parent.form1."+COUNTY;
	document.frames["hiddenframe"].location="../support/load.jsp?STYPE=DISCOUS&OBJ="+obje+"&SREAMRK="+CITY;
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
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);
%>
<form name="form1" method="POST" action="mcgl_tzxx_action.jsp" target="editframe">
<input type="hidden" name ="PRIPID" value=<%=PRIPID%>>
<input type="hidden" name ="OPENO" value="<%=OPENO%>">
<input type="hidden" name ="SIGN" value="<%=SIGN%>">
<input type="hidden" name="SPANAME" value="<%=SPANAME%>">
<input type="hidden" name="REGORG" value="<%=MCGL_JBXX_ZS.getPREREGORG() %>">
<input type="hidden" name="STATUS">
<input type="hidden" name="NAMEID" value="<%=NAMEID%>">
<%-- <input type="hidden" name="PROVINCE" id="PROVINCE" value="<%=MCGL_JBXX_SQ.getPROVINCE() %>">
<input type="hidden" name="CITY" id="CITY" value="<%=MCGL_JBXX_SQ.getCITY() %>">
<input type="hidden" name="COUNTY" id="COUNTY" value="<%=MCGL_JBXX_SQ.getCOUNTY() %>">
<input type="hidden" name="TOWN" id="TOWN" value="<%=MCGL_JBXX_SQ.getTOWN() %>">
<input type="hidden" name="VILLAGE" id="VILLAGE" value="<%=MCGL_JBXX_SQ.getVILLAGE() %>">
<input type="hidden" name="HOUSENUMBER" id="HOUSENUMBER" value="<%=MCGL_JBXX_SQ.getHOUSENUMBER() %>"> --%>
<table border="1" width="100%" >
<caption>[<%=MCGL_JBXX_ZS.getENTNAME() %>] 名称调整事项</caption>
 <tr>
	<td colspan="3" class="yxsm" align="center">项目</td>
	<td class="yxsm" align="center">调整前事项</td>
	<td class="yxsm" align="center">调整后事项</td>
</tr>
<%
if(ENTCLASS.equals("5")){
%>
<tr>
	<td class='lc1'><input name="ALTITEM" value="09" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">经营者</td>
	<td class='lc2'>
	<input type="text" name="ALTBE09" disabled title="经营者调整前内容" maxlength='2000'></td>
	<td class='lc2'><input type="text" name="ALTAF09" title="经营者调整后内容" maxlength='2000'>
	</td>
</tr>
<%--
<tr>
	<td class='lc1' rowspan="7"><input name="ALTITEM" value="16" type="checkbox" onclick="setvalue(this)" > </td>
	<td class='lc1' rowspan="7">经营场所</td>
	<td class='lc2'>（省/直辖市/自治区）</td>
	<td class='lc2'>
	<select name="ALTBE161" title="省" disabled>
		<option value='370000'>山东省</option>
	</select>
</td>
	<td class='lc2'>
	<select name="ALTAF161" id="ALTAF161" title="省"  onchange="writeDOM()">
		<option value='370000'>山东省</option>
	</select>
	</td>
</tr>
<tr>
<td class='lc2'>（市/地区/盟/自治州）</td>
<td class='lc2'>
	<select name="ALTBE162" disabled maxlength=20>
		<option value='<%=XZQH+"00"%>'><%=XZQHJC%></option>
	</select>
</td>
<td class='lc2'>
	<select name="ALTAF162" id="ALTAF162" id="CITY" title="市" maxlength=20>
		<option value='<%=XZQH+"00"%>'><%=XZQHJC%></option>
	</select>
</td>
</tr>
<tr>
<td class='lc2' nowrap>（区/县/县级市/旗）</td>
<td class='lc2'>
	<select name=ALTBE163 disabled maxlength=20>
		<%=icms.getSysDmListByRemark("DISCOUS",XZQH) %>
	</select>
</td>
<td class='lc2'>
	<select name="ALTAF163" id="ALTAF163" onchange="writeDOM()"  title="县" maxlength=20>
		<%=icms.getSysDmListByRemark("DISCOUS",XZQH) %>
	</select>	
</td>
</tr>
<tr>
<td class='lc2'>（乡/民族乡/镇/街道）</td>
<td class='lc2'>
<input type="text" name="ALTBE164"  disabled size="23" maxlength=25>
</td>
<td class='lc2'>
<input type="text" name="ALTAF164" id="ALTAF164" title="乡" size="23" maxlength=25 onchange="writeDOM()">
</td>
</tr>
<tr>
<td class='lc2'>（路/村/社区）</td>
<td class='lc2'>
<input type="text" name="ALTBE165" disabled size="23" maxlength=25>
</td>
<td class='lc2'>
<input type="text" name="ALTAF165" id="ALTAF165" title="村" size="23" maxlength=25 onchange="writeDOM()">
</td>
</tr>
<tr>
<td class='lc2'>（号）</td>
<td class='lc2'>
<input type="text" name="ALTBE166" disabled size="10" maxlength=25>
</td>
<td class='lc2'>
<input type="text" name="ALTAF166" id="ALTAF166" title="号" size="10" maxlength=25 onchange="writeDOM()">
</td>
</tr>
<tr>
<td class='lc2'>经营场所</td>
<td class='lc2'><input type="text" size="40" disabled name="ALTBE16" title="经营场所调整前内容" maxlength='50'></td>
<td class='lc2'><input type="text" size="40" name="ALTAF16" id="ALTAF16" title="经营场所调整后内容" maxlength='50'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">资金数额</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE04" disabled title="资金数额调整前内容"> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF04" onblur='doblurregcap()' title="资金数额调整后内容" maxlength='14' datatype="NUM"> 万元
	</td>	
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="14" type="checkbox" onclick="setvalue(this)"></td>
	<td class="lc1" colspan="2">拟登记机关</td>    
	<td class="lc2"><select name="ALTBE14" disabled title="拟登记机关调整前内容">
	<option value=''></option>
	<%=icms.getSysDmList("REGORG")%>
	</select> </td>
  	<td class="lc2"><select name="ALTAF14" title="拟登记机关调整后内容">
	<option value=''></option>
	<%=icms.getSysDmList("REGORG")%>
	</select> </td>
</tr> 
 --%>
<%	
}else{
%>
<tr>
	<td class='lc1' rowspan="7"><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)" > </td>
	<td class='lc1' rowspan="7">住所</td>
	<td class='lc2'>（省/直辖市/自治区）</td>
	<td class='lc2'>
	<select name="ALTBE161" title="省" disabled>
		<%=icms.getSysDmList("PROVINCE")%>
	</select>
</td>
	<td class='lc2'>
	<select name="ALTAF161" id="ALTAF161" title="省"  onchange="writeDOM()">
		<%=icms.getSysDmList("PROVINCE")%>
	</select>
	</td>
</tr>
<tr>
<td class='lc2'>（市/地区/盟/自治州）</td>
<td class='lc2'>
	<select name="ALTBE162" disabled maxlength=20 onchange="cityChange(this.value,'ALTBE163')">
		<%=ContrInfo.getDiShiOption(icms,webuser.getXZQH()) %>
	</select>
</td>
<td class='lc2'>
	<select name="ALTAF162" id="ALTAF162" id="CITY" title="市" maxlength=20 onchange="cityChange(this.value,'ALTAF163')">
		<%=ContrInfo.getDiShiOption(icms,webuser.getXZQH()) %>
	</select>
</td>
</tr>
<tr>
<td class='lc2' nowrap>（区/县/县级市/旗）</td>
<td class='lc2'>
	<select name=ALTBE163 disabled maxlength=20>
		<%=ContrInfo.getBenShiQuXianOption(icms,webuser.getXZQH(),MCGL_JBXX_ZS.getCITY()) %>
	</select>
</td>
<td class='lc2'>
	<select name="ALTAF163" id="ALTAF163" onchange="writeDOM()"  title="县" maxlength=20>
		<%=ContrInfo.getBenShiQuXianOption(icms,webuser.getXZQH(),ALTAF162) %>
	</select>	
</td>
</tr>
<tr>
<td class='lc2'>（乡/民族乡/镇/街道）</td>
<td class='lc2'>
<input type="text" name="ALTBE164"  disabled size="23" maxlength=25>
</td>
<td class='lc2'>
<input type="text" name="ALTAF164" id="ALTAF164" title="乡" size="23" maxlength=25 onchange="writeDOM()">
</td>
</tr>
<tr>
<td class='lc2'>（路/村/社区）</td>
<td class='lc2'>
<input type="text" name="ALTBE165" disabled size="23" maxlength=25>
</td>
<td class='lc2'>
<input type="text" name="ALTAF165" id="ALTAF165" title="村" size="23" maxlength=25 onchange="writeDOM()">
</td>
</tr>
<tr>
<td class='lc2'>（号）</td>
<td class='lc2'>
<input type="text" name="ALTBE166" disabled size="10" maxlength=25>
</td>
<td class='lc2'>
<input type="text" name="ALTAF166" id="ALTAF166" title="号" size="10" maxlength=25 onchange="writeDOM()">
</td>
</tr>
<tr>
<td class='lc2'>住所</td>
<td class='lc2'><input type="text" size="40" disabled name="ALTBE04" title="住所调整前内容" maxlength='50'></td>
<td class='lc2'><input type="text" size="40" name="ALTAF04" id="ALTAF04" title="住所调整后内容" maxlength='50'></td>
</tr>
<%-- <tr>	<input type="text" size="40" disabled name="ALTBE02" title="住所调整前内容" maxlength='50'></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" id="ALTAF02" title="住所调整后内容" maxlength='50' readonly>
	<input type="button" value="点击录入" onclick="getDom('<%=OPENO %>')" class="button">
	<input type="text" size="40" name="ALTAF02" id="ALTAF02" title="住所调整后内容" maxlength='50' readonly>
	</td>
</tr> --%>
<%
if(ENTCLASS.equals("8")){
%>
<tr>
	<td class='lc1'><input name="ALTITEM" value="06" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">拟定投资总额</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE06" disabled title="拟定投资总额调整前内容"> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF06" onblur='doblurregcap()' title="拟定投资总额调整后内容" maxlength='14' datatype="NUM"> 万元
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="114" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">拟定投资总额币种</td>
	<td class='lc2'>
	<select name="ALTBE114" disabled title="拟定投资总额币种">
	<option value=''></option>
	<%=icms.getSysDmList("CURRENCY")%>
	</select></td>
	<td class='lc2'>
	<input type="text" disabled name="ALTAF114_TEXT" id="ALTAF114_TEXT">
	<input type="button" value="选择" onclick="getBz('ALTAF114')" class="button">
	<input type="hidden" name="ALTAF114">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="05" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">拟定注册资本</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE05" disabled title="拟定注册资本调整前内容"> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF05" onblur='doblurregcap()' title="拟定注册资本调整后内容" maxlength='14' datatype="NUM"> 万元
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="110" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">拟定注册资本币种</td>
	<td class='lc2'>
	<select name="ALTBE110" disabled title="拟定注册资本币种">
	<option value=''></option>
	<%=icms.getSysDmList("CURRENCY")%>
	</select>
	</td>
	<td class='lc2'>
	<input type="text" disabled name="ALTAF110_TEXT" id="ALTAF110_TEXT">
	<input type="button" value="选择" onclick="getBz('ALTAF110')" class="button">
	<input type="hidden" name="ALTAF110">
	</td>	
</tr>
<%	
}else{
%>
<tr>
	<td class='lc1'><input name="ALTITEM" value="05" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">注册资本</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE05" disabled title="注册资本调整前内容"> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF05" onblur='doblurregcap()' title="注册资本调整后内容" maxlength='14' datatype="NUM"> 万元
	</td>	
</tr>
<%} %>
<tr>
	<td class='lc1'><input name="ALTITEM" value="07" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">企业类型</td>
	<td class='lc2'>	
	<select size="1" name="ALTBE07" title="企业类型调整前内容" disabled>
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE")%>
	</select>
	</td>
	<td class='lc2'>	
	<select name="ALTAF07" title="企业类型调整后内容">
	 <option value="">请选择企业类型</option>
		<%if(ENTCLASS.equals("1")){%>
		 <option value='1110'>1110|有限责任公司(国有独资)</option>
									<option value='1140'>1140|有限责任公司(国有控股)</option>
									<option value='1152'>1152|有限责任公司(自然人投资或控股的法人独资)</option>
									<option value='1213'>1213|股份有限公司(上市、国有控股)</option>
									<option value='1223'>1223|股份有限公司(非上市、国有控股)</option>
									<option value='2110'>2110|有限责任公司分公司(国有独资)</option>
									<option value='2140'>2140|有限责任公司分公司(国有控股)</option>
									<option value='2152'>2152|有限责任公司分公司(自然人投资或控股的法人独资)</option>
									<option value='2213'>2213|股份有限公司分公司(上市、国有控股)</option>
									<option value='2223'>2223|股份有限公司分公司(国有控股)</option>
		 <%=icms.getSysDmList("ENTTYPE", "NZYY")%>
		 <%=icms.getSysDmList("ENTTYPE", "NZFR")%>
	   <%}else if(ENTCLASS.equals("2")) {%>
		 <option value='1120'>1120|有限责任公司(外商投资企业投资)</option>
									<option value='1121'>1121|有限责任公司(外商投资企业合资)</option>
									<option value='1122'>1122|有限责任公司(外商投资企业与内资合资)</option>
									<option value='1123'>1123|有限责任公司(外商投资企业法人独资)</option>
									<option value='1130'>1130|有限责任公司(自然人投资或控股)</option>
									<option value='1150'>1150|一人有限责任公司</option>
									<option value='1151'>1151|有限责任公司(自然人独资)</option>
									<option value='1152'>1152|有限责任公司(自然人投资或控股的法人独资)</option>
									<option value='1190'>1190|其他有限责任公司</option>
									<option value='1200'>1200|股份有限公司</option>
									<option value='1210'>1210|股份有限公司(上市)</option>
									<option value='1211'>1211|股份有限公司(上市、外商投资企业投资)</option>
									<option value='1212'>1212|股份有限公司(上市、自然人投资或控股)</option>
									<option value='1219'>1219|其他股份有限公司(上市)</option>
									<option value='1220'>1220|股份有限公司(非上市)</option>
									<option value='1221'>1221|股份有限公司(非上市、外商投资企业投资)</option>
									<option value='1222'>1222|股份有限公司(非上市、自然人投资或控股)</option>
									<option value='1229'>1229|其他股份有限公司(非上市)</option>
									<option value='2000'>2000|内资分公司</option>
									<option value='2100'>2100|有限责任公司分公司</option>
									<option value='2120'>2120|有限责任公司分公司(外商投资企业投资)</option>
									<option value='2121'>2121|有限责任公司分公司(外商投资企业合资)</option>
									<option value='2122'>2122|有限责任公司分公司(外商投资企业与内资合资)</option>
									<option value='2123'>2123|有限责任公司分公司(外商投资企业法人独资)</option>
									<option value='2130'>2130|有限责任公司分公司(自然人投资或控股)</option>
									<option value='2150'>2150|一人有限责任公司分公司</option>
									<option value='2151'>2151|有限责任公司分公司(自然人独资)</option>
									<option value='2152'>2152|有限责任公司分公司(自然人投资或控股的法人独资)</option>
									<option value='2190'>2190|其他有限责任公司分公司</option>
									<option value='2200'>2200|股份有限公司分公司</option>
									<option value='2210'>2210|股份有限公司分公司(上市)</option>
									<option value='2211'>2211|股份有限公司分公司(上市、外商投资企业投资)</option>
									<option value='2212'>2212|股份有限公司分公司(上市、自然人投资或控股)</option>
									<option value='2219'>2219|其他股份有限公司分公司(上市)</option>
									<option value='2220'>2220|股份有限公司分公司(非上市)</option>
									<option value='2221'>2221|股份有限公司分公司(非上市、外商投资企业投资）</option>
									<option value='2222'>2222|股份有限公司分公司(非上市、自然人投资或控股)</option>
									<option value='2229'>2229|其他股份有限公司分公司(非上市)</option>
		 <%=icms.getSysDmList("ENTTYPE", "GRDZ")%>
		 <%=icms.getSysDmList("ENTTYPE", "GRDZFZ")%>
		 <%=icms.getSysDmList("ENTTYPE", "HHQY")%>
		 <%=icms.getSysDmList("ENTTYPE", "HHQYFZ")%>
	 <%}else if(ENTCLASS.equals("6")){ %>
		 <%=icms.getSysDmList("ENTTYPE", "HZS")%>
		 <%=icms.getSysDmList("ENTTYPE", "HZSFZ")%>
	 <%}else if(ENTCLASS.equals("8")){ %>
		 <%=icms.getSysDmList("ENTTYPE", "WZGS")%>
		 <%=icms.getSysDmList("ENTTYPE", "WZFZ")%>
		 <%=icms.getSysDmList("ENTTYPE", "WGDB")%>
		 <%=icms.getSysDmList("ENTTYPE", "WGJY")%>
		 <%=icms.getSysDmList("ENTTYPE", "WZHH")%>
		 <%=icms.getSysDmList("ENTTYPE", "WZHHFZ")%>
	 <%} %>
	</select>
	</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="14" type="checkbox" onclick="setvalue(this)"></td>
	<td class="lc1" colspan="2">拟登记机关</td>    
	<td class="lc2"><select name="ALTBE14" disabled title="拟登记机关调整前内容">
	<option value=''></option>
	<%=icms.getBsDjjg(XZQH)%>
	</select> </td>
  	<td class="lc2"><select name="ALTAF14" title="拟登记机关调整后内容">
	<option value=''></option>
	<%=icms.getBsDjjg(XZQH)%>
	</select> </td>
</tr> 
<%} %>
<tr> 
	<td class='lc1' rowspan="2"><input name="ALTITEM" value="98" type="checkbox" onClick="setvalue(this)">
	</td><td class="lc1" rowspan="2" nowrap>行业门类<br/>及代码</td>   
	<td class="lc1">行业门类</td>
	<td class="lc2">
	<select name="ALTBE98" disabled title="行业门类调整前内容">
	<option value=''></option>
	<%=icms.getSysDmList("INDUSTRYPHY")%>
	</select>
	</td>
	<!-- <input type="text" disabled name="ALTBE98_TEXT">
	<input type="hidden" name="ALTBE98">
	</td>	 -->
	<%-- <select name="ALTBE11" disabled title="行业代码调整前内容">
	<option value=''></option>
	<%=icms.getSysDmList("INDUSTRYCO")%>
	</select> --%>
	<!-- <td class="lc2">
	行业门类
	</td> -->
	<td class="lc2">
	<!-- <input type="text" disabled name="ALTAF98_TEXT">
	<input type="hidden" name="ALTAF98"> -->
	<select name="ALTAF98" title="行业门类调整前内容">
	<option value=''></option>
	<%=icms.getSysDmList("INDUSTRYPHY")%>
	</select>
	</td>
</tr>
<tr>
<td class="lc1">行业代码</td>
<td class="lc2"><input type="text" disabled name="ALTBE11_TEXT">
	<input type="hidden" name="ALTBE11"></td>
<!-- <td class="lc2">行业代码</td> -->
<td class="lc2">
	<input type="text" disabled name="ALTAF11_TEXT" id="ALTAF11_TEXT">
	<input type="button" value="选择" onclick="getHydm('ALTAF11')" class="button">
	<input type="hidden" name="ALTAF11" id="ALTAF11">
</td>
</tr>
<%--
<SCRIPT LANGUAGE="JavaScript">
	function dopre(t)
	{
		// 判断如果行业代码被选中，而行业门类
		if (t.checked==true)
		{
			// 行业门类没选中
			var a=document.getElementsByTagName('input');
			for (k=0;k<=a.length-1 ;k++ )
			{
				if (a[k].value=='98')
				{
					if (a[k].checked==false)
					{
						alert('请变更行业门类！');
						break;
					}
				}		
			}
		}
	}
</SCRIPT>
<tr>	
	<td class='lc1'><input name="ALTITEM" onclick='dopre(this)' value="11" type="checkbox" onclick="setvalue(this)"></td>
	<td class="lc1">行业代码</td>    
	<td class="lc2"><select name="ALTBE11" disabled title="行业代码调整前内容">
	<option value=''></option>
	<%=icms.getSysDmList("INDUSTRYCO")%>
	</select> </td>
  	<td class="lc2"><select name="ALTAF11" title="行业代码调整后内容">
	<option value=''></option>
	<%=icms.getSysDmList("INDUSTRYCO")%>
	</select> </td>
</tr> 
 --%>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' colspan="2">经营范围</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="经营范围调整前内容" maxlength='2000'></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF12" title="经营范围调整后内容" maxlength='2000'></textarea>
	</td>
</tr>
<!-- <tr>
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>保留期限</td>
	<td class='lc2'>
	<input type="text" name="ALTBE08" disabled title="保留期限调整前内容" maxlength='2000'></td>
	<td class='lc2'><input type="text" name="ALTAF08" title="保留期限调整后内容" maxlength='2000'>
	</td>
</tr> -->
</table>
<div>
	<font color="red">提示：若要调整某个项目，请先选中左边复选框，再在右侧填写调整后的内容。</font>
</div>
<script language="javascript">
function loadhydm(INDUSTRYPHY)
{
	document.frames["hiddenframe"].location="../support/loadhydm.jsp?INDUSTRYPHY="+INDUSTRYPHY+"&OBJ=parent.form1.ALTBE11";
}

function loadhydm1(INDUSTRYPHY)
{
	document.frames["hiddenframe1"].location="../support/loadhydm.jsp?INDUSTRYPHY="+INDUSTRYPHY+"&OBJ=parent.form1.ALTAF11";
}
</script>
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
<IFRAME height="0" width="100" name="hiddenframe"  id="hiddenframe"></IFRAME>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="../bottom.inc"%>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.checkedCheck("ALTITEM","请选择变更事项！");
	ec.setUserFunction("blankCheck()");
	//ec.setUserFunction("doblurregcap()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	
	//MCGL_BGSX.setOPENO(OPENO);
	//ArrayList list2=MCGL_BGSX.getDataList2();
	//vf.setData(list2);
	
	
	if("5".equals(ENTCLASS)){
		vf.setFormData("ALTBE16",MCGL_JBXX_ZS.getDOM());
		vf.setFormData("ALTBE04",MCGL_JBXX_ZS.getREGCAP());
	}else{
		vf.setFormData("ALTBE04",MCGL_JBXX_ZS.getDOM());
		vf.setFormData("ALTBE05",MCGL_JBXX_ZS.getREGCAP());//注册资本
	}
	vf.setFormData("ALTBE161",MCGL_JBXX_ZS.getPROVINCE());
	vf.setFormData("ALTBE162",MCGL_JBXX_ZS.getCITY());
	vf.setFormData("ALTBE163",MCGL_JBXX_ZS.getCOUNTY());
	vf.setFormData("ALTBE164",MCGL_JBXX_ZS.getSTREET());
	vf.setFormData("ALTBE165",MCGL_JBXX_ZS.getROAD());
	vf.setFormData("ALTBE166",MCGL_JBXX_ZS.getDOORPLATE());
	
	
	vf.setFormData("ALTBE07",MCGL_JBXX_ZS.getENTTYPE());//企业类型
	//vf.setFormData("ALTBE98_TEXT",icms.getSysDm("INDUSTRYPHY",MCGL_JBXX_ZS.getINDUSTRYPHY()));//行业门类
	vf.setFormData("ALTBE11_TEXT",icms.getSysDm("INDUSTRYCO",MCGL_JBXX_ZS.getINDUSTRYCO()));//行业代码
	vf.setFormData("ALTBE98",MCGL_JBXX_ZS.getINDUSTRYPHY());//行业门类
	vf.setFormData("ALTBE11",MCGL_JBXX_ZS.getINDUSTRYCO());//行业代码
	vf.setFormData("ALTBE12",MCGL_JBXX_ZS.getBUSSCOPE());//经营范围
	//vf.setUserFunction("loadhydm(document.form1.ALTBE98.value)");
	//vf.setUserFunction("loadhydm1(document.form1.ALTAF98.value)");	
	vf.setFormData("ALTBE08",MCGL_JBXX_ZS.getSAVEPERTO());
	vf.setFormData("ALTBE06",MCGL_JBXX_ZS.getCONGRO());
	vf.setFormData("ALTBE114",MCGL_JBXX_ZS.getCONGROCUR());
	//vf.setFormData("ALTBE114_TEXT",icms.getSysDm("CURRENCY",MCGL_JBXX_ZS.getCONGROCUR()));
	vf.setFormData("ALTBE110",MCGL_JBXX_ZS.getREGCAPCUR());
	//vf.setFormData("ALTBE110_TEXT",icms.getSysDm("CURRENCY",MCGL_JBXX_ZS.getREGCAPCUR()));
	
	vf.setFormData("ALTBE09",MCGL_JBXX_ZS.getNAME());
	vf.setFormData("ALTBE13",MCGL_JBXX_ZS.getOPLOC());
	
	vf.setFormData("ALTBE14",MCGL_JBXX_ZS.getPREREGORG());
	out.print(vf.ValueDefaultScript());
%>