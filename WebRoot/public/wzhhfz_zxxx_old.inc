<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
    <td class="yxsm" colspan="6">&nbsp;ע����Ϣ</td> 
</tr>
<tr>
    <td class="lc1" nowrap="nowrap" align="center">����ע��<br>�� �� ��<Br>ԭ   ��</td>
    <td class="lc2" colspan="5">
	   <%--�������ϵ�ע��ԭ����sys_dmdz����type=CANREA�����ݶ��գ�ȡcode�ֶε�ֵ��Ϊvalueֵ--%>
	   <select name="CANREA" disblank title="����ע���Ǽǵ�ԭ��" style="width:200">
	     <option value=""></option><%=icms.getSysDmList("CANREA")%>	     
	   </select>
    </td>
</tr>
<tr>
	<td class="lc1" rowspan="2" nowrap="nowrap" align="center">֤�ս������</td>
	<td class="lc1" nowrap="nowrap" align="center">Ӫҵִ������</td>
	<td class="lc1" align="center" nowrap="nowrap">����</td>
	<td class="lc2" width="10%"><input type="text" name="BLICREVORINUM" size="15" title="Ӫҵִ����������" maxlength='25'></td>
	<td class="lc1" align="center" nowrap="nowrap">���</td>
	<td class="lc2"><input type="text" name="BLICREVORINO" size="50" title="Ӫҵִ���������" maxlength='25'></td>
</tr>
<tr>
	<td class="lc1" align="center">Ӫҵִ�ո���</td>
	<td class="lc1" align="center">����</td>
	<td class="lc2" width="10%"><input type="text" name="BLICREVDUPCONUM" size="15" title="Ӫҵִ�ո�������" maxlength='25'></td>
	<td class="lc1" align="center">���</td>
	<td class="lc2"><input type="text" name="BLICREVDUPCONO" size="50" title="Ӫҵִ�ո������" maxlength='25'></td>
</tr>
<tr>
    <td class="lc1" align="center">ע��˵��</td>
    <td class="lc2" colspan="5"><textarea rows="5" name="REMARK" maxlength=200 cols="89" title="ע����ע"></textarea></td>
</tr>        
</table>