<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >����</td>   
	<td class="lc2" ><input type="text" name="NAME" title="����" disblank maxlength=25>
	<input type="hidden" name="LEREPSIGN" value=1>&nbsp;<font color=red>*</font>	</td> 
	
	<td class="lc1" >�Ա�</td>
    <td class="lc2" >
    <select size="1" name="SEX" title="�Ա�" diablank >
	<option value=''>��ѡ���Ա�</option><%=icms.getSysDmList("SEX")%></select>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1" >��������</td>
	<td class="lc2" ><input type="text" name="NATDATE" title="��������" maxlength=10 datatype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" diablank>&nbsp;<font color=red>*</font></td>
   </tr>
   <tr>
     <td class="lc1" >�Ļ��̶�</td>   
	 <td class="lc2" ><select size="1" name="LITEDEG" disblank title="�Ļ��̶�">
	   <option value=''>��ѡ���Ļ��̶�</option><%=icms.getSysDmList("LITEDEG")%></select>&nbsp;<font color=red>*</font>
	 </td>
	 
	 <td class="lc1" >������ò</td>   
	 <td class="lc2" ><select size="1" name="POLSTAND" title="������ò" diablank>
	   <option value=''>��ѡ��������ò</option><%=icms.getSysDmList("POLSTAND")%></select>&nbsp;<font color=red>*</font>
	 </td> 

	<td class="lc1" >����</td>   
	<td class="lc2" ><select size="1" name="NATION" title="����" diablank>
	  <option value=''>��ѡ������</option><%=icms.getSysDmList("NATION")%></select>&nbsp;<font color=red>*</font></td>  
   </tr>
   <tr> 	
	<td class="lc1" >����</td>   
	<td class="lc2" colspan="5"><input type="text" name="HOUSEADD" title="����" size="60" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>  
   </tr>
   <tr>
   <td class="lc1" >��������</td>   
	<td class="lc2" >
		<input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 diablank>&nbsp;<font color=red>*</font>
	</td>  
    <td class="lc1" >��ϵ�绰</td>   
	<td class="lc2" colspan="3">
		<input type="text" name="TEL" title="��ϵ�绰" size="15" datatype="TEL" maxlength=20 id="TEL">
	</td> 
   </tr>
      <tr> 
    <td class="lc1" >֤������</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="֤������" disblank>
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>   
	<td class="lc1" >֤������</td>   
	<td class="lc2" colspan="3"><input type="text" name="CERNO" disblank title="֤������" maxlength=20 size="30">&nbsp;<font color=red>*</font></td> 
	
   </tr> 
    <tr> 
	<td class="lc1" >�ƶ��绰</td>   
	<td class="lc2" ><input type="text" name="MOBTEL" datatype="TEL" title="�ƶ��绰" id="MOBTEL" maxlength=20>&nbsp;<font color=red>*</font>	</td> 
	<td class="lc1" >��������</td>   
	<td class="lc2" ><input type="text" name="EMAIL" datatype="EMAIL" title="��������" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>
   
   <tr> 
	<td class="lc1" >����ǰְҵ״��</td>   
	<td class="lc2" colspan="5"><input type="text" name="OCCSTBEAPP" title="����ǰְҵ״��" size="70" maxlength=50 diablank>&nbsp;<font color=red>*</font></td>   
   </tr>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
    ������Ϣ��ΪΪ�����û�е�����д���ޡ���
	<br>
	</p></td>   
 </tr>
</table>