<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1">���ʳ�Ա���ƻ�����</td>   
	<td class="lc2"><input type="text" name="INV"  disblank title="���ʳ�Ա���ƻ�����" maxlength=30 size="30%">&nbsp;<font color=red>*</font>	</td> 	 
	<td class="lc1">��Ա����</td>   
	<td class="lc2"><select size="1" name="INVTYPE" title="��Ա����" disblank style="width:192px;" onchange="setInIitem()">
	<option value=''>��ѡ���Ա����</option><%=icms.getSysDmList("MEMTYPE")%></select>&nbsp;<font color=red>*</font></td>  
</tr>
<tr> 
	<td class="lc1">ס��</td>   
	<td class="lc2" colspan="3"><input type="text" name="DOM"  title="ס��" maxlength=50></td> 	  
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1">֤������</td>   
	<td class="lc2">
	  <select size="1" name="CERTYPE" title="֤������" disblank style="width:192px;">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>
	  &nbsp;<font color=red>*</font>
	  </td>    
	<td class="lc1">֤������</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" disblank title="֤������" maxlength=20 >
	&nbsp;<font color=red>*</font>
	</td> 
   </tr>
   <tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >֤������</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" disblank title='֤������'>
	<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("BLICTYPE")%></select>
	&nbsp;<font color=red>*</font>
	</td>
	<td class="lc1" >֤�պ���</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="30"  disblank maxlength="18" title='֤�պ���'>
		&nbsp;<font color=red>*</font>
		</td>
</tr>
   <tr> 
	<td class="lc1" >���ʶԪ��</td>   
	<td class="lc2" ><input type="text" name="SUBCONAM" id="SUBCONAM" onblur='doblurregcap()' datatype='NUM' title="���ʶ�" maxlength=30 size="30%"></td> 
	<td class="lc1" >���ʷ�ʽ</td>   
	<td class="lc2">
		<select size="1" name="CONFORM" title="���ʷ�ʽ" disblank id="CONFORM" style="width:192px; ">
		<option value=''>��ѡ����ʷ�ʽ</option><%=icms.getSysDmList("CONFORM")%>
	    </select>
	    &nbsp;<font color=red>*</font>
	</td> 
   </tr> 
 <tr>
    <td class="lc2" colspan='4' align="left"><p align="left" style="font-color: #000080;font-size: 9pt;">ע�⣺1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2������Ա���͡�����Ȼ�˵ģ�����д֤�����ͼ�֤�����룻��Ա���͡��Ƿ��˵ģ�����д֤�����ͼ�֤�պ��롣<br>
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
		    alert('���ʶ�����Ǹ�ֵ��');
			return false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('���ʶ��ϵͳ��󾫶ȣ�');
			return false;
		}
	}
	else
	{
		alert('���ʶ�ӦΪ���֣�');
		return false;
	}
}
</script>