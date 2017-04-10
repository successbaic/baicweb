<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="HWGG_GGZXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_GGZXX_SQ"/>
<html>
<head>
<title>基本情况</title>
<script language='javascript'>
</script>
</head>
<body>
<%@include file="/top.inc"%>
<%
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);

String SIGN = Page.getSIGN();	//-1数据未保存,1已开业
String OPENO =Page.getOPENO();
String OPETYPE =Page.getOPETYPE();

%>
<br/>
<form name="form1" action="action/hwgg_ggzxx_action.jsp" method="post" target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<table border="1" cellpadding="0" cellspacing="0" width="100%">
<caption align="left" >户外广告广告主基本信息</caption>
<!--<tr> 
    <td  class="lc1" >广告登记证号</td>
    <td  class="lc2" colspan="5">
    <input type="text" name="ADREGCNO" title="广告登记证号" size="40" maxlength=50  disabled ></td>
  </tr>-->
  <tr>
    <td  class="lc1">广告主</td>
    <td  class="lc2"    >
    <input type="text" name="ADHOST" title="广告主" size="40" maxlength=50 disblank ><font color="red"> *</font></td>
    <td  class="lc1"   >广告主类型</td>
    <td  class="lc2" >
	<select size="1" name="ADHOSTTYPE" style='width:200' disblank title="广告主类型">
	<option  value=''>请选择广告主类型</option>
		<%=icms.getSysDmList("ENTTYPE")%>		
		    </select><font color="red"> *</font></td>
  </tr>
  <tr>
   <td  class="lc1">广告样件编号</td>
   <td  class="lc2" >
   <input type="text" name="ADCNO" size="20" title="广告样件编号" maxlength=25 disblank><font color="red"> *</font></td>
   
  <td  class="lc1">地址</td>
   <td  class="lc2" >
   <input type="text" name="ADDR" size="40" title="地址" maxlength=50 disblank><font color="red"> *</font></td>
  </tr>
  <tr>
   <td  class="lc1">法定代表人</td>
   <td  class="lc2" >
   <input type="text" name="LEREP" size="20" title="法定代表人" maxlength=25 disblank><font color="red"> *</font></td>
   
  <td  class="lc1">联系电话</td>
   <td  class="lc2" >
   <input type="text" name="TEL" size="40" title="联系电话" maxlength=50 disblank><font color="red"> *</font></td>
  </tr>
<tr>
     <td  class="lc1" >证照号码</td>
     <td  class="lc2"  colspan="3">
    <input type="text" name="BLICNO" size="40" title="证照号码" disblank maxlength=20><font color="red"> *</font></td>
</tr>
</table>  
<br>
<CENTER>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一页</div>
<%
}
%>
</CENTER>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<%@include file="/bottom.inc"%>
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
	HWGG_GGZXX.setOPENO(OPENO);
	vf.setData(HWGG_GGZXX.getData());
	out.print(vf.ValueDefaultScript());
%>