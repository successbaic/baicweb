<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.system.*"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath()%>/support/list.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/Calendar.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/window.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/value.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/valid.js"></script>
<HTML><HEAD><TITLE>网上登记公告列表</TITLE>
</HEAD> 
<body>
<table width="980px" border="1" align="center">
<tr height="82px" >
  	<td colspan="2" background="../images/banner.jpg"></td>
</tr>
</table>
<br><br>
<form name=form1 action="qydjnotice2.jsp">
<table width="980px" align="center" id="cxtj" border="1">
<tr>
<td class="lc1">是否公司</td>
<td class="lc2"><select name="sfgs"><option></option>
<option value="1">是</option>
<option value="2">否</option>
</select></td>
<td class="lc1">业务类型</td>
<td class="lc2"><select name="OPETYPE"><option></option><%=icms.getSysDmList("OPETYPE") %></select></td></tr><tr>
<td class="lc1">预审日期</td>
<td class="lc2"><input type="text" name="APPRDATE"  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE"/></td>
<td class="lc1">登记机关</td>
<td class="lc2"><select name="REGORG"><option></option><%=icms.getSysDmList("REGORG") %></select></td></tr>
<tr>
<td class="lc1">企业名称</td>
<td class="lc2" align="center" colspan="3">
<input type="text" name="ENTNAME">
</td></tr><tr>
<td class="lc2" align="center" colspan="4">
&nbsp;
&nbsp;
<input name="cx" type="submit" value="查   询" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
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
		<td class="yxsm2" align="center">预审日期</td>
		<td class="yxsm2" align="center">预审情况</td>
	</tr>
<%
String sfgs=SysUtility.doPreProcess(request.getParameter("sfgs"));
String start=request.getParameter("start");
if(start==null || start.equals("")){
	start="0";
}

int istart=Integer.parseInt(start);
String whesql="";
if(sfgs.equals("1")){
   whesql+=" and enttype like '1%'";
}else if(sfgs.equals("2")){
	whesql+=" and enttype not like '1%'";
}
String APPRDATE=SysUtility.doPreProcess(request.getParameter("APPRDATE"));
if(!APPRDATE.equals("")){
	whesql+=" and to_date('"+APPRDATE+"','yyyy-MM-dd')=APPRDATE";
}

String[][] s={{"ENTNAME","0"},{"OPETYPE","1"},{"REGORG","1"}}; //OPETYPE  20 ky 30 bg 50zx 90dxzx
whesql=whesql+SysUtility.getSqlFilter(request,s);
String sql="SELECT ENTNAME,OPETYPE,STATUS,to_char(APPDATE,'yyyy-mm-dd')as APPDATE,to_char(APPRDATE,'yyyy-mm-dd')as APPRDATE FROM (SELECT * FROM QYDJ_YWSB_SQ WHERE STATUS IN ('2','4')"+whesql+" ORDER BY APPDATE DESC) WHERE ROWNUM<="+(istart+10);
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
rs=db.executeQuery("SELECT COUNT(*) AS COUNT FROM QYDJ_YWSB_SQ WHERE STATUS IN ('2','4') "+whesql);
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
	com.macrosoft.icms.system.ValueDefault vf=new com.macrosoft.icms.system.ValueDefault();
	vf.setFormName("form1");
	vf.setData(request);
	out.print(vf.ValueDefaultScript());
	
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
	db.close();
%>