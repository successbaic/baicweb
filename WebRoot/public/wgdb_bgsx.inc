<table border="1" width="100%" >
<caption>���(����)��ҵ��פ������������Ǽ�����</caption>
<input type="hidden" name="ALTTIME">
 <tr>
	<td class="yxsm" align="center" colspan="2">��Ŀ</td>
	<td class="yxsm" align="center">ԭ�Ǽ�����</td>
	<td class="yxsm" align="center">�������Ǽ�����</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">������������</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE01" disabled title="���Ʊ��ǰ����" value="<%=QYDJ_JBXX_ZS.getENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF01" maxlength='50' title="���Ʊ��������" maxlength='50' readonly><input type="button" value="��ѯ" onclick="getMc()">
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">פ�ڳ���</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE02" disabled title="פ�ڵ�ַ���ǰ����" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="פ�ڵ�ַ���������" maxlength='50' readonly>
	<input type="button" value="���¼��" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1' align="center">��������</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE69" disabled title="����������ǰ����" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF69" datatype=int title="����������������" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��ϵ�绰</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE50" disabled title="��ϵ�绰���ǰ����" maxlength='6' value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF50" title="��ϵ�绰���������" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="22" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">��ϯ��������</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE22" disabled title="��ϯ�����������ǰ����" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF22" title="��ϯ�����������������" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">ҵ��Χ</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="ҵ��Χ���ǰ����" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF12"  disabled title="ҵ��Χ���������" maxlength='2000'></textarea>
	</td>
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">פ������</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="פ�����ޱ��ǰ����" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"����":QYDJ_JBXX_ZS.getOPTO()%>">���������ڣ�</td>
	<td class='lc2'>
	����<input type="checkbox" name="checkboxInput" id="checkboxInput"  title="Ӫҵ���ޱ��������" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="ALTAF08" id="ALTAF08"  title="Ӫҵ���ޱ��������" maxlength='10'>��
		<font color="red">����дXX��</font>
		</span>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="150" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' nowrap="nowrap">�������������ҵ����</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE150" disabled title="�������������ҵ���Ʊ���ǰ����" maxlength='50' value="<%=QYDJ_JBXX_ZS.getSUPENTNAME() %>"> </td>
	<td class='lc2'><input type="text" size="45" name="ALTAF150" title="�������������ҵ���Ʊ���������" maxlength='50' > </td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="151" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' nowrap="nowrap">�������������ҵ����ס��</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE151" disabled title="�������������ҵ����ס������ǰ����" maxlength='50' value=""> </td>
	<td class='lc2'><input type="text" size="45" name="ALTAF151" title="�������������ҵ����ס������������" maxlength='50' > </td>
</tr>

</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>