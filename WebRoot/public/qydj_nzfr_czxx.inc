<table border="1" style="margin-top:20px;" width="100%" cellpadding="0" cellspacing="0" >
   <tr> 
	<td class="lc1">����</td>   
	<td class="lc2" ><input type="text" name="INV"  disblank  maxlength=30 size="30%">&nbsp;<font color=red>*</font>	</td> 	 
	<td class="lc1" nowrap="nowrap">��������</td>   
	<td class="lc2"><select size="1" name="INVTYPE" title="Ͷ��������" disblank style="width:192px;" onchange="setInIitem()">
	<option value=''>��ѡ��Ͷ��������</option>
	<%=icms.getSysDmList("INVTYPE")%>
	</select>&nbsp;<font color=red>*</font></td>  
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1" >֤������</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="֤������" style="width:192px;">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>    
	<td class="lc1" >֤������</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" title="֤������" maxlength=20 >&nbsp;<font color=red>*</font></td> 
   </tr>
   <tr style="display:block" id="ZZLX_TR">
	<td class="lc1" >֤������</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='֤������' >
	<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("BLICTYPE")%></select>&nbsp;<font color=red>*</font></td>
	<td class="lc1" >֤�պ���</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="30" maxlength="18" title='֤�պ���' >&nbsp;<font color=red>*</font></td>
</tr>
 <tr> 
    <td class="lc1" >�Ǽǻ���</td>   
	<td class="lc2" colspan='3'>
		<input type="text" id="INVPERAREA" name="INVPERAREA" title="�Ǽǻ���" size="70" disblank>&nbsp;<font color=red>*</font>
	</td>   
</tr>
 
 <tr> 
    <td class="lc1" >��ע</td>   
	<td class="lc2" colspan='3'>
		<input type="text" id="REMARK" name="REMARK" title="����ע��" size="70">
	</td>   
</tr>
 <tr>
    <td class="lc2" colspan='6' align="left"><p align="left" style="font-color: #000080;font-size: 9pt;">ע�⣺1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����<br>
    </td>    
</tr>   
</table>