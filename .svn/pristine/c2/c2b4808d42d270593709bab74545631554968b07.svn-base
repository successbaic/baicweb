<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="8" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>外资合伙企业分支机构基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">名称</td>   
	<td class="lc2" colspan="4">
	<input type="text" name="ENTNAME" READONLY size="60" title="名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

<tr>	
	<td class="lc1" nowrap>营业场所</td>   
 	<td class="lc2" colspan="4">
		<font color="red">说明：</font>营业场所请按下面的格式填写，系统会自动合并。<br/>
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
						您录入的营业场所为：<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="营业场所" >
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
	<input type="text" name="TEL" title="联系电话" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>    
 	
 	<td class="lc1">邮政编码</td>   
	<td class="lc2" ><input type="text" name="POSTALCODE" title="邮政编码" datatype=int maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>

<tr>
	<td class="lc1">负责人</td>   
	<td class="lc2" colspan="2"><input type="text" name="LEREP" title="负责人" size="30" maxlength=6 disblank>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1">副本数</td>   
	<td class="lc2"><input type="text" name="COPYNUM" title="申请副本数" datatype=INT size="10" maxlength=2 value=1 disblank>&nbsp;<font color=red>*</font></td> 		
</tr>

<tr>
   <td class="lc1" rowspan="3">隶属企业</td>
    <td class="lc1" colspan="2">企业注册号/统一社会信用代码</td>
   <td class="lc2" colspan="2">
   	<input type="text" id="SUPREGNO" name="SUPREGNO" title="隶属企业注册号" size="30" maxlength=18 disblank>&nbsp;<font color=red>*</font>
   </td>
   
</tr>
<tr>
  <td class="lc1">名称</td>
   <td class="lc2" colspan="1"><input type="text" id="SUPENTNAME" name="SUPENTNAME" title="隶属企业名称" size="50" maxlength=50 disblank>&nbsp;<font color=red>*</font>
   </td>
   <td class="lc1" nowrap="nowrap">登记机关</td>
   <td class="lc2">
      <input type="text" id="SUPREGORG" name="SUPREGORG" title="隶属企业登记机关" size="30" maxlength=100 disblank>&nbsp;<font color=red>*</font>
   </td>

   
</tr>
<tr>
	<td class="lc1" nowrap="nowrap">企业类型</td>   
	<td class="lc2">
	<select name="ECOCHR" id="ECOCHR" disblank title="企业类型">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZHH")%></select>&nbsp;<font color=red>*</font>
	</td>
   
	<td class="lc1">隶属企业<br>营业期限</td>   
	<td class="lc2">
	自<input type="text" id="FORENTOPFROM" name="FORENTOPFROM" title="营业期限自" size="12" maxlength=20 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">&nbsp;<font color=red>*</font>
	至<input type="text" id="FORENTOPTO" name="FORENTOPTO" title="营业期限至" size="12" maxlength=20 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	</td>    
</tr>
<tr> 	
	<td class="lc1" nowrap="nowrap">拟设立登记机关</td>   
	<td class="lc2" colspan="2"><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>
	<td class="lc1" style="width:80px;">管辖单位</td>
	<td class="lc2"><select name="OPELOCDISTRICT" title="管辖单位" style="width:220px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td>   	
</tr>
<tr>
   <td class="lc1" nowrap="nowrap">企业类型</td>   
	<td class="lc2" colspan="3">
	<select name="ENTTYPE" disblank title="企业类型">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZHHFZ")%></select>&nbsp;<font color=red>*</font>
	</td>
</tr>

<tr> 
	<td class="lc1">经营范围</td>   
	<td class="lc2" colspan="7">
	   <table width="100%">
	     <tr>  
	      <td rowspan="2" class="lc2" >
	         <textarea rows="5" id="BUSSCOPE" name="BUSSCOPE" title="经营范围" cols="90" maxlength=1000></textarea>	         
	      </td>
	      <td class="lc2" width="20%">
	         <input type="button" class="button" style="height=20px;width=120px;" name="" value="经营项目选择..." onClick="getJYFWStr('BUSSCOPE')" > 
	      </td>
	    </tr>
	  </table>
	</td>
</tr>
<tr>
<td class="lc1" nowrap>核算方式</td>   
	<td class="lc2" colspan="7">
	<select name="CALCULATIONMETHOD" title="核算方式" style="width:180px;" disblank> 
	<option value=''>请选择核算方式</option>
	<%=icms.getSysDmList("CALCULATIONMETHOD")%>
	</select>
	&nbsp;<font color=red>*</font>
	</td>
</tr>

</table>
<script language="javascript">
function checkSub(){
	return true;	
}
function checkWorcap(){
   var WORCAP=document.getElementById("WORCAP").value;
	if(WORCAP!=null&&WORCAP!="")
	{
	   if (fucCheckNUM(WORCAP))
	    {
		   if (Math.abs(WORCAP)>999999999999)
		    {
			   alert('营运资金超过系统最大精度！');
			   return false;
		    }
	    }else
	    {
		   alert('营运资金应为数字！');
		   return false;
	    }
	}
	return true;
}
</script>