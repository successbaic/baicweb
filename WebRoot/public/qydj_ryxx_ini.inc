<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >����</td>   
	<td class="lc2" ><input type="text" name="NAME"  disblank maxlength=25>&nbsp;<font color=red>*</font>	</td> 
	<td class="lc1" >ְ��</td>   
	<td class="lc2" >
	  <select size="1" name="POSITION" title="ְ��" disblank>
	  <option value=''>��ѡ��ְ��</option>
	  <%
	  if(LEREPSIGN.equals("1") && ENTTYPE.equals("GS")){
	  %>
	  <option value='431A'>���³�</option>
	  <option value='431B'>�����³�</option>
	  <option value='432K'>ִ�ж���</option>
	  <option value='434Q'>�ܾ���</option>
	  <option value='434R'>���ܾ���</option>
	  <option value='436A'>����</option>
	  <option value='410A'>���³����ܾ���</option>
	  <option value='410C'>ִ�ж��¼��ܾ���</option>
	  <%
	  }else{
	  %>
	  <%=icms.getSysDmList("POSITION")%>
	  <%
	  }
	  %>
	  </select>&nbsp;<font color=red>*</font></td> 	
   </tr>
 </tr> 
   <tr> 
    <td class="lc1" >֤������</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="֤������" disblank>
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>   
	<td class="lc1" >֤������</td>   
	<td class="lc2" colspan="3"><input type="text" name="CERNO" disblank title="֤������" maxlength=20 size="30">&nbsp;<font color=red>*</font></td> 
   </tr> 

</table>
<input type="hidden" name="LEREPSIGN">
<input type="hidden" name="TEL">
<input type="hidden" name="POSBRFORM">
<input type="hidden" name="APPOUNIT">
<input type="hidden" name="HOUSEADD">