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
</head>
<body>
<%
java.util.Date date=new java.util.Date();
int sINSYEAR=date.getYear()+1899;
String ADBULICNO=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("ADBULICNO")));
String ADBUENT=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("ADBUENT")));
//String LEREP=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("LEREP")));
String INSYEAR=SysUtility.doPreProcess(request.getParameter("INSYEAR"));
String ANCHETYPE=SysUtility.doPreProcess(request.getParameter("ANCHETYPE"));
SysUrlForm.setQueryString("ggxkz_ysbl_list.jsp",request);
boolean IFFIRST=false;
String siffirst=request.getParameter("IFFIRST");
if(siffirst!=null && siffirst.equals("true")){
	IFFIRST=true;
}
%>
<form name="form1" method="get" action="ggxkz_ysbl_list.jsp">
<input type="hidden" name="query" value="1">
<table border="1" width="100%" >
<tr>
<td class="lc1">广告经营单位：</td>
<td class="lc2"><input type="text" name="ADBUENT"></td>
<td class="lc1">广告许可证号：</td>
<td class="lc2"><input type="text" name="ADBULICNO"></td>
<td class="lc1"><input type="submit" class="butontType" value="查 询"></td>
</tr>
<tr>
<%--td class="lc1">法定代表人：</td>
<td class="lc2"><input type="text" name="LEREP" value="<%=LEREP%>"></td--%>
<td class="lc1">年检年度：</td>
<td class="lc2">
<select name="INSYEAR">
<%
for(int i=2011;i<=sINSYEAR;i++){
String ifchecked="";
if(i==sINSYEAR && INSYEAR.equals("")){
	ifchecked="selected";
}
%>
<OPTION value="<%=i%>" <%=ifchecked%>><%=i%>年度</OPTION>
<%}%>
</select>
</td>
<td class="lc1">预审状态</td>
<td class="lc2">
<select name="ANCHETYPE">
<%
String typeselected="";
if(ANCHETYPE.equals("")){
	typeselected="selected";
}
%>
<OPTION value=""></OPTION>
<OPTION value="0" <%=typeselected%>>尚未提交</OPTION>
<OPTION value="1">待预审</OPTION>
<OPTION value="2">预审通过</OPTION>
<OPTION value="3">预审驳回</OPTION>
</select>
</td>
<td class="lc1"><input type="reset" class="butontType" value="重 置"></td>
</tr>
</table>
<br/>
<table border="1" width="100%" >
<tr class="lc1">
<td>广告经营单位</td>
<td>广告许可证号</td>
<td>法定代表人</td>
<td>年检年度</td>
<td>预审状态</td>
<td>详细信息</td>
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
String wheSql=" WHERE 1=1 ";
if(!ADBULICNO.equals("")){
	wheSql+=" AND ADBULICNO LIKE '%"+ADBULICNO+"%'";
}
if(!ADBUENT.equals("")){
	wheSql+=" AND ADBUENT LIKE '%"+ADBUENT+"%'";
}
//if(!LEREP.equals("")){
//	wheSql+=" AND LEREP LIKE '%"+LEREP+"%'";
//}
if(!INSYEAR.equals("")){
	wheSql+=" AND INSYEAR="+INSYEAR;
}
if(!ANCHETYPE.equals("")){
	if(ANCHETYPE.equals("0")){
		wheSql+=" AND (ANCHETYPE IS NULL OR ANCHETYPE='0')";
	}else{
		wheSql+=" AND ANCHETYPE="+ANCHETYPE;
	}	
}
if(!IFFIRST){
	boolean bl=GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*)	FROM AD0101 WHERE AD01022 NOT IN (SELECT ADBULICNO FROM GGGL_JYDW_JBXX WHERE INSYEAR="+INSYEAR+")");
	if(bl){
		GGGL_JYDW_JBXX.doModifyBySql("INSERT INTO GGGL_JYDW_JBXX (ADBULICNO,ADBUENT,INSYEAR,DOM,LEREP,POLCODE,TEL,ADTYPE,OPFROM,OPTO,BUSSCOPE,CERDATE,REGORG) SELECT AD01022,AA00003,"
		+INSYEAR+",AD01057,AD01059,AD01058,AD01060,AD01014,to_date(AD01071,'yyyy-mm-dd'),to_date(AD01072,'yyyy-mm-dd'),AD01064,to_date(AD01017,'yyyy-mm-dd'),AD01034 FROM AD0101 WHERE AD01022 not in (SELECT ADBULICNO FROM GGGL_JYDW_JBXX WHERE INSYEAR="+INSYEAR+")");
	}
	IFFIRST=true;
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
<%
if(jbxx.getANCHETYPE().equals("") || jbxx.getANCHETYPE().equals("0")){
	out.println("尚未提交");
}else if(jbxx.getANCHETYPE().equals("1")){
	out.println("待预审");
}else if(jbxx.getANCHETYPE().equals("2")){
	out.println("预审通过");
}else if(jbxx.getANCHETYPE().equals("3")){
	out.println("预审驳回");
}
%></td>
<td>
<a onclick="list_click('nw_ggxkz_control.jsp','SIGN=3&ADBULICNO=<%=jbxx.getADBULICNO()%>&INSYEAR=<%=jbxx.getINSYEAR()%>','');">
<%
if(jbxx.getANCHETYPE().equals("") || jbxx.getANCHETYPE().equals("0")){
%>
<img border=0 src='images/icon_find.gif' alt='补录'>
补录
<%
}else{
%>
<img border=0 src='images/icon_find.gif' alt='修改'>
修改
<%
}
%>
</a></td>
</tr>
<%}%>
</table>

<%
SysPageShow sp=new SysPageShow(request,GGGL_JYDW_JBXX.getListCount(wheSql));
		out.print(sp.PageNav());
%>
<SCRIPT language="javascript">
var ANCHETYPE='<%=ANCHETYPE%>';
var INSYEAR='<%=INSYEAR%>';
var ADBULICNO='<%=ADBULICNO%>';
var ADBUENT='<%=ADBUENT%>';
if(ANCHETYPE!=""){
	document.all.ANCHETYPE.value=ANCHETYPE;
}
if(INSYEAR!=""){
	document.all.INSYEAR.value=INSYEAR;
}
if(ADBULICNO!=""){
	document.all.ADBULICNO.value=ADBULICNO;
}
if(ADBUENT!=""){
	document.all.ADBUENT.value=ADBUENT;
}
</SCRIPT>
<%}%>
<input type="hidden" name="IFFIRST" value="<%=IFFIRST%>">
</form>
</body>
</html>