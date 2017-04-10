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
	<td class="lc1" >固定电话</td>   
	<td class="lc2" ><input type="text" name="TEL" datatype="TEL" title="固定电话" id="TEL" maxlength=20></td> 
	<td class="lc1" >移动电话</td>   
	<td class="lc2" ><input type="text" name="MOBTEL" datatype="TEL" title="移动电话" id="MOBTEL"  maxlength=20></td>
   </tr>
   
    <tr> 
	<td class="lc1" >电子邮箱</td>   
	<td class="lc2" colspan="3"><input type="text" name="EMAIL" datatype="EMAIL" title="电子邮箱" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>
   
   
    <%--tr>
	<td class="lc1" >性别</td>
    <td class="lc2" >
	  <select size="1" name="SEX" title="性别" disblank style="width:192PX; ">
	  <option value=''>请选择性别</option><%=icms.getSysDmList("SEX")%></select>
	</td> 
	
	<td class="lc1">出生日期</td>
    <td class="lc2">
    <input type="text" name="NATDATE" title="出生日期" maxlength=10 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    </td>
   </tr>
   <tr>
    <td class="lc1" >民族（中方）</td>   
	<td class="lc2"><select size="1" name="NATION" title="民族（中方）" id="NATION">
	<option value=''>请选择民族</option><%=icms.getSysDmList("NATION")%></select></td>
	<td class="lc1" >联系电话</td>   
	<td class="lc2" >
	<input type="text" name="TEL" title="联系电话" maxlength=20 size="30%">
    </td>
   </tr>
   <tr>
    <td class="lc1" >住址</td>
    <td class="lc2" colspan="3"><input type="text" name="HOUSEADD"  title="住址" maxlength=50 size="70"></td>
   </tr>
   <tr> 	
	<td class="lc1" >委派单位</td>   
	<td class="lc2" ><input type="text" name="APPOUNIT" title="委派单位" size="30" maxlength=50></td>  
   
	<td class="lc1" nowrap="nowrap">是否法定代表人</td>   
	<td class="lc2" >
	  <select size="1" name="LEREPSIGN" title="法定代表人标志" <%=fddbrFlag%> disblank style="width:192px;" >
	  <option value=''>请选择法定代表人标志</option><%=icms.getSysDmList("YESORNO")%></select>&nbsp;<font color=red>*</font>
	</td>    
 </tr--%> 

<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	</p></td>   
 </tr>
</table>
<input type="hidden" name="LEREPSIGN">