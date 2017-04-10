<%@page import="java.util.ArrayList"%>
<%@page import="com.macrosoft.icms.util.WSDJ_WLZGY"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<html>
<head>
<title>网络专管员</title>
</head>
<body style="background-color: #FFFFFF;">
<TABLE width="100%" height="72px" border="1" >
  <tr>
  	<td style="background-image:url(../images/main/top-left.jpg);border-right-style: none;border-right-width: medium;" width="400px"></td>
  	<td style="background-image:url(../images/main/top-center.jpg);border-left-style: none;border-left-width: medium;"></td>
  </tr>
</table>
<br/>
<table width="90%" border="1" align="center">
<caption>网络专办员联系电话</caption>
<tr class="lc1">
<td>单位名称</td>
<td>联系电话</td>
<td>地址</td>
</tr>
<%
WSDJ_WLZGY wlzgy=new WSDJ_WLZGY();
ArrayList list=wlzgy.getList(" WHERE 1=1 ");
for(int i=0;i<list.size();i++){
	wlzgy=(WSDJ_WLZGY)list.get(i);
%>
<tr>
<td><font style="font-size: 14px;"><%=icms.getSysDm("REGORG_MC",wlzgy.getREGORG()) %></font></td>
<td> <font style="font-size: 14px;"><%=wlzgy.getTEL() %></font></td>
<td><font style="font-size: 14px;"><%=wlzgy.getDOM() %></font></td>
</tr>
<%	
}
%>
</table>
</body>
</html>