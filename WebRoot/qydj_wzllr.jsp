<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>工商登记联络员</title>
</head>

<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<%@include file="top.inc"%>
<%
  	String OPENO = Page.getOPENO();
  	String SIGN = Page.getSIGN();
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	
	String divflag="block";
	if(SIGN.equals("1")){//已开业的企业
		divflag="none";
 	}
 %>
<form name="form1" method="POST" action='web/qydj_wzllr_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="SIGN" value=0>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" name="action"  value="1">
<input type="hidden" name="nextPage" value="<%=Page.getNextPage()[0] %>">
<table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-bottom-width:0;">
  <tr>
    <td class="yxsm" align="center">
      <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>工商登记联络员</font>           
      </p>
    </td>
  </tr>
</table>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr> 
	<td class="lc1">姓名</td>   
	<td class="lc2"><input type="text" name="NAME" title="姓名" maxlength=15 disblank>&nbsp;<font color="red">*</font></td>   
  
	<td class="lc1">部门</td>   
	<td class="lc2"><input type="text" name="DEPARTMENT" title="部门" maxlength=50 disblank>&nbsp;<font color="red">*</font></td>  
</tr>

<tr> 
	<td class="lc1" >固定电话</td>   
	<td class="lc2" ><input type="text" name="TEL" title="联系电话" maxlength=30 datatype="TEL" disblank>&nbsp;<font color="red">*</font></td>   
  
	<td class="lc1" >移动电话</td>   
	<td class="lc2" ><input type="text" name="MOBTEL" title="移动电话" maxlength=11 datatype="TEL" disblank>&nbsp;<font color="red">*</font></td>  
</tr>
<tr>  
	<td class="lc1" >电子邮箱</td>   
	<td class="lc2" ><input type="text" name="EMAIL" title="电子邮箱" maxlength=100 datatype="EMAIL" disblank>&nbsp;<font color="red">*</font></td> 
	
	<td class="lc1">邮政编码</td>
	<td class="lc2"><input type="text" name="POSTALCODE" size="25"  maxlength=6 title="邮政编码" disblank>&nbsp;<font color="red">*</font></td>
</tr>
<tr>
    <td class="lc1" >联系地址</td>   
	<td class="lc2" colspan=3><input type="text" name="ADDR" style="width:360px" title="地址" maxlength=50 disblank>&nbsp;<font color="red">*</font></td>   
</tr>
<tr>
	<td class="lc2" colspan="4">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
    说明：有红色*标示的项目为必填项。
	<br>
	</p></td>   
 </tr>
</table>

 <br>
<div id="baocun" style="display:<%=divflag %> ">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
			<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一页</div>
		</td>
	</tr>
</table>
</div>
</form>
<iframe height="0" width="100" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0"></iframe>
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
	QYDJ_WZLLR.setOPENO(OPENO);
	vf.setData(QYDJ_WZLLR.getData());
 	out.print(vf.ValueDefaultScript());
%>
 
