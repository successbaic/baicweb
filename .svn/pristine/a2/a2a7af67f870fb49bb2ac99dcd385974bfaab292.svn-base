<%@ include file="/jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="DCDY_DYWXX" scope="page"  class="com.macrosoft.icms.htgl.DCDY_DYWXX_SQ"/>

<%
    String action = SysUtility.doPreProcess(request.getParameter("action"));
  	String RECID = SysUtility.doPreProcess(request.getParameter("RECID"));
  	String OPENO = SysUtility.doPreProcess(request.getParameter("OPENO"));
%>

<html>
<head>
<title>添加抵押物</title>
</head>
<body>
<form name="form1" method="post" action="action/dcdy_dywxx_action.jsp" >
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="RECID" value="<%=RECID%>">
<input type="hidden" name="action" value="<%=action%>">
<table border="1"  width="100%" id="AutoNumber1">
 <caption>抵押物信息</caption>
  <tr>
    <td class="lc1">抵押物名称</td>
	<td class="lc2" >
		<input type="text" name="GUANAME" size="40"  title="抵押物名称" disblank></td>
   
   <td class="lc1">所有权归属</td>
	<td class="lc2" >
        <input type="text"  name="OWN" size="40"  title="所有权归属"  ></td>
  <tr>
     <td class="lc1">所在地情况</td>
	<td class="lc2" >
        <input type="text"  name="DEPOSPOT" size="40"  title="所在地情况"  ></td>
	
    <td class="lc1"  >数量</td>
	<td class="lc2" >
<input type="text" name="QUAN" size="10"  title='数量'  datatype="NUM">&nbsp;&nbsp;&nbsp; 
		价值&nbsp;
<input type="text" name="VALUE" size="10"  title='价值'  datatype="NUM">万元</td></tr>  

  <tr>
     
     <td class="lc1">状况</td>
	<td class="lc2" coslpan="3">
        <input type="text"  name="ASCST" size="40"  title="状况" ></td>
	
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
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	if(action.equals("2")||action.equals("4"))//action=4 查看
	{
		DCDY_DYWXX.setRECID(Integer.parseInt(RECID));
		DCDY_DYWXX.setOPENO(OPENO);	
		vf.setData(DCDY_DYWXX.getData());
	}
	else
	{
		
	}		
 	out.print(vf.ValueDefaultScript());
%>

