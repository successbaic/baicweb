<table border="1" cellpadding="0" cellspacing="0" width="100%" >
<caption align="left">��Ȩ��Ѻ�Ǽ���Ϣ</caption>
<tr class="lc1">
	<td width="20%"  class="lc1" align="right">��Ȩ���ڹ�˾ע��ţ�</td>
	<td width="30%"  class="lc2"><%=WR0212.getENTERPRISENO()%></td>
	<td width="20%"  class="lc1" align="right">��Ȩ���ڹ�˾���ƣ�</td>
	<td width="30%"  class="lc2"><%=WR0212.getENTERPRISENAME()%></td>
</tr>
<tr class="lc2">
	<td class="lc1" align="right">���������������ƣ���</td>
	<td class="lc2"><%=WR0212.getEXPORG()%></td>
	<td class="lc1" align="right">��Ȩ�����������ƣ���</td>
	<td class="lc2"><%=WR0212.getIMPORG()%></td>
</tr>
<tr class="lc2">
	<td class="lc1" align="right">���ʹ�Ȩ���Ԫ��ɣ���</td>
	<td class="lc2"><%=WR0212.getIMPAM() %></td>
	<td class="lc1" align="right">������ծȨ���Ԫ����</td>
	<td class="lc2"><%=cConvert.DoubleFormat(WR0212.getASSUREDAM())%></td>
</tr>
<tr class="lc2">
	<td class="lc1" align="right">�Ǽǻ��أ�</td>
	<td class="lc2" ><%=icms.getSysDm("REGORG",WR0212.getDJJG())%></td>
	<td class="lc1" align="right">�������ڣ�</td>
	<td class="lc2"><%=WR0212.getIMPREQDATE()%></td>
</tr> 
</table>