<table align="center" border="1" width="80%" bordercolor='#000000'>
	<caption><p align="center"><b>
		<span style="font-size: 16pt">合伙人出资情况</b><br><br>
	</caption>	
<tr>    
	<td align='center' width='15%' nowrap="nowrap" style="font-size:14px;">合伙人名称<br>或姓名</td>
	<td align="center" width='10%' height="30" style="font-size:14px;">国别<br>（地区）</td>
	<td align="center" width='15%' height="30" style="font-size:14px;">证件类型</td>
	<td align="center" width='15%' height="30" style="font-size:14px;">证件号码</td>
	<td align="center" width='10%' style="font-size:14px;">承担责任方式</td>
	<td align="center" width='10%' style="font-size:14px;">出资时间</td>
	<td align="center" width='10%' style="font-size:14px;">出资方式</td>
	<td align="center" width='10%' style="font-size:14px;">认缴出资<br>额（万元）</td>
	<td align="center" width='5%' style="font-size:14px;">出资比例</td>
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
  <td align="center" style="font-size:12px;"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
  <%if(invtype.equals("20")|| invtype.equals("21") || invtype.equals("22") || invtype.equals("35")||invtype.equals("36")){ %>
      <td align="center" style="font-size:12px;"><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%></td> <td align="center" style="font-size:12px;"><%=bTable.getCERNO()%></td>
  <%}else{ %>
      <td align="center" style="font-size:12px;"><%=icms.getSysDm("BLICTYPE",bTable.getBLICTYPE())%></td> <td align="center" style="font-size:12px;"><%=bTable.getBLICNO()%></td>
  <%} %>
  <td align="center" style="font-size:12px;"><%=icms.getSysDm("ONDUTYSTY",bTable.getONDUTYSTY())%></td>
  <td align="center" style="font-size:12px;"><%=bTable.getCONDATE()%></td>
  <td align="center" style="font-size:12px;"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>
  <td align="center" style="font-size:12px;"><%=String.valueOf(bTable.getSUBCONAM())%></td>
  <td align="center" style="font-size:12px;"><%=bTable.getSUBCONPROP()%></td>
 </tr>

<% 
 }

 while (czxxNo<10) 
 {
	out.print("<tr><td height='30'></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
	czxxNo++;
 }
%>	
</table>
<br>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>