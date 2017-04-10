<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="jspheader.inc"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"%>
<%@ page import="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"%>
<jsp:useBean id="UPLOAD_FILE" scope="page"  class="com.macrosoft.icms.util.UPLOAD_FILE"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head><title>上传文件信息</title>
<script language="javascript" src="<%=request.getContextPath()%>/eid/eIDPluginHelper2.0.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/eid/base64.js"></script>
	<script language="javascript" src='<%=request.getContextPath()%>/eid/jquery-1.8.2.js'></script>
	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.js'></script>
   	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/eIDUI-common.js'></script>
    <link   rel="stylesheet" href="<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.css">
<script language="javascript">
function eIDlogin(openo,fileid){
	window.open('wsdj_fjxx_login.jsp?OPENO='+openo+"&FILEID="+fileid,"","height=300, width=400, top=300,left=600, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
}

function IsFullElec(){
	var fullElec = document.getElementById("fullElec");
	var noFullElec = document.getElementById("noFullElec");
	if(fullElec.checked){
		stockmanID.style.setAttribute("display", "none");  
		table1.style.setAttribute("display", "none"); 
		ElecFjxx.style.setAttribute("display", ""); 
	}
	if(noFullElec.checked){
		stockmanID.style.setAttribute("display", "");
		table1.style.setAttribute("display", ""); 
		ElecFjxx.style.setAttribute("display", "none"); 
	}
}
</script>
</head>
<body bgcolor="#eefbf7" onLoad="body_load()">
<%@include file="top.inc"%>
<%
String OPENO = Page.getOPENO();
String SIGN=Page.getSIGN();
//String IFELEC="";
//if (!OPENO.equals("")) {
//		QYDJ_JBXX_SQ jbxx = new QYDJ_JBXX_SQ();
//		jbxx.setOPENO(OPENO);
//	    jbxx.doSelect();
//		IFELEC = jbxx.getIFELEC();
//	}
String IFELEC=Page.getIFELEC();
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);
%>
<form name="form1">

<div style="position:relative;">
<div id="editDiv"  style="position:absolute; width:100%; height:780px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt;border-color:blue">
<table width="100%"><tr class="yxsm" style="background-color: #BED8EB;">
<td align="left" style="font-size:14px;font-weight:bold; ">附件信息添加</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
关闭
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="100%" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align='center'  frameborder="0">
</IFRAME>
</div></div>
<%
if(IFELEC==null||"0".equals(IFELEC)){
%>
<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
附件信息</td>
<td style="text-align: right;" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#' onclick="framejumpTo('wsdj_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2&IFELEC=0');">
<img border=0 src='images/icon/icon_list_add.gif' alt='增加'>
<font style="font-size:14px;">增加</font>
</a><%}%>
</td></tr></table>

<table bgcolor="#FFFFFF" align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="table1">
  <tr class="yxsm">		
    <td align="center" style="width:40%;">文件名</td>    
    <td align="center" style="width:20%;">上传时间 </td>  
    <td align="center" style="width:20%;">操作</td>
    <%if("3".equals(webuser.getTYPE())) {%>
    <td align="center" style="width:20%;">签字人</td>
    <%} %>	
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
			<td align="center">
<%
	if (SIGN.equals("1"))
	{
%>
			<a href='upload/<%=f.getFILEID() %>' target="_blank"><img border=0 src='images/icon/icon_edit.gif' alt='查看'>查看</a> 
<%
	}	
	else
	{
%>
			<a href='upload/<%=f.getFILEID() %>' target="_blank"><img border=0 src='images/icon/icon_edit.gif' alt='查看'>查看</a> &nbsp;
			   <%if("3".equals(webuser.getTYPE())) {%>
			<a href='#' onclick="eIDlogin('<%=f.getOPENO()%>','<%=f.getFILEID()%>')"><img border=0 src='images/icon/icon_edit.gif' alt='签名'>签名</a>	&nbsp;	
			<%} %>			
			<a href='#' onclick="framejumpToC('web/wsdj_fjxx_delete.jsp','REMARK=delete&OPENO=<%=f.getOPENO()%>&FILEID=<%=f.getFILEID()%>','确定删除该记录吗?');"><img border=0 src='images/icon/icon_delete.gif' alt='删除'>删除</a>						
<%
	}	
%>
	</td>
	<%if("3".equals(webuser.getTYPE())) {%>
	<td align="center"><%=f.getREMARKS()%></td>
		<%} %>	
  </tr>
<%
		}
%>
<tr>
<td colspan="4">
<%	
	SysPageShow sp=new SysPageShow(request,UPLOAD_FILE.getListCount(sql));
	out.print(sp.PageNav());	
%>
</td>
</tr>
</table>
<%
}else if(IFELEC.equals("1")){
%>
<div id="ElecFjxx" >
<%@include file="tjwj_edit.jsp"%>
</div>
<%} %>
<br>
<CENTER>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
</div>
<%
	if(isSanZheng){
 %>
 <div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
 
<%
	}else{
 %>
<div class="subImgs" id="subid" onclick="document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';window.location.href='wsdj_dotj.jsp?openo=<%=OPENO %>'">下一步</div>
 
 <%
 }
  %>
</CENTER>

</form>

<%@include file="bottom.inc"%>
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