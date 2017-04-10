<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="yxsm" colspan="6" align="center">
		<p
			style="font-color: #000080; font-size: 11pt; font-weight: bold;">
			<font color=#000080>基本信息</font>
		</p>
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		拟设立企业名称
	</td>
	<td class="lc2" colspan="3">
		<input type="text" name="ENTNAME" size="60" title="企业(机构)名称"
			maxlength=50 disblank readonly="readonly">
		&nbsp;
		<font color=red>*</font>
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		备选企业名称1
	</td>
	<td class="lc2" colspan="3">
		<input type="text" name="ENTNAME1" readonly="readonly" size="60"
			title="备选企业名称1" maxlength=50 >
		&nbsp;
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		备选企业名称2
	</td>
	<td class="lc2" colspan="3">
		<input type="text" name="ENTNAME2" readonly="readonly" size="60"
			title="备选企业名称2" maxlength=50 >
		&nbsp;
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		备选企业名称3
	</td>
	<td class="lc2" colspan="3">
		<input type="text" name="ENTNAME3" readonly="readonly" size="60"
			title="备选企业名称3" maxlength=50 >
		&nbsp;
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		拟定企业住所
	</td>
	<td class="lc2" colspan="3">
						<font color="red">说明：</font>企业住所地请按下面的格式填写，系统会自动合并。<br/>									
					<select name="PROVINCE" id="PROVINCE" title="省" onchange="writeDOM()">
					<%=icms.getSysDmList("PROVINCE")%>
					</select>
					省/直辖市/自治区） 
					<select name="CITY" id="CITY" title="（市/地区/盟/自治州）" maxlength=20 onchange="cityChange()" disblank>
						<%=ContrInfo.getDiShiOption(icms,XZQH)%>
					</select>
					（市/地区/盟/自治州）
					 <select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="（区/县/县级市/旗） " maxlength=20 disblank>
						<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,MCGL_JBXX.getCITY())%>
					</select>
					（区/县/县级市/旗） 
					<input type="text" name="TOWN" id="TOWN" title="乡" size="23" maxlength=25 onchange="writeDOM()">（乡/民族乡/镇/街道） 
					<input type="text" name="VILLAGE" id="VILLAGE" title="村" size="23" maxlength=25	onchange="writeDOM()">（路/村/社区） 
					<input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="号" size="10" maxlength=25 	onchange="writeDOM()">（号）
					<br>
						您录入的企业所在地为：
					<input type="text" name="DOM" id="DOM" disblank maxlength="100" style="width:380px" title="企业所在地">
					<font color=red>*</font></td>
					</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		拟登记机关
	</td>
	<td class="lc2" nowrap colspan="3">
		<select name="PREREGORG" id="PREREGORG" disblank title="拟登记机关" disabled>
			<option value=""></option>
			<%			
			out.println(icms.getBsDjjg(XZQH));%>
		</select>
	</td>
</tr>
<tr>
<td class="lc1">投资总额</td>
<td class="lc2">
<input style="margin-left: 10px;height: 18px;width: 150px;" type="text" maxlength="14" id="CONGRO" name="CONGRO" title="金额" datatype='NUM'> 万元
</td>
<td class="lc1">币种</td>
<td class="lc2">
<input type="text" name="CONGROCUR_TEXT" id="CONGROCUR_TEXT" disabled>
<input type="hidden" name="CONGROCUR" id="CONGROCUR" title="投资总额币种" ><input type="button" class="button" onclick="getSelDm('CONGROCUR','CURRENCY')" value="选 择..">					

</td>
</tr>

<tr>
<td class="lc1">注册资本</td>
<td class="lc2">
<input style="margin-left: 10px;height: 18px;width: 150px;" type="text" id="REGCAP" name="REGCAP" title="金额" datatype='NUM' maxlength="14"> 万元

</td>
<td class="lc1">币种</td>
<td class="lc2">
<input type="text" name="REGCAPCUR_TEXT" id="REGCAPCUR_TEXT" disabled>
<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" title="注册资本币种" ><input type="button" class="button" onclick="getSelDm('REGCAPCUR','CURRENCY')" value="选 择..">

</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		企业类型
	</td>
	<td class="lc2" colspan="3">
		<select id="ENTTYPE" name="ENTTYPE" disblank title="企业(机构类型)">
			<option value=""></option>
			<%
				if (ENTCLASS.equals("1")) {
			%>
			<%=icms.getSysDmList("ENTTYPE", "GS")%>
			<%=icms.getSysDmList("ENTTYPE", "FGS")%>
			<%=icms.getSysDmList("ENTTYPE", "NZYY")%>
			<%=icms.getSysDmList("ENTTYPE", "NZFR")%>
			<%
				} else if (ENTCLASS.equals("2")) {
			%>
			<%=icms.getSysDmList("ENTTYPE", "GS")%>
			<%=icms.getSysDmList("ENTTYPE", "FGS")%>
			<%=icms.getSysDmList("ENTTYPE", "GRDZ")%>
			<%=icms.getSysDmList("ENTTYPE", "GRDZFZ")%>
			<%=icms.getSysDmList("ENTTYPE", "HHQY")%>
			<%=icms.getSysDmList("ENTTYPE", "HHQYFZ")%>
			<%
				} else if (ENTCLASS.equals("6")) {
			%>
			<%=icms.getSysDmList("ENTTYPE", "HZS")%>
			<%=icms.getSysDmList("ENTTYPE", "HZSFZ")%>
			<%
				} else if (ENTCLASS.equals("8")) {
			%>
			<%=icms.getSysDmList("ENTTYPE", "WZGS")%>
			<%=icms.getSysDmList("ENTTYPE", "WZFZ")%>
			<%=icms.getSysDmList("ENTTYPE", "WGDB")%>
			<%=icms.getSysDmList("ENTTYPE", "WGJY")%>
			<%=icms.getSysDmList("ENTTYPE", "WZHH")%>
			<%=icms.getSysDmList("ENTTYPE", "WZHHFZ")%>
			<%
				}
			%>
		</select>
		&nbsp;
		<font color=red>*</font>						
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		经营期限
	</td>
	<td class="lc2" colspan="3">
		长期<input type="checkbox" name="checkboxInput" id="check1"  title="营业期限" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" id="OPDATETO" title="营业期限" size="10" maxlength=10 >年
		<font color=red>*</font>
	</td>
</tr>			
	<tr>
	<td class="lc1" nowrap>经营范围</td> 
	<td colspan="3">
	<table width="100%" style="border-style:none;">
	<tr>
	<td rowspan="3" class="lc2" >
	<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>
	</td>
	<td class="lc2" width="33%">
	<input type="button" class="button" style="height=20px;width=120px;" name="" value="经营范围选择..." onClick="getJYFWStr('BUSSCOPE')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	</td>
	</tr>
	
	</table>
	</td>

				<tr>
		<td class="lc2" colspan="6">
			<p align="left" style="font-color: #000080; font-size: 9pt;">
				说明：有红色
				<font color=red>*</font>标示的项目为必填项。
			</p>
		</td>
	</tr>
</table>