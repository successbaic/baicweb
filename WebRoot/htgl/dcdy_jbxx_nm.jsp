<%@page import="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"%>
<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="DCDY_JBXX" scope="page"  class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ"/>
<html>
<head>
<title>�������</title>
</head>

<body>
<%@include file="/top.inc"%>
<%
String pageheader=Page.pageheader(request.getRequestURI());

out.println(pageheader);
String SIGN = Page.getSIGN();	//-1����δ����,1�ѿ�ҵ
String OPENO =Page.getOPENO();
String OPETYPE =Page.getOPETYPE();
//System.out.println("SIGN="+SIGN+",OPENO="+OPENO+",OPETYPE="+OPETYPE);
%>
<br/>
<form name="form1" action="action/dcdy_jbxx_nm_action.jsp" method="post" target="editframe">
<input type="hidden" name="MORTGAGOTYPE">
<input type="hidden" name="STATUS">
<input type="hidden" name="APPDATE" value="<%=webuser.getCurrentDate()%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
<input type="hidden" name="OPETYPE" value="20">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<table border="1" width="100%" >
<caption>��Ѻ����Ϣ</caption>
<tr>      
	<td class="lc1">��Ѻ�����</td>
	<td class="lc2" colspan="6">
	    <input type="radio" value="0" name="MORTGAGOTYPE" disabled="disabled"> ��ҵ&nbsp;		
		<input type="radio" value="1" name="MORTGAGOTYPE" disabled="disabled"> ���幤�̻�&nbsp;
		<input type="radio" value="2" name="MORTGAGOTYPE" checked> ũҵ������Ӫ��
	</td>
</tr>

<tr>
	<td class="lc1"  >��ҵ����</td>
	<td class="lc2" colspan="1"   >
	<input id="entname" type="text" name="MORTGAGO" size="30"  title="��ҵ����" ></td>
	 
	<td class="lc1" >ͳһ������ô���/ע���</td>
	<td class="lc2"  colspan="4" >
	<input id="regno" type="text" name="REGORUN" size="30"  title="ͳһ������ô���/ע���" ></td>
</tr> 
<tr> 
	<td class="lc1" >��ҵ����</td> 
	<td class="lc2" >
	<select id ="enttype" size="1" name="ENTTYPE"   title="��ҵ����">
	<OPTION></OPTION>
			<%=icms.getSysDmList("ENTTYPE")%>
		</select></td> 
	<td class="lc1" >ס��</td> 
	<td class="lc2" colspan="4" >
	<input id="dom" type="text" name="MORTGAGOADDRESS" size="40"  title="ס��" ></td> 
</tr>
<tr> 
	<td class="lc1" >����֤������</td> 
	<td class="lc2" >
	<select id ="certype" size="1" name="MORTGAGOCERTYPE"   title="����֤������">
	<OPTION></OPTION>
			<%=icms.getSysDmList("CERTYPE")%>
		</select></td> 
	<td class="lc1" >֤�պ���</td> 
	<td class="lc2"  colspan="4" >
	<input id="cerno" type="text" name="MORTGAGORPERNO" size="20"  title="֤�պ���" ></td> 
</tr>
<tr>      
	<td class="lc1" >��������(����)</td>      
	<td class="lc2" colspan="6"  >
	<input id="name" type="text" name="MORTGAGOAGENT" size="40"  title="�������ƣ�������" ></td>
</tr>
<%--tr> 
	<td class="lc1" >������֤������</td>
	<td class="lc2">
	<select size="1" name="DYRDLZZLX"   title="��Ѻ�˴�����֤������">
			<%=icms.getSysDmList("CERTYPE")%>
		</select></td>
	<td class="lc1" >������֤�պ���</td>
	<td class="lc2" colspan="4" >
	<input type="text" name="DYRDLZZHM" size="20"  title="��Ѻ�˴�����֤�պ���" ></td>
</tr--%>  
</table>
<table border="1" width="100%" >
<caption>��ѺȨ����Ϣ</caption>
<tr>
	<td class='lc1'>��ѺȨ������(����)</td>
	<td class='lc2' colspan="6">
	<input type="text" name="MORE" size="67"  title="��ѺȨ�����ƣ�������" ></td>  
	
