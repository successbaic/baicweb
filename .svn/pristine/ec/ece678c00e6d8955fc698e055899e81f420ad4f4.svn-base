<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_JYDW_ZSXX" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_ZSXX"/>
<html>
<head>
<title>证书信息</title>
</head> 
<%
	String action = SysUtility.doPreProcess(request.getParameter("action"));
  	String RECID = SysUtility.doPreProcess(request.getParameter("RECID"));
  	String ADBULICNO = SysUtility.doPreProcess(request.getParameter("ADBULICNO"));
  	String INSYEAR=SysUtility.doPreProcess(request.getParameter("INSYEAR"));  	
 %>
<body>
<form name="form1" method="POST" action='ggxkz_zsxx_action.jsp' target="editframe">
<input type="hidden" name="ADBULICNO" value=<%=ADBULICNO%>>
<input type="hidden" name="INSYEAR" value=<%=INSYEAR%>>
<input type="hidden" name="PRIPID" >
<input type="hidden" name="RECID" value=<%=RECID%>>
<input type="hidden" name="action" value="<%=action%>" >

<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>
	<td class="lc1" >广告资格证书类型</td>   
	<td class="lc2" >
	<select size="1" name="ADTICERTYPE" title="广告资格证书类型" disblank style="width:192px; ">
	  <option value=''>请选择证书类型</option>	  
	  <option value='02'>广告审查员证</option>
	  <option value='01'>广告专业技术岗位资格培训证</option>
	  <option value='99'>其他</option>
	  </select>&nbsp;<font color=red>*</font>
	</td>
	
	<td class="lc1" >姓名</td>   
	<td class="lc2" ><input type="text" name="NAME" title="姓名" disblank maxlength=30>&nbsp;<font color=red>*</font></td> 
	</tr>
   <tr> 
    <td class="lc1" >证件名称</td>   
	<td class="lc2" ><input type="text" name="CERNAME" disblank title="证件名称" maxlength=100 size="30%">&nbsp;<font color=red>*</font></td>
	    
	<td class="lc1" >证件号码</td>   
	<td class="lc2"><input type="text" name="CERNO" disblank title="证件号码" maxlength=50 size="30%">&nbsp;<font color=red>*</font>
	</td> 	
   </tr>
   <tr>
     <td class="lc1">培训日期</td>
     <td class="lc2">
       <input type="text" name="CULDATE" title="培训日期" disblank maxlength=10 datetype=DATE onclick="dropdowndate(this)">&nbsp;<font color=red>*</font>
     </td>
     
     <td class="lc1">发证日期</td>
     <td class="lc2">
       <input type="text" name="ISSCARDDATE" title="发证日期" disblank maxlength=10 datetype=DATE onclick="dropdowndate(this)">&nbsp;<font color=red>*</font>
     </td>
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
		GGGL_JYDW_ZSXX.setRECID(Integer.parseInt(RECID));
		GGGL_JYDW_ZSXX.setADBULICNO(ADBULICNO);
		GGGL_JYDW_ZSXX.setINSYEAR(Integer.parseInt(INSYEAR));
		vf.setData(GGGL_JYDW_ZSXX.getData());
	}
	
 	out.print(vf.ValueDefaultScript());
%>
