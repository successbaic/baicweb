<table border="1" width="100%" >
<caption>Ӫҵ��λ����Ǽ�������</caption>
 <tr >
	<td class="yxsm" colspan="2" align="center">��Ŀ</td>
	<td class="yxsm" align="center">ԭ�Ǽ�����</td>
	<td class="yxsm" align="center">�������Ǽ�����</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��λ����</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE01" disabled title="��λ���Ʊ��ǰ����" value="<%=QYDJ_JBXX_ZS.getENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF01" maxlength='50' title="��λ���Ʊ��������" maxlength='50'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">��ַ</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE02" disabled title="��ַ���ǰ����" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="��ַ���������" maxlength='50' readonly>
	<input type="button" value="���¼��" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1' align="center">��������</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="����������ǰ����" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE() %>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="����������������" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��ϵ�绰</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="��ϵ�绰���ǰ����" value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="��ϵ�绰���������"></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="03" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">������</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE03" disabled title="�������������ǰ����" value="<%=QYDJ_JBXX_ZS.getLEREP()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF03" title="�������������������" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="26" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">�ʽ�����</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE26" disabled title="�ʽ�������ǰ����" value="<%=QYDJ_JBXX_ZS.getREGCAP()%>"> (��Ԫ)</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF26" onblur='doblurregcap()' title="�ʽ�������������" maxlength='14' datatype="NUM"> (��Ԫ)
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��������</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="�������ʱ��ǰ����" disabled>
	<option  value=''>��ѡ����ҵ����</option>
	<%=icms.getSysDmList("ENTTYPE","NZYY")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="�������ʱ��������">
	<option  value=''>��ѡ��</option><%=icms.getSysDmList("ENTTYPE","NZYY")%></select></td>
</tr>
<tr> 
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��Ӫ����</td>
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
	<td class='lc1'><input name="ALTITEM" value="105" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">������λ</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE105" disabled title="������λ���ǰ����" value="<%=QYDJ_JBXX_ZS.getSUPENTNAME()%>"></td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF105" title="������λ���������" maxlength='10'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="09" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��Ӫ��ʽ</td>
	<td class='lc2'><input type="text" size="20" name="ALTBE09" disabled title="��Ӫ��ʽ���ǰ����" maxlength='50' value="<%=QYDJ_JBXX_ZS.getBUSFORM() %>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF09" title="��Ӫ��ʽ���������" maxlength='50'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>��Ӫ��Χ</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="��Ӫ��Χ���ǰ����" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF12"  disabled title="��Ӫ��Χ���������" maxlength='2000'></textarea>
	</td>
</tr>
</table>

<table border="1" width="100%" >
<caption>Ӫҵ��λ�����Ǽ�����</caption>
<tr>
	<td class="yxsm" align="center" colspan="2">��Ŀ</td>
	<td class="yxsm" align="center">���뱸������</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="790" type="checkbox" ></td>
	<td class='lc1'>��������</td>
	<td class='lc2'colspan="2"><font color=red>��ѡ��������������д����������Ϣ��</font>
	<input type="hidden" name="ALTBE790"  maxlength='500'>
	<input type="hidden" name="ALTAF790"  maxlength='500'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="780" type="checkbox" ></td>
	<td class='lc1'>����Ա</td>
	<td class='lc2'colspan="2"><font color=red>��ѡ��������������д����Ա��Ϣ��</font>
	<input type="hidden" name="ALTBE780"  maxlength='500'>
	<input type="hidden" name="ALTAF780"  maxlength='500'></td>
</tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>