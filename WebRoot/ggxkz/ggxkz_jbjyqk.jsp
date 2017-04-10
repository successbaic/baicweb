<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GGGL_JYDW_JYQK" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYQK"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<html>
<head>
<title>经营基本情况</title>
<style type="text/css">
#yxsm {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
}
</style>
</head> 
<%
  	String ADBULICNO=Page.getpageKey();
	int INSYEAR=Page.getipageKey();
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();

  	String SIGN = Page.getpageKey1();
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
		
 %>
<body>
<form name="form1" method="POST" action='ggxkz_jbjyqk_action.jsp' target="editframe">
<input type="hidden" name="ADBULICNO" value=<%=ADBULICNO%>>
<input type="hidden" name="INSYEAR" value=<%=INSYEAR%>>
<br>
<table border="1" width="100%" cellpadding="0" cellspacing="0">
<CAPTION>广告经营基本情况</CAPTION>
   <tr> 
    <td class="lc1" >广告营业收入</td>   
	<td class="lc2" ><input type="text" name="ADOPEINC" disblank title="广告营业收入" maxlength=18 datetype=NUM>万元&nbsp;<font color=red>*</font></td>
	    
    <td class="lc1" >外商来华广告收入</td>   
	<td class="lc2" ><input type="text" name="FORBUSIADINC" disblank title="外商来华广告收入" maxlength=18 datetype=NUM>万元&nbsp;<font color=red>*</font></td>	
   </tr>
   <tr>
    <td class="lc1" >纳税额</td>   
	<td class="lc2" ><input type="text" name="RATAL" disblank title="纳税额" maxlength=18 datetype=NUM>万元&nbsp;<font color=red>*</font></td>
   
    <td class="lc1" >税后利润</td>   
	<td class="lc2" ><input type="text" name="NETINC" disblank title="税后利润" maxlength=18 datetype=NUM>万元&nbsp;<font color=red>*</font></td>
   </tr>
   <tr>
    <td class="lc1" >亏损额</td>   
	<td class="lc2" colspan=3><input type="text" name="DEFICIT" disblank title="亏损额" maxlength=18 datetype=NUM>万元&nbsp;<font color=red>*</font></td>
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
<%if(SIGN.equals("1")){

}else{%>
<table border="1" width="100%">
	<tr>
		<td align=center>
		<input name="btSave" type="submit" value="保  存" class="butontType"></td>
	</tr>
</table>
<%}%>
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
	GGGL_JYDW_JYQK.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JYQK.setINSYEAR(INSYEAR);
	vf.setData(GGGL_JYDW_JYQK.getData());
 	out.print(vf.ValueDefaultScript());
%>