<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>���̵Ǽ�����Ա</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<SCRIPT type="text/javascript">
	function checkSFZH()
	{		
		var ret=true;
		if (document.form1.CERTYPE.value=="10")	// ���֤
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
			alert("�ƶ��绰�͹̶��绰����������дһ����");
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
	if(SIGN.equals("1")){//�ѿ�ҵ����ҵ
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
      <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>����Ա��Ϣ</font>           
      </p>
    </td>
  </tr>
</table>



<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >����</td>   
	<td class="lc2" ><input type="text" name="NAME" maxlength=25 disblank title="����">&nbsp;<font color=red>*</font>	</td> 
	<td class="lc1" >�̶��绰</td>   
	<td class="lc2" colspan="3"><input type="text" name="TEL" id="TEL" datatype="TEL" title="�̶��绰" maxlength=20></td>
   </tr>
   
    <tr> 
	<td class="lc1" >�ƶ��绰</td>   
	<td class="lc2" ><input type="text" name="MOBTEL" id="MOBTEL" datatype="TEL" title="�ƶ��绰"  maxlength=20></td> 
	<td class="lc1" >��������</td>   
	<td class="lc2" colspan="3"><input type="text" name="EMAIL" datatype="EMAIL" title="��������" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>
   <tr> 
    <td class="lc1" >֤������</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="֤������" disblank>
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>   
	<td class="lc1" >֤������</td>   
	<td class="lc2" colspan="3"><input type="text" name="CERNO" disblank title="֤������" maxlength=20 size="30">&nbsp;<font color=red>*</font></td> 
   </tr> 

<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">
    ˵�����к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
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
				���ݲ�ѯ�У���ȴ�...<br/>&nbsp;
			</div>
			<%
			if(SIGN.equals("1")){
			%>
			<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">��һҳ</div>
			<%
			}else{
			%>
			<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">��һҳ</div>
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
 
