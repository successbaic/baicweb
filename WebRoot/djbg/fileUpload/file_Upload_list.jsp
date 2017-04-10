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
<jsp:useBean id="UPLOAD_FILE" scope="page"  class="com.macrosoft.icms.util.CommonUPLOAD_FILE"/>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath() %>/support/list.js"></script>

<html><head><title>上传文件信息</title>
</head>
<body>
<br>
<%String YWLX=SysUtility.doPreProcess(request.getParameter("YWLX")); 
%>
<form name="form1">
<input type="hidden" name="YWLX" id="YWLX" value=<%=YWLX %>>
<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:200px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue">
<table width="100%" ><tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; ">附件信息添加</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
关闭
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="155%" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align='center'  frameborder="0">

</IFRAME>
</div></div>

<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr>
<td style="font-size:14px;padding-right: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
附件信息
</td>
<td align="center" width="120px">

&nbsp;
<a href='#' onclick="framejumpTo('file_Upload_do.jsp','action=1&YWLX=<%=YWLX %>');">
<img border=0 src='../../images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a>
</td></tr></table>

<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="table1">
  <tr class="yxsm">	
  	<td align="center">序号</td>	
    <td align="center">文件名</td>    
    <td align="center">上传时间 </td>
    <td align="center">文件类型</td>   
    <td align="center">操作</td>
  </tr>
<%	 	
		String sql=" WHERE YWLX='"+YWLX+"' ";		
		ArrayList al=UPLOAD_FILE.getList(sql); //根据业务编号查询出该业务的所有上传文件信息
		Iterator It=al.iterator();
		while (It.hasNext()) 		
		{
			com.macrosoft.icms.util.CommonUPLOAD_FILE f=(com.macrosoft.icms.util.CommonUPLOAD_FILE)It.next();
%>
  <tr>
			<td align="center"><%=f.getWJBH()%></td>
			<td align="center"><%=f.getFILENAME()%></td>		
			<td align="center"><%=f.getATTACHDATE()%></td>
			<td align="center"><%=f.getREMARKS()%></td>
			
			<td align="center">
			<a href='../../commin_upload/<%=f.getFILEID() %>' target="_blank"><img border=0 src='../../images/icon/icon_edit.gif' alt='查看'>查看</a> &nbsp;&nbsp;
			<a href='#' onclick="framejumpToC('file_Upload_delete.jsp','REMARK=delete&OPENO=<%=f.getOPENO()%>&FILEID=<%=f.getFILEID()%>','确定删除该记录吗?');"><img border=0 src='../../images/icon/icon_delete.gif' alt='删除'>删除</a>&nbsp;&nbsp;
			</td>
  </tr>
<%
		}
%>
</TABLE>
</form>

<%@include file="/bottom.inc"%>
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