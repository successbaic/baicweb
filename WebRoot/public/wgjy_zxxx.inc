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
	   </select>&nbsp;<font style="color:red">*</font>
   </td>
</tr>
<tr>
   <td class="lc1" align="center">��׼����</td>
   <td class="lc2">
      <input type="text" name="SANAUTH" size="20" disblank title="��׼����" maxlength=50>&nbsp;<font style="color:red">*</font>
   </td>
   <td class="lc1" align="center" colspan=2 nowrap="nowrap">����ծȨծ��λ</td>
   <td class="lc2">
      <input type="text" name="DECLECOMP" size="20" disblank title="����ծȨծ��λ" maxlength=50>&nbsp;<font style="color:red">*</font>
   </td>
</tr>
<tr>
   <td class="lc1" align="center">��׼�ĺ�</td>
   <td class="lc2">
      <input type="text" name="SANDOCNO" size="20" disblank title="��׼�ĺ�" maxlength=25>&nbsp;<font style="color:red">*</font>
   </td>
   <td class="lc1" align="center" nowrap="nowrap">��׼����</td>
   <td class="lc2" colspan=2>
      <input type="text" name="SANDATE" size="20" title="��׼����" datatype=date disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">&nbsp;<font style="color:red">*</font>
   </td>
</tr>


<tr>
   <td class="lc1" align="center">��˰���</td>
   <td class="lc2">
     <input type="radio" name="CLEANTAX" checked size="20" value='10' title='���������'>��������� <input type="radio" name="CLEANTAX" size="20" title='δ�漰��˰���� ' value='30' >δ�漰��˰����
   </td>
   
   <td class="lc1" align="center">��������<br/>������</td>
   <td class="lc2" colspan=2>
     <input type="radio" name="CUSTOMSETTLEMENT" checked size="20" value='1' title='�Ѱ������'>�Ѱ������ <input type="radio" name="CUSTOMSETTLEMENT" size="20" title='δ�漰�������� ' value='2' >δ�漰��������
   </td>
</tr>
</table>