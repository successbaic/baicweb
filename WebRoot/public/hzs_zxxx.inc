<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
    <td class="yxsm" colspan="5" align="center">&nbsp;ע����Ϣ</td> 
</tr>
<tr>
    <td class="lc1" align="center" nowrap="nowrap">����ע��<br>�� �� ��<br>ԭ   ��</td>
    <td class="lc2" colspan=4>
	   <%--�������ϵ�ע��ԭ����sys_dmdz����type=CANREA�����ݶ��գ�ȡcode�ֶε�ֵ��Ϊvalueֵ--%>
	   <input type="radio" name="CANREA" value="10" checked>1���³̹涨�Ľ�ɢ���ɳ���<br/>
	   <input type="radio" name="CANREA" value="20">2����Ա��������ɢ<br/>
	   <input type="radio" name="CANREA" value="70">3����ϲ����߷�����Ҫ��ɢ<br/>
	   <input type="radio" name="CANREA" value="50">4������������Ӫҵִ�ջ��߱�����<br/>
	   <input type="radio" name="CANREA" value="90">5�����ɡ���������涨��������ɢ����<br/>
   </td>
</tr>
<tr>
    <td class="lc1" colspan="2" align="center" nowrap="nowrap">��֧��������ע���Ǽ����</td>
    <td class="lc2" colspan="3">
       <input type="radio" checked name="CANCELBRSIGN" size="20" value='1' title='�Ѱ������'>�Ѱ������ <input type="radio" name="CANCELBRSIGN" size="20" title='�޷�֧����' value='2' >�޷�֧����
    </td>
</tr>
<tr>
	<td class="lc1" rowspan='2' align="center" nowrap="nowrap">���㹫�����</td>
	<td class="lc1" align="center" nowrap="nowrap">���汨ֽ����</td>
	<td class="lc2" colspan="3">
	   <input type="text" name="PUBNEWSNAME" size="50" title='���汨ֽ����' maxlength='25'>
	</td>
</tr>
<tr>
	<td class="lc1" align="center" nowrap="nowrap">��������</td>
	<td class="lc2" colspan="3">
	  <input type="text" name="PUBDATE" size="15" datatype='date' title='��������' maxlength='12'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	</td>
</tr>
<tr>
   <td class="lc1" align="center">��˰���</td>
   <td class="lc2" colspan="4">
      <select id="CLEANTAX" name="CLEANTAX" disblank title="��˰���">
       <option value=''></option>
     <option value='10'>�Ѿ��������</option>
	 <option value='30'>δ�漰��˰����</option>
      </select>
   </td>
</tr>
</table>