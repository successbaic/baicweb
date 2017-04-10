<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<jsp:useBean id="UPLOAD_FILE" scope="page"  class="com.macrosoft.icms.util.CommonUPLOAD_FILE"/>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<html><head><title>上传文件信息</title>
</head>
<body>
<form name="form1">
<% 
String YWLX=SysUtility.doPreProcess(request.getParameter("YWLX"));
DbConnection db=new DbConnection();
ResultSet rs=db.executeQuery("select REMARKS,count(*) as cou from COMMONUPLOAD_FILE where YWLX='"+YWLX+"'  group by REMARKS order by REMARKS");
%>
<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID" border="1">
<caption>表格信息</caption>
<%

while(rs.next()){

        String REMARKS=rs.getString("REMARKS");
        String sql=" WHERE YWLX='"+YWLX+"' AND REMARKS='"+REMARKS+"' ";	
 	 	ArrayList al=UPLOAD_FILE.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的所有上传文件信息
		Iterator It=al.iterator();
 	 	boolean flag=false;
		while (It.hasNext()) 		
		{ 
			com.macrosoft.icms.util.CommonUPLOAD_FILE f=(com.macrosoft.icms.util.CommonUPLOAD_FILE )It.next();
%>
    <tr >
    <%if(!flag) {%>
			<td align="center" rowspan=<%=rs.getInt("cou") %> class="lc1" width="20%"><%=REMARKS %></td>
			<%} %>
			<td class="lc2" >
			<a href='../fileUpload/file_Upload_delete.jsp?REMARK=detail&OPENO=<%=f.getOPENO()%>&FILEID=<%=f.getFILEID()%>')'>	
			<%=f.getFILENAME()%></a>			
			</td>	                  
	        <%flag=true; %>
  </tr>
<%
		}
}
%>
</TABLE>
</form>
		<IFRAME height="350xp" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align="middle"  frameborder="0"></IFRAME>		

</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
	
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");	
 	out.print(vf.ValueDefaultScript());
%>