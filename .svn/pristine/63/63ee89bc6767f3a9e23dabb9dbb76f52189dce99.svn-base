<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >姓名</td>   
	<td class="lc2" ><input type="text" name="NAME"  disblank maxlength=25>&nbsp;<font color=red>*</font>	</td> 
	<td class="lc1" >国别(地区)</td>   
	<td class="lc2" >
	<input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="国别" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="选 择..">					
		<font color=red>*</font>
	</td> 
   </tr>
   
    <tr> 
    <td class="lc1" >证件类型</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="证件类型" disblank style="width:192px; ">
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font></td>   
	<td class="lc1" >证件号码</td>   
	<td class="lc2"><input type="text" name="CERNO" disblank title="证件号码" maxlength=20 size="30%">&nbsp;<font color=red>*</font>
	</td> 	
   </tr>
   
    <tr>  
    <td class="lc1" >职务</td>   
	<td class="lc2" >
	  <select size="1" name="POSITION" title="职务" disblank style="width:192px; ">
	  <option value=''>请选择职务</option><%=icms.getSysDmList("POSITION")%></select>&nbsp;<font color=red>*</font>
	</td> 
   
	<td class="lc1" nowrap="nowrap">职务产生方式</td>   
	<td class="lc2">
	<select size="1" name="POSBRFORM" title="产生方式" style="width:192px; ">
	  <option value=''>请选择产生方式</option>
	  <option value='03'>选举</option>
	  <option value='04'>聘用</option>
	  <option value='02'>委派</option>
	  <option value='01'>任命</option>
	</select>&nbsp;
	</td>
   </tr>
   
   <tr>
   <td class="lc1" >固定电话</td>   
	<td class="lc2" >
	<input type="text" name="TEL" id="TEL" title="固定电话" maxlength=20 size="30%" datatype="TEL" >&nbsp;
    </td>
	<td class="lc1" >移动电话</td>   
	<td class="lc2" ><input type="text" name="MOBTEL"  id="MOBTEL" datatype="TEL" title="移动电话" maxlength=20></td> 	    
   </tr>
   
   <tr>
   <td class="lc1" >电子邮箱</td>   
	<td class="lc2" colspan="3"><input type="text" name="EMAIL" datatype="EMAIL" title="电子邮箱" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>
  <%--
   <tr>
   <td class="lc1" >性别</td>
    <td class="lc2" >
	  <select size="1" name="SEX" title="性别" style="width:192PX; ">
	  <option value=''>请选择性别</option><%=icms.getSysDmList("SEX")%></select>
	</td>
	
	<td class="lc1">出生日期</td>
    <td class="lc2">
    <input type="text" name="NATDATE" title="出生日期" maxlength=10 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    </td>
   </tr>
  
   <tr>
    <td class="lc1" >派出单位</td>   
	<td class="lc2" colspan="3"><input type="text" name="APPOUNIT" title="派出单位" maxlength=25 size="65%">&nbsp;</td> 
   </tr>
  
   <tr>
    <td class="lc1" >住址</td>
    <td class="lc2" colspan="3"><input type="text" name="HOUSEADD"  title="住址" maxlength=50 size="65%"></td>
   </tr>
	--%>
 

<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	</p></td>   
 </tr>
</table>

<input type="hidden" name="LEREPSIGN">