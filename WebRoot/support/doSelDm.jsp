<%@page import="java.sql.ResultSet"%>
<%@page import="com.macrosoft.icms.dbc.DbConnection"%>
<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@page import="com.macrosoft.icms.system.SysPageShow"%>
<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base target="_self"/>
<title>代码选择</title>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<style type="text/css">
.dmtitle {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;  
   color:#000080;    
}
</style>
<script type="text/javascript">
var oldtr="";
function doSelect(code,content){
	var ra_id="ra_"+code;
	var tr_id="tr_"+code;
	document.getElementById(ra_id).checked=true;
	document.getElementById("code").value=code;
	document.getElementById("content").value=content;
	if(oldtr!=null && oldtr!=""){
		document.getElementById(oldtr).style.backgroundColor="#FFFFFF";	
	}	
	document.getElementById(tr_id).style.backgroundColor="#DAE9F3";
	oldtr=tr_id;
}
function doQuery(){
	document.form1.submit();
}
function getCode(lx){
	var va=new Array();
	if(lx=="1"){
		var code=document.getElementById("code").value;
		var content=document.getElementById("content").value;
		if(code==null || code==""){
			alert("请选择相应的内容！");
			return;
		}
		va[0]=code;
		va[1]=content
		window.returnValue=va;
	}else{
		va[0]="";
		va[1]=""
		window.returnValue=va;
	}
	window.close();
}
</script>
</head>
<body>
<%
String type=SysUtility.doPreProcess(request.getParameter("type"));
String remark=SysUtility.doPreProcess(request.getParameter("remark"));
String noChinese=SysUtility.doPreProcess(request.getParameter("noChinese"));
if(type.equals("")){
	out.println(SysUtility.setAlertScript("参数传递错误！", "window.close();"));
	return;
}
String thisvalue="相关内容";
if(type.equals("CURRENCY")){
	thisvalue="币种";
}
String info=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("info")));
String start=request.getParameter("start");
if(start==null || start.equals("")){
	start="0";
}
int istart=Integer.parseInt(start);

DbConnection dbc=new DbConnection();
String wheSql=" WHERE TYPE='"+type+"'";
if(!info.equals("")){
	wheSql+=" AND CONTENT LIKE '%"+info+"%'";
}
if(!remark.equals("")){
	wheSql+=" AND REMARK = '"+remark+"'";
}
if(type.equals("COUNTRY")&&"1".equals(noChinese)){
	wheSql += " AND CODE <> '156'";
}
ResultSet rs=dbc.executeQuery("SELECT * FROM (SELECT * FROM SYS_DMDZ "+wheSql+" ORDER BY SIGN,CODE )WHERE ROWNUM<="+(istart+10));
%>
<form name="form1" method="get" action='doSelDm.jsp' target="">
<input type="hidden" name="type" value="<%=type%>">
<input type="hidden" name="remark" value="<%=remark%>">
<input type="hidden" name="noChinese" value="<%=noChinese%>">
<input type="hidden" name="code" id="code">
<input type="hidden" name="content" id="content">
<br/>
<table width="95%" border="1" align="center">
<tr><td class="dmtitle" colspan="3">
 查 询 条 件</td></tr>
<tr>
<td class="lc1"><%=thisvalue %></td>
<td class="lc2"><input type="text" name="info"></td>
<td class="lc1"><input type="button" onclick="doQuery()" value="查  询" class="button"></td>
</tr>
</table>
<br/>
<table width="95%" border="1" align="center">
<tr><td class="dmtitle" colspan="2">
 查 询 列 表</td></tr>
<tr>
<td class="lc1" width="15%">选择</td>
<td class="lc1" width="80%"><%=thisvalue %></td>
</tr>
<%
int	nDispRows=0;
do
{
	nDispRows++;
	if (nDispRows>(istart))	break;
}
while (rs.next());
while(rs.next()){
	String code=rs.getString("CODE");
	String content=rs.getString("CONTENT");
%>
<tr onclick="doSelect('<%=code%>','<%=content %>')" id="tr_<%=code%>">
<td>
<input type="radio" name="code" value="<%=code %>" id="ra_<%=code %>" >
</td>
<td>
<%=rs.getString("CONTENT") %>
</td>
</tr>
<%}
%>
<tr>
<td colspan="2"><%
rs=dbc.executeQuery("SELECT COUNT(*) FROM SYS_DMDZ "+wheSql);
int num=0;
if(rs.next()){
	num=rs.getInt(1);
}
SysPageShow sp=new SysPageShow(request,num);
out.print(sp.PageNav());
%></td>
</tr>
</table>
<br/>
<table width="95%" border="1" align="center">
<tr><td class="dmtitle">
 操    作</td></tr>
<tr>
<td align="center" class="lc1">
<input type="button" value=" 确  定 " onclick="getCode(1)" class="button" >
&nbsp;&nbsp;
<input type="button" value=" 清  空 " onclick="getCode(2)" class="button" >
&nbsp;&nbsp;
<input type="button" value=" 取  消 " onclick="window.close();" class="button" >
</td>
</tr>
</table>
</form>
<%
rs.close();
dbc.close();
%>
</body>
</html>