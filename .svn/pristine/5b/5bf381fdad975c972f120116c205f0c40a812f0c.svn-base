<%@ page contentType="text/html;charset=GBK"%> 
<%@ include file="jspheader.inc"%>
<jsp:useBean id="SW_LXRXX" scope="page"
	class="com.macrosoft.icms.bean.SW_LXRXX" />
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%@ page import="com.macrosoft.icms.bean.SW_LXRXX"%>
<html>
<head>
<title>联系人</title>
</head>
<%

    String OPENO = Page.getOPENO();//业务编号
    String SIGN=Page.getSIGN();
    String QYZL = Page.getENTTYPE();
%>
<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<form name="form1">

<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:400px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue">
<table width="100%"><tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; ">联系人信息</td>
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
联系人</td>
<td align="center" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#' onclick="framejumpTo('wsdj_sw_lxrxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2');">
<img border=0 src='images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>
<table bgcolor="#FFFFFF" align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr class="yxsm">
    <td align="center">姓名/代理人名称</td>    
    <td align="center">类型</td>
    <td align="center">证件类型</td>
    <td align="center">证件号/纳税人识别号</td>
    <td align="center">联系电话</td>
    <td align="center" width='120px'>操作</td>
</tr>
<%
     String sql=" WHERE OPENO = '"+OPENO+"'";	
 	 ArrayList<SW_LXRXX> al=SW_LXRXX.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的董监事会成员
	 Iterator<SW_LXRXX> It=al.iterator(); 
	while (It.hasNext()) 		
	{
		SW_LXRXX bean=It.next();
%>
<tr align='center'>
	<td align="center"><%=bean.getXM()%></td>
	<td align="center"><%=icms.getSysDm("SWLXRLX",bean.getRYLX())%></td>
	<td align="center"><%=icms.getSysDm("CERTYPE",bean.getZJLX())%></td>
	<td align="center"><%=bean.getZJHM()%></td>
	<td align="center"><%=bean.getLXDH()%></td>
	<td>
<%if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('wsdj_sw_lxrxx_do.jsp','action=4&RECID=<%=bean.getRECID()%>&OPENO=<%=bean.getOPENO()%>%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('wsdj_sw_lxrxx_do.jsp','action=2&RECID=<%=bean.getRECID()%>&OPENO=<%=bean.getOPENO()%>%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>
	&nbsp;
<%
%>	
	<a href='#' onclick="framejumpToC('web/wsdj_sw_lxrxx_action.jsp','action=3&RECID=<%=bean.getRECID()%>&OPENO=<%=bean.getOPENO()%>%>','确定删除该记录吗?');" ><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> 
<%  
  }
%>
  </td>
</tr>
<%	
	}
%>
<tr><td colspan="5">
<%	
	SysPageShow sp=new SysPageShow(request,SW_LXRXX.getListCount(sql));
	out.print(sp.PageNav());	
%>
</td></tr></table>
</form>
<center>
			<div class="subImgs" onclick="window.parent.location.href='wsdj_dotj.jsp'">下一步</div>
		</center>
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