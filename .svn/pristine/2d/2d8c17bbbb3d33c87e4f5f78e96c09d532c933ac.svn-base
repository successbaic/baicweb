<table border="1" width="100%" cellpadding="0" cellspacing="0" >
   <tr> 
	<td class="lc1">股东（发起人）名称或姓名</td>   
	<td class="lc2" ><input type="text" name="INV"  disblank title="“投资人”是个人的，请填写个人姓名、证件类型及证件号码；“投资人”是企业的，请填写企业名称、证照类型及证照号码" maxlength=30 size="30%">&nbsp;<font color=red>*</font>	</td> 	 
	<td class="lc1" nowrap="nowrap">投资人类型</td>   
	<td class="lc2"><select size="1" name="INVTYPE" title="投资人类型" disblank style="width:192px;" onchange="setInIitem()">
	<option value=''>请选择投资人类型</option><%=icms.getSysDmList("INVTYPE")%>
	</select>
	&nbsp;<font color=red>*</font>
	</td>  
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1" >证件类型</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="证件类型" style="width:192px;">
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select></td>    
	<td class="lc1" >证件号码</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" title="证件号码" maxlength=20 ></td> 
   </tr>
   <tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >证照类型</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='证照类型'>
	<option value=''>请选择证照类型</option><%=icms.getSysDmList("BLICTYPE")%></select></td>
	<td class="lc1" >证照号码</td>
	<td class="lc2">
		<input type="text" name="BLICNO" size="30" maxlength="18" title='证照号码'></td>
</tr>
  <tr> 
	<td class="lc1" >认缴出资额（万元）</td>   
	<td class="lc2" ><input type="text" name="SUBCONAM" id="SUBCONAM" title="认缴出资额" datatype='NUM' maxlength=30 size="30%"></td> 
	<td class="lc1" >出资比例（%）</td>   
	<td class="lc2" ><input type="text" name="SUBCONPROP" disblank title="出资比例" datatype='NUM' maxlength=30 size="30%">&nbsp;<font color=red>*</font></td>    
   </tr> 
   
<tr>
<td class="lc1">出资方式</td>
	<td class="lc2">
	<select size="1"  disblank title='出资方式' name="CONFORM">
	<option value=''>请选择出资方式</option>
	<%=icms.getSysDmList("CONFORM")%>
	</select>
	</td>
	
	<td class="lc1">出资时间</td>
	<td class="lc2">
	<input type="text" name="CONDATE" title='出资时间'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype=DATE disblank>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、“投资人类型”是自然人股东、农民自然人、非农民自然人、外籍自然人、华侨的，请填写证件类型及证件号码；其余的，请填写证照类型及证照号码。<br>
    </td>    
</tr>   
</table>
<script>
function doblurregcap()
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	var REGCAP = document.getElementById("REGCAP").value;
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
        //if(REGCAP!=null&&REGCAP!=""&&(REGCAP-0)>0){
		//   if(SUBCONAM/REGCAP>1){
		//      alert('认缴出资额超过企业的注册资本！');
		//	  return false;
		//   }else{
		//      document.getElementById("SUBCONAM").value=FormatNumber(SUBCONAM/REGCAP*100,2);
		//   } 
		//}
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
		if((ACCONAM-SUBCONAM)>0)
	    {
	        alert('实缴出资额不能大于认缴出资额！');
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
	}
}
</script>