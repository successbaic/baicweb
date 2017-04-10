<table border="1" width="100%" >
<caption>外资企业变更登记事项</caption>
<input type="hidden" name="ALTTIME">
 <tr>
	<td class="yxsm" align="center" colspan="2">项目</td>
	<td class="yxsm" align="center">原登记事项</td>
	<td class="yxsm" align="center">申请变更登记事项</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">名称</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE01" disabled title="名称变更前内容" value="<%=QYDJ_JBXX_ZS.getENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF01" maxlength='50' title="名称变更后内容" maxlength='50' readonly><input type="button" value="查询" onclick="getMc()">
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">住所</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE02" disabled title="住所变更前内容" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="住所变更后内容" maxlength='50' readonly>
	<input type="button" value="点击录入" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1' align="center">邮政编码</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE69" disabled title="邮政编码变更前内容" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF69" datatype=int title="邮政编码变更后内容" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">联系电话</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE50" disabled title="联系电话变更前内容" maxlength='6' value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF50" title="联系电话变更后内容" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="03" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">法定代表人</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE03" disabled title="法定代表人姓名变更前内容" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF03" title="法定代表人姓名变更后内容" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="05" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">注册资本</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE05" disabled title="注册资本变更前内容" value="<%=QYDJ_JBXX_ZS.getREGCAP()%>" datatype="NUM"> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF05" onblur='doblurregcap()' title="注册资本变更后内容" maxlength='14' datatype="NUM"> 万元
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="110" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">注册资本币种</td>
	<td class='lc2'>
		<select  name="ALTBE110" disabled title="注册资本币种变更前内容">
			<option value=" "></option><%=icms.getSysDmList("CURRENCY")%>
		</select>
	</td>
	<td class='lc2'>
		<select  name="ALTAF110"  title="注册资本币种变更后内容">
			<option value=" "></option><%=icms.getSysDmList("CURRENCY")%>
		</select>
	</td>	
</tr>
<!--
<tr>
	<td class='lc1'><input name="ALTITEM" value="111" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">注册资金折万美元</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTBE111" disabled  title="注册资金折万美元变更前内容" value="<%=QYDJ_JBXX_ZS.getREGCAPUSD()%>" datatype="NUM"></td>
	<td class='lc2'><input type="text" size="14" onblur='doblurregcap()' name="ALTAF111" title="注册资金折万美元变更后内容" maxlength='14' datatype="NUM"></td>
</tr>
-->
<tr>
	<td class='lc1'><input name="ALTITEM"  value="20" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">投资总额</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTBE20"  disabled title="投资总额变更前内容" value="<%=QYDJ_JBXX_ZS.getCONGRO()%>" datatype="NUM">万元
	</td>
	<td class='lc2'><input type="text" size="14" name="ALTAF20" onblur='doblurregcap()' title="投资总额变更后内容" maxlength='14' datatype="NUM">万元
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="114" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">投资总额币种</td>
	<td class='lc2'>
	<select  name="ALTBE114" disabled title="投资总额币种变更前内容">
			<option value=" "></option><%=icms.getSysDmList("CURRENCY")%>
		</select>
	</td>
	<td class='lc2'>
		<select  name="ALTAF114"  title="投资总额币种变更后内容">
			<option value=" "></option><%=icms.getSysDmList("CURRENCY")%>
		</select>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">企业类型</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="企业类型变更前内容" disabled>
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","WZGS")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="企业类型变更后内容">
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","WZGS")%>
	</select></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>经营范围</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="经营范围变更前内容" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF12"  disabled title="经营范围变更后内容" maxlength='2000'></textarea>
	</td>
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">营业期限</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="营业期限变更前内容" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"长期":QYDJ_JBXX_ZS.getOPTO()%>">（截至日期）</td>
	<td class='lc2'>
	长期<input type="checkbox" name="checkboxInput" id="checkboxInput"  title="营业期限变更后内容" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="ALTAF08" id="ALTAF08" title="营业期限"  title="营业期限变更后内容" maxlength='10'>年
		<font color="red">请填写XX年</font>
		</span>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="10" type="checkbox"></td>
	<td class='lc1' align="center">投资人</td>
	<td class='lc2'colspan="2"><font color=red>投资人变更请选择变更事项，保存后填写“出资情况”！</font>
	<input type="hidden" name="ALTBE10" title="投资人变更前内容" maxlength='500'>
	<input type="hidden" name="ALTAF10" title="投资人变更后内容" maxlength='500'></td> 
</tr>
</table>

<script language="javascript">
function checkSub(){
	return true;
}
</script>