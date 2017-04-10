<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>提交材料信息</title>
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
</head>
<body>
<%@include file="../top.inc"%>
<%
StepShow stepShow= new StepShow();

String OPETYPE=Page.getOPETYPE();
String DL=Page.getDL();
if(DL.equals("1")){DL="QYDJ";}else if (DL.equals("2")){DL="GTDJ";}
else if (DL.equals("3")){DL="HZSDJ";}else if (DL.equals("4")){DL="HWGG";}else if (DL.equals("1")){DL="DCDY";}
String ENTTYPE=Page.getENTTYPE();
int STEP=Page.getSTEP();
if(STEP>=2){
	
}else{

}
//String sql="SELECT * FROM WSDJ_TBXX WHERE OPETYPE='"+OPETYPE+"' AND DL='"+DL+"' AND XL='"+ENTTYPE+"' AND XBH='0' ORDER BY BH ";
String sql="SELECT * FROM WSDJ_TBXX WHERE OPETYPE='"+OPETYPE+"' AND DL='"+DL+"' AND XBH='0' ORDER BY BH ";
DbConnection db=new DbConnection();
ResultSet rs=db.executeQuery(sql);

%>
<%=stepShow.getStep("2",Page.getDL()+Page.getOPETYPE(),Page.getOPENO())%>
<table width="100%" align="center" border="1">
<tr class="lc1">
<td>需要提交的材料</td>
<td width="60px"><%if(OPETYPE.equals("30")){%>操作<%}else{%>实 例<%}%></td>
</tr>
<%
String wjsm="";
while(rs.next()){
wjsm=SysUtility.doPreProcess(rs.getString("WJSM"));
String jssm=SysUtility.doPreProcess(rs.getString("JSSM"));
String bgxz=SysUtility.doPreProcess(rs.getString("BGXZ"));
String bh=SysUtility.doPreProcess(rs.getString("BH"));
String xgsl=SysUtility.doPreProcess(rs.getString("XGSL"));
%>
<tr class="lc2">
<td>
<%=wjsm%>

<%if(bgxz.equals("")){
if(!jssm.equals("")){ %>
&nbsp;&nbsp;<a color="red" style="cursor:pointer" onclick="showSpan('<%=bh%>')">（查看说明）</a>
<span id="span_<%=bh%>" style="display:none"><br/><%=jssm%></span>
<%}
}%>
</td>
<td nowrap>
<%if(!bgxz.equals("")){%>
<a style="cursor:pointer" target="_blank" href="wsdj_tbxx_mx.jsp?OPETYPE=<%=OPETYPE%>&DL=<%=DL%>&ENTTYPE=<%=ENTTYPE%>&BH=<%=bh%>&WJSM=<%=wjsm%>"> 详细信息</a>
<%}else{
	if(!xgsl.equals("")){
	if(xgsl.startsWith("<a href")){
	out.print(xgsl);
	}else{	
	%>
	<a style="cursor:pointer" href="<%=xgsl%>" target="_blank">实例</a>
	<%
	}}
}%>
</td>
</tr>
<%
}if(wjsm.equals("")){
%>
<tr>
<td colspan="2" align="center">系统测试阶段，相关材料请参考国家局网站！</td>
</tr>
<%
}
%>
</table>
<br/> 
 <CENTER>
  <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
  <br/>
      数据查询中，请等待...<br/>&nbsp;
 </div>
  <div class="subImgs" id="subid" onclick="parent.document.getElementById('subid').disabled=true;parent.document.getElementById('waitdiv').style.display='';window.location.href='mcbg_control.jsp'">下一步</div>
</CENTER> 

<%
db.close();
rs.close();
%>
<%@include file="../bottom.inc"%>
</body>
</html>