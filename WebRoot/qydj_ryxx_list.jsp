<%@ page contentType="text/html;charset=GBK"%> 
<%@ include file="jspheader.inc"%>
<jsp:useBean id="QYDJ_RYXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>董事、监事、经理信息</title>
</head>
<%@include file="top.inc"%>
<%

    String OPENO = Page.getOPENO();//业务编号
    String SIGN=Page.getSIGN();
    String QYZL = Page.getENTTYPE();
    String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
%>
<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<form name="form1">

<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:400px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue">
<table width="100%"><tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; ">董事、监事、经理信息录入</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
关闭
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="100%" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align='center'  frameborder="0"></IFRAME>
</div></div>

<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
董事、监事、经理信息</td>
<td align="center" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#' onclick="framejumpTo('qydj_ryxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2');">
<img border=0 src='images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>
<table bgcolor="#FFFFFF" align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr class="yxsm">
    <td align="center">姓名</td>    
    <td align="center">职务</td>
    <td align="center">身份证件类型</td>
    <td align="center">身份证号</td>
    <td align="center" width='120px'>操作</td>
</tr>
<%
     String sql=" WHERE OPENO = '"+OPENO+"'";	
 	 ArrayList al=QYDJ_RYXX.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的董监事会成员
	 Iterator It=al.iterator(); 
	while (It.hasNext()) 		
	{
		com.macrosoft.icms.qydj.QYDJ_RYXX_SQ tb=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)It.next();
%>
<tr align='center'>
	<td align="center"><%=tb.getNAME()%></td>
	<td align="center"><%=icms.getSysDm("POSITION",tb.getPOSITION())%></td>
	<td align="center"><%=icms.getSysDm("CERTYPE",tb.getCERTYPE())%></td>
	<td align="center"><%=tb.getCERNO()%></td>
	<td>
<%if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('qydj_ryxx_do.jsp','action=4&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>&LEREPSIGN=<%=tb.getLEREPSIGN()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('qydj_ryxx_do.jsp','action=2&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>&LEREPSIGN=<%=tb.getLEREPSIGN()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>
	&nbsp;
<%
	if(!tb.getLEREPSIGN().equals("1")){
%>	
	<a href='#' onclick="framejumpToC('web/qydj_ryxx_action.jsp','action=3&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>&LEREPSIGN=<%=tb.getLEREPSIGN()%>','确定删除该记录吗?');" ><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> 
<%  
  	}
  }
%>
  </td>
</tr>
<%	
	}
%>
<tr><td colspan="5">
<%	
	SysPageShow sp=new SysPageShow(request,QYDJ_RYXX.getListCount(sql));
	out.print(sp.PageNav());	
%>
</td></tr></table>

<br/>
<center>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
</div>
<div class="subImgs" id="subid" onclick="djhCheck()">下一页</div>
</center>
</form>
<%@include file="bottom.inc"%>
</body>
<script type="text/javascript">
	var OPENO = "<%=OPENO%>";
	var QYZL = "<%=QYZL%>";
function djhCheck(){
	if(QYZL !="GS" && QYZL != "WZGS"){
		window.location.href="<%=Page.getNextPage()[0] %>";
	}else{
		$.ajax(
				{
					async:false,//提交采用同步方法
					type:"post", 
					data:{"OPENO":OPENO},
					dataType: "text",
					//method:getGSS,
					//contentType:"application/json",
					url:"djhCheck.action",
					beforeSend:function (XMLHttpRequest) {
					}, 
					success:function (data, textStatus) {
						if(data != ""){
							alert(data);
						}else{
							document.getElementById("subid").disabled=true;
							document.getElementById("waitdiv").style.display="";
							window.location.href="<%=Page.getNextPage()[0] %>";
							
						}
					}, 
					complete:function (XMLHttpRequest, textStatus) {
					}, 
					error:function () {
							//请求出错处理
						alert("系统错误，请稍后重试或联系管理员！");
					}
				}
			);
	}
	}
</script>
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