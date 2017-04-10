<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1">合伙人名称或姓名</td>   
	<td class="lc2"><input type="text" name="INV"  disblank title="“合伙人”是个人的，请填写个人姓名、证件类型及证件号码；“合伙人”是企业的，请填写企业名称、证照类型及证照号码" maxlength=30 size="30%">&nbsp;<font color=red>*</font>	</td> 	 
	
	<td class="lc1">国别(地区)</td>   
	<td class="lc2">
	   <input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="国别" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="选 择..">					
		<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1">合伙人类型</td>   
	<td class="lc2"><select size="1" name="INVTYPE" title="合伙人类型" disblank style="width:192px; " onchange="setInIitem()">
	<option value=''>请选择合伙人类型</option><%=icms.getSysDmList("INVTYPE")%>
	</select>&nbsp;<font color=red>*</font></td>  
    
    <td class='lc1'>承担责任方式</td>
	<td class="lc2">
	<select size="1" name="ONDUTYSTY" title="承担责任方式" disblank>
		<option value=''>--承担责任方式--</option>
		<%=icms.getSysDmList("ONDUTYSTY")%>
	</select><font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1">住所</td>   
	<td class="lc2" colspan='3'>
	<input type="text" name="DOM" title="住所" maxlength=50 size="50">	<font color=red>*</font>
	</td> 	 	
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1" >证件类型</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="证件类型" style="width:192px;">
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select><font color=red>*</font></td>    
	<td class="lc1" >证件号码</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" title="证件号码" maxlength=20 ><font color=red>*</font></td> 
</tr>
   <tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >证照类型</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='证照类型'>
	<option value=''>请选择证照类型</option><%=icms.getSysDmList("BLICTYPE")%></select><font color=red>*</font></td>
	<td class="lc1" >证照号码</td>
	<td class="lc2" >
		<input type="text" name="BLICNO" size="30" maxlength="18" title='证照号码'><font color=red>*</font></td>
</tr>
   <tr> 
	<td class="lc1" >认缴出资额（万元）</td>   
	<td class="lc2" ><input type="text" name="SUBCONAM" id="SUBCONAM" datatype='NUM' title="认缴出资额" maxlength=30 size="30%" disblank><font color=red>*</font></td> 
	<td class="lc1" >认缴出资方式</td>   
	<td class="lc2">
		<select size="1" name="CONFORM" title="出资方式填写：货币、实物、知识产权、土地使用权、其它" id="CONFORM" style="width:192px; " disblank>
		<option value=''>请选择认缴出资方式</option><%=icms.getSysDmList("CONFORM")%>
	    </select><font color=red>*</font>
	</td> 
   </tr> 
   <%--tr> 
	   
    <td class="lc1" >实缴出资额（万元）</td>   
	<td class="lc2" ><input type="text" name="ACCONAM" id="ACCONAM" onblur='doblurregcap()' title="实缴出资额"  maxlength=30 size="30%"></td>  	    
  </tr> 
  <tr> 	
	<td class="lc1" >实缴出资方式</td>   
	<td class="lc2" ><select size="1" name="ACCONFORM" title="出资方式填写：货币、实物、知识产权、土地使用权、其它" style="width:135px; ">
	<option value=''>请选择出资方式</option><%=icms.getSysDmList("CONFORM")%></select>
	</td> 
	
	<td class="lc1" >实缴出资时间</td>   
	<td class="lc2" ><input type="text" name="ACCONDATE" title="实缴出资时间" maxlength=10 datatype=DATE size="20%"  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	</td>
	
	<td class='lc1'>执行合伙事务标志</td>
	<td class="lc2">
	<select size="1" name="EXEAFFSIGN" title='执行合伙事务标志'>
		<option value=''>--执行合伙事务--</option>
		<option value='1'>执行</option>
		<option value='2'>不执行</option>
	</select>
	</td>
 </tr--%> 
<tr>
    <td class="lc1">出资时间</td>   
	<td class="lc2"><input type="text" name="CONDATE" title="出资时间" maxlength=10 datatype=DATE size="20%" disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})"><font color=red>*</font>
	</td>
	
	<td class="lc1" >出资比例（%）</td>   
	<td class="lc2" ><input type="text" name="SUBCONPROP" title="出资比例" maxlength=30 size="30%"></td>    
	
</tr>
 <tr>
    <td class="lc2" colspan='4' align="left"><p align="left" style="font-color: #000080;font-size: 9pt;">注意：1、有红色<font color=red >*</font>标示的项目为必填项。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、“合伙人”是自然人股东、外籍自然人、华侨的，请填写证件类型及证件号码；其余的，请填写证照类型及证照号码。<br>
</p>
    </td>    
</tr>   
</table>
<script>
function doblurregcap()
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	//var REGCAP = document.getElementById("REGCAP").value;
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
      //  if(REGCAP!=null&&REGCAP!=""&&(REGCAP-0)>0){
	  //     if(SUBCONAM/REGCAP>1){
	  //	       alert('认缴出资额超过企业的注册资本！');
	  //		   return false;
	  //	   }else{
	  //	      document.getElementById("CONPROP").value=SUBCONAM/REGCAP*100;
	  //	   } 
	  //	}
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