</tr>
<tr>      
	<td class="lc1" >��ѺȨ��֤������</td>   
	<td class="lc2" >
	<select size="1" name="MORECERTYPE"   title="��ѺȨ��֤������"><OPTION></OPTION>
			<%=icms.getSysDmList("CERTYPE")%>
		</select></td>
	<td class="lc1" >��ѺȨ��֤�պ���</td>
	<td class="lc2"  colspan="4" >
	<input type="text" name="MOREPERNO" size="20"  title="��ѺȨ��֤�պ���" ></td>
</tr>     
<tr>      
	<td class="lc1" >��ѺȨ�˴���������(����)</td>   
	<td class="lc2"  colspan="6">
	<input type="text" name="MOREAGENT" size="60"  title="��ѺȨ�˴��������ƣ�������" ></td>
</tr>
<%--tr>
	<td class="lc1" >������֤������</td>
	<td class="lc2">
	<select size="1" name="DYQRDLZZLX"   title="��ѺȨ�˴�����֤������">
			<%=icms.getSysDmList("HTCERTYPE")%>
		</select></td>
	<td class="lc1" >������֤�պ���</td>
	<td class="lc2" colspan="4">
	<input type="text" name="DYQRDLZZHM" size="20"  title="��ѺȨ�˴�����֤�պ���" ></td>
</tr--%>      

</table>
<table border="1" width="100%" >
<caption>������ծȨ��Ϣ</caption>
<tr>      
	<td class="lc1"  >����������ծȨ����</td>      
	<td class="lc2"  >
	<select size="1" name="MAINCONTTYPE"   title="������������ͬ����" disblank>
			<option value=''>��ѡ��</option><option value='1'>����</option><option value='2'>���</option><option value='3'>����</option>
		</select></td>
	<td class="lc1" >��ծȨ����</td>
	<td class="lc2" >
	<input type="text" name="MAINCONTAM" size="10"  title="������������ͬ���" datatype=NUM disblank>��Ԫ</td>
</tr> 

<tr>
	<td class="lc1" >����������</td>
	<td class="lc2" colspan="3"   >
	<input type="text" name="PEFPERFROM"  datatype=date  size="10" title="����������" onclick="dropdowndate(this);">&nbsp;&nbsp; 
	��<input type="text" name="PEFPERTO"  datatype=date  size="10" title="����������" onclick="dropdowndate(this);"></td>  

</tr>
<tr>      
	<td class="lc1"  >������Χ</td>      
	<td class="lc2" colspan="3" >
	<textarea rows="5" name="PRICRE" cols="70"></textarea></td>     
</tr>
<%--tr>      
	<td class="lc1"  >��ͬ������Լ��</td>      
	<td class="lc2" colspan="3" >
	<input type="text" name="CONTOTHSTI" size="70"  title="��ͬ������Լ��" ></td>      
</tr--%>
<tr>      
	<td class="lc1"  >�Ǽǻ���</td>      
	<td class="lc2"  colspan="3">
	<select size="1" name="REGORG"  disblank title="�Ǽǻ���">
	<OPTION VALUE="">
	<%	
	     out.print(icms.getSysDmList("REGORG"));	  
	%>
	</select>
	</td>	
</tr>
<tr>      
	<td class="lc1"  >��ע</td>      
	<td class="lc2" colspan="3" >
	<textarea rows="5" name="REMARK" cols="70"></textarea></td>      
</tr>
</table>
<center>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">��һҳ</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">��һҳ</div>
<%
}
%>
</center>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<%@include file="/bottom.inc"%>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	//ec.setUserFunction("checkMORTGAGOTYPE()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	System.out.println("OPENO="+OPENO);
	if ("".equals(OPENO)||OPENO==null||"null".equals(OPENO)){

	}else{
	   DCDY_JBXX.setOPENO(OPENO);
	   vf.setData(DCDY_JBXX.getData());
	}	
	//vf.setUserFunction("showDylx()");
	out.print(vf.ValueDefaultScript());
%>