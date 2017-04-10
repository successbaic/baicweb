<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="ggdjMjmc" scope="page"  class="com.macrosoft.icms.ggdj.GgdjMjmc" />
<html>
<head>
<%
    String id = SysUtility.doPreProcess(request.getParameter("id"));
	String sqxxId = SysUtility.doPreProcess(request.getParameter("sqxxId"));
    String action = SysUtility.doPreProcess(request.getParameter("action"));
	ggdjMjmc.setSqxxId(sqxxId);
	ggdjMjmc.setId(id);
	ggdjMjmc.doSelect();
	String mediaName = ggdjMjmc.getMediaName();
	if(mediaName==null){
		mediaName="";
	}
 %>
<title>媒介发布信息</title>
<script language="javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<form name="form1" method="POST" action='ggdj_mjmc_action.jsp' target="editframe">
<input type="hidden" name="id" value=<%=id%>>
<input type="hidden" name="sqxxId" value=<%=sqxxId%>>
<input type="hidden" name="action" value="<%=action%>">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<caption></caption>
</table>
<table border="1" style="margin-top:20px;" width="100%" cellpadding="0" cellspacing="0" >
   <tr> 
	<td class="lc1">媒介名称</td>   
	<td class="lc2" >
	<input type="text" name="mediaName"   value ="<%=mediaName%>"disblank  maxlength=30 size="30%">
	</td> 	 
  </tr>
</table>
<br>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
<%
		if (action.equals("4")) //4 查看
		{
%>
		<input name="btRet" type="button" value="返  回" tyle="cursor:pointer;" onclick="parent.window.location.reload();" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
<%
		}
		else
		{
		%>
		<input name="btSave" type="submit" value="保  存" class="inp_L1" style="cursor:pointer;"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
		<%
		}
		%>
		</td>
	</tr>
</table>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>     
</html>   