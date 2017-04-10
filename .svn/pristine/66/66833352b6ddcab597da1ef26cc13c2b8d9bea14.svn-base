<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1">投资人类型</td>
	<td class="lc2">
		<!--
		<select size="1" id="INVTYPE" name="INVTYPE"  title="投资人类型" disabled="disabled" disblank>
			<option value=''>请选择投资人类型</option>
		<%=icms.getSysDmList("INVTYPE")%>
     </select>&nbsp;<font color=red>*</font>
	<img src="<%=request.getContextPath() %>/images/usinghelp.png" style="width:20px;height: 20px;position: relative;top:0px;cursor: pointer;" onclick="showTzrLx('INVTYPE','INVTYPEContent','radio')"/>
	-->
	<select size="1" id="INVTYPE" name="INVTYPE"  title="投资人类型" disblank>
			<option value=''>请选择投资人类型</option>
		<%if(MCGL_JBXX.getENTTYPE().equals("1151")){ %>		
		<%=icms.getSysDmListLIKERemark("INVTYPE","ZRR")%>
		<%}else{ if(MCGL_JBXX.getENTTYPE().equals("1152")){%>
		<%=icms.getSysDmListLIKERemark("INVTYPE","FZR")%>
		<%}else{ %>
		<%=icms.getSysDmListLIKERemark("INVTYPE",ENTTYPE)%>
		<%}}%>	
     </select>&nbsp;<font color=red>*</font>
	</td>
	<td class="lc1" nowrap="nowrap">姓名或名称</td>
	<td class="lc2" colspan="3">
	<input type="text" name="INV" size="60" maxlength="50" disblank title='姓名或名称'>&nbsp;<font color=red>*</font></td>
</tr>
<tr style="display:none" id="ZJLX_TR">
<td class="lc1">证件类型</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="证件类型" style="width:192px;">
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
	<td class="lc1" >投资额</td>
	<td class="lc2">
	<input type="text" name="SUBCONAM" size="14" maxlength="14" datatype='NUM' onchange='doblurcongro()' title='投资额'>万元&nbsp;
	</td>
	<td class="lc1" >投资比例</td>
	<td class="lc2">
	<input type="text" name="CONPROP" size="14" maxlength="14" disabled datatype='NUM' title='投资比例'> %&nbsp;
</tr>
</table>
<script LANGUAGE="JavaScript">
function doblurcongro()
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	var JB_REGCAP = document.getElementById("JB_REGCAP").value;
	var ret=true;
	if (fucCheckNUM(SUBCONAM))
	{
		if(SUBCONAM<0){
		    alert('投资额不允许是负值！');
			ret= false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('投资额超过系统最大精度！');
			ret= false;
		}
        if(JB_REGCAP!=null&&JB_REGCAP!=""&&(JB_REGCAP-0)>0){
		   if(SUBCONAM/JB_REGCAP>1){
		      alert('投资额超过企业的注册资本！');
			  ret= false;
		   }else{
		      document.getElementById("CONPROP").value=FormatNumber(SUBCONAM/JB_REGCAP*100,2);
		   } 
		}
	}
	else
	{
		alert('投资额应为数字！');
		ret= false;
	}
	if(!ret){
		document.form1.btSave.disabled=false;
	}
	return ret;
}
</script>