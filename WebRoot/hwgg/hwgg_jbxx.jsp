<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="HWGG_JBXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_JBXX_SQ"/>
<html>
<head>
<title>�������</title>
<script language='javascript'>
</script>
</head>
<body>
<%@include file="/top.inc"%>
<%
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);

String SIGN = Page.getSIGN();	//-1����δ����,1�ѿ�ҵ
String OPENO =Page.getOPENO();
String OPETYPE =Page.getOPETYPE();

%>
<br/>
<form name="form1" action="action/hwgg_jbxx_action.jsp" method="post" target="editframe">
<input type="hidden" name="STATUS" >
<input type="hidden" name="APPDATE" value="<%=webuser.getCurrentDate()%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
<input type="hidden" name="OPETYPE" value=<%=OPETYPE%>>
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="ADREGCNO">
<table border="1" cellpadding="0" cellspacing="0" width="100%">
<caption align="left" >�����������Ϣ</caption>
  <tr>
    <td  class="lc1">�������</td>
    <td  class="lc2"    >
    <input type="text" name="ADNAME" title="�������" size="40" maxlength=50 disblank ><font color="red"> *</font></td>
    
    <td   class="lc1"align="right"  >�����</td>
    <td  class="lc2" >
    <input type="text" name="ADSPF" title="�����" size="20" maxlength=50 disblank><font color="red"> *</font></td>
  </tr>
  <tr>
   <td  class="lc1">�����ص�</td>
   <td  class="lc2" >
   <input type="text" name="ADISSSPOT" size="40" title="��淢���ص�" disblank  maxlength=50><font color="red"> *</font></td>
     <td class="lc1" >����������</td>
    <td class="lc2">
    <INPUT TYPE="text" NAME="ADISSFROM" size=12 disblank  onClick="dropdowndate(this)"  datatype="DATE" title="����������"><font color="red"> *</font> 
    �� <INPUT TYPE="text" NAME="ADISSTO"  size=12 disblank  onClick="dropdowndate(this)"  datatype="DATE" title="����������"><font color="red"> *</font></td>
  </tr>
  
  <tr >
  <td  class="lc1"   >�����ʽ</td>
    <td  class="lc2">
	<select name="ADFORM" title="��淢����ʽ" disblank>
	<OPTION value=""></OPTION>
	<OPTION value="01">չʾ��</OPTION>
	<OPTION value="02">������ʾװ��</OPTION>
	<OPTION value="03">����</OPTION>
	<OPTION value="04">�޺��</OPTION>
	<OPTION value="05">��ͨ����</OPTION>
	<OPTION value="06">ˮ��Ư����</OPTION>
	<OPTION value="07">��������</OPTION>
	<OPTION value="08">������</OPTION>
	<OPTION value="09">ģ��</OPTION>
	<OPTION value="10">ǽ����</OPTION>
	<OPTION value="11">����</OPTION>
	<OPTION value="99">����</OPTION>
	</select><font color="red"> *</font>
	</td>
	<td class="lc1" >���</td>
    <td class="lc2">
    <select name="ADCLASS" title="������" disblank>
	<OPTION value=""></OPTION>
	<OPTION value="01">���������  </OPTION>
	<OPTION value="02">��Ӫ�Ի����� </OPTION>	
	</select><font color="red"> *</font>
    </td>
  </tr>
 
   <%--tr>
   <td  class="lc1">�������</td>
   <td  class="lc2" colspan="5">
   <textarea rows="2" name="ADCONTENT" cols="60" title="�������"  maxlength=500></textarea></td>
  </tr--%>

 <tr>
 
 <td  class="lc1">�������</td>
    <td  class="lc2" >
    <input type="text" name="ADQUAN" size="5" title="�������" maxlength=8 disblank  datatype="NUM"><font color="red"> *</font></td>
    
  <td class="lc1" align="right">�Ǽǻ���</td>
    <td class="lc2">
	<select size="1" name="REGORG" style='width:220' title="�Ǽǻ���" disblank>
	<option value=''></option> 
	<%
		  out.print(icms.getSysDmList("REGORG"));
	%>
		</select><font color="red"> *</font></td>
</tr>		
 <tr>
   <td  class="lc1">�������Ŀ¼</td>
   <td  class="lc2"  colspan="3">
   <textarea rows="3" name="ADSTUFF" cols="60"title="�������Ŀ¼" maxlength=200 disblank></textarea><font color="red"> *</font>
   </td>
   </tr>
</table>
<br>
<center>
<%if(SIGN.equals("0")){%>
 	<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">��һ��</div>
<%}else{
%>
	 <div class="subImgs" onclick="window.location.href='hwgg_ggfbz.jsp'">��һ��</div>
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
	if ("".equals(OPENO)||OPENO==null||"null".equals(OPENO)){

	}else{
		HWGG_JBXX.setOPENO(OPENO);
	   vf.setData(HWGG_JBXX.getData());
	}
	out.print(vf.ValueDefaultScript());
%>