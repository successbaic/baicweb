<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Types" %>
<%@ page import="com.macrosoft.icms.ems.*"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<%
String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
WEB_USER_EXPRESS mes = new WEB_USER_EXPRESS();
mes.setOPENO(OPENO);
mes.doSelect();
String method="insert";
if(null==mes.getTEL()||"".equals(mes.getTEL())){
	
}else{
	method="update";
}
QYDJ_YWSB.setOPENO(OPENO);
QYDJ_YWSB.doSelect();
%>
<html>
<head>
<title>添加联系人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<LINK href="images/icms.css" type="text/css" rel="stylesheet">
<style>
  body,html{font-size:12px;background-color: #EEFBF7; }
  table{font-size:12px;width:100%;border:1px;border-color: #33829F;}
  td{background-color: #DAE9F3;}
  td.lc1{background-color: #DAE9F3;text-align: right;width:40%;}
  p{text-indent:2em;line-height:1.5em;margin-top:20px;padding:5px;}
  form{padding:5px;}
  
  input.saveButton{width:30%;}
  td.lc2{width:60%;}
</style>
<script type="text/javascript">
function doSub(){
	var name=document.form1.NAME.value;
	var tel=document.form1.TEL.value;
	var add=document.form1.ADDRESS.value;
	if(name==""){
		alert("请录入联系人姓名！");
		return ;
	}
	if(tel==""){
		alert("请录入联系人电话！");
		return ;
	}
	if(add==""){
		alert("请录入联系人地址！");
		return ;
	}
	document.form1.submit();	
}
</script>
</head>
<body>
   <p >您现在可以选择通过快递的方式将申请材料送达工商机关，业务办理完成后会将材料通过快递的方式寄送(到付)你处：</p>
   <form name="form1" action='addEmsMessAction.jsp' target="editframe">
   <input type='hidden' name='OPENO' value='<%=OPENO %>'/>
   <input type='hidden' name='method' value='<%=method %>'/>
   <input type='hidden' name='ENTCLASS' value='<%=QYDJ_YWSB.getENTCLASS() %>'/>
   <input type='hidden' name='CDDL' value='<%=QYDJ_YWSB.getCDDL() %>'/>
   <input type='hidden' name='REGNO' value='<%=QYDJ_YWSB.getREGNO() %>'/>
   <input type='hidden' name='LOGINID' value='<%=webuser.getLOGINID() %>'/>
   <input type='hidden' name='CZSJ' value='<%=webuser.getCurrentDate() %>'/>
   <table width="100%" border="1">
   <caption>业务信息</caption>
    <tr><td class='lc1' >名称</td>
       	<td class='lc2'><input name='ENTNAME2' value='<%=QYDJ_YWSB.getENTNAME() %>' disabled/>
       	<input type="hidden" name='ENTNAME' value='<%=QYDJ_YWSB.getENTNAME() %>'/>
       	</td></tr>
    <tr><td class='lc1' >业务类型</td>
       	<td class='lc2'>
       	<input type="text" value='<%=icms.getSysDm("OPETYPE",QYDJ_YWSB.getOPETYPE()) %>' disabled/>
       	<input type="hidden" name='OPETYPE' value='<%=QYDJ_YWSB.getOPETYPE() %>'/>
		</td></tr>   	
	  <tr><td class='lc1' >登记机关</td>
       	<td class='lc2'>
       	<input type="text" value='<%=icms.getSysDm("REGORG",QYDJ_YWSB.getREGORG()) %>' disabled/>
       	<input type="hidden" name='REGORG' value='<%=QYDJ_YWSB.getREGORG() %>'/>
		</td></tr>	
   </table>
      <table cellpadding="5" cellspacing="1">      
      <caption>快递信息</caption>
       <tr><td class='lc1' >联系人姓名</td>
       	<td class='lc2'><input name='NAME' value='<%=mes.getNAME() %>'/> &nbsp;<font color="red">*</font></td>
       </tr>
       <tr><td class='lc1'>联系人电话</td>
       	<td class='lc2'><input name='TEL'   value='<%=mes.getTEL()%>' /> &nbsp;<font color="red">*</font></td>
       </tr>
       <tr>
       	<td  class='lc1'>联系人地址</td><td >
       	<textarea class="lc2" name='ADDRESS' rows="3" cols="30"><%=mes.getTEL()%></textarea> &nbsp;<font color="red">*</font></td>
       </tr>
       <tr>
       	<td colspan='2' align="center">
       		<font color="red">* 请正确填写以上信息，以免耽误您的业务办理。</font>
       	</td>
       </tr>
       <tr><td colspan='2' align="center">
       <input class='saveButton' type = 'button' onclick="doSub()"  value='完成'/> </td>
       </tr>
      </table>
   </form>
   <iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
   
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
	out.print(vf.ValueDefaultScript());
%>