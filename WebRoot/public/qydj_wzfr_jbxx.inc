<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>(非公司)外商投资企业基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">名称</td>   
	<td class="lc2" colspan="3">
	<input type="text" name="ENTNAME" READONLY size="70" title="名称" maxlength=50 disblank>&nbsp;<font color=red>*</font>
	</td>
	
	  <td class="lc1">国别</td>
	<td class="lc2">	
	  <input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" size="10" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="国别" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="选 择..">					
		<font color=red>*</font> 
	</td>	
</tr>

  <tr>	
	<td class="lc1" nowrap>住所</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>住所请按下面的格式填写，系统会自动合并。<br/>
 		<select name="PROVINCE" title="省" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						省/直辖市/自治区） 
						<select name="CITY" id="CITY" title="（市/地区/盟/自治州）" maxlength=20 onchange="cityChange()" disblank>
							<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>
						（市/地区/盟/自治州）
						 <select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="（区/县/县级市/旗） " maxlength=20 disblank>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getCITY())%>
						</select>（区/县/县级市/旗）
						 <input type="text" name="TOWN" id="TOWN" title="乡" size="23" maxlength=25 onchange="writeDOM()">（乡/民族乡/镇/街道）
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="村" size="23" maxlength=25 onchange="writeDOM()">（路/村/社区）
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="号" size="10" maxlength=25 onchange="writeDOM()">（号） 
 		                <font color=red>*</font>
						<br>
						您录入的住所为：<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="住所" >
 		<font color=red>*</font>
 	</td></tr>
 	
 	
<tr>	
	<td class="lc1" nowrap >生产经营地</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>生产经营地请按下面的格式填写，系统会自动合并。<br/>									
						<select name="PROPROVINCE" id="PROPROVINCE" title="省" onchange="writePROLOC()">
						<%=icms.getSysDmList("PROVINCE")%>
						</select>
						省/直辖市/自治区） 
						<select name="PROCITY" id="PROCITY" title="（市/地区/盟/自治州）" maxlength=20 onchange="procityChange()" disblank>
							<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>
						（市/地区/盟/自治州）
						 <select name="PROCOUNTY" id="PROCOUNTY" onchange="writePROLOC()" title="（区/县/县级市/旗） " maxlength=20 disblank>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getPROCITY())%>
						</select>（区/县/县级市/旗）
						 <input type="text" name="PROTOWN" id="PROTOWN" title="乡" size="23" maxlength=25 onchange="writePROLOC()">（乡/民族乡/镇/街道）
 		                <input type="text" name="PROVILLAGE" id="PROVILLAGE" title="村" size="23" maxlength=25 onchange="writePROLOC()">（路/村/社区）
 		                <input type="text" name="PROHOUSENUMBER" id="PROHOUSENUMBER" title="号" size="10" maxlength=25 onchange="writePROLOC()">（号） 
 		                <font color=red>*</font>
						<br>
						您录入的生产经营地为：<input type="text" name="PROLOC" id="PROLOC" disblank style="width:380px" title="生产经营地" >
 		<font color=red>*</font>
 	</td></tr>
<tr>	
	<td class="lc1">联系电话</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="TEL" size="15" title="联系电话" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>   
 	
 	<td class="lc1">邮政编码</td>   
	<td class="lc2" colspan="2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr>	
	<td class="lc1" nowrap="nowrap">企业类型</td>   
	<td class="lc2" colspan="2" >
	<select name="ENTTYPE" disblank title="企业类型">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZFR")%></select>&nbsp;<font color=red>*</font>
	<!-- <input type="button" class="button"  style="height=20px;width=100px;" name="" value="企业类型简述" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/> -->
	</td>
 	
 	<td class="lc1" nowrap="nowrap">法定代表人姓名</td>   
	<td class="lc2" colspan="2"><input type="text" name="LEREP" title="法定代表人" size="40" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>

<tr> 
	<td class="lc1">投资总额</td>   
	<td class="lc2"><input type="text" name="CONGRO" id="CONGRO" title="投资总额" size="10" maxlength=20 onblur='checkCongro()'>&nbsp;万元</td> 
	
	<td class="lc1">币种</td>
	<td class="lc2" align="center"><input type="text" name="CONGROCUR_TEXT" id="CONGROCUR_TEXT" disabled>
		<input type="hidden" name="CONGROCUR" id="CONGROCUR" title="投资总额币种"><input type="button" class="button" onclick="getSelDm('CONGROCUR','CURRENCY','REGCAPCUR')" value="选 择..">							
	</td>
	
    <td class="lc1">折万美元</td>   
	<td class="lc2"><input type="text" name="CONGROUSD" id="CONGROUSD" title="投资总额折万美元" size="10" maxlength=20 onblur='checkCongro()'>&nbsp;万美元</td>     
						
