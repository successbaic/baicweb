<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >姓名</td>   
	<td class="lc2" ><input type="text" name="NAME"  disblank maxlength=15>&nbsp;<font color=red>*</font>	
	</td> 
	
	<td class="lc1" >国别(地区)</td>   
	<td class="lc2" >
	<input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="国别" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="选 择..">					
		<font color=red>*</font>
	</td> 
   </tr>
   <tr>
    <td class="lc1">入境时间</td>
    <td class="lc2">
    <input type="text" name="ARRCHDATE" disblank title="入境时间" maxlength=10 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    &nbsp;<font color=red>*</font>
    </td>
    <td class="lc1" >联系电话</td>   
	<td class="lc2" >
	<input type="text" name="TEL" disblank title="联系电话" maxlength=20 size="30%" datatype="TEL">&nbsp;<font color=red>*</font>
    </td>
   </tr>
   
   <tr> 
	 
	<td class="lc1" >电子邮箱</td>   
	<td class="lc2"><input type="text" name="EMAIL" datatype="EMAIL" title="电子邮箱" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1" >职务</td>   
	<td class="lc2" >
	  <select size="1" name="POSITION" title="职务" disblank disabled="disabled">
	  <option value=''>请选择职务</option><%=icms.getSysDmList("POSITION")%></select>&nbsp;<font color=red>*</font></td> 
  
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
    <td class="lc1">境内居住地址</td>
    <td class="lc2" colspan="3"><input type="text" name="HOUADDINCHINA" title="境内居住地址" maxlength=50 size="40%"></td>
	
   </tr>
   <tr>
    <td class="lc1">首席代表证有效期限</td>
    <td class="lc2" >
		自<input type="text" name="REPCARFROM" size=15 title="代表证期限自" datatype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})"> 
		至<input type="text" name="REPCARTO" size=15 title="代表证期限至" datatype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	</td>
	
    <td class="lc1" >首席代表标志</td>   
	<td class="lc2" colspan="3">
		<input type="radio" value="1"  name="LEREPSIGN" title="首席代表标志" checked disabled=<%=fddbrFlag%>>是 
		<input type="radio" value="2"  name="LEREPSIGN" title="首席代表标志" disabled=<%=fddbrFlag%>>否
	</td>
</tr> 
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
    1、有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	</p></td>   
 </tr>
</table>