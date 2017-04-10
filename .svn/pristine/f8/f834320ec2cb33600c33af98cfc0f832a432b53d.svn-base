<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >姓名</td>   
	<td class="lc2" ><input type="text" name="NAME"  disblank maxlength=25>&nbsp;<font color=red>*</font>	</td> 
	<td class="lc1" >职务</td>   
	<td class="lc2" >
	  <select size="1" name="POSITION" title="职务" disblank>
	  <option value=''>请选择职务</option>
	  <%
	  if(LEREPSIGN.equals("1") && ENTTYPE.equals("GS")){
	  %>
	  <option value='431A'>董事长</option>
	  <option value='431B'>副董事长</option>
	  <option value='432K'>执行董事</option>
	  <option value='434Q'>总经理</option>
	  <option value='434R'>副总经理</option>
	  <option value='436A'>经理</option>
	  <option value='410A'>董事长兼总经理</option>
	  <option value='410C'>执行董事兼总经理</option>
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
    <td class="lc1" >证件类型</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="证件类型" disblank>
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>   
	<td class="lc1" >证件号码</td>   
	<td class="lc2" colspan="3"><input type="text" name="CERNO" disblank title="证件号码" maxlength=20 size="30">&nbsp;<font color=red>*</font></td> 
   </tr> 

</table>
<input type="hidden" name="LEREPSIGN">
<input type="hidden" name="TEL">
<input type="hidden" name="POSBRFORM">
<input type="hidden" name="APPOUNIT">
<input type="hidden" name="HOUSEADD">