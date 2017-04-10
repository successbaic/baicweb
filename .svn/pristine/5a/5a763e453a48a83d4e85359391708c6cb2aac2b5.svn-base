<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1" nowrap="nowrap">姓名或名称</td>
	<td class="lc2">
	<input type="text" name="INV" size="30" maxlength="50" disblank title='姓名或名称'>&nbsp;<font color=red>*</font></td>
	<td class="lc1">投资人类型</td>
	<td class="lc2">
	<select size="1" name="INVTYPE" disblank title='投资人类型' onchange="setInIitem()">
	<option value=''>请选择投资人类型</option>
	<%=icms.getSysDmList("INVTYPE")%>
	</select>&nbsp;<font color=red>*</font></td>
</tr>
<tr>
	<td class="lc1" >是否执行事务合伙人</td>
	<td class="lc2">   
	<select size="1" name="EXEAFFSIGN" title="是否执行事务合伙人" disblank>
	<option value=''>请选择...</option><%=icms.getSysDmList("YESORNO")%></select>
	&nbsp;<font color=red>*</font>
	</td>
	<td class="lc1">住 所</td>
	<td class="lc2">
	<input type="text" name="DOM" size="50" maxlength="50" disblank title='住所'>&nbsp;<font color=red>*</font></td>
</tr>
<tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >证照类型</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" title="证照类型">
	<option value=''>请选择证照类型</option><%=icms.getSysDmList("BLICTYPE")%></select></td>
	<td class="lc1" >证照号码</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="20" maxlength="20" title='证照号码'></td>
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1" >证件类型</td>
	<td class="lc2">   
	<select size="1" name="CERTYPE" title="证件类型">
	<option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select></td>
	<td class="lc1" >证件号码</td>
	<td class="lc2">
	<input type="text" name="CERNO" size="20" maxlength="20" title='证件号码'></td>
</tr>	
<tr>
<td class='lc1'>出资方式</td>
	<td class="lc2" colspan="3">
		<select size="1"  disblank title='出资方式'  name="CONFORM">
		<option value=''>请选择出资方式</option><%=icms.getSysDmList("CONFORM")%>
		</select>&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
	<td class="lc1" >认缴出资额</td>
	<td class="lc2">
	<input type="text" name="SUBCONAM" onblur='doblurregcap()' size="14" maxlength="14" datatype='NUM' title='认缴出资额' disblank>&nbsp;<font color=red>*</font>万元
	</td>
	
	<td class="lc1" >持股比例（%）</td>   
	<td class="lc2" ><input type="text" name="SUBCONPROP" disblank title="持股比例" datatype='NUM' maxlength=30 >&nbsp;<font color=red>*</font></td>    
	
</tr>
<tr>
	<td class="lc1" >实缴出资额</td>
	<td class="lc2">
	<input type="text" name="ACCONAM" onblur='doblurregcap()' size="14" maxlength="14" datatype='NUM' title='实缴出资额(万元)' disblank>&nbsp;<font color=red>*</font>万元
	</td>
    <td class="lc1" >余额缴付期限</td>
	<td class="lc2">
	<input type="text" name="BALDELTERM" maxlength=10 title='余额缴付期限' class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype=DATE>
	</td>
</tr>
<tr>
	<td class='lc1'>评估方式</td>
	<td class="lc2">
		<select name="EVALSTY" disblank title="评估方式">
			<option value=''>--评估方式--</option>
			<%=icms.getSysDmList("EVALSTY")%>
		</select>&nbsp;<font color=red>*</font>
	</td>
	<td class='lc1'>承担责任方式</td>
	<td class="lc2">
		<select name="ONDUTYSTY" disblank title="承担责任方式">
			<option value=''>--承担责任方式--</option>
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
		    alert('认缴出资额不允许是负值！');
			return false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('认缴出资额超过系统最大精度！');
			return false;
		}
	}
	else
	{
		alert('认缴出资额应为数字！');
		return false;
	}

	var ACCONAM = document.getElementById("ACCONAM").value;
	if (fucCheckNUM(ACCONAM))
	{
		if(ACCONAM<0){
		    alert('实缴出资额不允许是负值！');
			return false;
		}
		if (Math.abs(ACCONAM)>999999999999)
		{
			alert('实缴出资额超过系统最大精度！');
			return false;
		}
	}
	else
	{
		alert('实缴出资额应为数字！');
		return false;
	}
}
function chebaldelterm()//余额缴付期限  实缴<认缴的时候，必须填写该字段
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	var ACCONAM = document.getElementById("ACCONAM").value;
	var BALDELTERM = document.getElementById("BALDELTERM").value;
	if((ACCONAM-SUBCONAM)<0)
	{
	   if(BALDELTERM==null||BALDELTERM==""){
	      //alert('余额缴付期限不能为空！');
	      //return false;
	   }
	}else if((ACCONAM-SUBCONAM)>0)
	{
	   alert('实缴出资额不能大于认缴出资额！');
	   return false;
	}
}
</script>
