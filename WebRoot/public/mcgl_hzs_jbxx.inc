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
			申请名称
		</td>
		<td class="lc2" colspan="5">
			<input type="text" name="ENTNAME"  size="60"
				title="申请名称" maxlength=50 disblank readonly="readonly">
			&nbsp;
			<font color=red>*</font>
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			备选名称1
		</td>
		<td class="lc2" colspan="5">
			<input type="text" name="ENTNAME1" readonly="readonly" size="60"
				title="备选名称1" maxlength=50 >
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			备选名称2
		</td>
		<td class="lc2" colspan="5">
			<input type="text" name="ENTNAME2" readonly="readonly" size="60"
				title="备选名称2" maxlength=50 >
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			备选名称3
		</td>
		<td class="lc2" colspan="5">
			<input type="text" name="ENTNAME3" readonly="readonly" size="60"
				title="备选名称3" maxlength=50 >
			&nbsp;
		</td>
	</tr>				
	<tr>
		<td class="lc1" nowrap>
			业务范围
		</td>
		<td colspan="5">
		<textarea rows="6" id="BUSSCOPE" name="BUSSCOPE" title="业务范围" cols="75" maxlength=1500></textarea>
		<input type="button" class="button" value="业务范围选择..." onClick="getJYFWStr('BUSSCOPE')">
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			住所
		</td>
		<td class="lc2" colspan="5">
						<font color="red">说明：</font>企业住所地请按下面的格式填写，系统会自动合并。<br/>									
						<select name="PROVINCE" id="PROVINCE" title="省"  onchange="writeDOM()">
						<%=icms.getSysDmList("PROVINCE")%>	
						</select>
						省/直辖市/自治区） 
						<select name="CITY" id="CITY" title="市" maxlength=20>
						<option value='<%=XZQH%>'><%=icms.getSysDm("XZQH",XZQH)%></option>
						</select>（市/地区/盟/自治州）
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()"  title="县" maxlength=20>
							<%=icms.getSysDmListByRemark("DISCOUS",XZQH) %>
						</select>（区/县/县级市/旗）
						
						 <input type="text" name="TOWN" id="TOWN" title="乡" size="23" maxlength=25 onchange="writeDOM()">（乡/民族乡/镇/街道）
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="村" size="23" maxlength=25 onchange="writeDOM()">（路/村/社区）
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="号" size="10" maxlength=25 onchange="writeDOM()">（号） 
						<br>
						您录入的住所为：<input type="text" name="DOM" id="DOM" maxlength="100" disblank style="width:380px;" title="企业所在地" > <font color=red>*</font>
					</td>
	</tr>
	
	<tr>
		<td class="lc1" nowrap>
			拟登记机关
		</td>
		<td class="lc2" colspan="5">
			<select name="PREREGORG" id="PREREGORG" disblank title="拟登记机关" disabled>
				<option value=""></option>
				<%out.println(icms.getBsDjjg(XZQH));%>
			</select>
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			所属工商所
		</td>
		<td class="lc2" colspan="5">
			<select id="LOCALADM" name="LOCALADM" disblank title="所属工商所">
				<option value=""></option>
				<%
				out.print(icms.getBjgGss(MCGL_JBXX.getPREREGORG()));
				%>
				</select>
			&nbsp;
			<font color=red>*</font>
		</td>

	</tr>
	<input type="hidden" name="ENTTYPE" id="ENTTYPE" value="9100">
	<tr>
		<td class="lc2" colspan="6">
			<p align="left" style="font-color: #000080; font-size: 9pt;">
				说明：有红色
				<font color=red>*</font>标示的项目为必填项。		
			</p>
		</td>
	</tr>
</table>