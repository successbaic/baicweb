<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
   <td class="yxsm" colspan="5" align="center">&nbsp;&nbsp;��˾ע����Ϣ</td> 
</tr>
<tr> 
   <td class="lc1" colspan=2 nowrap="nowrap" align="center">�������Ա������֪ͨ�顷�ĺ�</td>
   <td class="lc2" colspan=3>
      <input type="text" name="AFFWRITNO" size="50" disblank title='�������Ա������֪ͨ�顷�ĺ�' maxlength='25'>
   </td>
</tr>
<tr>
   <td class="lc1" align="center">����ע��<br>�� �� ��<br>ԭ   ��</td>
   <td class="lc2" colspan=4>
	 <%--�������ϵ�ע��ԭ����sys_dmdz����type=CANREA�����ݶ��գ�ȡcode�ֶε�ֵ��Ϊvalueֵ--%>
	 <input type="radio" name="CANREA" value="10" checked>��˾�³̹涨��Ӫҵ���޽�����������ɢ���ɳ���<br/>
	 <input type="radio" name="CANREA" value="20">�ɶ��������ɶ��ᡢ�ɶ��������ɢ<br/>
	 <input type="radio" name="CANREA" value="70">��˾�ϲ����߷�����Ҫ��ɢ<br/>
	 <input type="radio" name="CANREA" value="50">����������Ӫҵִ�ա�����رջ��߱�����<br/>
	 <input type="radio" name="CANREA" value="30">����Ժ�������Խ�ɢ<br/>
	 <input type="radio" name="CANREA" value="40">��˾�����������Ʋ�<br/>
	 <input type="radio" name="CANREA" value="90">���ɡ���������涨��������ɢ����<br/>
   </td>
</tr>

<tr>
   <td class="lc1" colspan='2' align="center">�ֹ�˾ע���Ǽ����</td>
   <td class="lc2">
      <input type="radio" checked name="CANCELBRSIGN" size="20" value='1' title='�Ѱ������'>�Ѱ������ <input type="radio" name="CANCELBRSIGN" size="20" title='�޷ֹ�˾' value='2' >�޷ֹ�˾
   </td>
</tr>
<tr>
   <td class="lc1" colspan='2' align="center">����Ͷ���������</td>
   <td class="lc2" colspan=3>
       <input type="radio" checked name="EXTCLEBRSIGN" size="20" value='1' title='��������� '>���������  <input type="radio" name="EXTCLEBRSIGN" size="20" title='�޶���Ͷ��' value='2' >�޶���Ͷ��
   </td>
</tr>
<tr>
   <td class="lc1" colspan='2' align="center">ծȨծ���������</td>
   <td class="lc2" colspan=3>
     <input type="radio" name="DECLEBRSIGN" checked size="20" value='1' title='���������'>��������� <input type="radio" name="DECLEBRSIGN" size="20" title='��ծȨծ�� ' value='2' >��ծȨծ�� 
   </td>
</tr>

<tr>
   <td class="lc1" colspan='2' align="center">��˰���</td>
   <td class="lc2" colspan=3>
     <input type="radio" name="CLEANTAX" checked size="20" value='10' title='���������'>��������� <input type="radio" name="CLEANTAX" size="20" title='δ�漰��˰���� ' value='30' >δ�漰��˰���� 
   </td>
</tr>
<tr>
   <td class="lc1" rowspan='2' align="center">�������</td>
   <td class="lc1" align="center">���汨ֽ����</td>
   <td class="lc2" colspan=3>
       <input type="text" name="PUBNEWSNAME" size="50" title='���汨ֽ����' maxlength='25'>
   </td>
</tr>
<tr>
   <td class="lc1" align="center" align="center">��������</td>
   <td class="lc2" colspan=3>
      <input type="text" name="PUBDATE" size="15" datatype='date' title='��������' maxlength='12'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
   </td>
</tr>
<tr>
    <td class="lc1" align="center">ע��˵��</td>
    <td class="lc2" colspan="4">
       <textarea rows="5" name="REMARK" maxlength=200 cols="89" title="ע��˵��"></textarea>
    </td>
</tr>
</table>