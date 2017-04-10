<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="jspheader.inc"%>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<html>
<head><title>变更登记填报材料</title></head>
<script language="javascript">
function showSpan(v){
	var id="span_"+v;
	if(document.getElementById(id).style.display=="none"){
		document.getElementById(id).style.display="";
	}else{
		document.getElementById(id).style.display="none";
	}
}
</script>
<body>
<%
String DL=SysUtility.doPreProcess(request.getParameter("DL"));
if(DL.equals("1")){DL="QYDJ";}else if (DL.equals("2")){DL="GTDJ";}
else if (DL.equals("3")){DL="HZSDJ";}else if (DL.equals("4")){DL="HWGG";}else if (DL.equals("1")){DL="DCDY";}
String ENTTYPE=SysUtility.doPreProcess(request.getParameter("ENTTYPE"));
String BH=SysUtility.doPreProcess(request.getParameter("BH"));
String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
String WJSM=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("WJSM")));
String sql="SELECT * FROM WSDJ_TBXX WHERE OPETYPE='"+OPETYPE+"' AND DL='"+DL+"' AND XL='"+ENTTYPE+"' AND BH='"+BH+"' AND XBH>0 ORDER BY XBH ";
DbConnection db=new DbConnection();
ResultSet rs=db.executeQuery(sql);

%>
<br/><br/>
<CENTER>
<font style="font-size:18px" color="blue"><strong>
<%=WJSM%></strong>
</font>
</CENTER><br/>
<table width="800px" align="center" border="1">

<tr class="lc1">
<td>需要提交的材料</td>
<td width="80px">实 例</td>
</tr>


<%
while(rs.next()){
String wjsm=SysUtility.doPreProcess(rs.getString("WJSM"));
String jssm=SysUtility.doPreProcess(rs.getString("JSSM"));
SysUtility.doPreProcess(rs.getString("BGXZ"));
String xbh=SysUtility.doPreProcess(rs.getString("XBH"));
String xgsl=SysUtility.doPreProcess(rs.getString("XGSL"));
%>
<tr class="lc2">
<td>
<%=wjsm%>

<%--
if(!jssm.equals("")){ %>
&nbsp;&nbsp;<a color="blue" style="cursor:pointer" onclick="showSpan('<%=xbh%>')">（说明）</a>
<span id="span_<%=xbh%>" style="display:none"><br/><%=jssm%></span>
<%
}--%>
<%
if(!jssm.equals("")){
out.println("<br/>"+jssm);
}
%>
</td>
<td>
<%
	if(!xgsl.equals("")){
%>
	<a style="cursor:pointer" href="<%=xgsl%>" target="_blank">实例</a>
<%
	}
%>
</td>
</tr>
<%
}
%>
</table>
 <br/>
 <CENTER>
  <div class="subImgs" onclick="window.close();">关 闭</div>
</CENTER> 

<%
db.close();
rs.close();
%>
</body>
</html>