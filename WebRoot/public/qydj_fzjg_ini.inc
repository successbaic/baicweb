<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1">名称</td>   
	<td class="lc2"><input type="text" name="BRNAME" disblank title="分公司名称" maxlength=50>&nbsp;<font color=red>*</font></td> 	 
	<td class="lc1">注册号</td>
	<td class="lc2"><input type="text" name="REGNO" disblank title="注册号" maxlength=15>&nbsp;<font color=red>*</font></td>  
   </tr>
   	<td class="lc1">社会信用代码</td>
	<td class="lc2"><input type="text" name="UNISCID" title="社会信用代码" maxlength=18></td>  
	<td class="lc1">登记机关</td>   
	<td class="lc2"><input type="text" name="REGORG" disblank title="登记机关" maxlength=25>&nbsp;<font color=red>*</font></td> 	 
   <tr>
	<td class="lc1">登记日期</td>   
	<td class="lc2"><input type="text" name="REGDATE" disblank title="登记日期"  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">&nbsp;<font color=red>*</font></td>  
	<td class="lc1">登记类型</td>   
	<td class="lc2">
	<select name="REGULATION" disblank title="登记类型">
	<option value=""></option>
	<option value="0">新设</option>
	<option value="1">注销</option>
	<option value="2">名称变更</option>
	</select>&nbsp;<font color=red>*</font>
   </tr>   
</table>