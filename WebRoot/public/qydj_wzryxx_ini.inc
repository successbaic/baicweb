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
    <td class="lc1" >ְ��</td>   
	<td class="lc2" >
	  <select size="1" name="POSITION" title="ְ��" disblank style="width:192px; ">
	  <option value=''>��ѡ��ְ��</option><%=icms.getSysDmList("POSITION")%></select>&nbsp;<font color=red>*</font>
	</td> 
   
	<td class="lc1" nowrap="nowrap">ְ�������ʽ</td>   
	<td class="lc2">
	<select size="1" name="POSBRFORM" title="������ʽ" style="width:192px; ">
	  <option value=''>��ѡ�������ʽ</option>
	  <option value='03'>ѡ��</option>
	  <option value='04'>Ƹ��</option>
	  <option value='02'>ί��</option>
	  <option value='01'>����</option>
	</select>&nbsp;
	</td>
   </tr>
   
   <tr>
   <td class="lc1" >�̶��绰</td>   
	<td class="lc2" >
	<input type="text" name="TEL" id="TEL" title="�̶��绰" maxlength=20 size="30%" datatype="TEL" >&nbsp;
    </td>
	<td class="lc1" >�ƶ��绰</td>   
	<td class="lc2" ><input type="text" name="MOBTEL"  id="MOBTEL" datatype="TEL" title="�ƶ��绰" maxlength=20></td> 	    
   </tr>
   
   <tr>
   <td class="lc1" >��������</td>   
	<td class="lc2" colspan="3"><input type="text" name="EMAIL" datatype="EMAIL" title="��������" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>
  <%--
   <tr>
   <td class="lc1" >�Ա�</td>
    <td class="lc2" >
	  <select size="1" name="SEX" title="�Ա�" style="width:192PX; ">
	  <option value=''>��ѡ���Ա�</option><%=icms.getSysDmList("SEX")%></select>
	</td>
	
	<td class="lc1">��������</td>
    <td class="lc2">
    <input type="text" name="NATDATE" title="��������" maxlength=10 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    </td>
   </tr>
  
   <tr>
    <td class="lc1" >�ɳ���λ</td>   
	<td class="lc2" colspan="3"><input type="text" name="APPOUNIT" title="�ɳ���λ" maxlength=25 size="65%">&nbsp;</td> 
   </tr>
  
   <tr>
    <td class="lc1" >סַ</td>
    <td class="lc2" colspan="3"><input type="text" name="HOUSEADD"  title="סַ" maxlength=50 size="65%"></td>
   </tr>
	--%>
 

<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵�����к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>
	</p></td>   
 </tr>
</table>

<input type="hidden" name="LEREPSIGN">