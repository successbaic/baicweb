<table width="100%" border=1 cellpadding="0" cellspacing="0" >
<tr>
        <td class="yxsm" colspan="8">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>ί�д�����֤��</font>
        </p>
        </td>
      </tr>
<tr>
    <td class="lc1"  colspan="2" >ί��������</td>
    <td class="lc2"  colspan="2">
        <input type="text" name="APPPER" size="29"  title='������' maxlength='100' value="<%=GTDJ_JBXX.getOPERNAME()%>" disblank>
        &nbsp;<font color=red>*</font>
    </td>
    <td class="lc1"  >ί�д���������</td>
    <td class="lc2"  >
        <input type="text" name="CONSIGNER" size="29" disblank title='ί�д�����' maxlength='15'>
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1"  colspan="2" >ί�д���Ȩ��</td>
	<td class="lc2" colspan="4" >
	  	&nbsp;1��<input type="radio" name="IFLICENSE1" value="1" checked="checked">ͬ��&nbsp;<input type="radio" name="IFLICENSE1" value="2">��ͬ��&nbsp;&nbsp;&nbsp;&nbsp;�˶ԵǼǲ����еĸ�ӡ����ǩ��˶������<br>
	  	&nbsp;2��<input type="radio" name="IFLICENSE2" value="1" checked="checked">ͬ��&nbsp;<input type="radio" name="IFLICENSE2" value="2">��ͬ��&nbsp;&nbsp;&nbsp;&nbsp;�޸��йر������д����<br>
	  	&nbsp;3��<input type="radio" name="IFLICENSE3" value="1" checked="checked">ͬ��&nbsp;<input type="radio" name="IFLICENSE3" value="2">��ͬ��&nbsp;&nbsp;&nbsp;&nbsp;��ȡ����֪ͨ�飻<br>
	  	&nbsp;4��<input type="radio" name="IFLICENSE4" value="1" checked="checked">ͬ��&nbsp;<input type="radio" name="IFLICENSE4" value="2">��ͬ��&nbsp;&nbsp;&nbsp;&nbsp;��ȡ���幤�̻�Ӫҵִ�ա�<br>
  	</td>
 </tr>

<tr>
    <td class="lc1" colspan="2" >ί����Ч����</td>
    <td class="lc2" colspan="2">
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
    <td class="lc1" rowspan="3" nowrap="nowrap" colspan="2">ί�д�������Ϣ</td>
    <td class="lc1" height="27" nowrap="nowrap" width="10%">֤������</td>
    <td class="lc2">
	  <select size="1" id="CERTYPE" name="CERTYPE" title="֤������" disblank style="width:192px; ">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font>
	</td> 
    <td class="lc1" height="27" nowrap="nowrap">֤������</td>
    <td class="lc2" >   
        <input type="text" id="CERNO" name="CERNO" disblank title="����֤������" maxlength=40 size="30">&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1" height="27" width="15%">ס��</td>
    <td class="lc2" colspan="3" >   
        <input type="text" name="UNIT" size="50" title='ס��' maxlength='50'>
    </td>
</tr>    
<tr>
    <td class="lc1" height="27" >��������</td>
    <td class="lc2">   
        <input type="text" name="POSTALCODE" size="30" title='��������' maxlength='30'>
    </td>
    <td class="lc1" >��ϵ�绰</td>
    <td class="lc2">   
        <input type="text" name="TEL" size="30" title='��ϵ�绰' maxlength='30' datatype="TEL" disblank>&nbsp;<font color=red>*</font>
    </td>
</tr>  
<tr>   
    <td class="lc1"  colspan="2">ί������</td>
    <td class="lc2" colspan="2">   
        <input type="text" name="CONDATE" size="30" title='ί������' disblank value=''  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
</tr> 
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����<br>
	1�������Ӫ�߱���ȥ�Ǽǲ��Ű����Ǽ�ҵ�񣬿ɵ������һҳ��������ǰҳ�档
		<br>
    2���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>
	</p></td>   
 </tr>
</table>