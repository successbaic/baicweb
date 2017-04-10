<table border="1" width="100%" >
<caption>合伙企业变更登记申请书</caption>
 <tr>
	<td  class="yxsm" colspan="2" align="center">项目</td>
	<td  class="yxsm" align="center">原登记事项</td>
	<td  class="yxsm" align="center">申请变更登记事项</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">名   称</td>
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
	<input type="text" size="40" name="ALTBE02" disabled title="经营场所变更前内容" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="经营场所变更后内容" maxlength='50' readonly>
	<input type="button" value="点击录入" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1' align="center">邮政编码</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="邮政编码变更前内容" maxlength='20' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="邮政编码变更后内容" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">联系电话</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="联系电话变更前内容" maxlength='20' value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="联系电话变更后内容" maxlength='15'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="03" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">执行事务合伙人或委派代表</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE03" disabled title="执行事务合伙人或委派代表姓名变更前内容" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF03" title="执行事务合伙人或委派代表姓名变更后内容" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">企业类型</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="企业类型变更前内容" disabled>
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","HHQY")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="企业类型变更后内容">
	<option  value=''>请选择</option><%=icms.getSysDmList("ENTTYPE","HHQY")%></select></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="18" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">认缴出资额</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE18" disabled title="认缴出资额变更前内容" maxlength='14' datatype="NUM" value="<%=QYDJ_JBXX_ZS.getREGCAP() %>"> &nbsp;&nbsp;万元</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF18" onblur='doblurregcap()' title="认缴出资额变更后内容" maxlength='14' datatype="NUM"> &nbsp;&nbsp;万元</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="27" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">实缴出资额</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE27" disabled title="实缴出资额变更前内容" maxlength='14' datatype="NUM" value="<%=QYDJ_JBXX_ZS.getRECCAP() %>"> &nbsp;&nbsp;万元</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF27" onblur='doblurregcap()' title="实缴出资额变更后内容" maxlength='14' datatype="NUM"> &nbsp;&nbsp;万元</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">经营范围</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="经营范围变更前内容" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF12" title="经营范围变更后内容" maxlength='2000'></textarea></td>
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1' align="center">合伙期限</td>
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

</table>


<table border="1" width="100%" >
<caption>合伙企业备案登记事项</caption>
<tr>
	<td class="yxsm" align="center" colspan="2">项目</td>
	<td class="yxsm" align="center">申请备案事项</td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="152" type="checkbox"></td>
	<td class='lc1'>合伙人</td>
	<td class='lc2'colspan="2"><font color=red>合伙人变更请选择变更事项，保存后填写“合伙人信息”！</font>
	<input type="hidden" name="ALTBE152" title="合伙人变更前内容" maxlength='500'>
	<input type="hidden" name="ALTAF152" title="合伙人变更后内容" maxlength='500'></td> 
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="73" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>合伙协议</td>
	<td class='lc2'><font color=red>合伙协议备案的请选中该项目后保存！</font>
	<input type="hidden" name="ALTBE73"  maxlength='50'>
	<input type="hidden" name="ALTAF73"  maxlength='50'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="74" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>合伙协议修正</td>
	<td class='lc2'><font color=red>合伙协议修正备案的请选中该项目后保存！</font>
	<input type="hidden" name="ALTBE74"  maxlength='50'>
	<input type="hidden" name="ALTAF74"  maxlength='50'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="79" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>清算组成员</td>
	<td class='lc2'>
	<input type="hidden" name="ALTBE79"  maxlength='50'>
	<input type="text" size="50" name="ALTAF79"  maxlength='50' title="清算组成员备案后内容" size="40"></td> 
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="84" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>清算组负责人</td>
	<td class='lc2'>
	<input type="hidden" name="ALTBE84"  maxlength='50'>
	<input type="text" size="50" name="ALTAF84"  maxlength='20' title="清算组负责人备案后内容" size="40"></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="87" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>清算组负责人电话</td>
	<td class='lc2'>
	<input type="hidden" name="ALTBE87"  maxlength='50'>
	<input type="text" size="50" name="ALTAF87"  maxlength='20' title="清算组负责人电话备案后内容" datatype=int size="40"></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="81" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>分支机构增加</td>
	<td class='lc2'colspan="2"><font color=red>分支机构增加后请选择变更事项，保存后填写“分支机构”信息！</font>
	<input type="hidden" name="ALTBE81"  maxlength='500'>
	<input type="hidden" name="ALTAF81"  maxlength='500'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="83" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>分支机构注销</td>
	<td class='lc2'colspan="2"><font color=red>分支机构注销后请选择变更事项，保存后填写“分支机构”信息！</font>
	<input type="hidden" name="ALTBE83"  maxlength='500'>
	<input type="hidden" name="ALTAF83"  maxlength='500'></td> 
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