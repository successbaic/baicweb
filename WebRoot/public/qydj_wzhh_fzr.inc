<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >����</td>   
	<td class="lc2" ><input type="text" name="NAME"  disblank maxlength=25>&nbsp;<font color=red>*</font>	</td> 
	
	<td class="lc1" >����(����)</td>   
	<td class="lc2" >
	<input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="����" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="ѡ ��..">					
		<font color=red>*</font>
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
	<td class="lc1" >�̶��绰</td>   
	<td class="lc2" ><input type="text" name="TEL" datatype="TEL" title="�̶��绰" id="TEL" maxlength=20></td> 
	<td class="lc1" >�ƶ��绰</td>   
	<td class="lc2" ><input type="text" name="MOBTEL" datatype="TEL" title="�ƶ��绰" id="MOBTEL"  maxlength=20></td>
   </tr>
   
    <tr> 
	<td class="lc1" >��������</td>   
	<td class="lc2" colspan="3"><input type="text" name="EMAIL" datatype="EMAIL" title="��������" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>
   
   
    <%--tr>
	<td class="lc1" >�Ա�</td>
    <td class="lc2" >
	  <select size="1" name="SEX" title="�Ա�" disblank style="width:192PX; ">
	  <option value=''>��ѡ���Ա�</option><%=icms.getSysDmList("SEX")%></select>
	</td> 
	
	<td class="lc1">��������</td>
    <td class="lc2">
    <input type="text" name="NATDATE" title="��������" maxlength=10 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    </td>
   </tr>
   <tr>
    <td class="lc1" >���壨�з���</td>   
	<td class="lc2"><select size="1" name="NATION" title="���壨�з���" id="NATION">
	<option value=''>��ѡ������</option><%=icms.getSysDmList("NATION")%></select></td>
	<td class="lc1" >��ϵ�绰</td>   
	<td class="lc2" >
	<input type="text" name="TEL" title="��ϵ�绰" maxlength=20 size="30%">
    </td>
   </tr>
   <tr>
    <td class="lc1" >סַ</td>
    <td class="lc2" colspan="3"><input type="text" name="HOUSEADD"  title="סַ" maxlength=50 size="70"></td>
   </tr>
   <tr> 	
	<td class="lc1" >ί�ɵ�λ</td>   
	<td class="lc2" ><input type="text" name="APPOUNIT" title="ί�ɵ�λ" size="30" maxlength=50></td>  
   
	<td class="lc1" nowrap="nowrap">�Ƿ񷨶�������</td>   
	<td class="lc2" >
	  <select size="1" name="LEREPSIGN" title="���������˱�־" <%=fddbrFlag%> disblank style="width:192px;" >
	  <option value=''>��ѡ�񷨶������˱�־</option><%=icms.getSysDmList("YESORNO")%></select>&nbsp;<font color=red>*</font>
	</td>    
 </tr--%> 

<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵�����к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>
	</p></td>   
 </tr>
</table>
<input type="hidden" name="LEREPSIGN">