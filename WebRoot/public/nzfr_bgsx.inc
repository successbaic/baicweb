<table border="1" width="100%" >
<caption>�ǹ�˾��ҵ���˱���Ǽ�����</caption>
 <tr>
	<td class="yxsm" align="center" colspan="2">��Ŀ</td>
	<td class="yxsm" align="center">ԭ�Ǽ�����</td>
	<td class="yxsm" align="center">�������Ǽ�����</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>����</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE01" disabled title="���Ʊ��ǰ����" value="<%=QYDJ_JBXX_ZS.getENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF01" maxlength='50' title="���Ʊ��������" maxlength='50' readonly><input type="button" value="��ѯ" onclick="getMc()">
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>ס��</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE02" disabled title="ס�����ǰ����" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF02" title="ס�����������" maxlength='50' readonly>
	<input type="button" value="���¼��" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1'>��������</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="����������ǰ����" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="����������������" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>��ϵ�绰</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="��ϵ�绰���ǰ����" value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="��ϵ�绰���������"></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="03" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>����������</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE03" disabled title="�����������������ǰ����" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF03" title="�����������������������" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>��������</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="�������ʱ��ǰ����" disabled>
	<option  value=''>��ѡ����ҵ����</option>
	<%=icms.getSysDmList("ENTTYPE","NZFR")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="�������ʱ��������">
	<option  value=''>��ѡ��</option><%=icms.getSysDmList("ENTTYPE","NZFR")%><%=icms.getSysDmList("ENTTYPE","GS")%></select></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="05" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>ע���ʽ�</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE05" disabled title="ע���ʽ���ǰ����" value="<%=QYDJ_JBXX_ZS.getREGCAP()%>"> ��Ԫ</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF05" onblur='doblurregcap()' title="ע���ʽ���������" maxlength='14' datatype="NUM"> ��Ԫ
	</td>	
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>��Ӫ����</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="��Ӫ���ޱ��ǰ����" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"����":QYDJ_JBXX_ZS.getOPTO()%>">���������ڣ�</td>
	<td class='lc2'>
	����<input type="checkbox" name="checkboxInput" id="checkboxInput"  title="Ӫҵ���ޱ��������" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="ALTAF08" id="ALTAF08" title="Ӫҵ����"  title="Ӫҵ���ޱ��������" maxlength='10'>��
		<font color="red">����дXX��</font>
		</span>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>��Ӫ��Χ</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="��Ӫ��Χ���ǰ����" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF12"  disabled title="��Ӫ��Χ���������" maxlength='2000'></textarea>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="40" type="checkbox"></td>
	<td class='lc1'><%=title%>����</td>
	<td class='lc2'colspan="2"><font color=red><%=title%>����ѡ��<%=title%>����������д��<%=title%>��Ϣ����</font>
	<input type="hidden" name="ALTBE40" title="<%=title%> �����ǰ����" maxlength='500'>
	<input type="hidden" name="ALTAF40" title="<%=title%> �����������" maxlength='500'></td></tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="41" type="checkbox"></td>
	<td class='lc1'><%=title%>����</td>
	<td class='lc2'colspan="2"><font color=red><%=title%>����ѡ��<%=title%>����������д��<%=title%>��Ϣ����</font>
	<input type="hidden" name="ALTBE41" title="<%=title%> �����ǰ����" maxlength='500'>
	<input type="hidden" name="ALTAF41" title="<%=title%> �����������" maxlength='500'></td></tr>
</tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>