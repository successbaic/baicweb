<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
   <td class="yxsm" colspan="5">&nbsp;ע����Ϣ</td> 
</tr>
<tr>
   <td class="lc1" align="center">����ע���Ǽǵ�ԭ��</td>
   <td class="lc2" colspan=4>
	  <%--�������ϵ�ע��ԭ����sys_dmdz����type=CANREA�����ݶ��գ�ȡcode�ֶε�ֵ��Ϊvalueֵ--%>
	  <select name="CANREA" disblank title="����ע���Ǽǵ�ԭ��" style="width:200">
	     <option value=""></option><%=icms.getSysDmList("CANREA")%>	     
	   </select>
   </td>
</tr>
<tr> 
	<td class="lc1"   align="center" nowrap="nowrap" width="20%">�������Ա������֪ͨ�顷�ĺ�</td>
	<td class="lc2" colspan="3">
		<input type="text" name="AFFWRITNO" size="50" disblank title='�������Ա������֪ͨ�顷�ĺ�' maxlength='25'>
	</td>
</tr>

<tr>
   <td class="lc1" align="center">����Ͷ��<br/>�������</td>
   <td class="lc2">
       <input type="radio" checked name="EXTCLEBRSIGN" size="20" value='1' title='��������� '>���������  <input type="radio" name="EXTCLEBRSIGN" size="20" title='�޶���Ͷ��' value='2' >�޶���Ͷ��
   </td>
   
   <td class="lc1" align="center">��֧����ע��<br/>�Ǽ����</td>
   <td class="lc2">
      <input type="radio" checked name="CANCELBRSIGN" size="20" value='1' title='�Ѱ������'>�Ѱ������ <input type="radio" name="CANCELBRSIGN" size="20" title='�޷�֧����' value='2' >�޷�֧����
   </td>

</tr>
<tr>
   <td class="lc1" align="center">ծȨծ��<br/>�������</td>
   <td class="lc2">
     <input type="radio" name="DECLEBRSIGN" checked size="20" value='1' title='���������'>��������� <input type="radio" name="DECLEBRSIGN" size="20" title='��ծȨծ�� ' value='2' >��ծȨծ�� 
   </td>
   
   <td class="lc1" align="center">��׼֤��<br/>�������</td>
   <td class="lc2">
     <input type="radio" name="CANCELLATIONCERTIFICATE" checked size="20" value='1' title='��׼֤���ѽ������'>��׼֤���ѽ������ 
   </td>
   
</tr>

<tr>
   <td class="lc1" align="center">��˰���</td>
   <td class="lc2">
     <input type="radio" name="CLEANTAX" checked size="20" value='10' title='���������'>��������� <input type="radio" name="CLEANTAX" size="20" title='δ�漰��˰���� ' value='30' >δ�漰��˰���� 
   </td>
   
   <td class="lc1" align="center">��������<br/>������</td>
   <td class="lc2">
     <input type="radio" name="CUSTOMSETTLEMENT" checked size="20" value='1' title='�Ѱ������'>�Ѱ������ <input type="radio" name="CUSTOMSETTLEMENT" size="20" title='δ�漰�������� ' value='2' >δ�漰��������
   </td>
</tr>

<tr>
    <td class="lc1" rowspan="2" align="center">�������</td>
    <td class="lc1" align="center" nowrap="nowrap">���汨ֽ����</td>
    <td class="lc2" colspan="2">
       <input type="text" name="PUBNEWSNAME" size="50" title='���汨ֽ����' maxlength='25'>
    </td>
</tr>
<tr>
    <td class="lc1" align="center">��������</td>
    <td class="lc2" colspan="2">
       <input type="text" name="PUBDATE" size="15" datatype='date' title='��������' maxlength='12'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    </td>
</tr>

</table>