<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GGGL_JYDW_JYQK" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYQK"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<html>
<head>
<title>��Ӫ�������</title>
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
<CAPTION>��澭Ӫ�������</CAPTION>
   <tr> 
    <td class="lc1" >���Ӫҵ����</td>   
	<td class="lc2" ><input type="text" name="ADOPEINC" disblank title="���Ӫҵ����" maxlength=18 datetype=NUM>��Ԫ&nbsp;<font color=red>*</font></td>
	    
    <td class="lc1" >���������������</td>   
	<td class="lc2" ><input type="text" name="FORBUSIADINC" disblank title="���������������" maxlength=18 datetype=NUM>��Ԫ&nbsp;<font color=red>*</font></td>	
   </tr>
   <tr>
    <td class="lc1" >��˰��</td>   
	<td class="lc2" ><input type="text" name="RATAL" disblank title="��˰��" maxlength=18 datetype=NUM>��Ԫ&nbsp;<font color=red>*</font></td>
   
    <td class="lc1" >˰������</td>   
	<td class="lc2" ><input type="text" name="NETINC" disblank title="˰������" maxlength=18 datetype=NUM>��Ԫ&nbsp;<font color=red>*</font></td>
   </tr>
   <tr>
    <td class="lc1" >�����</td>   
	<td class="lc2" colspan=3><input type="text" name="DEFICIT" disblank title="�����" maxlength=18 datetype=NUM>��Ԫ&nbsp;<font color=red>*</font></td>
   </tr>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
    1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
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
		<input name="btSave" type="submit" value="��  ��" class="butontType"></td>
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