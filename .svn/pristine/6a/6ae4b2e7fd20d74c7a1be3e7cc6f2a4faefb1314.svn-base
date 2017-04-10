<table align="center" border="1" width="80%" bordercolor='#000000'>
	<caption><p align="center"><b>
		<span style="font-size: 16pt">公司股东(发起人)出资信息</b><br><br>
	</caption>	
<tr>    
	<td align='center' width='22%' nowrap="nowrap" style="font-size:14px;">投资者名称<br>或姓名</td>
	<td align="center" width='15%' height="30" style="font-size:14px;">证件类型</td>
	<td align="center" width='15%' height="30" style="font-size:14px;">证件号码</td>
	<td align="center" width='12%' style="font-size:14px;">出资时间</td>
	<td align="center" width='12%' style="font-size:14px;">出资方式</td>
	<td align="center" width='12%' style="font-size:14px;">认缴出资额（万元）</td>
	<td align="center" width='12%' style="font-size:14px;">出资比例</td>
</tr>
	<%
	int czxxNo=0;
	 ArrayList addCzxx=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
	 for (int i=0;i<addCzxx.size();i++){
	 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)addCzxx.get(i);
	 String invtype=bTable.getINVTYPE();
	  czxxNo=czxxNo+1;
	%>
  <tr>  
  <td height="40" align="center" style="font-size:12px;"><%=bTable.getINV()%></td>
  <%if(invtype.equals("20")|| invtype.equals("21") || invtype.equals("22") || invtype.equals("35")||invtype.equals("36")){ %>
      <td align="center" style="font-size:12px;"><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%></td> <td align="center" style="font-size:12px;"><%=bTable.getCERNO()%></td>
  <%}else{ %>
      <td align="center" style="font-size:12px;"><%=icms.getSysDm("BLICTYPE",bTable.getBLICTYPE())%></td> <td align="center" style="font-size:12px;"><%=bTable.getBLICNO()%></td>
  <%} %>
  
  <td align="center" style="font-size:12px;"><%=bTable.getCONDATE()%></td>
  <td align="center" style="font-size:12px;"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>
  <td align="center" style="font-size:12px;"><%=String.valueOf(bTable.getSUBCONAM())%></td>
  <td align="center" style="font-size:12px;"><%=bTable.getSUBCONPROP()%></td>
 </tr>

<% 
 }

 while (czxxNo<20) 
 {
	out.print("<tr><td height='30'></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
	czxxNo++;
 }
%>	
</table>
<br>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>