<table border="1" width="100%" >
<caption>外商投资合伙企业变更登记事项</caption>
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
	<td class='lc1' align="center">主要经营场所</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE02" disabled title="主要经营场所变更前内容" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="主要经营场所变更后内容" maxlength='50' readonly>
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
	<input type="text" size="20" name="ALTBE50" disabled title="联系电话变更前内容" maxlength='16' value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF50" title="联系电话变更后内容" maxlength='16'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">企业类型</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="企业类型变更前内容" disabled>
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","WZHH")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="企业类型变更后内容">
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","WZHH")%>
	<%=icms.getSysDmList("ENTTYPE","WZGS")%>
	<%=icms.getSysDmList("ENTTYPE","WZFR")%>
	</select></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="116" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">执行事务合伙人或委派代表</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE116" disabled title="执行事务合伙人或委派代表变更前内容" maxlength='20' value="<%=QYDJ_JBXX_ZS.getLEREP() %>"></td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF116" title="执行事务合伙人或委派代表变更后内容" maxlength='20'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM"  value="117" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">认缴出资额</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTBE117" disabled title="认缴出资额变更前内容" maxlength='14' datatype="NUM" value="<%=QYDJ_JBXX_ZS.getREGCAP()%>">&nbsp;&nbsp;万元
	</td>
	<td class='lc2'>
	<input type="text" size="14"  name="ALTAF117" onblur='doblurregcap()' title="认缴出资额变更后内容" maxlength='14' datatype="NUM">&nbsp;&nbsp;万元
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="118" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">认缴出资额币种</td>
	<td class='lc2'>
	    <input type="text" name="ALTBE118" disabled title="认缴出资额币种变更前内容" value="<%=icms.getSysDm("CURRENCY",QYDJ_JBXX_ZS.getREGCAPCUR()) %>">
	</td>
	<td class='lc2'>
		<select  name="ALTAF118"  title="认缴出资额币种变更后内容">
			<option value=" "></option><%=icms.getSysDmList("CURRENCY")%>
		</select>
	</td>
</tr>
<!--  tr>
	<td class='lc1'><input name="ALTITEM" value="119" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">认缴出资额折万美元</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTBE119" disabled  title="认缴出资额折万美元变更前内容" maxlength='20' value="<%=QYDJ_JBXX_ZS.getREGCAPUSD() %>"></td>
	<td class='lc2'>
	<input type="text" size="14" onblur='doblurregcap()' name="ALTAF119" title="认缴出资额折万美元变更后内容" maxlength='14' datatype="NUM"></td>
</tr -->
<tr>
	<td class='lc1'><input name="ALTITEM" value="120" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">实缴出资额</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTBE120"  disabled title="实缴出资额变更前内容" maxlength='12' datatype="NUM" value="<%=QYDJ_JBXX_ZS.getRECCAP() %>">&nbsp;&nbsp;万元
	</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTAF120" onblur='doblurregcap()' title="实缴出资额变更后内容" maxlength='14' datatype="NUM">&nbsp;&nbsp;万元
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="121" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">实缴出资额币种</td>
	<td class='lc2'>
	<input type="text" name="ALTBE121" disabled title="实缴出资额币种变更前内容" value="<%=icms.getSysDm("CURRENCY",QYDJ_JBXX_ZS.getRECCAPCUR()) %>">
	</td>
	<td class='lc2'>
		<select  name="ALTAF121"  title="实缴出资额币种变更后内容">
			<option value=" "></option><%=icms.getSysDmList("CURRENCY")%>
		</select>
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
	<td class='lc1'><input name="ALTITEM"  value="08" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1' align="center">合伙期限</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="营业期限变更前内容" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"长期":QYDJ_JBXX_ZS.getOPTO()%>">（截至日期）</td>
	<td class='lc2'>
	长期<input type="checkbox" name="checkboxInput" id="checkboxInput"  title="营业期限变更后内容" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="ALTAF08" id="ALTAF08"  title="营业期限变更后内容" maxlength='10'>年
		<font color="red">请填写XX年</font>
		</span>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="10" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>合伙人</td>
	<td class='lc2'colspan="2"><font color=red>合伙人变更请选择变更事项，保存后填写“合伙情况”信息！</font>
	<input type="hidden" name="ALTBE10"  maxlength='500'>
	<input type="hidden" name="ALTAF10"  maxlength='500'></td> 
</tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>