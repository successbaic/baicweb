<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1" nowrap="nowrap">Ͷ����</td>
	<td class="lc2">
	<input type="text" name="INV" size="45" maxlength="50" disblank title='����������'>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1">Ͷ��������</td>
		<td class="lc2">
			<select size="1" id="INVTYPE" name="INVTYPE"  title="Ͷ��������" disblank>
			<option value=''>��ѡ��Ͷ��������</option>
		<%=icms.getSysDmListLIKERemark("INVTYPE",ENTTYPE)%>
     </select>&nbsp;<font color=red>*</font>
	</td>
     
</tr>
<tr style="display:none" id="ZJLX_TR">
<td class="lc1">֤������</td>   
	<td class="lc2" >
	  <select size="1" id="CERTYPE" name="CERTYPE" title="֤������" style="width:192px;">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select></td>    
	<td class="lc1" >֤������</td>   
	<td class="lc2" colspan='3'><input type="text" size="30" name="CERNO" title="֤������" maxlength=20 ></td> 
</tr>
<tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >֤������</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='֤������'>
	<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("BLICTYPE")%></select></td>
	<td class="lc1" >֤�պ���</td>
	<td class="lc2" colspan='3'>
		<input type="text" name="BLICNO" size="30" maxlength="18" title='֤�պ���'></td>
</tr>
<tr>
	<td class="lc1" nowrap="nowrap">����/����</td>
	<td class="lc2" colspan="3">
		<input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="����" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="ѡ ��..">					
		<font color=red>*</font>
	</td>
</tr>
<tr>
	<td class="lc1" nowrap="nowrap">���ʶ��</td>
	<td class="lc2" colspan="1">
		<input type="text" name="SUBCONAM" size="14" maxlength="14" datatype='NUM' title="���ʶ��" onblur='doblurcongro()' >&nbsp;		
	</td>
	<td class="lc1" nowrap="nowrap">����</td>
	<td class="lc2" colspan="1">
		<input type="text" name="CONGROCUR_TEXT" id="CONGROCUR_TEXT" disabled>
		<input type="hidden" name="CONGROCUR" id="CONGROCUR" title="���ʶ����"><input type="button" class="button" onclick="getSelDm('CONGROCUR','CURRENCY')" value="ѡ ��..">		
	</td>
</tr>
<tr>
	<td class="lc1" >Ͷ�ʱ���</td>
	<td class="lc2" colspan="3">
	<input type="text" name="CONPROP" size="14" maxlength="14" datatype='NUM' title='Ͷ�ʱ���'> %
	</td>
</tr>
</table>

<script LANGUAGE="JavaScript">
function doblurcongro()
{
/*
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	var JB_REGCAP = document.getElementById("JB_REGCAP").value;
	var ret=true;
	if (fucCheckNUM(SUBCONAM))
	{
		if(SUBCONAM<0){
		    alert('���ʶ�����Ǹ�ֵ��');
			ret= false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('���ʶ��ϵͳ��󾫶ȣ�');
			ret= false;
		}
        if(JB_REGCAP!=null&&JB_REGCAP!=""&&(JB_REGCAP-0)>0){
		   if(SUBCONAM/JB_REGCAP>1){
		      alert('���ʶ����ҵ��ע���ʱ���');
			  ret= false;
		   }else{
		      document.getElementById("CONPROP").value=FormatNumber(SUBCONAM/JB_REGCAP*100,2);
		   } 
		}
	}
	else
	{
		alert('���ʶ�ӦΪ���֣�');
		ret= false;
	}
	if(!ret){
		document.form1.btSave.disabled=false;
	}
	return ret;
	*/
}
</script>