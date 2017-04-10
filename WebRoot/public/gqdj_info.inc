<table border="1" cellpadding="0" cellspacing="0" width="100%" >
<caption align="left">股权质押登记信息</caption>
<tr class="lc1">
	<td width="20%"  class="lc1" align="right">股权所在公司注册号：</td>
	<td width="30%"  class="lc2"><%=WR0212.getENTERPRISENO()%></td>
	<td width="20%"  class="lc1" align="right">股权所在公司名称：</td>
	<td width="30%"  class="lc2"><%=WR0212.getENTERPRISENAME()%></td>
</tr>
<tr class="lc2">
	<td class="lc1" align="right">出质人姓名（名称）：</td>
	<td class="lc2"><%=WR0212.getEXPORG()%></td>
	<td class="lc1" align="right">质权人姓名（名称）：</td>
	<td class="lc2"><%=WR0212.getIMPORG()%></td>
</tr>
<tr class="lc2">
	<td class="lc1" align="right">出质股权额（万元万股）：</td>
	<td class="lc2"><%=WR0212.getIMPAM() %></td>
	<td class="lc1" align="right">被担保债权额（万元）：</td>
	<td class="lc2"><%=cConvert.DoubleFormat(WR0212.getASSUREDAM())%></td>
</tr>
<tr class="lc2">
	<td class="lc1" align="right">登记机关：</td>
	<td class="lc2" ><%=icms.getSysDm("REGORG",WR0212.getDJJG())%></td>
	<td class="lc1" align="right">设立日期：</td>
	<td class="lc2"><%=WR0212.getIMPREQDATE()%></td>
</tr> 
</table>