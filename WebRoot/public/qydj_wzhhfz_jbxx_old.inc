<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="8" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>外商投资公司基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap" align="center">分支机构名称</td>   
	<td class="lc2" colspan="4">
	<input type="text" name="ENTNAME" READONLY size="70" title="分支机构名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   

    <td class="lc1" align="center" nowrap="nowrap">联系电话</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="TEL" size="15" title="联系电话" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
</tr>
<tr>	
	<td class="lc1" align="center">经营场所</td>   
	<td class="lc2" colspan="4"><input type="text" name="DOM" title="经营场所" size="70" maxlength=50 disblank>&nbsp;<font color=red>*</font>
 	</td>
 	
 	<td class="lc1" align="center">邮政编码</td>   
	<td class="lc2" colspan="2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr> 	
 	<td class="lc1" nowrap="nowrap" align="center">负责人</td>   
	<td class="lc2" colspan="4"><input type="text" name="LEREP" title="负责人" size="40" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	

	<td class="lc1" align="center">从业人数</td>
	<td class="lc2" colspan="2">
	<input type="text" name="EMPNUM" size="20" title='从业人数' datatype='INT' maxlength=10>	
	</td>
</tr>
<%-- 
<tr>
    <td class="lc1" align="center">经营期限</td>
    <td class="lc2" colspan="7">
	自 <input type="text" name="OPFROM" size="20" disblank title='经营期限自' maxlength='6'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype='date'> 
	至 <input type="text" name="OPTO" size="20"  title='经营期限至' maxlength='6'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype='date'>        
    </td>
</tr>
--%>
<tr>
   <td class="lc1" rowspan=3 align="center">隶属企业</td>
   <td align="center" width="15%" class="lc1">名称</td>
   <td colspan=6><input type="text" name="SUPENTNAME" size="50"  title='隶属企业名称' maxlength='50'></td>
</tr>
<tr>
   <td align="center" class="lc1">登记机关</td>
   <td colspan=6><input type="text" name="SUPREGORG" size="50"  title='隶属企业登记机关' maxlength='50'></td>
</tr>
<tr>
   <td align="center" class="lc1">注 册 号</td>
   <td colspan=2><input type="text" name="SUPREGNO" size="20" title='隶属企业注册号' maxlength='15'></td>
   <td align="center" width="15%" class="lc1">电子邮箱</td>
   <td colspan=3><input type="text" name="SUPEMAIL" size="29"  datatype="EMAIL" title='隶属企业电子邮箱' maxlength='50'></td>
</tr>
<tr>
	<td class="lc1" align="center">经营范围</td>
	<td class="lc2" colspan="7">
	<textarea rows="4" id="BUSSCOPE" name="BUSSCOPE" title="经营范围" cols="100" maxlength=1000></textarea>
	</td>
</tr>
<tr>
    <td class="lc1" align="center">许可经营项目</td>
    <td class="lc2" colspan='7'>
        <textarea rows="4" name="ABUITEMCO" cols="100" disblank title='许可经营项目' maxlength='2000'></textarea>
    </td>
</tr>
<tr>	
	<td class="lc1" nowrap="nowrap" align="center">公司类型</td>   
	<td class="lc2" colspan="3" >
	<select name="ENTTYPE" disblank title="公司类型" style="width:150px; ">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZHHFZ")%></select>&nbsp;<font color=red>*</font>
	</td>
	
	<td class="lc1" align="center" nowrap>拟设立登记机关</td>   
	<td class="lc2" colspan="4"><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getSysDmList("REGORG")%>
	</select>&nbsp;<font color=red>*</font></td>  	
 </tr>
 <tr>
	<td class="lc2" colspan="8">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
	<br>
    1、有红色<font color=red >*</font>标示的项目为必填项。
	<br>	
	2、经营范围不能都为空。企业的经营范围应当包含或者体现企业名称中的行业或者经营特征，经营范围用语应当参照国民经济行业分类标准（参见经营项目），有取得许可证书的须注明证书有效期。
	<br>
	3、许可经营项目是指企业在申请登记前依据法律、行政法规、国务院决定应当报经有关部门批准的项目（参见前置审批目录）。</font></p></td>   
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