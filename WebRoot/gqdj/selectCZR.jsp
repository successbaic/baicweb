<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="GSGSJIN_BASIS02" scope="page"  class="com.macrosoft.icms.gsnw.GSGSJIN_BASIS02"/>
<jsp:useBean id="Par" scope="page" class="com.macrosoft.icms.system.SysParameter"/>
<html>
<head>
<title>��ȡ��ҵ������Ϣ</title>
</head>
<body>
<form name="form1" method="post" action="selectCZR.jsp">
<table border="1" width="98%" cellpadding="0" cellspacing="0" align="center">
<caption>��ȡ��ҵ������Ϣ</caption> 
<tr>
	<input name="mode" type="hidden">
	<td class=lc1>ע���</td>
	<td class=lc2><input size="12" name="REGNO" type="text" title="ע���"  maxlength=15></td>
	<td class=lc1>��ҵ����</td>
	<td class=lc2><input size="20" name="ENTNAME" type="text" title="��׼������" maxlength=50></td>
	<td class=lc1><input type="button" value="�� ѯ" name="query1" onclick="doSubmit()">
	<INPUT TYPE="reset" value="�� ��" >
	</td>
</tr>
</table>
<br>
<table border="1" width="98%" cellpadding="0" cellspacing="0" align="center">
<tr class='tc'>
	<!--td>���ƺ�׼��</td-->
	<td>ע���</td>
	<td>��ҵ����</td>
	<td>����������</td>
	<td>ѡ��</td>
</tr>	
 <%
	if (request.getParameter("mode")!=null)
	{
		String sql=" WHERE FIELD002 IN('020101','020201','020301') AND FIELD006 IN ('1','4')";		
		String REGNO=GSGSJIN_BASIS02.convertCode(GSGSJIN_BASIS02.doPreProcess(request.getParameter("REGNO")).trim());
		if(!REGNO.equals(""))
		{
			sql+="  AND trim(FIELD004)='"+REGNO+"'";
		}
		String ENTNAME=GSGSJIN_BASIS02.convertCode(GSGSJIN_BASIS02.doPreProcess(request.getParameter("ENTNAME")).trim());
		if(!ENTNAME.equals(""))
		{
			sql+="  AND trim(FIELD009)='"+ENTNAME+"'";
		}	
		ArrayList al=GSGSJIN_BASIS02.getList(sql,request.getParameter("start"));	
		Iterator It=al.iterator();
		while (It.hasNext())
		{
			com.macrosoft.icms.gsnw.GSGSJIN_BASIS02 tb=(com.macrosoft.icms.gsnw.GSGSJIN_BASIS02)It.next();
%>  
		<tr class='lc1'>
			<td><%=tb.getFIELD004()%></td>
			<td><%=tb.getFIELD009()%></td>
			<td><%=tb.getFIELD019()%></td>
			<td><input type="button" name="btnsel" value="ѡ ��" onclick="getxx('<%=tb.getFIELD004()%>','<%=tb.getFIELD009()%>')"></td>
		</tr>	
<%
		}
		SysPageShow sp=new SysPageShow(request,GSGSJIN_BASIS02.getListCount(sql));
		out.print(sp.PageNav());
	}
%>
</table>
</form> 
<script language=javascript>
function doSubmit()
{
	var regno=document.getElementById("REGNO").value;
	var entname=document.getElementById("ENTNAME").value;
	if(regno==""){
		alert("����дע��ţ�");
		return ;
	   }
	   if(entname==""){
		alert("����д��ҵ���ƣ�");
		return ;
	   }
	form1.submit();
}
function getxx(regno,entname)
{
	if (regno!=''&&entname!='')
	{
		window.parent.document.form1.IMPMORBLICNO.value=regno;
		window.parent.document.form1.IMPMOR.value=entname;
		window.parent.document.getElementById('editDiv').style.display='none'
	}	
	else
	{
		//alert("����ѡ�����ݣ�");
	}
}
</script>
</body>      
</html>      
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");	
	vf.setData(request);
	out.print(vf.ValueDefaultScript());
%>
