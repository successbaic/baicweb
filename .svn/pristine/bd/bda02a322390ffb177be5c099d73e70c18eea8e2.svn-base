<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>分公司基本信息</font>
        </p>
        </td>
      </tr>
<tr>
	<td class="lc1">公司名称</td>   
	<td class="lc2" style="width:200px;">
	<input type="text" name="SUPENTNAME" id="SUPENTNAME" title="公司名称" size="30" maxlength=40 disblank>&nbsp;<font color=red>*</font></td>  
	<td class="lc1" >注册号/社会信用代码</td>   
	<td class="lc2">
	<input type="text" name="SUPREGNO" id="SUPREGNO" title="注册号/社会信用代码" size="15" disblank>&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>   
	<td class="lc1" nowrap="nowrap">分公司名称</td>   
	<td class="lc2" style="width:200px;">
	<input type="text" name="ENTNAME" READONLY size="20" title="分公司名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
	
	<td class="lc1" >负责人</td>   
	<td class="lc2"><input type="text" name="LEREP" title="负责人" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
	
</tr>

 <tr>	
	<td class="lc1" nowrap>营业场所</td>   
 	<td class="lc2" colspan="3">
		<font color="red">说明：</font>营业场所请按下面的格式填写，系统会自动合并。<br/>
 		<select name="PROVINCE" id="PROVINCE" title="省"  onchange="writeDOM()">
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
	<td class="lc1" nowrap="nowrap">邮政编码</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1">联系电话</td>   
	<td class="lc2"><input type="text" name="TEL" title="联系电话" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 	
</tr> 
 
<!--<tr>
	<td class="lc1">经营范围</td> 
	<td colspan="5">
	<table width="100%">
<tr>
	<td class="lc1" rowspan="2">许可经营项目</td>   
	<td rowspan="2" class="lc2">
	<textarea rows="5" id="ABUITEMCO" name="ABUITEMCO" title="经营范围分为许可经营项目和一般经营项目，两项中必须要填写一项，不能都为空。许可经营项目是指企业在申请登记前依据法律、行政法规、国务院决定应当报经有关部门批准的项目（参见前置审批目录）。一般经营项目是指不需批准，企业可以自主申请的项目。企业的经营范围应当包含或者体现企业名称中的行业或者经营特征，经营范围用语应当参照国民经济行业分类标准（参见经营项目），有取得许可证书的须注明证书有效期" cols="60" maxlength=1000></textarea>
	</td>
	<td class="lc2">
	<input type="button" class="button" style="height=20px;width=120px;" name="" value="许可经营项目选择..." onClick="getJYFWStr('ABUITEMCO')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	</td>
</tr>
<tr>
	<td class="lc2">
	<input type="button" class="button"  style="height=20px;width=120px;" name="" value="前置许可项目" onclick="javascript:window.showModalDialog('../demo/qzspml.htm','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"></input>
	</td>	
</tr>
<tr>    
	<td class="lc1" >一般经营项目</td>   
	<td class="lc2">
	<textarea rows="5"  id="CBUITEM"  name="CBUITEM" title="经营范围分为许可经营项目和一般经营项目，两项中必须要填写一项，不能都为空。许可经营项目是指企业在申请登记前依据法律、行政法规、国务院决定应当报经有关部门批准的项目（参见前置审批目录）。一般经营项目是指不需批准，企业可以自主申请的项目。企业的经营范围应当包含或者体现企业名称中的行业或者经营特征，经营范围用语应当参照国民经济行业分类标准（参见经营项目），有取得许可证书的须注明证书有效期" cols="60" maxlength=1000 >(须经审批的，未获批准前不得经营)</textarea>
	</td><td class="lc2">	
	<input type="button" class="button" style="height=20px;width=120px;" name="" value="一般经营项目选择..." onClick="getJYFWStr('CBUITEM')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	</td>    
</tr>
	</table>
	</td>
</tr> 
	-->
<tr>
	<td class="lc1" nowrap>经营范围</td> 
	<td colspan="3">
	<table width="100%" style="border-style:none;">
		<tr>
			<td class="lc2" >
				<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>
			</td>
			<td class="lc2" width="33%">
				<input type="button" class="button" style="height=20px;width=120px;" name="" value="经营范围选择..." onClick="getJYFWStr('BUSSCOPE')" > 
			</td>
		</tr>	
	</table>
	</td>
</tr>

<tr>    
	<td class="lc1" nowrap="nowrap">企业(机构)类型</td>   
	<td class="lc2" colspan="3"><select name="ENTTYPE" disblank title="企业(机构类型)">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","FGS")%></select>&nbsp;<font color=red>*</font>
	</td>   
</tr>
<tr> 	
	<td class="lc1" nowrap="nowrap">拟设立登记机关</td>   
	<td class="lc2"><select name="REGORG" title="拟设立登记机关" disblank > 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  
	<td class="lc1" style="width:80px;">管辖单位</td>
	<td class="lc2"><select name="OPELOCDISTRICT" title="管辖单位" style="width:180px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
	<td class="lc1" nowrap>执照副本数</td>   
	<td class="lc2" ><input type="text" name="COPYNUM" title="执照副本数" datatype=INT size="10" maxlength=2 value=1 disblank>
	&nbsp;<font color=red>*</font>
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

</table>
<script language="javascript">
function checkSub(){
    return true;	
}
function setBusscope()
{
document.form1.BUSSCOPE.value="许可经营项目："+document.form1.ABUITEMCO.value + "一般经营项目："+document.form1.CBUITEM.value;
}
</script>