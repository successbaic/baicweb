<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id='GGGL_JYDW_JBXX' scope='page' class='com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX'/>
<jsp:useBean id='SysUrlForm' scope='session' class='com.macrosoft.icms.system.SysUrlForm'/>
<jsp:useBean id='GGGL_USER_NW' scope='session' class='com.macrosoft.icms.ggxkz.GGGL_USER_NW'/>
<jsp:useBean id='GGGL_USER' scope='session' class='com.macrosoft.icms.ggxkz.GGGL_USER'/>
<html>
<head>
<title>广告资格检查预审列表</title>
<LINK href="css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="support/list.js"></script>
<script language="javascript" src="support/Calendar.js"></script>
<script language="javascript" src="support/window.js"></script>
<script language="javascript" src="support/value.js"></script>
<script language="javascript" src="support/valid.js"></script>
<script language="javascript" src="support/pubjs.js"></script>
<script language="javascript">
function doReset(){
	document.all.ADBUENT.value="";
	document.all.ADBULICNO.value="";
	document.all.LEREP.value="";
}
</script>
</head>
<body>
<%
java.util.Date date=new java.util.Date();
int sINSYEAR=date.getYear()+1899;
String ADBULICNO=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("ADBULICNO")));
String ADBUENT=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("ADBUENT")));
String LEREP=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("LEREP")));
SysUrlForm.setQueryString("ggxkz_ys_list.jsp",request);
%>
<form name="form1" method="get" action="ggxkz_ys_list.jsp">
<input type="hidden" name="query" value="1">
<table border="1" width="100%" >
<tr>
<td class="lc1">广告经营单位：</td>
<td class="lc2"><input type="text" name="ADBUENT" value="<%=ADBUENT%>"></td>
<td class="lc1">广告许可证号：</td>
<td class="lc2"><input type="text" name="ADBULICNO" value="<%=ADBULICNO%>"></td>
<td class="lc1"><input type="submit" class="butontType" value="查 询"></td>
</tr>
<tr>
<td class="lc1">法定代表人：</td>
<td class="lc2"><input type="text" name="LEREP" value="<%=LEREP%>"></td>
<td class="lc1">年检年度：</td>
<td class="lc2"><input type="text" name="INSYEAR" disabled value="<%=sINSYEAR%>">
</td>
<td class="lc1"><input type="button" class="butontType" value="重 置" onclick="doReset()"></td>
</tr>
</table>
<br/>
<table border="1" width="100%" >
<tr class="lc1">
<td>广告经营单位</td>
<td>广告许可证号</td>
<td>法定代表人</td>
<td>年检年度</td>
<td>操 作</td>
</tr>
<%
if(request.getParameter("query")!=null && !request.getParameter("query").equals("")){
GGGL_USER_NW.setUSERID("1");
GGGL_USER_NW.setUSERNAME("1");
if(GGGL_USER!=null && GGGL_USER.getADBULICNO()!=null && !GGGL_USER.getADBULICNO().equals("")){
%>
<tr><td colspan="6" align="center"><br/>
<font color="red" style="font-size:14px">检测到您正在使用外网广告资格检测页面。为保证数据安全，请确认关闭外网广告资格检测页面。<br/>
<%--如仍有问题，请点击<a href="sesRe.jsp"><font color="blue" style="font-size:18px">这里清空缓存</font></a>。--%>
</td></tr>
<%	
	return;
}

String wheSql=" WHERE ANCHETYPE='1' AND INSYEAR="+sINSYEAR;
if(!ADBULICNO.equals("")){
	wheSql+=" AND ADBULICNO LIKE '%"+ADBULICNO+"%'";
}
if(!ADBUENT.equals("")){
	wheSql+=" AND ADBUENT LIKE '%"+ADBUENT+"%'";
}
if(!LEREP.equals("")){
	wheSql+=" AND LEREP LIKE '%"+LEREP+"%'";
}
ArrayList list=GGGL_JYDW_JBXX.getList(wheSql,request.getParameter("start"));
%>

<%
for(int i=0;i<list.size();i++){
com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX jbxx=(com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX)list.get(i);
String lc="";
String color="";
if(i%2==0){
lc="lc2";
color="#F6F6F6";
}
%>
<tr style="cursor: hand;" class="<%=lc%>" onMouseOver="this.style.backgroundColor='#f9ef93'" onMouseOut="this.style.backgroundColor='<%=color%>'">
<td><%=jbxx.getADBUENT() %></td>
<td><%=jbxx.getADBULICNO() %></td>
<td><%=jbxx.getLEREP() %></td>
<td><%=jbxx.getINSYEAR() %></td>
<td>
<a onclick="list_click('nw_ggxkz_control.jsp','SIGN=0&ADBULICNO=<%=jbxx.getADBULICNO()%>&INSYEAR=<%=jbxx.getINSYEAR()%>','');">
<img border=0 src='images/icon_edit.gif' alt='信息预审'>
信息预审
</a></td>
</tr>
<%}%>
</table>

<%
SysPageShow sp=new SysPageShow(request,GGGL_JYDW_JBXX.getListCount(wheSql));
		out.print(sp.PageNav());
%>
<%}%>
</body>
</html>