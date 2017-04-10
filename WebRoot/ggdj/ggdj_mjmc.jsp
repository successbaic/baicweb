<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="ggdjMjmc" scope="page"  class="com.macrosoft.icms.ggdj.GgdjMjmc" />
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.system.SysUtility"%>
<html>
<head>
<%
String sqxxId = Page.getSqxxId();
String OPENO = Page.getOPENO(); // ID 主键
String OPETYPE = Page.getOPETYPE(); // 业务类型
if (StringUtils.isEmpty(OPENO)) {
	OPENO = SysUtility.getUUID20();
	Page.setOPENO(OPENO);
}
// 媒介材料
ggdjMjmc.setSqxxId(sqxxId);
ggdjMjmc.queryMediaNameListByMtbId();
List mnList = ggdjMjmc.getMediaNameList();
%>
<title>媒介批准文件信息</title>
</head>
<body bgcolor="#eefbf7">
<%@include file="../top.inc"%>
<%	
    String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SIGN=Page.getSIGN();
%>
<form name="form1">
<%
  String sENTTYPE=Page.getENTTYPE();
  String title="媒介名称";
  String tableTitle = "媒介名称";
  int colNum=0;
%>
<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:400px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue;">
<table width="100%"><tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; "><%=title %></td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
关闭
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="100%" width="100%" name="editframe" src="" id="editframe" scrolling="yes" border="0" align='center'  frameborder="0"></IFRAME>
</div></div>


<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr>
<td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
<%=title %></td>
<td style="text-align: right;" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#'  onclick="framejumpTo('ggdj_mjmc_do.jsp','action=1&sqxxId=<%=sqxxId%>');">
<img border=0 src='../images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>

<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
  <tr class="yxsm">
    <td class="yxsm" align="center"><%=tableTitle %></td>
	<td class="yxsm" align="center" width='120px'>操作</td>
  </tr>
<%
        String sql=" WHERE SQXXID = '"+sqxxId+"'";		
        ArrayList al=ggdjMjmc.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的出资人信息
        Iterator It=al.iterator();
		int j=0;
        while (It.hasNext()) 		
		{
			j=j+1;
			com.macrosoft.icms.ggdj.GgdjMjmc tb=(com.macrosoft.icms.ggdj.GgdjMjmc)It.next();
%>
 <tr>
<td align="center"><%=tb.getMediaName()%></td> 	
<td>
<%if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('ggdj_mjmc_do.jsp','action=4&id=<%=tb.getId()%>&sqxxId=<%=tb.getSqxxId()%>');" ><img border=0 src='../images/icon/icon_edit.gif' alt='查看'> 查看</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('ggdj_mjmc_do.jsp','action=2&id=<%=tb.getId()%>&sqxxId=<%=tb.getSqxxId()%>');" ><img border=0 src='../images/icon/icon_edit.gif' alt='修改'> 修改</a>
	&nbsp;
	<a href='#' onclick="framejumpToC('ggdj_mjmc_action.jsp','action=3&id=<%=tb.getId()%>&sqxxId=<%=tb.getSqxxId()%>','确定删除该记录吗?');" ><img border=0 src='../images/icon/icon_delete.gif' alt='删除'> 删除</a> 
	
<%
  }
%>
</td>	
  </tr>
<%}%>  
  <tr><td>
<%		
		SysPageShow sp=new SysPageShow(request,ggdjMjmc.getListCount(sql));
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
<div class="subImgs" onclick="window.location.href='ggdj_bgfjxx.jsp'">下一步</div>

</center>
</form>
<%@include file="../bottom.inc"%>
</body>
</html>		
<script type="text/javascript">
</script>
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