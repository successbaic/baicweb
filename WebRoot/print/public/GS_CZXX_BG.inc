<table align="center" border="1" width="80%" bordercolor='#000000'>
	<caption><p align="center"><b>
		<span style="font-size: 16pt">公司股东(发起人)出资信息</b><br><br>
	</caption>	
<tr>    
	<td align='center' width='15%' rowspan="16" nowrap="nowrap" style="font-size:14px;">股东<br>(发起人)</td>
	<td align="center" width='30%' height="30" style="font-size:14px;">名称或姓名</td>
	<td align="center" width='30%' height="30" style="font-size:14px;">证照号码</td>
	<td align="center" width='25%' style="font-size:14px;">备注</td>
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
  <td height="40" align="center" style="font-size:12px;"><%=bTable.getINV()%></td>股东(发起人)名称或姓名
  <%if(invtype.equals("20")||invtype.equals("35")||invtype.equals("36")){ %>
      <td align="center" style="font-size:12px;"><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%><br><%=bTable.getCERNO()%></td>  证件名称及号码
  <%}else{ %>
      <td align="center" style="font-size:12px;"><%=icms.getSysDm("BLICTYPE",bTable.getBLICTYPE())%><br><%=bTable.getBLICNO()%></td>  证件名称及号码
  <%} %>
  <td align="center" style="font-size:12px;"><%=String.valueOf(bTable.getSUBCONAM())%></td> 认缴出资额
  <td align="center" style="font-size:12px;"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>出资方式
  <td align="center" style="font-size:12px;"><%=bTable.getCONDATE()%></td>出资时间  
  <td align="center" style="font-size:12px;"><%=bTable.getCONPROP()%></td>持股比例  
  <td align="center" style="font-size:12px;"><%=String.valueOf(bTable.getACCONAM())%></td>实缴出资额  
  <td align="center" style="font-size:12px;"><%=icms.getSysDm("CONFORM",bTable.getACCONFORM())%></td>出资方式  
  <td align="center" style="font-size:12px;"><%=bTable.getACCONDATE()%></td>出资时间    
  <td align="center" style="font-size:12px;"><%=bTable.getREMARK() %></td>备注    
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
