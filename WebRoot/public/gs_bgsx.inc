<table border="1" width="100%" >
<caption>��˾����Ǽ�����</caption>
 <tr>
	<td class="yxsm" align="center" colspan="2">��Ŀ</td>
	<td class="yxsm" align="center">ԭ�Ǽ�����</td>
	<td class="yxsm" align="center">�������Ǽ�����</td>
</tr>
<tr>	
	<td class="lc1"><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
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
	<input type="text" size="40" name="ALTBE02" disabled title="ס�����ǰ����" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF02" title="ס�����������" maxlength='50' readonly disabled>
	<input type="button" value="���¼��" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>��ϵ�绰</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="��ϵ�绰���ǰ����" value="<%=QYDJ_JBXX_ZS.getTEL() %>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="��ϵ�绰���������"></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1'>��������</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="����������ǰ����" maxlength='6' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE() %>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="����������������" maxlength='6'></td>
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
	<td class='lc1'><input name="ALTITEM" value="05" type="checkbox" onclick="checkGd(this);setvalue(this)"></td>
	<td class='lc1'>ע���ʱ�</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE05" disabled title="ע���ʱ����ǰ����" value="<%=QYDJ_JBXX_ZS.getREGCAP()%>"> ��Ԫ</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF05" onblur='doblurregcap()' title="ע���ʱ����������" maxlength='14' datatype="NUM"> ��Ԫ
	</td>	
</tr>
<%-- 
<tr>
	<td class='lc1'><input name="ALTITEM" value="27" type="checkbox" onclick="checkGd(this);setvalue(this)"></td>
	<td class='lc1'>ʵ���ʱ�</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE27" disabled title="ʵ���ʱ����ǰ����" value="<%=QYDJ_JBXX_ZS.getRECCAP()%>"> ��Ԫ</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF27" onblur='doblurreccap()' title="ʵ���ʱ����������" maxlength='14' datatype="NUM"> ��Ԫ
	</td>	
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="101" type="checkbox" ></td>
	<td class='lc1'>��ҵ���</td>
	<td class='lc2'>
	<select size="1" name="ALTBE101" style="width:250" disabled title="��ҵ�����ǰ����">
	<option  value=''>��ѡ����ҵ���</option>
	<%
		out.print(icms.getSysDmList("ENTCLASS"));
	%></select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF101" title="��ҵ�����������" >
	<option></option>
	<option value='1'>������ҵ</option>	
	<option value='2'>˽Ӫ��ҵ</option>
	<option value='8'>������ҵ</option>
	</select></td>
</tr>--%>
<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>��ҵ����</td>
	<td class='lc2'>	
	<select size="1" name="ALTBE04" title="��ҵ���ͱ��ǰ����" disabled>
	<option  value=''>��ѡ����ҵ����</option>
	<%=icms.getSysDmList("ENTTYPE","GS")%>
	</select>
	</td>
	<td class='lc2'><select size="1" name="ALTAF04" title="��ҵ���ͱ��������">
	<option  value=''>��ѡ����ҵ����</option>
	<%=icms.getSysDmList("ENTTYPE","GS")%>
	</select></td>
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
	<td class='lc1'><input name="ALTITEM" value="08" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>Ӫҵ����</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE08" disabled title="Ӫҵ���ޱ��ǰ����" value="<%=QYDJ_JBXX_ZS.getOPTO().equals("")?"����":QYDJ_JBXX_ZS.getOPTO()%>">���������ڣ�</td>
	<td class='lc2'>
	<!-- 
	<input type="text" size="20" name="ALTAF08" title="Ӫҵ���ޱ��������" maxlength='10' datatype="INT">��
	-->
		����<input type="checkbox" name="checkboxInput" id="checkboxInput"  title="Ӫҵ���ޱ��������" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="ALTAF08" id="ALTAF08" title="Ӫҵ����"  title="Ӫҵ���ޱ��������" maxlength='10'>��
		<font color="red">����дXX��</font>
		</span>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="10" type="checkbox"></td>
	<td class='lc1'>�ɶ�(������)</td>
	<td class='lc2'colspan="2"><font color=red>�ɶ������ѡ��������������д���ɶ���Ͷ����Ϣ����</font>
	<input type="hidden" name="ALTBE10" title="�ɶ�(������)���ǰ����" maxlength='500'>
	<input type="hidden" name="ALTAF10" title="�ɶ�(������)���������" maxlength='500'></td> 
