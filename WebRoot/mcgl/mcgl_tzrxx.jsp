<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="MCGL_TZRXX" scope="page"  class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>投资人信息</title>

</head>
<body>
<%@include file="../top.inc"%>
<%	
	String OPENO = Page.getOPENO();//业务编号
    String pageheader=Page.pageheader(request.getRequestURI());
    String ENTCLASS=Page.getENTCLASS();
    String SIGN=Page.getSIGN();
	out.println(pageheader);
	String OPETYPE = Page.getOPETYPE();
	int colNum=5;
%>
<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:200px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue">
<table width="100%"><tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; ">出资信息录入</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
关闭
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="300" width="770px" name="editframe" src="" id="editframe" scrolling="yes" border="0" align='center'  frameborder="0"></IFRAME>
</div></div>

<form name="form1">
<table align="center" width="770px" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;"></td>
<td align="center" width="120px">
&nbsp;
<%if(SIGN.equals("0")){ %>
<a href='#' onclick="framejumpTo('mcgl_tzrxx_do.jsp','action=1&OPENO=<%=OPENO%>');">
<img border=0 src='../images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a>
<%} %>
</td></tr></table>


<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
  <tr>
  <%
  if(ENTCLASS.equals("8")){
  %>
    <td class="yxsm" align="center">投资人姓名或名称</td>
    <td class="yxsm" align='center'>国别</td>	     
    <td class="yxsm"><p align="center">投资额</td>
    <td class="yxsm" align="center">投资比例</td>
  <%
  }else{
  %>
    <td class="yxsm" align="center">投资人姓名或名称</td>
    <td class="yxsm" align="center">投资人类型</td>
	<td class="yxsm" align="center">证照类型</td>
	<td class="yxsm" align="center">证照号码</td>
<%} %>    
	<td class="yxsm" align="center">操作</td>

  </tr>
<%
        String sql=" WHERE OPENO = '"+OPENO+"'";		
	 	
 	 	ArrayList al=MCGL_TZRXX.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的投资人文件信息
		Iterator It=al.iterator();
		int j=0;
		while (It.hasNext()) 		
		{
			j=j+1;
			com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ tb=(com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ)It.next();
%>
 <tr align='center'>
	<%
if(ENTCLASS.equals("8")){
%>
<td><%=tb.getINV() %></td>
<td><%=icms.getSysDm("COUNTRY",tb.getCOUNTRY())%></td>
<td><%=tb.getSUBCONAM() %></td>
<td><%=tb.getCONPROP() %>%</td>
<%
}else{
%>
<td><%=tb.getINV() %></td>
<td align="center">
<%
if(ENTCLASS.equals("6")){
	out.println(icms.getSysDm("MEMTYPE",tb.getINVTYPE()));	
}else{
	out.println(icms.getSysDm("INVTYPE",tb.getINVTYPE()));
}
%>
</td><!-- //投资人类型 -->
	
	<%
		if(tb.getINVTYPE().equals("20") || tb.getINVTYPE().equals("35") || tb.getINVTYPE().equals("36") || tb.getINVTYPE().equals("21") || tb.getINVTYPE().equals("22")){
	%>
	<td align="center"><%=icms.getSysDm("CERTYPE",tb.getCERTYPE()) %></td>
	<td align="center"><%=tb.getCERNO() %></td>
	<%		
		}else{
	%>
	<td align="center"><%=icms.getSysDm("BLICTYPE",tb.getBLICTYPE()) %></td>
	<td align="center"><%=tb.getBLICNO() %></td>
	<%			
		}
	%>
<%
}%>
<td>
<%
if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('mcgl_tzrxx_do.jsp','action=4&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='../images/icon/icon_edit.gif' alt='查看'> 查看</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('mcgl_tzrxx_do.jsp','action=2&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='../images/icon/icon_edit.gif' alt='修改'> 修改</a>
	&nbsp;
	<a href='#' onclick="framejumpToC('mcgl_tzrxx_action.jsp','action=3&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>','确定删除该记录吗?');" ><img border=0 src='../images/icon/icon_delete.gif' alt='删除'> 删除</a> 
<%  
  }
%></td>
  </tr>
<%}%>
<tr><td colspan="<%=colNum%>">
<%

		SysPageShow sp=new SysPageShow(request,MCGL_TZRXX.getListCount(sql));
		out.print(sp.PageNav());	
%>
</td></tr>

</TABLE>
<br/>
<center>
  <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
  </div>
<div class="subImgs" id="subid" onclick="tzrCheck()">下一页</div>
</center>
</form>
<%@include file="../bottom.inc"%>
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
<script type="text/javascript">
var OPENO = "<%=OPENO%>";
var OPETYPE = "<%=OPETYPE%>";
function tzrCheck(){
	$.ajax(
			{
				async:false,//提交采用同步方法
				type:"post", 
				data:{"OPENO":OPENO,"OPETYPE":OPETYPE,"ywlx":"mcgl"},
				dataType: "text",
				//method:getGSS,
				//contentType:"application/json",
				url:"tzrCheck.action",
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
</script>