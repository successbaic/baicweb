
<table width="100%" border=1 cellpadding="0" cellspacing="0" >
<tr>
<td class="yxsm" colspan="5">&nbsp;ָ���������߹�ͬί�д����˵�֤��</td> 
</tr>	
<tr>
    <td class="lc1"  colspan="2" >������</td>
    <td class="lc2"  >
        <input type="text" name="APPPER" size="29"  title='������' maxlength='100' disblank>
        &nbsp;<font color=red>*</font>
    </td>
    <td class="lc1"  >ָ����������ί�д�����</td>
    <td class="lc2"  >
        <input type="text" name="CONSIGNER" size="29" disblank title='ί�д�����' maxlength='15'>
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1"  colspan="2" >ί�����Ȩ��</td>
	<td class="lc2" colspan="3" >
	  	&nbsp;1������<input type="text" name="ENTNAME" value="" size="55" disabled>(��ҵ����)��ע������<br>
	  	&nbsp;2��<input type="radio" name="IFLICENSE1" value="1">ͬ��&nbsp;<input type="radio" name="IFLICENSE1" value="2">��ͬ��&nbsp;&nbsp;&nbsp;&nbsp;�˶�ע���Ǽǲ����еĸ�ӡ����ǩ��˶����<br>
	  	&nbsp;3��<input type="radio" name="IFLICENSE2" value="1">ͬ��&nbsp;<input type="radio" name="IFLICENSE2" value="2">��ͬ��&nbsp;&nbsp;&nbsp;&nbsp;�޸���ҵ�Ա��ļ��Ĵ���<br>
	  	&nbsp;4��<input type="radio" name="IFLICENSE3" value="1">ͬ��&nbsp;<input type="radio" name="IFLICENSE3" value="2">��ͬ��&nbsp;&nbsp;&nbsp;&nbsp;�޸��йر������д����<br>
	  	&nbsp;5��<input type="radio" name="IFLICENSE4" value="1">ͬ��&nbsp;<input type="radio" name="IFLICENSE4" value="2">��ͬ��&nbsp;&nbsp;&nbsp;&nbsp;��ȡӪҵִ�պ��й�����<br>
  	</td>
 </tr>

<tr>
    <td class="lc1"  colspan="2" >ָ������ί�е���Ч����</td>
    <td class="lc2">
        <input type="text" name="CONFROM" size="30"    title='��Ч������'disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
    <td class="lc1">
         ��
    </td>
    <td class="lc2">
        <input type="text" name="CONTO" size="30"   title='��Ч������' disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>   
    <td class="lc1" rowspan="4">ָ��������ί�д����˻��߾�������Ϣ</td>
    <td class="lc1" height="27" nowrap="nowrap" width="10%">֤������</td>
    <td class="lc2" colspan="3">
	  <select size="1" name="CERTYPE" title="֤������" disblank style="width:192px; ">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font>
	</td> 
</tr>
<tr>	   
    <td class="lc1" height="27" nowrap="nowrap">֤������</td>
    <td class="lc2" colspan="3" >   
        <input type="text" name="CERNO" disblank title="����֤������" maxlength=40 size="30">&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1" height="27" >�̶��绰</td>
    <td class="lc2" colspan="3" >   
        <input type="text" name="TEL" size="30" title='�̶��绰���ƶ��绰����д����һ��' maxlength='30'  datatype="TEL">
    </td>
</tr>
<tr>   
    <td class="lc1" >�ƶ��绰</td>
    <td class="lc2" colspan="3">   
        <input type="text" name="MOBTEL" size="30" title='�̶��绰���ƶ��绰����д����һ��' maxlength='30' datatype="TEL">
    </td>
</tr>   
<tr>   
    <td class="lc1"  colspan="2">ί������</td>
    <td class="lc2" colspan="3">   
        <input type="text" name="CONDATE" size="30" title='ί������' disblank value=''  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����<br>
    1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>
	2���̶��绰���ƶ��绰����д����һ�
	<br>
	</p></td>   
 </tr>
</table>