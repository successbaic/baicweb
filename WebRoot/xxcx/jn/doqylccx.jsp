<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="java.util.Calendar" %>
<jsp:useBean id="icms" scope="application" class="com.macrosoft.icms.system.SysSystem"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.macrosoft.icms.gsdbc.GsDbConnection"%>
<%@ page import="com.macrosoft.icms.system.*" %>
<%@ page import="com.macrosoft.icms.qydj.XXCX_WFJL" %>
<html>
<head>
<title>山东工商行政管理局信息查询-预登记查询</title>
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="../support/list.js"></script>
<script language="javascript" src="../support/Calendar.js"></script>
<script language="javascript" src="../support/window.js"></script>
<script language="javascript" src="../support/value.js"></script>
<script language="javascript" src="../support/valid.js"></script>
<script language="javascript">
function doSub()
{
	var entname=document.getElementById("ENTNAME").value;
	var regorg=document.getElementById("REGORG").value;
	if(entname=="" && regorg==""){
		//alert("请至少录入一项查询条件！");
		//return;
	}
	myform.submit();
}
function doReset()
{
	document.getElementById("ENTNAME").value="";
	document.getElementById("REGORG").value="";
}
</script>
</head>
<body style="margin: 0px">
<%
String entname=request.getParameter("ENTNAME");
String regorg=request.getParameter("REGORG");
if(entname==null){
	entname="";
}
if(regorg==null){
	regorg="";
}
if(!entname.equals("")){
	entname=entname.replaceAll("[\\n\\r]","");
	entname=new String(entname.getBytes("ISO8859-1"));
}
String yn="false";
%>
 <table width="100%" border="1" align="center" bgcolor="#D5E2EA" height="99%" >
  <tr>
  <td height="72px" style="background-image:url(../images/main/top-center.jpg)" valign="bottom">
  		<img src="../images/top-left.gif" height="60px">
	    <font color="white" style="font-size:28px;font-weight:800;">
	    山东省工商局登记办理业务查询
	    </font>	
  </td>
  </tr>
  <tr>    
    <td align="center" valign="top" bgcolor="#FFFFFF">
    
    
	<form name="myform" method="get">
	<input type="hidden" name="model" id="model" value="0">
	<table height="27px" width="100%" style="background-image:url(../images/main/currpostitleBG.jpg);background-repeat:repeat-x;">
	<tr>		
		<td>
		&nbsp;&nbsp;
		<img src="../images/main/nowlocation.png"/>
		&nbsp;&nbsp;
		<font color="#1E90FF">当 前 位 置 > </font>
		<font color="#8c0044"> 登 记 业 务 办 理 查 询 </font> 
		</td>
	</tr>
	</table>
	
	<table border="1" width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr>
	<td class="lc1" nowrap>企业名称：</td>
	<td class="lc2">
	<input type="text" id="ENTNAME" name="ENTNAME" style="width:220px" value="<%=entname%>">
	</td>
	
	<td width="30%" style="background-color: #F6F9FF;text-align: center;">
	<input type="button" value="查  询" onclick="doSub();">	
	</td>
	</tr>
	<tr>
	<td class="lc1" nowrap width="20%">受理机关：</td>
	<td class="lc2" width="50%">
	<select name="REGORG"  title="受理机关">
			<option value=''>--受理机关--</option>
				<%=icms.getSysDmList("REGORG")%>
		    </select>
	</td>
	<td style="background-color: #F6F9FF;text-align: center;">
	<input type="button" value="重  置" onclick="doReset();">
	</td>
	</tr>	
	</table>
	</form>
	<table border="1" width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr class='tc'>   
	<td align="center" class="blank">办理事项</td>
	<td align="center" class="blank">申请单位/人</td>
    <td align="center" class="blank">办理日期</td>
    <td align="center" class="blank">办理状态</td>
	</tr>
<%	
	
	String colSql="select openo,lctype,ywcode,yw,opdate,entname,regorg from  ";
	String fromSql=" qydj_jbxx_lc_all ";

	String wheSql=" where 1=1 ";
	if(!entname.equals("")){
		wheSql+=" and entname like '%"+entname+"%'";
	}
	if(!regorg.equals("")){
		wheSql+=" and regorg='"+regorg+"'";
	}
	String start=request.getParameter("start");
	if(start==null ||start.equals("")){
		start="0";
	}
	int istart=Integer.parseInt(start);
	GsDbConnection dbc=new GsDbConnection();			
	ResultSet rsList=dbc.executeQuery("SELECT * FROM ("+colSql+""+fromSql+""+wheSql+" order by opdate desc,openo) WHERE ROWNUM<="+(istart+10));
	int	nDispRows=0;
	do{
		nDispRows++;
		if (nDispRows>istart)	break;
	}while(rsList.next());
	while(rsList.next()){
		yn="true";
		String sentname=SysUtility.doPreProcess(rsList.getString("entname"));		
		String sdjjg=SysUtility.doPreProcess(rsList.getString("regorg"));
		String sywjdmc=SysUtility.doPreProcess(rsList.getString("yw"));
		String slcjdmc=SysUtility.doPreProcess(rsList.getString("lctype"));		
		String timee=SysUtility.doPreProcess(rsList.getString("opdate"));
		
	%> 
	<tr>
	<td align="center"><%=sywjdmc%></td>
	<td align="center"><%=sentname%></td>
	<td align="center"><%=timee%></td>
    <td align="center"><%=slcjdmc%></td>
    </tr>
	<%
	}
	%>
	<tr >
	<td colspan="4">
	<%
		rsList=dbc.executeQuery("SELECT COUNT(*) from "+fromSql+""+wheSql);
		rsList.next();
		int nRowCount=rsList.getInt( 1 );
		SysPageShow sp=new SysPageShow(request,nRowCount);
		out.print(sp.PageNav());
		
		dbc.close();
		rsList.close();
 %>
	 </td>
	</tr>
</table>
<%

	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("myform");	
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());

	ValueDefault vf=new ValueDefault();
	vf.setFormName("myform");
	vf.setData(request);
	out.print(vf.ValueDefaultScript());
%>
</body>
</html>