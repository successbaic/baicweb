<table border="1" width="100%" >
<caption>����Ͷ�ʺϻ���ҵ����Ǽ�����</caption>
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
	<td class='lc1' align="center">��Ҫ��Ӫ����</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE02" disabled title="��Ҫ��Ӫ�������ǰ����" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="��Ҫ��Ӫ�������������" maxlength='50' readonly>
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
	<input type="text" size="20" name="ALTBE50" disabled title="��ϵ�绰���ǰ����" maxlength='16' value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF50" title="��ϵ�绰���������" maxlength='16'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��ҵ����</td>
	<td class='lc2'>
	<select size="1" name="ALTBE04" title="��ҵ���ͱ��ǰ����" disabled>
	<option  value=''>��ѡ����ҵ����</option>
	<%=icms.getSysDmList("ENTTYPE","WZHH")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="��ҵ���ͱ��������">
	<option  value=''>��ѡ����ҵ����</option>
	<%=icms.getSysDmList("ENTTYPE","WZHH")%>
	<%=icms.getSysDmList("ENTTYPE","WZGS")%>
	<%=icms.getSysDmList("ENTTYPE","WZFR")%>
	</select></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="116" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">ִ������ϻ��˻�ί�ɴ���</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE116" disabled title="ִ������ϻ��˻�ί�ɴ������ǰ����" maxlength='20' value="<%=QYDJ_JBXX_ZS.getLEREP() %>"></td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF116" title="ִ������ϻ��˻�ί�ɴ������������" maxlength='20'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM"  value="117" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">�Ͻɳ��ʶ�</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTBE117" disabled title="�Ͻɳ��ʶ���ǰ����" maxlength='14' datatype="NUM" value="<%=QYDJ_JBXX_ZS.getREGCAP()%>">&nbsp;&nbsp;��Ԫ
	</td>
	<td class='lc2'>
	<input type="text" size="14"  name="ALTAF117" onblur='doblurregcap()' title="�Ͻɳ��ʶ���������" maxlength='14' datatype="NUM">&nbsp;&nbsp;��Ԫ
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="118" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">�Ͻɳ��ʶ����</td>
	<td class='lc2'>
	    <input type="text" name="ALTBE118" disabled title="�Ͻɳ��ʶ���ֱ��ǰ����" value="<%=icms.getSysDm("CURRENCY",QYDJ_JBXX_ZS.getREGCAPCUR()) %>">
	</td>
	<td class='lc2'>
		<select  name="ALTAF118"  title="�Ͻɳ��ʶ���ֱ��������">
			<option value=" "></option><%=icms.getSysDmList("CURRENCY")%>
		</select>
	</td>
</tr>
<!--  tr>
	<td class='lc1'><input name="ALTITEM" value="119" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">�Ͻɳ��ʶ�������Ԫ</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTBE119" disabled  title="�Ͻɳ��ʶ�������Ԫ���ǰ����" maxlength='20' value="<%=QYDJ_JBXX_ZS.getREGCAPUSD() %>"></td>
	<td class='lc2'>
	<input type="text" size="14" onblur='doblurregcap()' name="ALTAF119" title="�Ͻɳ��ʶ�������Ԫ���������" maxlength='14' datatype="NUM"></td>
</tr -->
<tr>
	<td class='lc1'><input name="ALTITEM" value="120" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">ʵ�ɳ��ʶ�</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTBE120"  disabled title="ʵ�ɳ��ʶ���ǰ����" maxlength='12' datatype="NUM" value="<%=QYDJ_JBXX_ZS.getRECCAP() %>">&nbsp;&nbsp;��Ԫ
	</td>
	<td class='lc2'>
	<input type="text" size="14" name="ALTAF120" onblur='doblurregcap()' title="ʵ�ɳ��ʶ���������" maxlength='14' datatype="NUM">&nbsp;&nbsp;��Ԫ
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="121" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">ʵ�ɳ��ʶ����</td>
	<td class='lc2'>
	<input type="text" name="ALTBE121" disabled title="ʵ�ɳ��ʶ���ֱ��ǰ����" value="<%=icms.getSysDm("CURRENCY",QYDJ_JBXX_ZS.getRECCAPCUR()) %>">
	</td>
	<td class='lc2'>
		<select  name="ALTAF121"  title="ʵ�ɳ��ʶ���ֱ��������">
			<option value=" "></option><%=icms.getSysDmList("CURRENCY")%>
		</select>
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
	<td class='lc1'><input name="ALTITEM"  value="08" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1' align="center">�ϻ�����</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="Ӫҵ���ޱ��ǰ����" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"����":QYDJ_JBXX_ZS.getOPTO()%>">���������ڣ�</td>
	<td class='lc2'>
	����<input type="checkbox" name="checkboxInput" id="checkboxInput"  title="Ӫҵ���ޱ��������" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="ALTAF08" id="ALTAF08"  title="Ӫҵ���ޱ��������" maxlength='10'>��
		<font color="red">����дXX��</font>
		</span>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="10" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>�ϻ���</td>
	<td class='lc2'colspan="2"><font color=red>�ϻ��˱����ѡ��������������д���ϻ��������Ϣ��</font>
	<input type="hidden" name="ALTBE10"  maxlength='500'>
	<input type="hidden" name="ALTAF10"  maxlength='500'></td> 
</tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>