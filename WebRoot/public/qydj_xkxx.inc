<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1" nowrap="nowrap">�����ļ�����</td>
	<td class="lc2" colspan=3>
	<select size="1" name="LICNAME" disblank title="�����ļ�����" style="width:300px; ">
	<option value=''></option><%=icms.getSysDmList("LICNAME")%>
	</select>&nbsp;<font color=red>*</font></td>	
</tr>
<tr> 
	<td class="lc1">�����ļ����</td>
	<td class="lc2">
	<INPUT name="LICNO" size=30 maxlength=25 disblank title="�����ļ����">&nbsp;<font color=red>*</font></td>
	
	<td class="lc1" nowrap="nowrap">���ɻ���</td>
	<td class="lc2">
	<INPUT name="LICANTH" size=40 maxlength=40 disblank title="���ɻ���">&nbsp;<font color=red>*</font></td>
	
</tr>
<tr>
	<td class="lc1"  style="display:none">�����ļ�״̬</td>
	<td class="lc2"  style="display:none">
	<select size="1" name="LICSTATE" disblank title="�����ļ�״̬"  style="width:102px; ">
	<%=icms.getSysDmList("LICSTATE")%>
	</select>&nbsp;<font color=red>*</font></td>

	<td class="lc1">��Ч����</td>
	<td class="lc2">��<INPUT name="VALFROM" size=12  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})"  datatype="DATE" disblank title="��Ч������">&nbsp;<font color=red>*</font> 
	�� <INPUT name="VALTO" size=12  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE"  title="��Ч������">(��ʽ��YYYY-MM-DD)
	</td>
</tr>
</table>