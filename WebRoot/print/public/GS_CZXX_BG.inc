<table align="center" border="1" width="80%" bordercolor='#000000'>
	<caption><p align="center"><b>
		<span style="font-size: 16pt">��˾�ɶ�(������)������Ϣ</b><br><br>
	</caption>	
<tr>    
	<td align='center' width='15%' rowspan="16" nowrap="nowrap" style="font-size:14px;">�ɶ�<br>(������)</td>
	<td align="center" width='30%' height="30" style="font-size:14px;">���ƻ�����</td>
	<td align="center" width='30%' height="30" style="font-size:14px;">֤�պ���</td>
	<td align="center" width='25%' style="font-size:14px;">��ע</td>
</tr>

	<%
	int czxxNo=0;
	 ArrayList addCzxx=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
	 for (int i=0;i<addCzxx.size();i++){
	 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)addCzxx.get(i);
	 String invtype=bTable.getINVTYPE();
	  czxxNo=czxxNo+1;
	  
	  String cerno="";
					if(bTable.getINVTYPE().equals("20") || bTable.getINVTYPE().equals("21") || bTable.getINVTYPE().equals("22") || bTable.getINVTYPE().equals("35") ||bTable.getINVTYPE().equals("36")){
						cerno=bTable.getCERNO();
					}else{
						cerno=bTable.getBLICNO();
					}
	%>
<!--
  <tr>  
  <td height="40" align="center" style="font-size:12px;"><%=bTable.getINV()%></td>�ɶ�(������)���ƻ�����
  <%if(invtype.equals("20")||invtype.equals("35")||invtype.equals("36")){ %>
      <td align="center" style="font-size:12px;"><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%><br><%=bTable.getCERNO()%></td>  ֤�����Ƽ�����
  <%}else{ %>
      <td align="center" style="font-size:12px;"><%=icms.getSysDm("BLICTYPE",bTable.getBLICTYPE())%><br><%=bTable.getBLICNO()%></td>  ֤�����Ƽ�����
  <%} %>
  <td align="center" style="font-size:12px;"><%=String.valueOf(bTable.getSUBCONAM())%></td> �Ͻɳ��ʶ�
  <td align="center" style="font-size:12px;"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>���ʷ�ʽ
  <td align="center" style="font-size:12px;"><%=bTable.getCONDATE()%></td>����ʱ��  
  <td align="center" style="font-size:12px;"><%=bTable.getCONPROP()%></td>�ֹɱ���  
  <td align="center" style="font-size:12px;"><%=String.valueOf(bTable.getACCONAM())%></td>ʵ�ɳ��ʶ�  
  <td align="center" style="font-size:12px;"><%=icms.getSysDm("CONFORM",bTable.getACCONFORM())%></td>���ʷ�ʽ  
  <td align="center" style="font-size:12px;"><%=bTable.getACCONDATE()%></td>����ʱ��    
  <td align="center" style="font-size:12px;"><%=bTable.getREMARK() %></td>��ע    
 </tr>
 -->  
 <tr>  
  <td height="30" align="center" style="font-size:12px;"><%=bTable.getINV()%></td>
  <td align="center" style="font-size:12px;"><%=cerno%></td>
  <td align="center" style="font-size:12px;"><%=bTable.getREMARK() %></td>
 </tr>
<% 
 }

 while (czxxNo<15) 
 {
	out.print("<tr><td height='30'></td><td></td><td></td></tr>");
	czxxNo++;
 }
%>	
</table>
<br>