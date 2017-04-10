<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_JYDW_JYSB" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYSB"/>
<html>
<head>
<title>经营设备信息</title>
</head> 
<%
	String action = SysUtility.doPreProcess(request.getParameter("action"));
  	String RECID = SysUtility.doPreProcess(request.getParameter("RECID"));
  	String ADBULICNO = SysUtility.doPreProcess(request.getParameter("ADBULICNO"));
  	String INSYEAR=SysUtility.doPreProcess(request.getParameter("INSYEAR"));  	
	
 %>
<body>
<form name="form1" method="POST" action='ggxkz_jysb_action.jsp' target="editframe">
<input type="hidden" name="ADBULICNO" value=<%=ADBULICNO%>>
<input type="hidden" name="INSYEAR" value=<%=INSYEAR%>>
<input type="hidden" name="PRIPID" >
<input type="hidden" name="RECID" value=<%=RECID%>>
<input type="hidden" name="action" value="<%=action%>" >

<table border="1" width="100%" cellpadding="0" cellspacing="0">
<%--   
   <tr> 
	<td class="lc1" >广告经营许可证号</td>   
	<td class="lc2" ><input type="text" name="ADBULICNO" title="广告经营许可证号" disblank maxlength=32 disabled>&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1" >检查年度</td>
    <td class="lc2" >
	  <input type="text" name="INSYEAR" disblank title="检查年度" maxlength=5 datetype=INT disabled>&nbsp;<font color=red>*</font>
	</td> 
   </tr>
--%>
   <tr>
    <td class="lc1" >设备名称</td>   
	<td class="lc2" ><input type="text" name="EQUNAME" title="设备名称" disblank maxlength=50>&nbsp;<font color=red>*</font></td> 
   
    <td class="lc1" >型号</td>   
	<td class="lc2" ><input type="text" name="TYPESPF" title="型号" disblank maxlength=50>&nbsp;<font color=red>*</font></td> 
   </tr>
   <tr> 
    <td class="lc1" >数量</td>   
	<td class="lc2"><input type="text" name="QUAN" disblank title="数量" maxlength=8 size="30%" datetype=INT>个&nbsp;<font color=red>*</font></td>	
 
    <td class="lc1" >净价值</td>   
	<td class="lc2"><input type="text" name="NETPRICE" disblank title="净价值" maxlength=18 size="30%" datetype=NUM>万元&nbsp;<font color=red>*</font></td>	
   </tr>

<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
    1、有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	</p></td>   
 </tr>
</table>

<br>
<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
<%
		if (action.equals("4"))
		{
%>
		<input name="btRet" type="button" value="返  回" onclick="parent.window.location.reload();" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
<%
		}
		else
		{
		%>
		<input name="btSave" type="submit" value="保  存" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
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

 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();	
	out.print(ec.ErrorCheckScript());


	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	
	if(action.equals("2")||action.equals("4"))//action=4 查看
	{
		GGGL_JYDW_JYSB.setRECID(Integer.parseInt(RECID));
		GGGL_JYDW_JYSB.setADBULICNO(ADBULICNO);
		GGGL_JYDW_JYSB.setINSYEAR(Integer.parseInt(INSYEAR));
		vf.setData(GGGL_JYDW_JYSB.getData());
	}	
 	out.print(vf.ValueDefaultScript());
%>
