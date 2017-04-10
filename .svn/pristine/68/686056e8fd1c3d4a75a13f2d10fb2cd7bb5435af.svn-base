<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1">出资成员名称或姓名</td>   
	<td class="lc2"><input type="text" name="INV"  disblank title="出资成员名称或姓名" maxlength=30 size="30%">&nbsp;<font color=red>*</font>	</td> 	 
	<td class="lc1">成员类型</td>   
	<td class="lc2"><select size="1" name="INVTYPE" title="成员类型" disblank style="width:192px;" onchange="setInIitem()">
	<option value=''>请选择成员类型</option><%=icms.getSysDmList("MEMTYPE")%></select>&nbsp;<font color=red>*</font></td>  
</tr>
<tr> 
	<td class="lc1">住所</td>   
	<td class="lc2" colspan="3"><input type="text" name="DOM"  title="住所" maxlength=50></td> 	  
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1">证件类型</td>   
	<td class="lc2">
	  <select size="1" name="CERTYPE" title="证件类型" disblank style="width:192px;">
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select>
	  &nbsp;<font color=red>*</font>
	  </td>    
	<td class="lc1">证件号码</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" disblank title="证件号码" maxlength=20 >
	&nbsp;<font color=red>*</font>
	</td> 
   </tr>
   <tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >证照类型</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" disblank title='证照类型'>
	<option value=''>请选择证照类型</option><%=icms.getSysDmList("BLICTYPE")%></select>
	&nbsp;<font color=red>*</font>
	</td>
	<td class="lc1" >证照号码</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="30"  disblank maxlength="18" title='证照号码'>
		&nbsp;<font color=red>*</font>
		</td>
</tr>
   <tr> 
	<td class="lc1" >出资额（元）</td>   
	<td class="lc2" ><input type="text" name="SUBCONAM" id="SUBCONAM" onblur='doblurregcap()' datatype='NUM' title="出资额" maxlength=30 size="30%"></td> 
	<td class="lc1" >出资方式</td>   
	<td class="lc2">
		<select size="1" name="CONFORM" title="出资方式" disblank id="CONFORM" style="width:192px; ">
		<option value=''>请选择出资方式</option><%=icms.getSysDmList("CONFORM")%>
	    </select>
	    &nbsp;<font color=red>*</font>
	</td> 
   </tr> 
 <tr>
    <td class="lc2" colspan='4' align="left"><p align="left" style="font-color: #000080;font-size: 9pt;">注意：1、有红色<font color=red >*</font>标示的项目为必填项。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、“成员类型”是自然人的，请填写证件类型及证件号码；成员类型”是法人的，请填写证照类型及证照号码。<br>
    </td>    
</tr>   
</table>
<script>
function doblurregcap()
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	if (fucCheckNUM(SUBCONAM))
	{
		if(SUBCONAM<0){
		    alert('出资额不允许是负值！');
			return false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('出资额超过系统最大精度！');
			return false;
		}
	}
	else
	{
		alert('出资额应为数字！');
		return false;
	}
}
</script>