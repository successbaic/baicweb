<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>非公司企业法人基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" width="140px">名  称</td>   
	<td class="lc2" colspan="3">
	<input type="text" name="ENTNAME" READONLY size="50" title="名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>
<tr>	
	<td class="lc1" nowrap>住所</td>   
 	<td class="lc2" colspan="5">
		<select name="PROVINCE" title="省" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						省/直辖市/自治区） 
						<select name="CITY" id="CITY" title="市" maxlength=20>
						<option value='<%=XZQH%>'><%=icms.getSysDm("XZQH",XZQH)%></option>
						</select>（市/地区/盟/自治州）
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="县" maxlength=20>
							<!--div id="COUNTYOPT" width='100'></div-->
							<%=icms.getSysDmListByRemark("DISCOUS",XZQH) %>
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
	<td class="lc2"><input type="text" name="TEL" title="联系电话" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 

	<td class="lc1">邮政编码</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 
</tr>
<tr> 
	<td class="lc1" width="140px">法定代表人</td>   
	<td class="lc2"><input type="text" name="LEREP" title="法定代表人" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1">注册资金</td>   
	<td class="lc2">
	<input type="text" name="REGCAP" id="REGCAP" title="注册资本" size="15" onblur='doblurregcap()' maxlength=14 datatype=NUM>万元</td>  
</tr> 
<tr>
	<td class="lc1" nowrap>经营范围</td> 
	<td colspan="5">
	<table width="100%" style="border-style:none;">
	<tr>
	<td class="lc2" >
	<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>
	</td>
	<td class="lc2" width="33%">
	<input type="button" class="button" style="height=20px;width=120px;" name="" value="经营范围选择..." onClick="getJYFWStr('BUSSCOPE')"> 
	</td>
	</tr>
	</table>
	</td>
</tr> 
<tr>  
	<td class="lc1" >经济性质</td>   
	<td class="lc2" colspan="5"><select name="ENTTYPE" disblank title="经济性质" style="width:150px; ">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","NZFR")%></select>&nbsp;<font color=red>*</font>
	<!-- <input type="button" class="button"  style="height=20px;width=100px;" name="" value="企业类型简述" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/> -->
	</td>   
</tr>

<tr>	
	<td class="lc1" nowrap="nowrap">拟设立登记机关</td>   
	<td class="lc2"><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td> 	
	</td>
	<td class="lc1" style="width:80px;">管辖单位</td>
	<td class="lc2" colspan="3"><select name="OPELOCDISTRICT" title="管辖单位" style="width:180px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">主管部门(出资人)</td>   
	<td class="lc2" colspan="5"><input type="text" name="DEPINCHA" title="主管部门(出资人)" size="40" maxlength=50 disblank>&nbsp;<font color=red>*</font>
 	</td>
 	<!--
 	<td class="lc1">主管部门注册号</td>   
	<td class="lc2"><input type="text" name="SUPREGNO" title="主管部门注册号" size="15" maxlength=15></td>
	--> 
</tr>
<tr>
	<td class="lc1">营业期限</td>
	<td class="lc2" >
		长期<input type="checkbox" name="checkboxInput" id="check1"  title="营业期限" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" id="OPDATETO" name="OPDATETO" title="营业期限" size="10" maxlength=10 >年
		</span><font color=red>*</font>
	</td> 
	<td class="lc1">执照副本数</td>   
	<td class="lc2"><input type="text" name="COPYNUM" title="执照副本数" disblank datatype=INT size="15" maxlength=2 value=1>&nbsp;</td>	
 </tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
	<br>
    1、有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	2、营业期限：请填写“长期”或者“XX年”。
	<br>
 </tr>
</table>
<script language="javascript">
function checkSub(){
   if(!($("#check1").is(":checked")) && $.trim($("#OPDATETO").val()) == ""){
		alert("请输入营业期限！");
		return false;
	};
	return true;
}
function setBusscope()
{
document.form1.BUSSCOPE.value="许可经营项目："+document.form1.ABUITEMCO.value + "一般经营项目："+document.form1.CBUITEM.value;
}
</script>