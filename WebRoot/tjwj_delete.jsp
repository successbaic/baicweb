<%@ include file="jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%> 
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.system.SysPageShow" %>
<%@ page import="com.macrosoft.icms.system.ValueDefault" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="java.io.File" %>

<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head>
<title>删除文件删除</title>
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath()%>/support/list.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/Calendar.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/window.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/value.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/support/valid.js"></script>
<script language="javascript">
</script>
</head>
<body>
<%
String wjid=(String)request.getParameter("wjid");
String openo=(String)request.getParameter("openo");
String fpath=(String)request.getParameter("fpath");
String fileId=(String)request.getParameter("fileId");

String sql="DELETE FROM UPLOAD_FILE_ELEC"+" WHERE WJID='"+wjid+"' and OPENO='"+openo+"'" ;
String td="";
DbConnection db =null;
try{
db=new DbConnection();
int nRowCount= db.executeUpdate(sql);
db.close();
if (nRowCount>0)
{
	File f = new File(fpath+"/"+fileId);
	if(f.exists()){
		f.delete();
	}
	out.print(SysUtility.setAlertScript("文件删除成功!","parent.window.location.reload();"));
}else{
 	 out.print(SysUtility.setAlertScript("删除文件信息失败!",""));
 }
}catch(Exception e){
	out.print(SysUtility.setAlertScript("文件删除失败！","parent.window.location.reload();"));	
}finally{
	db.close();
}
%>
</body>
</html>