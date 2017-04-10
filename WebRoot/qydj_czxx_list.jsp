<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_CZXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<%
	String OPENO = Page.getOPENO();//业务编号
	String OPETYPE = Page.getOPETYPE();
%>
<title>公司股东（发起人）出资信息</title>
</head>
<body bgcolor="#eefbf7">
<%@include file="top.inc"%>
<%	
    String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SIGN=Page.getSIGN();
%>
<form name="form1">
<%
  String sENTTYPE=Page.getENTTYPE();
  String title="股东(发起人)信息";
  String tableTitle = "股东(发起人)名称或姓名";
  if(sENTTYPE.equals("HZS")){
     title="成员出资信息";
	 tableTitle = "出资成员名称或姓名";
  }else if(sENTTYPE.equals("NZFR")){
	  title="主管部门(出资人)信息";
	  tableTitle = "名称";
  }
  String opetype=Page.getOPETYPE();
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
<a href='#'  onclick="framejumpTo('qydj_czxx_do.jsp','action=1&OPENO=<%=OPENO%>');">
<img border=0 src='images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>

<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
  <tr class="yxsm">
<%
  if(sENTTYPE.equals("HZS"))
  { 
  	colNum=5;
%>
    <td class="yxsm" align="center"><%=tableTitle %></td>
    <td class="yxsm" align="center">成员类型</td>    
<%}else{
	colNum=5;
 %>    	
    <td class="yxsm" align="center"><%=tableTitle %></td>
    <td class="yxsm" align="center">投资人类型</td>       
<%} %>	
	<td class="yxsm" align="center">证照/件类型</td>
	<td class="yxsm" align="center">证照/件号码</td>
	<td class="yxsm" align="center" width='120px'>操作</td>
  </tr>
<%
        String sql=" WHERE OPENO = '"+OPENO+"'";		
	 	
 	 	ArrayList al=QYDJ_CZXX.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的出资人信息
		Iterator It=al.iterator();
		int j=0;
		while (It.hasNext()) 		
		{
			j=j+1;
			com.macrosoft.icms.qydj.QYDJ_CZXX_SQ tb=(com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)It.next();
%>
 <tr>
    <td align="center"><%=tb.getINV()%></td> 
    <%if(sENTTYPE.equals("HZS")){
    %>
	<td align="center"><%=icms.getSysDm("MEMTYPE",tb.getINVTYPE())%></td><!-- //投资人类型 -->
    <%}else{ %>       
	<td align="center"><%=icms.getSysDm("INVTYPE",tb.getINVTYPE())%></td><!-- //投资人类型 -->
	
	<%
		}
	if(sENTTYPE.equals("HZS")){
	
	if(tb.getINVTYPE().equals("1") || tb.getINVTYPE().equals("2") ){
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
	}else{
		if(tb.getINVTYPE().equals("20") ||tb.getINVTYPE().equals("21") ||tb.getINVTYPE().equals("22") || tb.getINVTYPE().equals("35") || tb.getINVTYPE().equals("36")){
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
	}
	%>
	
	
<td>
<%if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('qydj_czxx_do.jsp','action=4&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('qydj_czxx_do.jsp','action=2&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>
	&nbsp;
	<a href='#' onclick="framejumpToC('web/qydj_czxx_action.jsp','action=3&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>','确定删除该记录吗?');" ><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> 
	
<%
  }
%>
</td>	
  </tr>
<%}%>  
  <tr><td colspan="<%=colNum%>">
<%		
		SysPageShow sp=new SysPageShow(request,QYDJ_CZXX.getListCount(sql));
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
<div class="subImgs" id="subid" onclick="tzrCheck()">下一页</div>
</center>
</form>
<%@include file="bottom.inc"%>
</body>
</html>		
<script type="text/javascript">
var OPENO = "<%=OPENO%>";
var OPETYPE = "<%=OPETYPE%>";
function tzrCheck(){
	$.ajax(
			{
				async:false,//提交采用同步方法
				type:"post", 
				data:{"OPENO":OPENO,"OPETYPE":OPETYPE,"ywlx":"qydj"},
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
						//if("30" == OPETYPE){
						//	qybgCheck();
						//}else{
							document.getElementById("subid").disabled=true;
							document.getElementById("waitdiv").style.display="";
							window.location.href="<%=Page.getNextPage()[0] %>";
						//}
						
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
function qybgCheck(){
	$.ajax(
			{
				async:false,//提交采用同步方法
				type:"post", 
				data:{"OPENO":OPENO,"OPETYPE":OPETYPE,"ywlx":"qybg"},
				dataType: "text",
				//method:getGSS,
				//contentType:"application/json",
				url:"tzrCheck.action",
				beforeSend:function (XMLHttpRequest) {
				}, 
				success:function (data, textStatus) {
					if(data != ""){
						if(window.confirm(data)){
							window.location.href="<%=Page.getNextPage()[0] %>";
						}
					}else{
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