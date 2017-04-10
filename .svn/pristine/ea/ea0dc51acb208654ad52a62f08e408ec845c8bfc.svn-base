<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="GSGSJIN_BASIS02" scope="page"  class="com.macrosoft.icms.gsnw.GSGSJIN_BASIS02"/>
<jsp:useBean id="Par" scope="page" class="com.macrosoft.icms.system.SysParameter"/>
<html>
<head>
<title>获取企业名称信息</title>
</head>
<body>
<form name="form1" method="post" action="selectCZR.jsp">
<table border="1" width="98%" cellpadding="0" cellspacing="0" align="center">
<caption>获取企业名称信息</caption> 
<tr>
	<input name="mode" type="hidden">
	<td class=lc1>注册号</td>
	<td class=lc2><input size="12" name="REGNO" type="text" title="注册号"  maxlength=15></td>
	<td class=lc1>企业名称</td>
	<td class=lc2><input size="20" name="ENTNAME" type="text" title="核准的名称" maxlength=50></td>
	<td class=lc1><input type="button" value="查 询" name="query1" onclick="doSubmit()">
	<INPUT TYPE="reset" value="重 置" >
	</td>
</tr>
</table>
<br>
<table border="1" width="98%" cellpadding="0" cellspacing="0" align="center">
<tr class='tc'>
	<!--td>名称核准号</td-->
	<td>注册号</td>
	<td>企业名称</td>
	<td>法定代表人</td>
	<td>选择</td>
</tr>	
 <%
	if (request.getParameter("mode")!=null)
	{
		String sql=" WHERE FIELD002 IN('020101','020201','020301') AND FIELD006 IN ('1','4')";		
		String REGNO=GSGSJIN_BASIS02.convertCode(GSGSJIN_BASIS02.doPreProcess(request.getParameter("REGNO")).trim());
		if(!REGNO.equals(""))
		{
			sql+="  AND trim(FIELD004)='"+REGNO+"'";
		}
		String ENTNAME=GSGSJIN_BASIS02.convertCode(GSGSJIN_BASIS02.doPreProcess(request.getParameter("ENTNAME")).trim());
		if(!ENTNAME.equals(""))
		{
			sql+="  AND trim(FIELD009)='"+ENTNAME+"'";
		}	
		ArrayList al=GSGSJIN_BASIS02.getList(sql,request.getParameter("start"));	
		Iterator It=al.iterator();
		while (It.hasNext())
		{
			com.macrosoft.icms.gsnw.GSGSJIN_BASIS02 tb=(com.macrosoft.icms.gsnw.GSGSJIN_BASIS02)It.next();
%>  
		<tr class='lc1'>
			<td><%=tb.getFIELD004()%></td>
			<td><%=tb.getFIELD009()%></td>
			<td><%=tb.getFIELD019()%></td>
			<td><input type="button" name="btnsel" value="选 择" onclick="getxx('<%=tb.getFIELD004()%>','<%=tb.getFIELD009()%>')"></td>
		</tr>	
<%
		}
		SysPageShow sp=new SysPageShow(request,GSGSJIN_BASIS02.getListCount(sql));
		out.print(sp.PageNav());
	}
%>
</table>
</form> 
<script language=javascript>
function doSubmit()
{
	var regno=document.getElementById("REGNO").value;
	var entname=document.getElementById("ENTNAME").value;
	if(regno==""){
		alert("请填写注册号！");
		return ;
	   }
	   if(entname==""){
		alert("请填写企业名称！");
		return ;
	   }
	form1.submit();
}
function getxx(regno,entname)
{
	if (regno!=''&&entname!='')
	{
		window.parent.document.form1.IMPMORBLICNO.value=regno;
		window.parent.document.form1.IMPMOR.value=entname;
		window.parent.document.getElementById('editDiv').style.display='none'
	}	
	else
	{
		//alert("请先选择数据！");
	}
}
</script>
</body>      
</html>      
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");	
	vf.setData(request);
	out.print(vf.ValueDefaultScript());
%>
