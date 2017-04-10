<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="8" algin="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>农民专业合作社分支机构基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">名  称</td>   
	<td class="lc2" colspan="4">
	<input type="text" name="ENTNAME" READONLY size="70" title="名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

<tr>	
	<td class="lc1" nowrap>营业场所</td>   
 	<td class="lc2" colspan="4">
		<font color="red">说明：</font>营业场所请按下面的格式填写，系统会自动合并。<br/>
 		<select name="PROVINCE" title="省" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						省/直辖市/自治区） 
						<select name="CITY" id="CITY" title="市" maxlength=20 onchange="cityChange()">
						<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>（市/地区/盟/自治州）
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="县" maxlength=20>
							<!--div id="COUNTYOPT" width='100'></div-->
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
		<font color="red">说明：</font>企业住所地请按下面的格式填写，系统会自动合并。<br/>									
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
    <td class="lc1">邮政编码</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
    
    <td class="lc1" style="width:110px;">联系电话</td>   
	<td class="lc2">
	<input type="text" name="TEL" size="15" title="联系电话" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
</tr>
<tr>   
    <td class="lc1" nowrap="nowrap">负责人姓名</td>   
	<td class="lc2" colspan="4" ><input type="text" name="LEREP" title="法定代表人" size="20" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr>
	<td class="lc1" >业务范围</td>
	<td colspan="4">
		<table width="100%" style="border-style:none;">
			<tr>
				<td class="lc2" >
					<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="业务范围" cols="70" maxlength=333></textarea>
				</td>
				<td class="lc2" width="33%">
					<input type="button" class="button" style="height:20px;width:120px;" name="" value="业务范围选择..." onClick="getJYFWStr('BUSSCOPE')"> 
				</td>
			</tr>
		</table>
	</td>
	 </td>  
</tr>
<tr> 	
	<td class="lc1" nowrap="nowrap">拟设立登记机关</td>   
	<td class="lc2" colspan="2"><select name="REGORG" id="REGORG" title="“拟设立登记机关”" disblank style="width:192px; " onchange="loadgss()"> 
	<option value=''>请选择登记机关</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select>&nbsp;<font color=red>*</font>
	<input type="hidden" name="ENTTYPE" title="企业类型" value="9200">
	</td> 	 	
	<td class="lc1" nowrap>核算方式</td>   
	<td class="lc2" >
	<select name="CALCULATIONMETHOD" title="核算方式" style="width:180px;" disblank> 
	<option value=''>请选择核算方式</option>
	<%=icms.getSysDmList("CALCULATIONMETHOD")%>
	</select>
	&nbsp;<font color=red>*</font>
	</td>
</tr>
<%--tr> 	
	<td class="lc1">管辖单位</td>   
	<td class="lc2" colspan="3"><select id="OPELOCDISTRICT" name="OPELOCDISTRICT" title="管辖单位" style="width:220px; " disabled> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getSysDmListByRemark("REGORG","3",XZQH)%>
	</select></td> 
</tr--%>
<tr>	
	<td class="lc1">管片工商所</td>   
	<td class="lc2" colspan="4"><select name="LOCALADM" id="LOCALADM" title="管片工商所" style="width:220px; "> 
	<option value=''>请先选择登记机关</option>
	</select></td>
	</td>
</tr>
 <tr>
	<td class="lc2" colspan="8">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
	所有信息均为必填项，没有的请填写“无”。
 </tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>