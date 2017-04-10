
<%@page import="java.net.URLDecoder"%><%@include file="../jspheader.inc"%>

<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");

%>
<%@ page import="java.util.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page errorPage="/error.jsp"%>

<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="DIGITAL_SQ" scope="page" class="com.macrosoft.icms.digital.DIGITAL_SQ"></jsp:useBean>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath() %>/support/list.js"></script>
<%
String opt = request.getParameter("opt");
String status = request.getParameter("status");
String ENTNAME = request.getParameter("ENTNAME");
String PNAME  = request.getParameter("PNAME");
if(null==ENTNAME||"null".equals(ENTNAME)){
	ENTNAME="";
}
if(null==PNAME||"null".equals(PNAME)){
	PNAME="";
}
String optName="";

String whereSql="";
if("sq".equals(opt)){
	whereSql = " and PNAME = '"+webuser.getUSERNAME() +"'";
	optName="查看";
}else{
	whereSql = " and STATUS !='0'";
	optName="审批";
}
if(null!=status&&!"".equals(status)&&!"null".equals(status)){
	whereSql = whereSql+" and STATUS="+status;
}
if(null!=ENTNAME&&!"".equals(ENTNAME)&&!"null".equals(ENTNAME)){
	ENTNAME  = SysUtility.convertCode(ENTNAME);
	whereSql = whereSql+" and ENTNAME like '%"+ENTNAME+"%'";
}
if(null!=PNAME&&!"".equals(PNAME)&&!"null".equals(PNAME)){
	whereSql = whereSql+" and PNAME like '%"+PNAME+"%'";
}
%>
<script type="text/javascript">
<!--//-->
function query(){
	var status = document.getElementsByName('status')
	var zt='';
	for(var i=0;i<status.length;i++){
		if(status[i].checked){
			zt = status[i].value;
		}
	}
	var opt='<%=opt %>';
	form1.action='degital_list.jsp?status='+zt;
	form1.submit();
}
</script>
<html><head><title></title>
</head>
<%@ include file="top.inc"%>

<body>
<br>
<form name="form1" >
<input type='hidden' name='opt' value='<%=opt %>' />
<table align="center"  width="980px" cellpadding="0" cellspacing="0" id="stockmanID">
<tr>
<td style="font-size:14px;padding-right: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
数字证书申请表
</td>
<td align="center" width="700px">
申请单位：<input type='text' name='ENTNAME' value='<%=ENTNAME %>'>
经办人：<input type='text' name='PNAME' value='<%=PNAME %>'>
<%if("sq".equals(opt)){ %>
<input type='radio' name='status' value='0' >未提交
<%} %>
<input type='radio' name='status' value='1' >提交
<input type='radio' name='status' value='2' >审核通过
<input type='radio' name='status' value='3' >审核驳回
<input type='button' value='查询' onclick='query()'>
</td>
	
<%if("sq".equals(opt)){ %>
<td align="right" style="font-size:14px;font-weight:bold; ">
<a href='degital_sq.jsp' target="_blank">增加申请</a> &nbsp;&nbsp;
</td>
<%} %>
</td>
</tr></table>

<table align="center" border="1"  width="980px" cellpadding="0" cellspacing="0" id="table1">
  <tr class="yxsm">	
  	<td align="center">序号</td>	
    <td align="center">申请单位</td>    
    <td align="center">经办人</td>
    <td align="center">申请时间</td> 
    <td align="center">状态</td>  
    <td align="center">操作</td>
  </tr>
<%	 	
		String sql=" WHERE 1=1 "+whereSql;		
		ArrayList al=DIGITAL_SQ.getList(sql,request.getParameter("start")); //根据业务编号查询出该业务的所有上传文件信息
		Iterator It=al.iterator();
		int i=0;
		while (It.hasNext()) 		
		{
			i=i+1;
			com.macrosoft.icms.digital.DIGITAL_SQ f=(com.macrosoft.icms.digital.DIGITAL_SQ)It.next();
			status =f.getSTATUS();
			String st="";
			if("0".equals(status)){st="未提交";}
			if("1".equals(status)){st="提交";}
			if("2".equals(status)){st="受理通过";}
			if("3".equals(status)){st="受理驳回";}

%>
  <tr>
			<td align="center"><%=i %></td>
			<td align="center"><%=f.getENTNAME()%></td>		
			<td align="center"><%=f.getPNAME()%></td>
			<td align="center"><%=f.getSQDATE()%></td>
			<td align="center"><%=st%></td>
			
			<td>
			<%if("sq".equals(opt)){ %>
				<a href='degital_detail.jsp?id=<%=f.getID() %>' target="_blank">查看</a> &nbsp;&nbsp;
			<%}else{ %>
				<a href='degital_detail.jsp?id=<%=f.getID() %>' target="_blank">查看</a> &nbsp;&nbsp;
				<%if("1".equals(f.getSTATUS())) {%>
				<a href='degital_sp.jsp?id=<%=f.getID() %>' target="_blank">审批</a> &nbsp;&nbsp;
				<%} %>
			<%} %>
			</td>
  </tr>
<%
		}
%>
 <tr><td colspan="6">		
<%		SysPageShow sp=new SysPageShow(request,DIGITAL_SQ.getListCount(sql));
		out.print(sp.PageNav());	
%>

</td></tr>
</TABLE>
</form>
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