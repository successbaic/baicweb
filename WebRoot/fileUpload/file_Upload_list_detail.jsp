<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page errorPage="/error.jsp"%>

<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>

<jsp:useBean id="UPLOAD_FILE" scope="page"  class="com.macrosoft.icms.util.CommonUPLOAD_FILE"/>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath() %>/support/list.js"></script>

<html><head><title>上传文件信息</title>
</head>
<body>
<br>
<form name="form1">
<%
String typeSql="select distinct nvl(remarks,'其他') remarks from CommonUPLOAD_FILE order  by remarks";
java.sql.ResultSet rs=dbc.executeQuery(typeSql);
while(rs.next()){
	String type=rs.getString("REMARKS");
	String whereSql="";
	if("其他".equals(type)){
		whereSql=" and remarks is null";
	}else{
		whereSql=" and remarks='"+type+"'";
	}
%>
<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="table1">
<caption><%=type %></caption>
<%	 	
		String sql=" WHERE 1=1 "+whereSql;		
		ArrayList al=UPLOAD_FILE.getList(sql); //根据业务编号查询出该业务的所有上传文件信息
		for (int i=0;i<al.size();) 		
		{
			if(i==al.size()-1){
				com.macrosoft.icms.util.CommonUPLOAD_FILE f1=(com.macrosoft.icms.util.CommonUPLOAD_FILE)al.get(i);

			%>
			<tr>
				<td align="center" class="lc2" width='50%'>
				<a href='../commin_upload/<%=f1.getFILEID() %>' target="_blank">
				<%=f1.getFILENAME()%>
				</a>
				</td>
				<td align="center" class="lc2"  width='50%'></td>
  			</tr>
			<%	
			}else{
			com.macrosoft.icms.util.CommonUPLOAD_FILE f1=(com.macrosoft.icms.util.CommonUPLOAD_FILE)al.get(i);
			com.macrosoft.icms.util.CommonUPLOAD_FILE f2=(com.macrosoft.icms.util.CommonUPLOAD_FILE)al.get(i+1);
%>
			<tr>
				<td align="center" class="lc2"  width='50%' >
				<a href='../commin_upload/<%=f1.getFILEID() %>' target="_blank">
				<%=f1.getFILENAME()%>
				</a>				</td>
				<td align="center" class="lc2"  width='50%'>
				<a href='../commin_upload/<%=f2.getFILEID() %>' target="_blank">
				<%=f2.getFILENAME()%>
				</a>
				</td>
  			</tr>
<%			}
			i=i+2;
		}
%>
<%}
rs.close();
dbc.close();
%>
</TABLE>
</form>

</body>
</html>