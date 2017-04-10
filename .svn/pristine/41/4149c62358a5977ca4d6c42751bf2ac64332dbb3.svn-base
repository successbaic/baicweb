<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>外资合伙公司基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap" colspan="1" align="center" width="15%">名称</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="ENTNAME" READONLY size="70" title="名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
	
   </tr>
<tr>	
	<td class="lc1" nowrap>营业场所</td>   
 	<td class="lc2" colspan="5">
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
	
 	 <td class="lc1" align="center">联系电话</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="TEL" size="15" title="联系电话" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
 	
 	<td class="lc1" align="center">邮政编码</td>   
	<td class="lc2" colspan="2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr> 	
 	<td class="lc1" nowrap="nowrap" colspan="2" align="center">执行事务合伙人或委派代表</td>   
	<td class="lc2" colspan="2"><input type="text" name="LEREP" title="执行事务合伙人或委派代表" size="30" maxlength=6 disblank>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1">国别</td>
	<td class="lc2">	
	  <input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" size="10" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="国别" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="选 择..">					
		<font color=red>*</font> 	
</tr>
<tr>
    <td class="lc1" nowrap="nowrap" colspan="1" align="center">企业类型</td>   
	<td class="lc2" colspan="5" >
	<select name="ENTTYPE" disblank title="企业类型" style="width:150px; ">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZHH")%></select>&nbsp;<font color=red>*</font></td>
</tr>

<tr>	
	<td class="lc1" nowrap="nowrap" colspan="1" align="center">认缴出资额</td>   
	<td class="lc2" colspan="2" >
	<input type="text" name="REGCAP" disblank size="20" maxlength=20 title="认缴出资额" >万元&nbsp; <font color=red>*</font></td>
    <td class="lc1" nowrap="nowrap" align="center">币种</td> 
	<td class="lc2" align="center" colspan="2"><input type="text" name="REGCAPCUR_TEXT" id="REGCAPCUR_TEXT" disabled>
		<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" title="注册资本币种" disblank><input type="button" class="button" onclick="getSelDm('REGCAPCUR','CURRENCY')" value="选 择..">					
		<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1" align="center">实缴出资额</td>   
	<td class="lc2" colspan="5" width="30%">
	<input type="text" name="RECCAP" size="20"  maxlength=20 disblank title="实缴出资额">万元&nbsp; <font color=red>*</font></td> 
	<%--td class="lc1" nowrap="nowrap" align="center">币种</td> 
    <td class="lc2" colspan="2" align="center"><input type="text" name="RECCAPCUR_TEXT" id="RECCAPCUR_TEXT" disabled>
		<input type="hidden" name="RECCAPCUR" id="RECCAPCUR" title="实收资本币种" disblank><input type="button" class="button" onclick="getSelDm('RECCAPCUR','CURRENCY')" value="选 择..">					
		<font color=red>*</font>
    </td--%>
</tr>

<tr>
	<td class="lc1" align="center">经<br>营<br>范<br>围</td>
	<td class="lc2" colspan="5">
	<textarea rows="6" id="BUSSCOPE" name="BUSSCOPE" title="经营范围" cols="100" maxlength=1000></textarea>
	</td>
</tr>
<tr> 	
	<td class="lc1" colspan="1" align="center">拟设立登记机关</td>   
	<td class="lc2" colspan="2"><select name="REGORG" title="拟设立登记机关" disblank style="width:180px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  	
	<td class="lc1" style="width:80px;">管辖单位</td>
	<td class="lc2" colspan="2"><select name="OPELOCDISTRICT" title="管辖单位" style="width:220px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
 </tr>
 <tr> 	
	<td class="lc1" nowrap="nowrap">执照副本数</td>   
	<td class="lc2" colspan="2"><input type="text" name="COPYNUM" title="执照副本数" disblank datatype=INT size="20" maxlength=2 value=1>份
    &nbsp;<font color=red >*</font>&nbsp;
    </td>
    
    <td class="lc1" width="15%">营业期限</td>   
	<td class="lc2" colspan="2" >
	长期<input type="checkbox" name="checkboxInput" id="check1"  title="营业期限" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" disblank title="营业期限" size="10" maxlength=10 >年
		</span><font color=red>*</font>
	</td> 
    
 </tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。	
    </font></p></td>   
 </tr>
</table>
<script language="javascript">

function checkSub(){

		return true;
}

</script>