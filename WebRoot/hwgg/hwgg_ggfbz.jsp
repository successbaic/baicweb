<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="HWGG_JBXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_JBXX_SQ"/>
<jsp:useBean id="HWGG_FBZXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_FBZXX_SQ"/>
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
<form name="form1" action="action/hwgg_ggfbz_action.jsp" method="post" target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<table border="1" cellpadding="0" cellspacing="0" width="100%">
<caption align="left" >户外广告发布单位信息</caption>
<!--<tr> 
    <td  class="lc1" >广告登记证号</td>
    <td  class="lc2" colspan="5">
    <input type="text" name="ADREGCNO" title="广告登记证号" size="40" maxlength=50   disabled ></td>
  </tr>-->
  <tr>
    <td  class="lc1">广告发布单位名称</td>
    <td  class="lc2"    >
    <input type="text" name="ADISSENT" title="广告发布单位名称" size="40" maxlength=50 disblank ><font color="red"> *</font></td>
    <td  class="lc1"   >广告发布单位类型</td>
    <td  class="lc2" colspan="3">
	<select size="1" name="ADISSENTTYPE" style='width:220'  title="广告发布单位类型" disblank>
	  <option  value=''>请选择广告发布单位类型</option>
		<%=icms.getSysDmList("ENTTYPE")%>		
	</select><font color="red"> *</font></td>
  </tr>
  <tr>
   <td  class="lc1">法定代表人</td>
   <td  class="lc2" >
   <input type="text" name="LEREP" size="20" title="法定代表人" maxlength=25 disblank><font color="red"> *</font></td>   
  <td  class="lc1">证照编号</td>
   <td  class="lc2" colspan="3">
   <input type="text" name="BLICNO" size="20" title="证照编号" maxlength=20 disblank><font color="red"> *</font></td>
  </tr>
  
 <tr>
<td  class="lc1">地址</td>
   <td  class="lc2" >
   <input type="text" name="ADDR" size="40" title="地址" maxlength=50 disblank><font color="red"> *</font></td>
   <td  class="lc1">邮政编码</td>
   <td  class="lc2" colspan="3">
   <input type="text" name="POSTALCODE" size="15" title="邮政编码"  maxlength=6  datatype="NUM" disblank><font color="red"> *</font></td>
</tr>
<tr>  
   <td  class="lc1">联系人</td>
   <td  class="lc2" >
       <input type="text" name="LINKMAN" size="15" title="联系人" maxlength=15 disblank><font color="red"> *</font></td>
   <td  class="lc1" >联系电话</td>
   <td  class="lc2" colspan="3">
       <input type="text" name="TEL" size="15" title="联系电话" maxlength=30 datatype="TEL" disblank><font color="red"> *</font></td>
</tr>
</table>  
<br>

<center>
<%if(SIGN.equals("0")){%>
 	<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一步</div>
<%}else{
%>
	 <div class="subImgs" onclick="window.location.href='hwgg_ggzxx.jsp'">下一步</div>
<%
}%>
</center>  
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
	HWGG_FBZXX.setOPENO(OPENO);
	vf.setData(HWGG_FBZXX.getData());
	out.print(vf.ValueDefaultScript());
%>