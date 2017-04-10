<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>工商登记联络员</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<SCRIPT type="text/javascript">
	function checkSFZH()
	{		
		var ret=true;
		if (document.form1.CERTYPE.value=="10")	// 身份证
		{
			ret=validatezjhm(document.form1.CERNO.value);
			if(ret){
			
			}else{
				//document.form1.btSave.disabled=false;
			}
		}
		return ret;
	}
	function checkDH(){
		var tel = $.trim($("#TEL").val());
		var mobtel = $.trim($("#MOBTEL").val());
		if(tel=="" && mobtel==""){
			alert("移动电话和固定电话必须至少填写一个！");
			return false;
		}
		return true;
	}
</SCRIPT>
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
<form name="form1" method="POST" action='web/qydj_llyxx_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="SIGN" value=0>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" name="action"  value="1">
<input type="hidden" name="nextPage" value="<%=Page.getNextPage()[0] %>">
<table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-bottom-width:0;">
  <tr>
    <td class="yxsm" align="center">
      <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>联络员信息</font>           
      </p>
    </td>
  </tr>
</table>



<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >姓名</td>   
	<td class="lc2" ><input type="text" name="NAME" maxlength=25 disblank title="姓名">&nbsp;<font color=red>*</font>	</td> 
	<td class="lc1" >固定电话</td>   
	<td class="lc2" colspan="3"><input type="text" name="TEL" id="TEL" datatype="TEL" title="固定电话" maxlength=20></td>
   </tr>
   
    <tr> 
	<td class="lc1" >移动电话</td>   
	<td class="lc2" ><input type="text" name="MOBTEL" id="MOBTEL" datatype="TEL" title="移动电话"  maxlength=20></td> 
	<td class="lc1" >电子邮箱</td>   
	<td class="lc2" colspan="3"><input type="text" name="EMAIL" datatype="EMAIL" title="电子邮箱" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>
   <tr> 
    <td class="lc1" >证件类型</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="证件类型" disblank>
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>   
	<td class="lc1" >证件号码</td>   
	<td class="lc2" colspan="3"><input type="text" name="CERNO" disblank title="证件号码" maxlength=20 size="30">&nbsp;<font color=red>*</font></td> 
   </tr> 

<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">
    说明：有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	</p></td>   
 </tr>
</table>

 <br>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
			<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
				<br/>
				数据查询中，请等待...<br/>&nbsp;
			</div>
			<%
			if(SIGN.equals("1")){
			%>
			<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
			<%
			}else{
			%>
			<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">下一页</div>
			<%
			}
			%>
		</td>
	</tr>
</table>
</form>
<iframe height="0" width="100" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0"></iframe>
<%@include file="bottom.inc"%>
</body>
</html>      

<%  		
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("checkDH()");
	ec.FormErrorCheck();
	ec.setUserFunction("checkSFZH()");
	out.print(ec.ErrorCheckScript());

	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	QYDJ_WZLLR.setOPENO(OPENO);
	vf.setData(QYDJ_WZLLR.getData());
 	out.print(vf.ValueDefaultScript());
%>
 
