<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_XKXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_XKXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>许可信息</title>
</head>
<body bgcolor="#eefbf7">
<%@include file="top.inc"%>
<%	
    String OPENO = Page.getOPENO();//业务编号
    String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SIGN = Page.getSIGN();
%>
<form name="form1">
<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:400px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue">
<table width="100%"><tr class="yxsm" style="background-color: #BED8EB;">
<td align="left" style="font-size:14px;font-weight:bold; ">许可信息录入</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
关闭
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="100%" width="100%" name="editframe" src="" id="editframe" scrolling="yes" border="0" align='center'  frameborder="0"></IFRAME>
</div></div>

<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
许可经营列表</td>
<td align="center" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#' onclick="framejumpTo('qydj_xkxx_do.jsp','action=1&OPENO=<%=OPENO%>');">
<img border=0 src='images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>

<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
  <tr class="yxsm">
    <td align="center">许可文件编号</td>    
    <td align="center">许可文件名称</td>
    <td align="center">许可机关</td>
	<td align="center" width='120px'>操作</td>
  </tr>
<%
        String sql=" WHERE OPENO = '"+OPENO+"'";		
	 	
 	 	ArrayList al=QYDJ_XKXX.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的许可文件信息
		Iterator It=al.iterator();
		int j=0;
		while (It.hasNext()) 		
		{
			j=j+1;
			com.macrosoft.icms.qydj.QYDJ_XKXX_SQ tb=(com.macrosoft.icms.qydj.QYDJ_XKXX_SQ)It.next();
%>
 <tr>
	<td align="center"><%=tb.getLICNO()%></td>
	<td align="center"><%=icms.getSysDm("LICNAME",tb.getLICNAME())%></td>
	<td align="center"><%=tb.getLICANTH()%></td>
	<td align="center">
<%if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('qydj_xkxx_do.jsp','action=4&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('qydj_xkxx_do.jsp','action=2&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>
	&nbsp;
	<a href='#' onclick="framejumpToC('web/qydj_xkxx_action.jsp','action=3&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>','确定删除该记录吗?');" ><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> 
<%  
  }
%>	
	</td>
</tr>
<%}%>
<tr><td colspan="4">
<%

		SysPageShow sp=new SysPageShow(request,QYDJ_XKXX.getListCount(sql));
		out.print(sp.PageNav());	
%>
</td></tr>
</TABLE>
<br/>
<center>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
</div>
<div class="subImgs" id="subid" onclick="document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
</center>
</form>
<%@include file="bottom.inc"%>
</body>
</html>		
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");		
	out.print(vf.ValueDefaultScript());
%>
<%
	//dbc.close();	
%>
