<%
	QYDJ_RYXX_ZS.setPRIPID(PRIPID);
	QYDJ_RYXX_ZS.doSelectByPripid();
	System.out.print(QYDJ_RYXX_ZS.getNAME());
 %>
<table border="1" width="100%" >
<caption>���˶�����ҵ����Ǽ�������</caption>
 <tr>
	<td  class="yxsm" colspan="2" align="center">��Ŀ</td>
	<td  class="yxsm" align="center">ԭ�Ǽ�����</td>
	<td  class="yxsm" align="center">�������Ǽ�����</td>
</tr>
<tr>	
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center" nowrap="nowrap">��ҵ����</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE01" disabled title="��ҵ���Ʊ��ǰ����" value="<%=QYDJ_JBXX_ZS.getENTNAME()%>">
	</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF01" maxlength='50' title="��ҵ���Ʊ��������" maxlength='50' readonly><input type="button" value="��ѯ" onclick="getMc()">
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="02" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">��ҵס��</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE02" disabled title="��ҵס�����ǰ����" value="<%=QYDJ_JBXX_ZS.getDOM()%>"></td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF02" title="��ҵס�����������" maxlength='50' readonly>
	<input type="button" value="���¼��" onclick="getDom('<%=OPENO%>')">
	</td>	
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1' align="center">��������</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE69" disabled title="����������ǰ����" maxlength='20' value="<%=QYDJ_JBXX_ZS.getPOSTALCODE()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF69" datatype=int title="����������������" maxlength='6'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��ϵ�绰</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE50" disabled title="��ϵ�绰���ǰ����" maxlength='20' value="<%=QYDJ_JBXX_ZS.getTEL()%>"></td>
	<td class='lc2'><input type="text" size="10" name="ALTAF50" title="��ϵ�绰���������" maxlength='15'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="30" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">Ͷ����</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE30" disabled title="Ͷ�����������ǰ����" value="<%=QYDJ_RYXX_ZS.getNAME()%>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF30" title="Ͷ�����������������" maxlength='20'>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="54" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1' align="center">Ͷ���˾���</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE54" disabled title="Ͷ���˾������ǰ����" value="<%=QYDJ_RYXX_ZS.getHOUSEADD()%>"></td>
	<td class='lc2'><input type="text" size="45" name="ALTAF54" title="Ͷ���˾������������" maxlength='50'></td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="12" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1' align="center">��Ӫ��Χ����ʽ</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE12" disabled title="��Ӫ��Χ���ǰ����" maxlength='2000'><%=QYDJ_JBXX_ZS.getBUSSCOPE()%></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF12" title="��Ӫ��Χ���������" maxlength='2000'></textarea></td>
</tr>
</table>


<table border="1" width="100%" >
<caption>���˶�����ҵ�����Ǽ�����</caption>
<tr>
	<td class="yxsm" align="center" colspan="2">��Ŀ</td>
	<td class="yxsm" align="center">���뱸������</td>
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