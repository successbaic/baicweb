<%@ include file="/jspheader.inc"%>
<%@page import="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>代码选择</title>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
function writeDOM(){
	if(document.getElementById("PROVINCE")!=null &&document.getElementById("CITY")!==null
			&&document.getElementById("COUNTY")!==null&&document.getElementById("TOWN")!==null
			&&document.getElementById("VILLAGE")!==null&&document.getElementById("HOUSENUMBER")!==null){
		var proSel = document.getElementById("PROVINCE");
		var ctSel =  document.getElementById("CITY");
		var countySel = document.getElementById("COUNTY");
		
		var proText = proSel.options[proSel.selectedIndex].text; 
		var ctText = ctSel.options[ctSel.selectedIndex].text; 
		var countyText = countySel.options[countySel.selectedIndex].text; 
		
		var townm=document.getElementById("TOWN").value;
		var Address="";
		if(townm.indexOf("街道办事处")>0
		||townm.indexOf("办事处")>0
		||townm.indexOf("街道")>0
		){
			Address = proText+ctText+countyText+		
			document.getElementById("VILLAGE").value+
			document.getElementById("HOUSENUMBER").value;
		}else{
			Address = proText+ctText+countyText+
			document.getElementById("TOWN").value+
			document.getElementById("VILLAGE").value+
			document.getElementById("HOUSENUMBER").value;			
		}	
		 if(document.getElementById("DOM")!=null){
			document.getElementById("DOM").value = Address;
		 }
	}
}
function returnDom(){
	if(document.getElementById("DOM").value==""){
		alert("请录入住所地址！");
		return;
	}
	var boje=new Array();
	boje[0]=document.getElementById("PROVINCE").value;
	boje[1]=document.getElementById("CITY").value;
	boje[2]=document.getElementById("COUNTY").value;
	boje[3]=document.getElementById("TOWN").value;
	boje[4]=document.getElementById("VILLAGE").value;
	boje[5]=document.getElementById("HOUSENUMBER").value;
	boje[6]=document.getElementById("DOM").value
	window.returnValue=boje;
	window.close();
}
function clearDom(){
	var boje=new Array();
	boje[0]="";
	boje[1]="";
	boje[2]="";
	boje[3]="";
	boje[4]="";
	boje[5]="";
	boje[6]="";
	window.returnValue=boje;
	window.close();
}
function cityChange(){
	var CITY=document.form1.CITY.value;
	document.getElementById("hiddenframe").contentWindow.location.href="load.jsp?STYPE=DISCOUS&OBJ=parent.form1.COUNTY&SREAMRK="+CITY;
}
</script>
</head>
<body>
<%
String OPENO=SysUtility.doPreProcess(request.getParameter("openo"));
String LX=SysUtility.doPreProcess(request.getParameter("lx"));
MCGL_JBXX_SQ mcjbxx=new MCGL_JBXX_SQ();
mcjbxx.setOPENO(OPENO);
ArrayList mclist=mcjbxx.getData();

String PROVINCE="";
String CITY="";
String COUNTY="";
String TOWN="";
String VILLAGE="";
String HOUSENUMBER="";
PROVINCE=mcjbxx.getPROVINCE();
CITY=mcjbxx.getCITY();
COUNTY=mcjbxx.getCOUNTY();
TOWN=mcjbxx.getTOWN();
VILLAGE=mcjbxx.getVILLAGE();
HOUSENUMBER=mcjbxx.getHOUSENUMBER();

String XZQH=webuser.getXZQH();
java.util.Vector vector=icms.getSysVectorDm("REGORG");
String XZQHJC = icms.getSysDm("XZQH",XZQH);
String XZQHDQ = "";
for(int i=0;i<vector.size();i++){
	String[] ss=(String[])vector.get(i);
	if(ss[2].equals("2")){
		if(ss[0].indexOf(XZQH)>-1){
			XZQHDQ=ss[0];
		}
	}
}
%>

<br/><br/>
<form name="form1" method="POST">
<table width="100%" border="1" algin="center">
<caption>住所地址</caption>
<tr>
<td class="lc1" colspan="2">
<font color="red">说明：</font>住所地请按下面的格式填写，系统会自动合并。
</td>
</tr>
<tr>
<td class="lc1">（省/直辖市/自治区）</td>
<td class="lc2">
<select name="PROVINCE" title="省"  onchange="writeDOM()">
	<%=icms.getSysDmList("PROVINCE")%>
</select>
</td></tr><tr>
<td class="lc1">（市/地区/盟/自治州）</td>
<td class="lc2">
 <select name="CITY" id="CITY" style="width:150px;" title="市" maxlength=20  onchange="cityChange()">
	<%=ContrInfo.getDiShiOption(icms,XZQH)%>
</select>
</td></tr><tr>
<td class="lc1">（区/县/县级市/旗）</td>
<td class="lc2">
<select name="COUNTY" id="COUNTY" onchange="writeDOM()"  style="width:150px;" title="县" maxlength=20>
	<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,mcjbxx.getCITY())%>
</select>
</td>
</tr>
<tr>
<td class="lc1">（乡/民族乡/镇/街道）</td>
<td class="lc2"><input type="text" name="TOWN" title="乡" size="23" maxlength=25 onchange="writeDOM()"></td>
</tr>
<tr>
<td class="lc1">（路/村/社区）</td>
<td class="lc2"><input type="text" name="VILLAGE" title="村" size="23" maxlength=25 onchange="writeDOM()"></td>
</tr>
<tr>
<td class="lc1">（号）</td>
<td class="lc2"><input type="text" name="HOUSENUMBER" title="号" size="10" maxlength=25 onchange="writeDOM()"></td>
</tr>
<tr>
<td class="lc1">所在地址</td>
<td class="lc2">
<input type="text" name="DOM" id="DOM" style="width:380px;" title="所在地址">
</td>
</tr>
</table>
<br/>
<center>
<input type="button" value="确  定" onclick="returnDom()" class="button">
&nbsp;&nbsp;&nbsp;
<input type="button" value="清   空" onclick="clearDom()" class="button">
&nbsp;&nbsp;&nbsp;
<input type="button" value="取  消" onclick="window.close()" class="button">
</center>
</form>
<iframe height="0" width="0" name="hiddenframe" src="" id="hiddenframe"></iframe>
</body>
</html>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	//ec.setUserFunction("setBusscope()");
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");	
	vf.setData(mclist);	
	out.print(vf.ValueDefaultScript());
%>