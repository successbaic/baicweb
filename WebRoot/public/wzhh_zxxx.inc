<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
    <td class="yxsm" colspan="4">&nbsp;ע����Ϣ</td> 
</tr>
<tr>
    <td class="lc1" align="center" nowrap="nowrap" width="10%">ע��ԭ   ��</td>
    <td class="lc2" colspan="3">
	<%--�������ϵ�ע��ԭ����sys_dmdz����type=CANREA�����ݶ��գ�ȡcode�ֶε�ֵ��Ϊvalueֵ--%>
	   <select name="CANREA" disblank title="����ע���Ǽǵ�ԭ��" style="width:200">
	     <option value=""></option><%=icms.getSysDmList("CANREA")%>	     
	   </select>
    </td>
</tr>
<tr>
    <td class="lc1" align="center" nowrap="nowrap">�����˱���<br/>ȷ��������</td>
    <td class="lc2" colspan=3>
        <input type="text" name=AFFWRITNO disblank size="65" title="�����˱���ȷ��������" maxlength=100><font color="red">*</font>
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
   <td class="lc2" colspan=3>
     <input type="radio" name="DECLEBRSIGN" checked size="20" value='1' title='���������'>��������� <input type="radio" name="DECLEBRSIGN" size="20" title='��ծȨծ�� ' value='2' >��ծȨծ�� 
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
   <td class="lc1" align="center" nowrap="nowrap">��׼�ĺ�</td>
   <td class="lc2">
     <input type="text" name="SANDOCNO" size="15" title="��׼�ĺ�" maxlength=25>
   </td>
   <td class="lc1" align="center" nowrap="nowrap">��׼����</td>
   <td class="lc2">
     <input type="text" name="SANAUTH" size="20" title="��׼����" maxlength=50>
   </td>
</tr>

<tr>
   <td class="lc1" align="center" nowrap="nowrap">���汨ֽ����</td>
   <td class="lc2">
      <input type="text" name="PUBNEWSNAME" size="30" title="���汨ֽ����" maxlength=50>
   </td>
   <td class="lc1" align="center" nowrap="nowrap">��������</td>
   <td class="lc2">
      <input type="text" name="PUBDATE" size="20" title="��������" maxlength=50 datatype=date   class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
   </td>
</tr>

</table>