<table border="1" width="100%" >
<caption>外商投资合伙企业分支机构变更登记事项</caption>
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
	<td class='lc1' align="center">经营场所</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE02" disabled title="经营场所变更前内容" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF02" title="经营场所变更后内容" maxlength='50'>
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1' align="center">邮政编码</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="邮政编码变更前内容" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="邮政编码变更后内容" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">联系电话</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="联系电话变更前内容" maxlength='6' value="<%=QYDJ_JBXX_ZS.getTEL() %>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="联系电话变更后内容" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">企业类型</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="企业类型变更前内容" disabled>
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","WZHHFZ")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="企业类型变更后内容">
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","WZHHFZ")%>
	<%=icms.getSysDmList("ENTTYPE","WZGS")%>
	<%=icms.getSysDmList("ENTTYPE","WZFR")%>
	</select></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="21" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">负责人</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE21" disabled title="负责人姓名变更前内容" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF21" title="负责人姓名变更后内容" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="54" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">负责人住所</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE54" disabled title="负责人住所变更前内容" value=""></td>
	<td class='lc2'><input type="text" size="45" name="ALTAF54" title="负责人住所变更后内容" maxlength='50'></td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="105" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">隶属企业名称</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE105" disabled title="隶属企业名称变更前内容" value="<%=QYDJ_JBXX_ZS.getSUPENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF105" maxlength='50' title="隶属企业名称变更后内容" maxlength='50'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="06" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center" nowrap="nowrap">凭许可经营项目</td>
	<td class='lc2'>
		<textarea rows="3" cols="45" name="ALTBE06" disabled title="许可经营项目变更前内容"><%=QYDJ_JBXX_ZS.getABUITEMCO()%></textarea>
	</td>
	<td class='lc2'>
		<textarea rows="3" cols="45" name="ALTAF06" title="许可经营项目变更后内容" maxlength='1000'></textarea>
 	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">经营范围</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="经营范围变更前内容" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTAF12" title="经营范围变更后内容" maxlength='2000'></textarea>
	</td>
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">经营期限</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="经营期限变更前内容" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"长期":QYDJ_JBXX_ZS.getOPTO()%>">（截至日期）</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF08" title="经营期限变更后内容" maxlength='10' datatype="DATE" onclick="dropdowndate(this);">（截至日期）</td>
</tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>