</tr>
</table>

<table border="1" width="100%" >
<caption>��˾�����Ǽ�����</caption>
<tr>
	<td class="yxsm" align="center" colspan="2">��Ŀ</td>
	<td class="yxsm" align="center">���뱸������</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="70" type="checkbox" ></td>
	<td class='lc1'>����</td>
	<td class='lc2'colspan="2"><font color=red>���±����ѡ��������������д����Ҫ��Ա����Ϣ��</font>
	<input type="hidden" name="ALTBE70">
	<input type="hidden" name="ALTAF70"></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="71" type="checkbox" > </td>
	<td class='lc1'>����</td>
	<td class='lc2'colspan="2"><font color=red>���±����ѡ��������������д����Ҫ��Ա����Ϣ��</font>
	<input type="hidden" name="ALTBE71">
	<input type="hidden" name="ALTAF71"></td> 
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="72" type="checkbox" ></td>
	<td class='lc1'>����</td>
	<td class='lc2'colspan="2"><font color=red>���������ѡ��������������д����Ҫ��Ա����Ϣ�� </font>
	<input type="hidden" name="ALTBE72">
	<input type="hidden" name="ALTAF72"></td> 
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="73" type="checkbox" > </td>
	<td class='lc1'>�³�</td>
	<td class='lc2' colspan="2"><font color=red>�³̱�����ѡ�иñ�����Ŀ�󱣴棡</font>
	<input type="hidden" name="ALTBE73"  maxlength='500'>
	<input type="hidden" name="ALTAF73"  maxlength='500'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="74" type="checkbox" ></td>
	<td class='lc1'>�³�������</td>
	<td class='lc2' colspan="2"><font color=red>�³�������������ѡ�иñ�����Ŀ�󱣴棡</font>
	<input type="hidden" name="ALTBE74"  maxlength='500'>
	<input type="hidden" name="ALTAF74"  maxlength='500'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="79" type="checkbox"  onclick="setvalue(this)"></td>
	<td class='lc1'>�������Ա</td>
	<td class='lc2' colspan="2"><font color=red></font>
	<input type="hidden" name="ALTBE79"  maxlength='500'>
	<input type="text" name="ALTAF79" size="50"  maxlength='1000'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="84" type="checkbox"  onclick="setvalue(this)"></td>
	<td class='lc1'>�����鸺����</td>
	<td class='lc2' colspan="2"><font color=red></font>
	<input type="hidden" name="ALTBE84"  maxlength='500'>
	<input type="text" name="ALTAF84" size="50"  maxlength='500'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="87" type="checkbox"  onclick="setvalue(this)"></td>
	<td class='lc1'>�����鸺���˵绰</td>
	<td class='lc2' colspan="2"><font color=red></font>
	<input type="hidden" name="ALTBE87"  maxlength='500'>
	<input type="text" name="ALTAF87" size="50"  maxlength='500'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="81" type="checkbox" ></td>
	<td class='lc1'><%=title%>����</td>
	<td class='lc2'colspan="2"><font color=red><%=title%>���Ӻ���ѡ��������������д��<%=title%>����Ϣ��</font>
	<input type="hidden" name="ALTBE81"  maxlength='500'>
	<input type="hidden" name="ALTAF81"  maxlength='500'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="83" type="checkbox" ></td>
	<td class='lc1'><%=title%>ע��</td>
	<td class='lc2'colspan="2"><font color=red><%=title%>ע������ѡ��������������д��<%=title%>����Ϣ��</font>
	<input type="hidden" name="ALTBE83"  maxlength='500'>
	<input type="hidden" name="ALTAF83"  maxlength='500'></td>
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