<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center">
	<span>二、全体合伙人名录及出资情况</span><br><br></caption>	
<tr class=tr9>    
	<td height="40" width='12%' align='center'>合伙人名称或姓名</td>
	<td width='16%'align="center">住所</td>
	<td width='16%' align="center">证件类型及号码</td>
	<td align="center">承担责任方式</td>	
    <td width='10%' align="center">出资方式</td>
    <td width='10%' align="center">评估方式</td>
	<td width='8%'align="center">认缴出资额<br>（万元）</td>
	<td width='9%' align="center">实缴出资额<br>（万元）</td>
	<td width='10%' align="center">缴付期限</td>
	
	
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
  <td height="40" align="center" ><%=bTable.getINV()%></td><!--股东(发起人)名称或姓名-->
  <td align="center" ><%=bTable.getDOM() %></td><!-- 住所 -->
  <%if(invtype.equals("20")|| invtype.equals("21")|| invtype.equals("22")|| invtype.equals("35")||invtype.equals("36")){ %>
     <td align="center" ><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%><br><%=bTable.getCERNO()%></td>  <!--证件名称及号码-->
  <%}else{ %>
     <td align="center" ><%=icms.getSysDm("BLICTYPE",bTable.getBLICTYPE())%><br><%=bTable.getBLICNO()%></td>  <!--证件名称及号码-->
  <%} %>
  <td align="center" ><%=icms.getSysDm("ONDUTYSTY",bTable.getONDUTYSTY())%></td><!--承担责任方式-->
  <td align="center" ><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td><!--出资方式--> 
   <td align="center" ><%=icms.getSysDm("EVALSTY",bTable.getEVALSTY())%></td><!--评估方式-->
  <td align="center" ><%=String.valueOf(bTable.getSUBCONAM())%></td> <!--认缴出资额-->
  <td align="center" ><%=String.valueOf(bTable.getACCONAM())%></td><!--实缴出资额--> 
  <td align="center" ><%=bTable.getBALDELTERM()%></td><!--缴付期限-->
 
    
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
				    &nbsp;&nbsp;&nbsp;&nbsp;<p align="left">全体合伙人签字：</p>
				</td>
				<td>
				    &nbsp;&nbsp;&nbsp;&nbsp;<p align="right">申请日期：</p>
				</td>
			</TR>			
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>