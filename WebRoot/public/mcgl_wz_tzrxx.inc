<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1" nowrap="nowrap">投资者</td>
	<td class="lc2">
	<input type="text" name="INV" size="45" maxlength="50" disblank title='姓名或名称'>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1">投资人类型</td>
		<td class="lc2">
			<select size="1" id="INVTYPE" name="INVTYPE"  title="投资人类型" disblank>
			<option value=''>请选择投资人类型</option>
		<%=icms.getSysDmListLIKERemark("INVTYPE",ENTTYPE)%>
     </select>&nbsp;<font color=red>*</font>
	</td>
     
</tr>
<tr style="display:none" id="ZJLX_TR">
<td class="lc1">证件类型</td>   
	<td class="lc2" >
	  <select size="1" id="CERTYPE" name="CERTYPE" title="证件类型" style="width:192px;">
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select></td>    
	<td class="lc1" >证件号码</td>   
	<td class="lc2" colspan='3'><input type="text" size="30" name="CERNO" title="证件号码" maxlength=20 ></td> 
</tr>
<tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >证照类型</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='证照类型'>
	<option value=''>请选择证照类型</option><%=icms.getSysDmList("BLICTYPE")%></select></td>
	<td class="lc1" >证照号码</td>
	<td class="lc2" colspan='3'>
		<input type="text" name="BLICNO" size="30" maxlength="18" title='证照号码'></td>
</tr>
<tr>
	<td class="lc1" nowrap="nowrap">国别/地区</td>
	<td class="lc2" colspan="3">
		<input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="国别" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="选 择..">					
		<font color=red>*</font>
	</td>
</tr>
<tr>
	<td class="lc1" nowrap="nowrap">出资额（万）</td>
	<td class="lc2" colspan="1">
		<input type="text" name="SUBCONAM" size="14" maxlength="14" datatype='NUM' title="出资额（万）" onblur='doblurcongro()' >&nbsp;		
	</td>
	<td class="lc1" nowrap="nowrap">币种</td>
	<td class="lc2" colspan="1">
		<input type="text" name="CONGROCUR_TEXT" id="CONGROCUR_TEXT" disabled>
		<input type="hidden" name="CONGROCUR" id="CONGROCUR" title="出资额币种"><input type="button" class="button" onclick="getSelDm('CONGROCUR','CURRENCY')" value="选 择..">		
	</td>
</tr>
<tr>
	<td class="lc1" >投资比例</td>
	<td class="lc2" colspan="3">
	<input type="text" name="CONPROP" size="14" maxlength="14" datatype='NUM' title='投资比例'> %
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
		    alert('出资额不允许是负值！');
			ret= false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('出资额超过系统最大精度！');
			ret= false;
		}
        if(JB_REGCAP!=null&&JB_REGCAP!=""&&(JB_REGCAP-0)>0){
		   if(SUBCONAM/JB_REGCAP>1){
		      alert('出资额超过企业的注册资本！');
			  ret= false;
		   }else{
		      document.getElementById("CONPROP").value=FormatNumber(SUBCONAM/JB_REGCAP*100,2);
		   } 
		}
	}
	else
	{
		alert('出资额应为数字！');
		ret= false;
	}
	if(!ret){
		document.form1.btSave.disabled=false;
	}
	return ret;
	*/
}
</script>