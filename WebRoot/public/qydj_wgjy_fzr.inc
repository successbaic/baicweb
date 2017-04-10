<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1" >姓名</td>   
	<td class="lc2" ><input type="text" name="NAME"  disblank maxlength=25>&nbsp;<font color=red>*</font>	</td> 
	
	<td class="lc1" >国籍</td>   
	<td class="lc2" >
	<input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="国别" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="选 择..">					
		<font color=red>*</font>
	</td>  
   </tr>
   <%--tr>
    <td class="lc1" nowrap="nowrap">出生日期</td>
    <td class="lc2">
    <input type="text" name="NATDATE" title="出生日期" maxlength=10 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    </td>
   
	<td class="lc1" nowrap="nowrap">任职期限</td>
    <td class="lc2">
     自<input type="text" name="OFFHFROM" title="任职起始日期" size="20" maxlength=20 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	至<input type="text" name="OFFHTO" title="任职截止日期" size="20" maxlength=20 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	&nbsp;<font color=red>*</font>
    </td>	
   </tr--%>
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
    <%--td class="lc1" >住址</td>
    <td class="lc2"><input type="text" name="HOUSEADD"  title="住址" maxlength=50 size="50%">
    </td--%>
    	   
    <td class="lc1" >固定电话</td>   
	<td class="lc2" >
	<input type="text" name="TEL" id="TEL" title="固定电话" maxlength=20 size="30%" datatype="TEL">
    <input type="hidden" name="LEREPSIGN" title="法定代表人标志" value=1>
    </td>   
    <td class="lc1" >移动电话</td>   
	<td class="lc2" ><input type="text" name="MOBTEL" datatype="TEL" title="移动电话" id="MOBTEL" maxlength=20></td>
   </tr> 
   
   <tr> 
	<td class="lc1" >电子邮箱</td>   
	<td class="lc2" colspan="3"><input type="text" name="EMAIL" datatype="EMAIL" title="电子邮箱" maxlength=30 disblank>&nbsp;<font color=red>*</font></td>
   </tr>

<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	</p></td>   
 </tr>
</table>