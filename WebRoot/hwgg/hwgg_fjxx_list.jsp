<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<jsp:useBean id="UPLOAD_FILE" scope="page"  class="com.macrosoft.icms.util.UPLOAD_FILE"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head><title>上传文件信息</title>
</head>
<body>
<%@include file="/top.inc"%>
<%
String OPENO = Page.getOPENO();
String SIGN=Page.getSIGN();
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);
%>
<br>
<form name="form1">

<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:200px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue">
<table width="100%"><tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; ">附件信息添加</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
关闭
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="300" width="770px" name="editframe" src="" id="editframe" scrolling="no" border="0" align='center'  frameborder="0">

</IFRAME>
</div></div>

<table align="center" width="770px" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
附件信息</td>
<td align="center" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#' onclick="framejumpTo('hwgg_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2');">
<img border=0 src='../images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>

<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="table1">
  <tr class="yxsm">		
    <td align="center">文件名</td>    
    <td align="center">上传时间 </td>  
    <td align="center">操作</td>
  </tr>
<%
        String sql=" WHERE OPENO = '"+OPENO+"' ";		
	 	
 	 	ArrayList al=UPLOAD_FILE.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的所有上传文件信息
		Iterator It=al.iterator();
		while (It.hasNext()) 		
		{
			com.macrosoft.icms.util.UPLOAD_FILE f=(com.macrosoft.icms.util.UPLOAD_FILE)It.next();
%>
  <tr>
			<td align="center"><%=f.getFILENAME()%></td><!-- //文件名称 -->			
			<td align="center"><%=f.getATTACHDATE()%></td>
			<td>
<%
	if (SIGN.equals("1"))
	{
%>
			<a href='upload/<%=f.getFILEID() %>' target="_blank">查看</a> 
<%
	}	
	else
	{
%>
			<a href='/upload/<%=f.getFILEID() %>' target="_blank">查看</a> &nbsp;&nbsp;
			<a href='#' onclick="framejumpToC('action/hwgg_fjxx_delete.jsp','REMARK=delete&OPENO=<%=f.getOPENO()%>&FILEID=<%=f.getFILEID()%>','确定删除该记录吗?');">删除</a>						
<%
	}	
%>
	</td>
  </tr>
<%
		}
%>
<tr><td colspan="3">
<%		SysPageShow sp=new SysPageShow(request,UPLOAD_FILE.getListCount(sql));
		out.print(sp.PageNav());	
%></td></tr>
</TABLE><br><CENTER>

<div class="subImgs" onclick="window.location.href='hwgg_dotj.jsp'">下一步</div>

</CENTER>

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