<%@page import="java.util.*"%>
<%@page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="MCGL_TZRXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_TZRXX_ZS"/>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<html>
<head>
<title>Ͷ������Ϣ</title>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<style type="text/css">
#yxsm {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
   font-size:10pt;
   font-family: ����;
   color:#000080; 
}
</style>
</head>
<body style="margin:0">
<%	
    String NAMEID=SysUtility.doPreProcess(request.getParameter("NAMEID"));
	String ENTCLASS=SysUtility.doPreProcess(request.getParameter("ENTCLASS"));
	int colNum=5;
%>
<form name="form1">
<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
  <tr>
  <%
  if(ENTCLASS.equals("8")){
  %>
    <td class="yxsm" align="center">Ͷ��������������</td>
    <td class="yxsm" align='center'>����</td>	     
    <td class="yxsm"><p align="center">Ͷ�ʶ�</td>
    <td class="yxsm" align="center">Ͷ�ʱ���</td>
    <td class="yxsm" align="center">֤������</td>
	<td class="yxsm" align="center">֤�պ���</td>
  <%
  }else{
  %>
    <td class="yxsm" align="center">Ͷ��������������</td>
    <td class="yxsm" align="center">Ͷ��������</td>
	<td class="yxsm" align="center">֤������</td>
	<td class="yxsm" align="center">֤�պ���</td>
<%} %>    

  </tr>
<%
        String sql=" WHERE NAMEID = '"+NAMEID+"'";		
	 	
 	 	ArrayList al=MCGL_TZRXX_ZS.getList(sql,request.getParameter("start")); //����ҵ���Ų�ѯ����ҵ���Ͷ�����ļ���Ϣ
		Iterator It=al.iterator();
		int j=0;
		while (It.hasNext()) 		
		{
			j=j+1;
			com.macrosoft.icms.gsnw.MCGL_TZRXX_ZS tb=(com.macrosoft.icms.gsnw.MCGL_TZRXX_ZS)It.next();
%>
 <tr align='center'>
	<%
if(ENTCLASS.equals("8")){
%>
<td><%=tb.getINV() %></td>
<td><%=icms.getSysDm("COUNTRY",tb.getCOUNTRY())%></td>
<td><%=tb.getSUBCONAM() %></td>
<td><%=tb.getCONPROP() %>%</td>
<td align="center"><%=icms.getSysDm("CERTYPE",tb.getCERTYPE())+icms.getSysDm("BLICTYPE",tb.getBLICTYPE())%></td>
<td align="center"><%=tb.getCERNO()+tb.getBLICNO()%></td>
<%
}else{
%>
<td><%=tb.getINV() %></td>
<td align="center">
<%
if(ENTCLASS.equals("6")){
	out.println(icms.getSysDm("MEMTYPE",tb.getINVTYPE()));	
}else{
	out.println(icms.getSysDm("INVTYPE",tb.getINVTYPE()));
}
%>
</td><!-- //Ͷ�������� -->
	<td align="center"><%=icms.getSysDm("CERTYPE",tb.getCERTYPE())+icms.getSysDm("BLICTYPE",tb.getBLICTYPE())%></td>
	<td align="center"><%=tb.getCERNO()+tb.getBLICNO()%></td>	
<%
}%>
  </tr>
<%}%>
<tr><td colspan="<%=colNum%>">
<%
		SysPageShow sp=new SysPageShow(request,MCGL_TZRXX_ZS.getListCount(sql));
		out.print(sp.PageNav());	
%>
</td></tr>

</TABLE>
</form>
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