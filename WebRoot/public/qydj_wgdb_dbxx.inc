<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >��������</td>   
	<td class="lc2" ><input type="text" name="NAME"  disblank maxlength=15>&nbsp;<font color=red>*</font>	
	</td> 
	
	<td class="lc1" >����(����)</td>   
	<td class="lc2" >
	<input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="����" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="ѡ ��..">					
		<font color=red>*</font>
	</td> 
   </tr>
   <tr>
    <td class="lc1">�뾳ʱ��</td>
    <td class="lc2">
    <input type="text" name="ARRCHDATE" title="�뾳ʱ��" maxlength=10 disblank datatype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    &nbsp;<font color=red>*</font>
    </td>
    
    <td class="lc1" >��ϵ�绰</td>   
	<td class="lc2" >
	<input type="text" name="TEL" disblank title="��ϵ�绰" maxlength=20 size="30%">&nbsp;<font color=red>*</font>
    </td>
   </tr>
   <tr> 
    <td class="lc1" >֤������</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="֤������" disblank style="width:192px; ">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>   
	<td class="lc1" >֤������</td>   
	<td class="lc2"><input type="text" name="CERNO" disblank title="֤������" maxlength=20 size="30%">&nbsp;<font color=red>*</font>
	</td> 	
   </tr>
   <tr>
    <td class="lc1">���ھ�ס��ַ</td>
    <td class="lc2" colspan="1"><input type="text" name="HOUADDINCHINA" title="���ھ�ס��ַ" maxlength=50 size="40%"></td>
   <td class="lc1" >ְ��</td>   
	<td class="lc2" >
	  <select size="1" name="POSITION" title="ְ��" disblank disabled="disabled">
	  <option value=''>��ѡ��ְ��</option><%=icms.getSysDmList("POSITION")%></select>&nbsp;<font color=red>*</font>
	</td> 
  
   </tr>
   <tr>
    <td class="lc1">����֤��Ч����</td>
    <td class="lc2" >
		��<input type="text" name="REPCARFROM" size=15 title="����֤������" datatype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})"> 
		��<input type="text" name="REPCARTO" size=15 title="����֤������" datatype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	</td>
	
    <td class="lc1" >��ϯ������־</td>   
	<td class="lc2" colspan="3">
		<input type="radio" value="1"  name="LEREPSIGN" title="��ϯ������־" disabled=<%=fddbrFlag%>>�� 
		<input type="radio" value="2"  name="LEREPSIGN" title="��ϯ������־" checked disabled=<%=fddbrFlag%>>��
	</td>
</tr> 
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
    1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>
	</p></td>   
 </tr>
</table>