<table border="1" width="100%" >
<caption>����Ͷ�ʺϻ���ҵ��֧��������Ǽ�����</caption>
<input type="hidden" name="ALTTIME">
 <tr>
	<td class="yxsm" align="center" colspan="2">��Ŀ</td>
	<td class="yxsm" align="center">ԭ�Ǽ�����</td>
	<td class="yxsm" align="center">�������Ǽ�����</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">����</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE01" disabled title="���Ʊ��ǰ����" value="<%=QYDJ_JBXX_ZS.getENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF01" maxlength='50' title="���Ʊ��������" maxlength='50' readonly><input type="button" value="��ѯ" onclick="getMc()">
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">��Ӫ����</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE02" disabled title="��Ӫ�������ǰ����" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF02" title="��Ӫ�������������" maxlength='50'>
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1' align="center">��������</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="����������ǰ����" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="����������������" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��ϵ�绰</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="��ϵ�绰���ǰ����" maxlength='6' value="<%=QYDJ_JBXX_ZS.getTEL() %>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="��ϵ�绰���������" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��ҵ����</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="��ҵ���ͱ��ǰ����" disabled>
	<option  value=''>��ѡ����ҵ����</option>
	<%=icms.getSysDmList("ENTTYPE","WZHHFZ")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="��ҵ���ͱ��������">
	<option  value=''>��ѡ����ҵ����</option>
	<%=icms.getSysDmList("ENTTYPE","WZHHFZ")%>
	<%=icms.getSysDmList("ENTTYPE","WZGS")%>
	<%=icms.getSysDmList("ENTTYPE","WZFR")%>
	</select></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="21" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">������</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE21" disabled title="�������������ǰ����" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF21" title="�������������������" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="54" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">������ס��</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE54" disabled title="������ס�����ǰ����" value=""></td>
	<td class='lc2'><input type="text" size="45" name="ALTAF54" title="������ס�����������" maxlength='50'></td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="105" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">������ҵ����</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE105" disabled title="������ҵ���Ʊ��ǰ����" value="<%=QYDJ_JBXX_ZS.getSUPENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF105" maxlength='50' title="������ҵ���Ʊ��������" maxlength='50'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="06" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center" nowrap="nowrap">ƾ���ɾ�Ӫ��Ŀ</td>
	<td class='lc2'>
		<textarea rows="3" cols="45" name="ALTBE06" disabled title="���ɾ�Ӫ��Ŀ���ǰ����"><%=QYDJ_JBXX_ZS.getABUITEMCO()%></textarea>
	</td>
	<td class='lc2'>
		<textarea rows="3" cols="45" name="ALTAF06" title="���ɾ�Ӫ��Ŀ���������" maxlength='1000'></textarea>
 	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��Ӫ��Χ</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="��Ӫ��Χ���ǰ����" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTAF12" title="��Ӫ��Χ���������" maxlength='2000'></textarea>
	</td>
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��Ӫ����</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="��Ӫ���ޱ��ǰ����" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"����":QYDJ_JBXX_ZS.getOPTO()%>">���������ڣ�</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF08" title="��Ӫ���ޱ��������" maxlength='10' datatype="DATE" onclick="dropdowndate(this);">���������ڣ�</td>
</tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>