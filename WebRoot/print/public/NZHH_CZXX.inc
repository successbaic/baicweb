<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center">
	<span>����ȫ��ϻ�����¼���������</span><br><br></caption>	
<tr class=tr9>    
	<td height="40" width='12%' align='center'>�ϻ������ƻ�����</td>
	<td width='16%'align="center">ס��</td>
	<td width='16%' align="center">֤�����ͼ�����</td>
	<td align="center">�е����η�ʽ</td>	
    <td width='10%' align="center">���ʷ�ʽ</td>
    <td width='10%' align="center">������ʽ</td>
	<td width='8%'align="center">�Ͻɳ��ʶ�<br>����Ԫ��</td>
	<td width='9%' align="center">ʵ�ɳ��ʶ�<br>����Ԫ��</td>
	<td width='10%' align="center">�ɸ�����</td>
	
	
</tr>	
<%
 int No=0;
 ArrayList rsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int temp = rsdwtz.size();
 for (int i=0;i<temp;i++){
 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)rsdwtz.get(i);
 No=No+1;
 String invtype=bTable.getINVTYPE();
%>
  <tr class=tr9>  
  <td height="40" align="center" ><%=bTable.getINV()%></td><!--�ɶ�(������)���ƻ�����-->
  <td align="center" ><%=bTable.getDOM() %></td><!-- ס�� -->
  <%if(invtype.equals("20")|| invtype.equals("21")|| invtype.equals("22")|| invtype.equals("35")||invtype.equals("36")){ %>
     <td align="center" ><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%><br><%=bTable.getCERNO()%></td>  <!--֤�����Ƽ�����-->
  <%}else{ %>
     <td align="center" ><%=icms.getSysDm("BLICTYPE",bTable.getBLICTYPE())%><br><%=bTable.getBLICNO()%></td>  <!--֤�����Ƽ�����-->
  <%} %>
  <td align="center" ><%=icms.getSysDm("ONDUTYSTY",bTable.getONDUTYSTY())%></td><!--�е����η�ʽ-->
  <td align="center" ><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td><!--���ʷ�ʽ--> 
   <td align="center" ><%=icms.getSysDm("EVALSTY",bTable.getEVALSTY())%></td><!--������ʽ-->
  <td align="center" ><%=String.valueOf(bTable.getSUBCONAM())%></td> <!--�Ͻɳ��ʶ�-->
  <td align="center" ><%=String.valueOf(bTable.getACCONAM())%></td><!--ʵ�ɳ��ʶ�--> 
  <td align="center" ><%=bTable.getBALDELTERM()%></td><!--�ɸ�����-->
 
    
 </tr>
<% 
 }

 while (No<=9) 
 {
	out.print("<tr><td height='40'></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
	No++;
 }
%>	
</table>
<table align="center" border="0" width="90%" >
			<tr>
				<td>
				    &nbsp;&nbsp;&nbsp;&nbsp;<p align="left">ȫ��ϻ���ǩ�֣�</p>
				</td>
				<td>
				    &nbsp;&nbsp;&nbsp;&nbsp;<p align="right">�������ڣ�</p>
				</td>
			</TR>			
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>