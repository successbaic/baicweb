<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1" nowrap="nowrap">许可文件名称</td>
	<td class="lc2" colspan=3>
	<select size="1" name="LICNAME" disblank title="许可文件名称" style="width:300px; ">
	<option value=''></option><%=icms.getSysDmList("LICNAME")%>
	</select>&nbsp;<font color=red>*</font></td>	
</tr>
<tr> 
	<td class="lc1">许可文件编号</td>
	<td class="lc2">
	<INPUT name="LICNO" size=30 maxlength=25 disblank title="许可文件编号">&nbsp;<font color=red>*</font></td>
	
	<td class="lc1" nowrap="nowrap">许可机关</td>
	<td class="lc2">
	<INPUT name="LICANTH" size=40 maxlength=40 disblank title="许可机关">&nbsp;<font color=red>*</font></td>
	
</tr>
<tr>
	<td class="lc1"  style="display:none">许可文件状态</td>
	<td class="lc2"  style="display:none">
	<select size="1" name="LICSTATE" disblank title="许可文件状态"  style="width:102px; ">
	<%=icms.getSysDmList("LICSTATE")%>
	</select>&nbsp;<font color=red>*</font></td>

	<td class="lc1">有效期限</td>
	<td class="lc2">从<INPUT name="VALFROM" size=12  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})"  datatype="DATE" disblank title="有效期限自">&nbsp;<font color=red>*</font> 
	到 <INPUT name="VALTO" size=12  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE"  title="有效期限至">(格式：YYYY-MM-DD)
	</td>
</tr>
</table>