<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
    <td class="yxsm" colspan="5">&nbsp;注销信息</td> 
</tr>
<tr>
    <td class="lc1" align="center" nowrap="nowrap">申请注销<br>登 记 的<br>原   因</td>
    <td class="lc2" colspan="4">
       <select name="CANREA" disblank title="申请注销登记的原因" style="width:200">
	     <option value=""></option><%=icms.getSysDmList("CANREA")%>	     
	   </select>
    </td>
</tr>
<tr>
   <td class="lc1" align="center">清税情况</td>
   <td class="lc2" colspan="4">
      <select id="CLEANTAX" name="CLEANTAX" disblank title="清税情况">
       <option value=''></option>
     <option value='10'>已经清理完毕</option>
	 <option value='30'>未涉及纳税义务</option>
      </select>
   </td>
</tr>  
</table>