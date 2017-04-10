<table border="1" width="100%" >
<caption>营业单位变更登记申请书</caption>
 <tr >
	<td class="yxsm" colspan="2" align="center">项目</td>
	<td class="yxsm" align="center">原登记事项</td>
	<td class="yxsm" align="center">申请变更登记事项</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">单位名称</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE01" disabled title="单位名称变更前内容" value="<%=QYDJ_JBXX_ZS.getENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF01" maxlength='50' title="单位名称变更后内容" maxlength='50'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">地址</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE02" disabled title="地址变更前内容" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="地址变更后内容" maxlength='50' readonly>
	<input type="button" value="点击录入" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1' align="center">邮政编码</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="邮政编码变更前内容" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE() %>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="邮政编码变更后内容" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">联系电话</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="联系电话变更前内容" value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="联系电话变更后内容"></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="03" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">负责人</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE03" disabled title="负责人姓名变更前内容" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF03" title="负责人姓名变更后内容" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="26" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">资金数额</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE26" disabled title="资金数额变更前内容" value="<%=QYDJ_JBXX_ZS.getREGCAP()%>"> (万元)</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF26" onblur='doblurregcap()' title="资金数额变更后内容" maxlength='14' datatype="NUM"> (万元)
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">经济性质</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="经济性质变更前内容" disabled>
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","NZYY")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="经济性质变更后内容">
	<option  value=''>请选择</option><%=icms.getSysDmList("ENTTYPE","NZYY")%></select></td>
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">经营期限</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="经营期限变更前内容" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"长期":QYDJ_JBXX_ZS.getOPTO()%>">（截至日期）</td>
	<td class='lc2'>
	长期<input type="checkbox" name="checkboxInput" id="checkboxInput"  title="营业期限变更后内容" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="ALTAF08" id="ALTAF08" title="营业期限"  title="营业期限变更后内容" maxlength='10'>年
		<font color="red">请填写XX年</font>
		</span>
	</td>
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="105" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">隶属单位</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE105" disabled title="隶属单位变更前内容" value="<%=QYDJ_JBXX_ZS.getSUPENTNAME()%>"></td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF105" title="隶属单位变更后内容" maxlength='10'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="09" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">经营方式</td>
	<td class='lc2'><input type="text" size="20" name="ALTBE09" disabled title="经营方式变更前内容" maxlength='50' value="<%=QYDJ_JBXX_ZS.getBUSFORM() %>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF09" title="经营方式变更后内容" maxlength='50'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>经营范围</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="经营范围变更前内容" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF12"  disabled title="经营范围变更后内容" maxlength='2000'></textarea>
	</td>
</tr>
</table>

<table border="1" width="100%" >
<caption>营业单位备案登记事项</caption>
<tr>
	<td class="yxsm" align="center" colspan="2">项目</td>
	<td class="yxsm" align="center">申请备案事项</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="790" type="checkbox" ></td>
	<td class='lc1'>财务负责人</td>
	<td class='lc2'colspan="2"><font color=red>请选择变更事项，保存后填写财务负责人信息！</font>
	<input type="hidden" name="ALTBE790"  maxlength='500'>
	<input type="hidden" name="ALTAF790"  maxlength='500'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="780" type="checkbox" ></td>
	<td class='lc1'>联络员</td>
	<td class='lc2'colspan="2"><font color=red>请选择变更事项，保存后填写联络员信息！</font>
	<input type="hidden" name="ALTBE780"  maxlength='500'>
	<input type="hidden" name="ALTAF780"  maxlength='500'></td>
</tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>