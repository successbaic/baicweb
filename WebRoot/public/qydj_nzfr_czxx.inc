<table border="1" style="margin-top:20px;" width="100%" cellpadding="0" cellspacing="0" >
   <tr> 
	<td class="lc1">名称</td>   
	<td class="lc2" ><input type="text" name="INV"  disblank  maxlength=30 size="30%">&nbsp;<font color=red>*</font>	</td> 	 
	<td class="lc1" nowrap="nowrap">法人类型</td>   
	<td class="lc2"><select size="1" name="INVTYPE" title="投资人类型" disblank style="width:192px;" onchange="setInIitem()">
	<option value=''>请选择投资人类型</option>
	<%=icms.getSysDmList("INVTYPE")%>
	</select>&nbsp;<font color=red>*</font></td>  
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1" >证件类型</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="证件类型" style="width:192px;">
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>    
	<td class="lc1" >证件号码</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" title="证件号码" maxlength=20 >&nbsp;<font color=red>*</font></td> 
   </tr>
   <tr style="display:block" id="ZZLX_TR">
	<td class="lc1" >证照类型</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='证照类型' >
	<option value=''>请选择证照类型</option><%=icms.getSysDmList("BLICTYPE")%></select>&nbsp;<font color=red>*</font></td>
	<td class="lc1" >证照号码</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="30" maxlength="18" title='证照号码' >&nbsp;<font color=red>*</font></td>
</tr>
 <tr> 
    <td class="lc1" >登记机关</td>   
	<td class="lc2" colspan='3'>
		<input type="text" id="INVPERAREA" name="INVPERAREA" title="登记机关" size="70" disblank>&nbsp;<font color=red>*</font>
	</td>   
</tr>
 
 <tr> 
    <td class="lc1" >备注</td>   
	<td class="lc2" colspan='3'>
		<input type="text" id="REMARK" name="REMARK" title="“备注”" size="70">
	</td>   
</tr>
 <tr>
    <td class="lc2" colspan='6' align="left"><p align="left" style="font-color: #000080;font-size: 9pt;">注意：1、有红色<font color=red >*</font>标示的项目为必填项。<br>
    </td>    
</tr>   
</table>
