<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_FZJG" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<%
String enttype = Page.getENTTYPE();
String title = "分支机构";
String[] enttypes ={"GS","WZGS","WZQY"};
List<String> list = Arrays.asList(enttypes);
if(list.contains(enttype)){
	title = "分公司";
};
%>
<title><%=title %>信息</title>
</head>
<body>
<%@include file="top.inc"%>
<%	
    String OPENO = Page.getOPENO();//业务编号
    String SIGN=Page.getSIGN();
    String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);

	
	
%>
<form name="form1">
<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:200px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue">
<table width="100%"><tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; "><%=title %>录入</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
关闭
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="300" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align='center'  frameborder="0"></IFRAME>
</div></div>

<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
<%=title %>信息</td>
<td align="center" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#' onclick="framejumpTo('qydj_fzjg_do.jsp','action=1&OPENO=<%=OPENO%>');">
<img border=0 src='images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>

<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<%
/*
  String sENTTYPE=Page.getENTTYPE();
  String title="分公司";
  if(sENTTYPE.equalsIgnoreCase("NZFR")||sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHH")
     ||sENTTYPE.equalsIgnoreCase("HHQY"))
  {
     title="分支机构";
  } 
  */
%>
  <tr>	
    <td class="yxsm" align="center"><%=title %>名称</td>    
    <td class="yxsm"><p align="center">注册号</td>
    <td class="yxsm"><p align="center">社会信用代码</td>
    <td class="yxsm" align="center">登记机关 </td>
    <td class="yxsm" align="center">登记日期</td>    
	<td class="yxsm" align="center" width="120px">操作</td>
  </tr>
<%
        String sql=" WHERE OPENO = '"+OPENO+"'";		
	 	
 	 	ArrayList al=QYDJ_FZJG.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的出资人信息
		Iterator It=al.iterator();
		int j=0;
		while (It.hasNext()) 		
		{
			j=j+1;
			com.macrosoft.icms.qydj.QYDJ_FZJG_SQ tb=(com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)It.next();
%>
  <tr>
	<td align="center"><%=tb.getBRNAME()%></td>	
	<td align="center"><%=tb.getREGNO()%></td>
	<td align="center"><%=tb.getUNISCID()%></td>
	<td align="center"><%=tb.getREGORG()%></td>
	<td align="center"><%=tb.getREGDATE()%></td>
	<td>
	<%if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('qydj_fzjg_do.jsp','action=4&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('qydj_fzjg_do.jsp','action=2&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>
	&nbsp;

	<a href='#' onclick="framejumpToC('web/qydj_fzjg_action.jsp','action=3&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>','确定删除该记录吗?');" ><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> 
<%  

  }
%>
	</td>
</tr>
<%}%>
  <tr><td colspan="5">		
<%		SysPageShow sp=new SysPageShow(request,QYDJ_FZJG.getListCount(sql));
		out.print(sp.PageNav());	
%>

</td></tr>
</table> 
<br/>
<center>
  <div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
  <br/>
      数据查询中，请等待...<br/>&nbsp;
 </div>
<div class="subImgs" id="subid" onclick="document.getElementById('subid').disabled=true;parent.document.getElementById('waitdiv').style.display='';window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
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