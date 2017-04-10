<%@ include file="/jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="DCDY_DYWXX" scope="page"  class="com.macrosoft.icms.htgl.DCDY_DYWXX_SQ"/>
<html>
<head>
<title>抵押物信息</title>
<style type="text/css">
#yxsm2 {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
   font-size:10pt;
   font-family: 锟斤拷锟斤拷;
   color:#000080; 
}
</style>
<script language='javascript'>
</script>
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
<td align="left" style="font-size:14px;font-weight:bold; ">抵押物信息</td>
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
抵押物信息</td>
<td align="center" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#' onclick="framejumpTo('dcdy_dywxx_do.jsp','action=1&OPENO=<%=OPENO%>');">
<img border=0 src='../images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>

<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="table1">
  <tr class="yxsm">		
    <td align="center">抵押物名称</td>    
    <td align="center">所有权归属 </td>  
    <td align="center">数量</td>
    <td align="center">操作</td>
  </tr>
<%
        String sql=" WHERE OPENO = '"+OPENO+"' ";		
	 	
 	 	ArrayList al=DCDY_DYWXX.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的所有上传文件信息
		Iterator It=al.iterator();
		while (It.hasNext()) 		
		{
			com.macrosoft.icms.htgl.DCDY_DYWXX_SQ f=(com.macrosoft.icms.htgl.DCDY_DYWXX_SQ)It.next();
%>
  <tr>
			<td align="center"><%=f.getGUANAME()%></td>
			<td align="center"><%=f.getOWN()%></td>
			<td align="center"><%=f.getQUAN()%></td>
			<td>
<%if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('dcdy_dywxx_do.jsp','action=4&RECID=<%=f.getRECID()%>&OPENO=<%=f.getOPENO()%>');" ><img border=0 src='../images/icon/icon_edit.gif' alt='查看'> 查看</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('dcdy_dywxx_do.jsp','action=2&RECID=<%=f.getRECID()%>&OPENO=<%=f.getOPENO()%>');" ><img border=0 src='../images/icon/icon_edit.gif' alt='修改'> 修改</a>	
	&nbsp;
	<a href='#' onclick="framejumpToC('action/dcdy_dywxx_action.jsp','action=3&RECID=<%=f.getRECID()%>&OPENO=<%=f.getOPENO()%>','确定删除该记录吗?');" ><img border=0 src='../images/icon/icon_delete.gif' alt='删除'> 删除</a> 
<%}%>
	</td>
  </tr>
<%
		}
%>
<tr><td colspan="4">
<%		SysPageShow sp=new SysPageShow(request,DCDY_DYWXX.getListCount(sql));
		out.print(sp.PageNav());	
%></td></tr>
</TABLE><br><CENTER>

<div class="subImgs" onclick="window.location.href='htgl_fjxx_list.jsp'">下一步</div>

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