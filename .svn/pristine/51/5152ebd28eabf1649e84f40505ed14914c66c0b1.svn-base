<table align="center" border="1" width="90%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">投资者（股东/发起人）出资情况</b><br><br></caption>	
<tr class=tr9>    
	<td height="40" width='15%' align='center'>投资者名称<br/>或姓名</td>
	<td width='8%' align="center">国别（地区）</td>
	<td width='15%' align="center">证件类型</td>
	<td width='15%' align="center">证件号码</td>
	<td width='8%'align="center">出资时间 </td>
	<td width='9%' align="center">出资方式</td>
    <td width='10%' align="center">认缴出资额(万元)</td>
	<td width='8%' align="center">出资比例</td>	
</tr>	
<%
 int No=0;
 ArrayList rsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int temp = rsdwtz.size();
 for (int i=0;i<temp;i++){
 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)rsdwtz.get(i);
 No=No+1;
%>
  <tr class=tr9>  
  <td height="40" align="center" ><%=bTable.getINV()%></td>
  <td align="center" ><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
  <td align="center" ><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%></td>
  <td align="center" ><%=bTable.getCERNO()%></td>
  <td align="center" ><%=bTable.getCONDATE()%></td>
  <td align="center" ><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>
  <td align="center" ><%=String.valueOf(bTable.getSUBCONAM())%></td>
  <td align="center" ><%=bTable.getCONPROP()%></td>
 </tr>
<% 
 }
 while (No<=10) 
 {
	out.print("<tr><td height='40'></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
	No++;
 }
%>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
