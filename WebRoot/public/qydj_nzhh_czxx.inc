<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1" nowrap="nowrap">����������</td>
	<td class="lc2">
	<input type="text" name="INV" size="30" maxlength="50" disblank title='����������'>&nbsp;<font color=red>*</font></td>
	<td class="lc1">Ͷ��������</td>
	<td class="lc2">
	<select size="1" name="INVTYPE" disblank title='Ͷ��������' onchange="setInIitem()">
	<option value=''>��ѡ��Ͷ��������</option>
	<%=icms.getSysDmList("INVTYPE")%>
	</select>&nbsp;<font color=red>*</font></td>
</tr>
<tr>
	<td class="lc1" >�Ƿ�ִ������ϻ���</td>
	<td class="lc2">   
	<select size="1" name="EXEAFFSIGN" title="�Ƿ�ִ������ϻ���" disblank>
	<option value=''>��ѡ��...</option><%=icms.getSysDmList("YESORNO")%></select>
	&nbsp;<font color=red>*</font>
	</td>
	<td class="lc1">ס ��</td>
	<td class="lc2">
	<input type="text" name="DOM" size="50" maxlength="50" disblank title='ס��'>&nbsp;<font color=red>*</font></td>
</tr>
<tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >֤������</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" title="֤������">
	<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("BLICTYPE")%></select></td>
	<td class="lc1" >֤�պ���</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="20" maxlength="20" title='֤�պ���'></td>
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1" >֤������</td>
	<td class="lc2">   
	<select size="1" name="CERTYPE" title="֤������">
	<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select></td>
	<td class="lc1" >֤������</td>
	<td class="lc2">
	<input type="text" name="CERNO" size="20" maxlength="20" title='֤������'></td>
</tr>	
<tr>
<td class='lc1'>���ʷ�ʽ</td>
	<td class="lc2" colspan="3">
		<select size="1"  disblank title='���ʷ�ʽ'  name="CONFORM">
		<option value=''>��ѡ����ʷ�ʽ</option><%=icms.getSysDmList("CONFORM")%>
		</select>&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
	<td class="lc1" >�Ͻɳ��ʶ�</td>
	<td class="lc2">
	<input type="text" name="SUBCONAM" onblur='doblurregcap()' size="14" maxlength="14" datatype='NUM' title='�Ͻɳ��ʶ�' disblank>&nbsp;<font color=red>*</font>��Ԫ
	</td>
	
	<td class="lc1" >�ֹɱ�����%��</td>   
	<td class="lc2" ><input type="text" name="SUBCONPROP" disblank title="�ֹɱ���" datatype='NUM' maxlength=30 >&nbsp;<font color=red>*</font></td>    
	
</tr>
<tr>
	<td class="lc1" >ʵ�ɳ��ʶ�</td>
	<td class="lc2">
	<input type="text" name="ACCONAM" onblur='doblurregcap()' size="14" maxlength="14" datatype='NUM' title='ʵ�ɳ��ʶ�(��Ԫ)' disblank>&nbsp;<font color=red>*</font>��Ԫ
	</td>
    <td class="lc1" >���ɸ�����</td>
	<td class="lc2">
	<input type="text" name="BALDELTERM" maxlength=10 title='���ɸ�����' class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype=DATE>
	</td>
</tr>
<tr>
	<td class='lc1'>������ʽ</td>
	<td class="lc2">
		<select name="EVALSTY" disblank title="������ʽ">
			<option value=''>--������ʽ--</option>
			<%=icms.getSysDmList("EVALSTY")%>
		</select>&nbsp;<font color=red>*</font>
	</td>
	<td class='lc1'>�е����η�ʽ</td>
	<td class="lc2">
		<select name="ONDUTYSTY" disblank title="�е����η�ʽ">
			<option value=''>--�е����η�ʽ--</option>
			<%=icms.getSysDmList("ONDUTYSTY")%>
		</select>&nbsp;<font color=red>*</font>
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
		    alert('�Ͻɳ��ʶ�����Ǹ�ֵ��');
			return false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('�Ͻɳ��ʶ��ϵͳ��󾫶ȣ�');
			return false;
		}
	}
	else
	{
		alert('�Ͻɳ��ʶ�ӦΪ���֣�');
		return false;
	}

	var ACCONAM = document.getElementById("ACCONAM").value;
	if (fucCheckNUM(ACCONAM))
	{
		if(ACCONAM<0){
		    alert('ʵ�ɳ��ʶ�����Ǹ�ֵ��');
			return false;
		}
		if (Math.abs(ACCONAM)>999999999999)
		{
			alert('ʵ�ɳ��ʶ��ϵͳ��󾫶ȣ�');
			return false;
		}
	}
	else
	{
		alert('ʵ�ɳ��ʶ�ӦΪ���֣�');
		return false;
	}
}
function chebaldelterm()//���ɸ�����  ʵ��<�Ͻɵ�ʱ�򣬱�����д���ֶ�
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	var ACCONAM = document.getElementById("ACCONAM").value;
	var BALDELTERM = document.getElementById("BALDELTERM").value;
	if((ACCONAM-SUBCONAM)<0)
	{
	   if(BALDELTERM==null||BALDELTERM==""){
	      //alert('���ɸ����޲���Ϊ�գ�');
	      //return false;
	   }
	}else if((ACCONAM-SUBCONAM)>0)
	{
	   alert('ʵ�ɳ��ʶ�ܴ����Ͻɳ��ʶ');
	   return false;
	}
}
</script>