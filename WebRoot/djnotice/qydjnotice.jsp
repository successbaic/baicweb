<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.system.SysPageShow" %>
<%@ page import="com.macrosoft.icms.system.ValueDefault" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath()%>/support/list.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/Calendar.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/window.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/value.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/valid.js"></script>
<HTML><HEAD><TITLE>网上登记公告列表</TITLE>
<script type="text/javascript">
function stop(){
return false;
}
document.oncontextmenu=stop;

function   document.onkeydown()   {
   if   (   event.keyCode==116)             
   {                     
   event.keyCode   =   0;                     
   event.cancelBubble   =   true;                     
   return   false;             
   }   
}   

function doSub(){
	document.getElementById("cx").disabled=true;
	document.f1.submit();
}
</script>
</HEAD> 
<body>
<table width="980px" border="1" align="center">
<tr height="82px" >
	<%
	if(icms.getCURRENTUNIT().startsWith("22")){
	%>
	<td colspan="2" background="../images/banner_jl.jpg"></td>
	<%}else{%>
  	<td colspan="2" background="../images/banner.jpg"></td>
  	<%} %>
</tr>
</table>
<br><br>
<form name=f1 action="qydjnotice.jsp">
<table width="980px" align="center" id="cxtj" border="1">
<tr>
<td class="lc1">企业名称</td>
<td class="lc2"><input type="text" id="entname" name="entname"/></td>

<td class="lc2" align="center">
&nbsp;
&nbsp;
<input name="cx" id="cx" type="button" onclick="doSub()" value="查   询" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
&nbsp;
&nbsp;
<input name="cx" type="reset" value="重   置" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
</td>
</tr>
</table>
<br>
<table border=1 width="980px" id="stockmanID" align="center">
	<tr>
		<td class="yxsm2" align="center">企业名称</td>
		<td class="yxsm2" align="center">登记业务</td>
		<td class="yxsm2" align="center">填报日期</td>
		<td class="yxsm2" align="center">受理日期</td>
		<td class="yxsm2" align="center">办理状态</td>
	</tr>
<%
String entname=SysUtility.convertCode(request.getParameter("entname"));
String appdate1=SysUtility.convertCode(request.getParameter("appdate1"));
String appdate2=SysUtility.convertCode(request.getParameter("appdate2"));
String status=SysUtility.convertCode(request.getParameter("status"));
String start=request.getParameter("start");
if(start==null || start.equals("")){
	start="0";
}
int istart=Integer.parseInt(start);
String whesql="";
if(entname!=null&&!"".equals(entname)&&!"null".equals(entname)){
   whesql+=" and ENTNAME like '%"+entname+"%'";
}

String sql="SELECT ENTNAME,OPETYPE,STATUS,to_char(APPDATE,'yyyy-mm-dd')as APPDATE,to_char(APPRDATE,'yyyy-mm-dd')as APPRDATE FROM (SELECT * FROM QYDJ_YWSB_SQ WHERE STATUS IN ('2','3','4')"+whesql+" ORDER BY APPDATE DESC) WHERE ROWNUM<="+(istart+10);
String td="";
DbConnection db=new DbConnection();
ResultSet rs=db.executeQuery(sql);

int	nDispRows=0;
do
{
	nDispRows++;
	if (nDispRows>(istart))	break;
}
while (rs.next());

while(rs.next()){
td=(td=="businessTd01LeftBig"?"businessTd00LeftBig":"businessTd01LeftBig");
%>
	<tr align='center'>
		<td class=<%=td %>><%=rs.getString("ENTNAME")%></td>
		<td class=<%=td %>><%=icms.getSysDm("OPETYPE",rs.getString("OPETYPE"))%></td>
		<td class=<%=td %>><%=rs.getString("APPDATE")%></td>
		<td class=<%=td %>><%=rs.getString("APPRDATE")%></td>
		<td class=<%=td %>><%=icms.getSysDm("WSTATUS",rs.getString("STATUS"))%></td>
		
	</tr>
<%
}
rs=db.executeQuery("SELECT COUNT(*) AS COUNT FROM QYDJ_YWSB_SQ WHERE STATUS IN ('2','3','4') "+whesql);
int num=0;
if(rs.next()){
	num=rs.getInt(1);
}
%>
<tr><td colspan="5">
<%
SysPageShow sp=new SysPageShow(request,num);
out.print(sp.PageNav());
%></td></tr>
</table>
<br>
</form>
<p align="center">　</p>
</body>
</HTML>
<% 
	ValueDefault vf=new ValueDefault();
	vf.setFormName("f1");	
	if (entname!=null&&!"".equals(entname)&&!"null".equals(entname))	
	{		
		vf.setFormData("entname",entname);
	}	
	out.print(vf.ValueDefaultScript());
	db.close();
%>