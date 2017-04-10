<table border="1" width="100%" >
<caption>公司变更登记事项</caption>
 <tr>
	<td class="yxsm" align="center" colspan="2">项目</td>
	<td class="yxsm" align="center">原登记事项</td>
	<td class="yxsm" align="center">申请变更登记事项</td>
</tr>
<tr>	
	<td class="lc1"><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>名称</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE01" disabled title="名称变更前内容" value="<%=QYDJ_JBXX_ZS.getENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF01" maxlength='50' title="名称变更后内容" maxlength='50' readonly><input type="button" value="查询" onclick="getMc()">
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>住所</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE02" disabled title="住所变更前内容" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="住所变更后内容" maxlength='50' readonly disabled>
	<input type="button" value="点击录入" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>联系电话</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="联系电话变更前内容" value="<%=QYDJ_JBXX_ZS.getTEL() %>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="联系电话变更后内容"></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1'>邮政编码</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="邮政编码变更前内容" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE() %>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="邮政编码变更后内容" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="03" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>法定代表人</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE03" disabled title="法定代表人姓名变更前内容" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF03" title="法定代表人姓名变更后内容" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="05" type="checkbox" onclick="checkGd(this);setvalue(this)"></td>
	<td class='lc1'>注册资本</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE05" disabled title="注册资本变更前内容" value="<%=QYDJ_JBXX_ZS.getREGCAP()%>"> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF05" onblur='doblurregcap()' title="注册资本变更后内容" maxlength='14' datatype="NUM"> 万元
	</td>	
</tr>
<%-- 
<tr>
	<td class='lc1'><input name="ALTITEM" value="27" type="checkbox" onclick="checkGd(this);setvalue(this)"></td>
	<td class='lc1'>实收资本</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE27" disabled title="实收资本变更前内容" value="<%=QYDJ_JBXX_ZS.getRECCAP()%>"> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF27" onblur='doblurreccap()' title="实收资本变更后内容" maxlength='14' datatype="NUM"> 万元
	</td>	
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="101" type="checkbox" ></td>
	<td class='lc1'>企业类别</td>
	<td class='lc2'>
	<select size="1" name="ALTBE101" style="width:250" disabled title="企业类别变更前内容">
	<option  value=''>请选择企业类别</option>
	<%
		out.print(icms.getSysDmList("ENTCLASS"));
	%></select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF101" title="企业类别变更后内容" >
	<option></option>
	<option value='1'>内资企业</option>	
	<option value='2'>私营企业</option>
	<option value='8'>外资企业</option>
	</select></td>
</tr>--%>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>企业类型</td>
	<td class='lc2'>	
	<select size="1" name="ALTBE04" title="企业类型变更前内容" disabled>
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","GS")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="企业类型变更后内容">
	<option  value=''>请选择企业类型</option>
	<%=icms.getSysDmList("ENTTYPE","GS")%>
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
	<td class='lc1'>营业期限</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="营业期限变更前内容" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"长期":QYDJ_JBXX_ZS.getOPTO()%>">（截至日期）</td>
	<td class='lc2'>
	<!-- 
	<input type="text" size="20" name="ALTAF08" title="营业期限变更后内容" maxlength='10' datatype="INT">年
	-->
		长期<input type="checkbox" name="checkboxInput" id="checkboxInput"  title="营业期限变更后内容" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="ALTAF08" id="ALTAF08" title="营业期限"  title="营业期限变更后内容" maxlength='10'>年
		<font color="red">请填写XX年</font>
		</span>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="10" type="checkbox"></td>
	<td class='lc1'>股东(发起人)</td>
	<td class='lc2'colspan="2"><font color=red>股东变更请选择变更事项，保存后填写“股东或投资信息”！</font>
	<input type="hidden" name="ALTBE10" title="股东(发起人)变更前内容" maxlength='500'>
	<input type="hidden" name="ALTAF10" title="股东(发起人)变更后内容" maxlength='500'></td> 
</tr>
</table>

<table border="1" width="100%" >
<caption>公司备案登记事项</caption>
<tr>
	<td class="yxsm" align="center" colspan="2">项目</td>
	<td class="yxsm" align="center">申请备案事项</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="70" type="checkbox" ></td>
	<td class='lc1'>董事</td>
	<td class='lc2'colspan="2"><font color=red>董事变更请选择变更事项，保存后填写“主要人员”信息！</font>
	<input type="hidden" name="ALTBE70">
	<input type="hidden" name="ALTAF70"></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="71" type="checkbox" > </td>
	<td class='lc1'>监事</td>
	<td class='lc2'colspan="2"><font color=red>监事变更请选择变更事项，保存后填写“主要人员”信息！</font>
	<input type="hidden" name="ALTBE71">
	<input type="hidden" name="ALTAF71"></td> 
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="72" type="checkbox" ></td>
	<td class='lc1'>经理</td>
	<td class='lc2'colspan="2"><font color=red>经理变更请选择变更事项，保存后填写“主要人员”信息！ </font>
	<input type="hidden" name="ALTBE72">
	<input type="hidden" name="ALTAF72"></td> 
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="73" type="checkbox" > </td>
	<td class='lc1'>章程</td>
	<td class='lc2' colspan="2"><font color=red>章程备案请选中该备案项目后保存！</font>
	<input type="hidden" name="ALTBE73"  maxlength='500'>
	<input type="hidden" name="ALTAF73"  maxlength='500'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="74" type="checkbox" ></td>
	<td class='lc1'>章程修正案</td>
	<td class='lc2' colspan="2"><font color=red>章程修正案备案请选中该备案项目后保存！</font>
	<input type="hidden" name="ALTBE74"  maxlength='500'>
	<input type="hidden" name="ALTAF74"  maxlength='500'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="79" type="checkbox"  onclick="setvalue(this)"></td>
	<td class='lc1'>清算组成员</td>
	<td class='lc2' colspan="2"><font color=red></font>
	<input type="hidden" name="ALTBE79"  maxlength='500'>
	<input type="text" name="ALTAF79" size="50"  maxlength='1000'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="84" type="checkbox"  onclick="setvalue(this)"></td>
	<td class='lc1'>清算组负责人</td>
	<td class='lc2' colspan="2"><font color=red></font>
	<input type="hidden" name="ALTBE84"  maxlength='500'>
	<input type="text" name="ALTAF84" size="50"  maxlength='500'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="87" type="checkbox"  onclick="setvalue(this)"></td>
	<td class='lc1'>清算组负责人电话</td>
	<td class='lc2' colspan="2"><font color=red></font>
	<input type="hidden" name="ALTBE87"  maxlength='500'>
	<input type="text" name="ALTAF87" size="50"  maxlength='500'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="81" type="checkbox" ></td>
	<td class='lc1'><%=title%>增加</td>
	<td class='lc2'colspan="2"><font color=red><%=title%>增加后请选择变更事项，保存后填写“<%=title%>”信息！</font>
	<input type="hidden" name="ALTBE81"  maxlength='500'>
	<input type="hidden" name="ALTAF81"  maxlength='500'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="83" type="checkbox" ></td>
	<td class='lc1'><%=title%>注销</td>
	<td class='lc2'colspan="2"><font color=red><%=title%>注销后请选择变更事项，保存后填写“<%=title%>”信息！</font>
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