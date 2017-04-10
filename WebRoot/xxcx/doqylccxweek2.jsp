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
	<%--<table border="0" width="470px" align="center">
	<tr>
	<td style="border-width:0px;border-style:none;" align="right">
	<a href="doqylccx.jsp" target="_blank"><IMG src="../images/icon/icon.gif">更多...</a>
	</td>
	</tr>
	</table>
	--%>
	<table border="1" width="100%" cellpadding="0" cellspacing="0" align="center">
	<tr style="background-color: white;color:#00359f;font-size:12px;margin-top:115px;font-weight:bold;margin-left:45px;color:black;text-align:center;">   
	<td align="center" class="blank">办理事项</td>
	<td align="center" class="blank">申请单位/人</td>
	<td align="center" class="blank">办理日期</td>
    <td align="center" class="blank">办理状态</td>
	</tr>
<%	
	
	String colSql="select openo,lctype,ywcode,yw,opdate,entname,regorg from  ";
	String fromSql="(select a.openo,a.lctype,ywcode,(select content from com_dm where type='LCTYPE' and code=ywcode) as yw,to_char(opdate,'yyyy-MM-dd')as opdate,b.entname,b.regorg from qydj_ywbl_yjxx a, qydj_jbxx_lc b where a.openo=b.openo and b.regorg='370000' and a.openo||a.rowid in"
	+" (select openo||max(rowid) from qydj_ywbl_yjxx group by openo)"
	+" union all "
	+" select a.openo,a.lctype,ywcode,(select content from com_dm where type='LCTYPE' and code=ywcode) as yw,to_char(opdate,'yyyy-MM-dd')as opdate,b.entname,b.preregorg as regorg from qydj_ywbl_yjxx a, mcgl_jbxx_lc b where a.openo=b.openo and b.preregorg='370000' and a.openo||a.rowid in"
	+" (select openo||max(rowid) from qydj_ywbl_yjxx group by openo)"
	+")";

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
	ResultSet rsList=dbc.executeQuery("SELECT * FROM ("+colSql+""+fromSql+""+wheSql+" order by opdate desc,openo ) WHERE ROWNUM<="+(istart+10));
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
</table>
<%
rsList.close();
dbc.close();
%>
<%--

	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("myform");	
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());

	ValueDefault vf=new ValueDefault();
	vf.setFormName("myform");
	vf.setData(request);
	out.print(vf.ValueDefaultScript());
--%>
</body>
</html>