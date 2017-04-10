<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="com.macrosoft.icms.system.SysPyk" %>
<%
	String ENTTRA = SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("ENTTRA"))).trim();
	String OBJtxt=SysUtility.doPreProcess(request.getParameter("OBJTXT"));
	SysPyk syspyk=new SysPyk();
%>
<script language=javascript>
var sPy = "";
// 弹出一个选择框用于选择多音字
<%
for (int i=0;i<ENTTRA.length();i++)
{
	String hz=ENTTRA.substring(i,i+1);
	String res = syspyk.getHypy(hz);  //单个汉字
	if (res.equals("")){
		%>
		alert("未找到\""+"<%=hz%>"+"\"的拼音，请手动输入");	
		<%
	}else if (res.indexOf(",")>0)
	{
%>
	var ret=window.showModalDialog("select_py.jsp","<%=hz+','+res%>","dialogWidth=180px;dialogHeight=220px;status=0;help=0");
	if (ret!=null)		
	{
		sPy = sPy + " " + ret;
	}
<%
	}
	else
	{
%>		
		sPy = sPy + " <%=res%>";
<%	
	}
}
%>
if (sPy.length>0)
	sPy=sPy.substring(1, sPy.length);
<%

	if (OBJtxt.equals(""))
	{
%>
parent.document.form1.TRADPINY.value=sPy;
<%
	}
	else
	{
%>
eval('parent.document.form1.<%=OBJtxt%>.value="'+sPy+'"');
<%
	}
%>
</script>
