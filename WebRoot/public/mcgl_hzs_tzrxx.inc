<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1" nowrap="nowrap">����������</td>
	<td class="lc2" colspan="3">
	<input type="text" name="INV" size="60" maxlength="50" disblank title='����������'>&nbsp;<font color=red>*</font></td>
</tr>
<tr>
	<td class="lc1" >��Ա����</td>
	<td class="lc2" colspan="3">   
	<select size="1" name="INVTYPE" title="��Ա����" onchange="setInIitem()" disblank>
	<option value=''>��ѡ���Ա����</option><%=icms.getSysDmList("MEMTYPE")%></select>
	<font color=red>*</font>
	</td>
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1">֤������</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="֤������" style="width:192px;">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select></td>    
	<td class="lc1" >֤������</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" title="֤������" maxlength=20 ></td> 
   </tr>
   <tr style="display:none" id="ZZLX_TR">
	<td class="lc1">֤������</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='֤������'>
	<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("BLICTYPE")%></select></td>
	<td class="lc1" >֤�պ���</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="30" maxlength="18" title='֤�պ���'></td>
</tr>
</table>