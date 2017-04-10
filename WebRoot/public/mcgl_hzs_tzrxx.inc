<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1" nowrap="nowrap">姓名或名称</td>
	<td class="lc2" colspan="3">
	<input type="text" name="INV" size="60" maxlength="50" disblank title='姓名或名称'>&nbsp;<font color=red>*</font></td>
</tr>
<tr>
	<td class="lc1" >成员类型</td>
	<td class="lc2" colspan="3">   
	<select size="1" name="INVTYPE" title="成员类型" onchange="setInIitem()" disblank>
	<option value=''>请选择成员类型</option><%=icms.getSysDmList("MEMTYPE")%></select>
	<font color=red>*</font>
	</td>
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1">证件类型</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="证件类型" style="width:192px;">
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select></td>    
	<td class="lc1" >证件号码</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" title="证件号码" maxlength=20 ></td> 
   </tr>
   <tr style="display:none" id="ZZLX_TR">
	<td class="lc1">证照类型</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='证照类型'>
	<option value=''>请选择证照类型</option><%=icms.getSysDmList("BLICTYPE")%></select></td>
	<td class="lc1" >证照号码</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="30" maxlength="18" title='证照号码'></td>
</tr>
</table>