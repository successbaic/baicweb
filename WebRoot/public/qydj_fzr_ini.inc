<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >����</td>   
	<td class="lc2" ><input type="text" name="NAME"  disblank maxlength=25 size="30%">&nbsp;<font color=red>*</font>	</td> 
	<td class="lc1" >�̶��绰</td>   
	<td class="lc2" ><input type="text" name="TEL" id="TEL" title="�̶��绰" maxlength=20 size="30%"></td>
   </tr>
   
   <tr> 
	<td class="lc1" >�ƶ��绰</td>   
	<td class="lc2" ><input type="text" name="MOBTEL" id="MOBTEL" datatype="TEL" title="�ƶ��绰" maxlength=20></td> 
	<td class="lc1" >��������</td>   
	<td class="lc2"><input type="text" name="EMAIL" datatype="EMAIL" title="��������" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>
   
   <tr>
	<td class="lc1" >ְ��</td>   
	<td class="lc2" >
	  <select size="1" name="POSITION" title="ְ��" disblank style="width:192px; ">
	  <option value=''>��ѡ��ְ��</option><%=icms.getSysDmList("POSITION")%></select>&nbsp;<font color=red>*</font></td> 
   <td class="lc1" >סַ</td>   
   <td class="lc2"><input type="text" name="HOUSEADD" title="סַ" maxlength=50 size="60%"></td>  
   </tr> 
   <tr> 
    <td class="lc1" >����֤������</td>   
	<td class="lc2">
	  <select size="1" name="CERTYPE" title="����֤������" disblank style="width:192px; ">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>   

	<td class="lc1" >����֤������</td>   
	<td class="lc2"><input type="text" name="CERNO" disblank title="����֤������" maxlength=20 size="30%">&nbsp;<font color=red>*</font>
	<input type="hidden" name="LEREPSIGN" title="���������˱�־" value="1">
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