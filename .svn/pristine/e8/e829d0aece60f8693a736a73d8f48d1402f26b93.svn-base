<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="yxsm" colspan="2" align="center">
			<p style="font-color: #000080; font-size: 11pt; font-weight: bold;">
				<font color=#000080>基本信息</font>
			</p></td>
	</tr>
	<tr>
		<td class="lc1" nowrap>申请企业名称</td>
		<td class="lc2"><input type="text" name="ENTNAME" size="60"
			title="企业(机构)名称" maxlength=50 disblank readonly="readonly">
			&nbsp; <font color=red>*</font></td>
	</tr>
	<tr>
		<td class="lc1" nowrap>备选企业名称1</td>
		<td class="lc2"><input type="text" name="ENTNAME1"
			readonly="readonly" size="60" title="备选企业名称1" maxlength=50>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>备选企业名称2</td>
		<td class="lc2"><input type="text" name="ENTNAME2"
			readonly="readonly" size="60" title="备选企业名称2" maxlength=50>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>备选企业名称3</td>
		<td class="lc2"><input type="text" name="ENTNAME3"
			readonly="readonly" size="60" title="备选企业名称3" maxlength=50>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>经营范围</td>
		<td><textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="经营范围"
				disblank cols="70" maxlength=2000></textarea>&nbsp;<font color=red>*</font>

			<input type="button" class="button" style="height=20px;width=120px;"
			name="" value="经营范围选择..." onClick="getJYFWStr('BUSSCOPE')"
			onMouseOver="this.className='mouseover'"
			onMouseOut="this.className='button'"></td>
	</tr>

	<tr>

		<td class="lc1" nowrap>注册资本（金）</td>
		<td class="lc2" nowrap><input type="text" name="REGCAP"
			id="REGCAP" title="注册资本" size="15" onblur='doblurregcap()'
			maxlength=14 datatype=NUM> &nbsp;&nbsp;&nbsp;（万元）&nbsp;</td>


	</tr>

	<tr>
		<td class="lc1" nowrap>拟登记机关</td>
		<td class="lc2" nowrap><select name="PREREGORG" id="PREREGORG"
			disblank title="拟登记机关" disabled>
				<option value=""></option>
				<%									
					out.println(icms.getBsDjjg(XZQH));
				%>
		</select></td>
	</tr>

	<tr>
		<td class="lc1" nowrap>企业(机构)类型</td>
		<td class="lc2"><select id="ENTTYPE" name="ENTTYPE" disblank
			title="企业(机构类型)">
				<option value=""></option>
				<%
					if (ENTCLASS.equals("1")) {
				%>
				<option value='1110'>1110|有限责任公司(国有独资)</option>
				<option value='1140'>1140|有限责任公司(国有控股)</option>
				<option value='1152'>1152|有限责任公司(自然人投资或控股的法人独资)</option>
				<option value='1213'>1213|股份有限公司(上市、国有控股)</option>
				<option value='1223'>1223|股份有限公司(非上市、国有控股)</option>
				<option value='2110'>2110|有限责任公司分公司(国有独资)</option>
				<option value='2140'>2140|有限责任公司分公司(国有控股)</option>
				<option value='2152'>2152|有限责任公司分公司(自然人投资或控股的法人独资)</option>
				<option value='2213'>2213|股份有限公司分公司(上市、国有控股)</option>
				<option value='2223'>2223|股份有限公司分公司(国有控股)</option>
				<%=icms.getSysDmList("ENTTYPE", "NZYY")%>
				<%=icms.getSysDmList("ENTTYPE", "NZFR")%>
				<%
					} else if (ENTCLASS.equals("2")) {
				%>
				<option value='1120'>1120|有限责任公司(外商投资企业投资)</option>
				<option value='1121'>1121|有限责任公司(外商投资企业合资)</option>
				<option value='1122'>1122|有限责任公司(外商投资企业与内资合资)</option>
				<option value='1123'>1123|有限责任公司(外商投资企业法人独资)</option>
				<option value='1130'>1130|有限责任公司(自然人投资或控股)</option>
				<option value='1150'>1150|一人有限责任公司</option>
				<option value='1151'>1151|有限责任公司(自然人独资)</option>
				<option value='1152'>1152|有限责任公司(自然人投资或控股的法人独资)</option>
				<option value='1190'>1190|其他有限责任公司</option>
				<option value='1200'>1200|股份有限公司</option>
				<option value='1210'>1210|股份有限公司(上市)</option>
				<option value='1211'>1211|股份有限公司(上市、外商投资企业投资)</option>
				<option value='1212'>1212|股份有限公司(上市、自然人投资或控股)</option>
				<option value='1219'>1219|其他股份有限公司(上市)</option>
				<option value='1220'>1220|股份有限公司(非上市)</option>
				<option value='1221'>1221|股份有限公司(非上市、外商投资企业投资)</option>
				<option value='1222'>1222|股份有限公司(非上市、自然人投资或控股)</option>
				<option value='1229'>1229|其他股份有限公司(非上市)</option>
				<option value='2000'>2000|内资分公司</option>
				<option value='2100'>2100|有限责任公司分公司</option>
				<option value='2120'>2120|有限责任公司分公司(外商投资企业投资)</option>
				<option value='2121'>2121|有限责任公司分公司(外商投资企业合资)</option>
				<option value='2122'>2122|有限责任公司分公司(外商投资企业与内资合资)</option>
				<option value='2123'>2123|有限责任公司分公司(外商投资企业法人独资)</option>
				<option value='2130'>2130|有限责任公司分公司(自然人投资或控股)</option>
				<option value='2150'>2150|一人有限责任公司分公司</option>
				<option value='2151'>2151|有限责任公司分公司(自然人独资)</option>
				<option value='2152'>2152|有限责任公司分公司(自然人投资或控股的法人独资)</option>
				<option value='2190'>2190|其他有限责任公司分公司</option>
				<option value='2200'>2200|股份有限公司分公司</option>
				<option value='2210'>2210|股份有限公司分公司(上市)</option>
				<option value='2211'>2211|股份有限公司分公司(上市、外商投资企业投资)</option>
				<option value='2212'>2212|股份有限公司分公司(上市、自然人投资或控股)</option>
				<option value='2219'>2219|其他股份有限公司分公司(上市)</option>
				<option value='2220'>2220|股份有限公司分公司(非上市)</option>
				<option value='2221'>2221|股份有限公司分公司(非上市、外商投资企业投资）</option>
				<option value='2222'>2222|股份有限公司分公司(非上市、自然人投资或控股)</option>
				<option value='2229'>2229|其他股份有限公司分公司(非上市)</option>
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
		</select> &nbsp; <font color=red>*</font></td>

	</tr>
	<tr>
		<td class="lc1" nowrap>企业住所地</td>
		<td class="lc2"><font color="red">
		说明：</font>企业住所地请按下面的格式填写，系统会自动合并。
		<br />
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
	</tr>

	<tr>
		<td class="lc2" colspan="2">
			<p align="left" style="font-color: #000080; font-size: 9pt;">
				说明：有红色 <font color=red>*</font>标示的项目为必填项。
			</p></td>
	</tr>
</table>