</tr>
<tr>
	<td class="lc1">注册资本</td>   
	<td class="lc2">
	<input type="text" name="REGCAP" size="10" title="注册资本" maxlength=20 >&nbsp;万元</td>  	
	
	<td class="lc1">币种</td>
	<td class="lc2" align="center"><input type="text" name="REGCAPCUR_TEXT" id="REGCAPCUR_TEXT" disabled>
		<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" title="投资总额币种"><input type="button" class="button" onclick="getSelDm('REGCAPCUR','CURRENCY')" value="选 择..">							
	</td>
	
    <td class="lc1">折万美元</td>   
	<td class="lc2"><input type="text" name="REGCAPUSD" id="REGCAPUSD" title="投资总额折万美元" size="10" maxlength=20 onblur='checkCongro()'>&nbsp;万美元</td>     	
	
</tr>
<tr>
	<td class="lc1" >经营范围</td>
	<td  class="lc2" colspan="5">
	<textarea rows="4" id="BUSSCOPE" name="BUSSCOPE" title="经营范围" cols="100" maxlength=1000></textarea>
	</td>
</tr>

<tr> 	
	
    <td class="lc1">营业期限</td>   
	<td class="lc2" colspan="2">
	长期<input type="checkbox" name="checkboxInput" id="check1"  title="营业期限" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" title="营业期限" size="10" maxlength=10 >年
		</span><font color=red>*</font>
	</td> 
    
    <td class="lc1" nowrap="nowrap">执照副本数</td>   
	<td class="lc2" colspan="2"><input type="text" name="COPYNUM" title="执照副本数" disblank datatype=INT size="10" maxlength=2 value=1>份
    &nbsp;<font color=red >*</font>&nbsp;
    </td>
    
 </tr>
<tr> 	
	<td class="lc1">拟设立登记机关</td>   
	<td class="lc2" colspan="5"><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  	
 </tr>
 <tr>
	<td class="lc2" colspan="8">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
	<br>
    1、有红色<font color=red >*</font>标示的项目为必填项。	<br>
</tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
function checkCongro(){
    var CONGRO =document.getElementById("CONGRO").value;
	if(CONGRO!=null&&CONGRO!="")
	{
	   if (fucCheckNUM(CONGRO))
	    {
		 if (Math.abs(CONGRO)>999999999999)
		  {
			alert('投资总额超过系统最大精度！');
			return false;
		  }
	    }else
	    {
		    alert('投资总额应为数字！');
		    return false;
	    }
	}
	return true;
}
function checkDomeRegcap(){
    var DOMEREGCAP = document.getElementById("DOMEREGCAP").value;
    if(DOMEREGCAP!=null&&DOMEREGCAP!=""){
       if(fucCheckNUM(DOMEREGCAP))
	     {
	       if (Math.abs(DOMEREGCAP)>999999999999)
		     {
			    alert('中方注册资本超过系统最大精度！');
			    return false;
		     }
	     }   
	  else
	     {
	       alert('中方注册资本应为数字！');
		   return false;
	      }
    }
	return true;
}
function checkDomeRegcapUsd(){
    var DOMEREGCAPUSD = document.getElementById("DOMEREGCAPUSD").value;
    if(DOMEREGCAPUSD!=null&&DOMEREGCAPUSD!=""){
       if(fucCheckNUM(DOMEREGCAPUSD))
	     {
	       if (Math.abs(DOMEREGCAPUSD)>999999999999)
		     {
			    alert('中方注册资本折万美元超过系统最大精度！');
			    return false;
		     }
	     }   
	  else
	     {
	       alert('中方注册资本折万美元应为数字！');
		   return false;
	      }
    }
	return true;
}
function checkDomeRegcapInvrat(){
   //中方注册资本所占比例
	var DOMEREGCAPINVRAT = document.getElementById("DOMEREGCAPINVRAT").value;
	if(DOMEREGCAPINVRAT!=null&&DOMEREGCAPINVRAT!=""){
	   if(fucCheckNUM(DOMEREGCAPINVRAT))
	     {
	       if(Math.abs(DOMEREGCAPINVRAT)>100)
	        {
	           alert('中方注册资本所占比例超过100%！');
		       return false;
	        }
	     }
	   else
	     {
	       alert('中方注册资本所占比例应为数字！');
	       return false;
	     }
	}
	return true;   
}
function checkForRegcap(){
  //外方注册资本
   var FORREGCAP = document.getElementById("FORREGCAP").value;
   if(FORREGCAP!=null&&FORREGCAP!=""){
      if(fucCheckNUM(FORREGCAP))
	   {
	     if (Math.abs(FORREGCAP)>999999999999)
		  {
			alert('外方注册资本超过系统最大精度！');
			return false;
		  }
	   }
	  else
	   {
	     alert('外方注册资本应为数字！');
		 return false;
	   }
   }
   return true;

}
function checkForRegcapUsd(){
   //外方注册资本折万美元
   var FORREGCAPUSD = document.getElementById("FORREGCAPUSD").value;
   if(FORREGCAPUSD!=null&&FORREGCAPUSD!=""){
      if(fucCheckNUM(FORREGCAPUSD))
	   {
	     if (Math.abs(FORREGCAPUSD)>999999999999)
		  {
			alert('外方注册资本折万美元超过系统最大精度！');
			return false;
		  }
	   }
	  else
	   {
	     alert('外方注册资本折万美元应为数字！');
		 return false;
	   }
   }
   return true;
}
function checkForRegcapInvrat(){
    //外方注册资本所占比例
   var FORREGCAPINVRAT = document.getElementById("FORREGCAPINVRAT").value;
   if(FORREGCAPINVRAT!=null&&FORREGCAPINVRAT!=""){
     if(fucCheckNUM(FORREGCAPINVRAT))
	  {
	   if(Math.abs(FORREGCAPINVRAT)>100)
	    {
	      alert('外方注册资本所占比例超过100%！');
		  return false;
	    }
	  }
	else
	 {
	   alert('外方注册资本所占比例应为数字！');
	   return false;
	 }
   }
   return true;
}
function checkDomeReccap(){
  //中方实收资本
   var DOMERECCAP = document.getElementById("DOMERECCAP").value;
   if(DOMERECCAP!=null&&DOMERECCAP!=""){
      if(fucCheckNUM(DOMERECCAP))
	  {
	   if (Math.abs(DOMERECCAP)>999999999999)
		{
			alert('中方实收资本超过系统最大精度！');
			return false;
		}
	  }
	 else
	  {
	    alert('中方实收资本应为数字！');
		return false;
	  }
   }
   return true;
}
function checkDomeReccapUsd(){
   //中方实收资本折万美元
   var DOMERECCAPUSD = document.getElementById("DOMERECCAPUSD").value;
   if(DOMERECCAPUSD!=null&&DOMERECCAPUSD!=""){
      if(fucCheckNUM(DOMERECCAPUSD))
	  {
	   if (Math.abs(DOMERECCAPUSD)>999999999999)
		{
			alert('中方实收资本折万美元超过系统最大精度！');
			return false;
		}
	  }
	 else
	  {
	    alert('中方实收资本折万美元应为数字！');
		return false;
	  }
   }
   return true;
}
function checkDomeReccapConprop(){
   //中方实收资本所占比例
   var DOMERECCAPCONPROP = document.getElementById("DOMERECCAPCONPROP").value;
   if(DOMERECCAPCONPROP!=null&&DOMERECCAPCONPROP!=""){
      if(fucCheckNUM(DOMERECCAPCONPROP))
	   {
	     if(Math.abs(DOMERECCAPCONPROP)>100)
	      {
	        alert('中方实收资本所占比例超过100%！');
		    return false;
	      }
	   }
	  else
	   {
	     alert('中方实收资本所占比例应为数字！');
	     return false;
	   }
   }
   return true;
}
function checkForReccap(){
   //外方实收资本
   var FORRECCAP = document.getElementById("FORRECCAP").value;
   if(FORRECCAP!=null&&FORRECCAP!=""){
      if(fucCheckNUM(FORRECCAP))
	   {
	      if (Math.abs(FORRECCAP)>999999999999)
		   {
			  alert('外方实收资本超过系统最大精度！');
			  return false;
		   }
	   }
	  else
	   {
	      alert('外方实收资本应为数字！');
		  return false;
	   }
   }
   return true;
}
function checkForReccapUsd(){
   //外方实收资本折万美元
   var FORRECCAPUSD = document.getElementById("FORRECCAPUSD").value;
   if(FORRECCAPUSD!=null&&FORRECCAPUSD!=""){
      if(fucCheckNUM(FORRECCAPUSD))
	   {
	      if (Math.abs(FORRECCAPUSD)>999999999999)
		   {
			  alert('外方实收资本折万美元超过系统最大精度！');
			  return false;
		   }
	   }
	  else
	   {
	      alert('外方实收资本折万美元应为数字！');
		  return false;
	   }
   }
   return true;
}
function checkForReccapConprop(){
    //外方实收资本所占比例
	var FORRECCAPCONPROP = document.getElementById("FORRECCAPCONPROP").value;
    if(FORRECCAPCONPROP!=null&&FORRECCAPCONPROP!=""){
       if (fucCheckNUM(FORRECCAPCONPROP))
	    {
		  if (Math.abs(FORRECCAPCONPROP)>100)
		   {
			  alert('外方实收资本所占比例超过100%！');
			  return false;
		   }
	    }
	   else
	    {
		   alert('外方实收资本所占比例应为数字！');
		   return false;
	    }
    }
    return true;
}	
</script>