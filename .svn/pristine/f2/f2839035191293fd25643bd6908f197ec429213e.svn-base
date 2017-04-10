<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
   <td class="yxsm" colspan="5">&nbsp;注销信息</td> 
</tr>
<tr>
   <td class="lc1" align="center">申请注销登记的原因</td>
   <td class="lc2" colspan=4>
	   <%--申请书上的注销原因与sys_dmdz表中type=CANREA的内容对照，取code字段的值作为value值--%>
	   <select name="CANREA" disblank title="申请注销登记的原因" style="width:200">
	     <option value=""></option><%=icms.getSysDmList("CANREA")%>	     
	   </select>&nbsp;<font style="color:red">*</font>
   </td>
</tr>
<tr>
   <td class="lc1" align="center">批准机关</td>
   <td class="lc2">
      <input type="text" name="SANAUTH" size="20" disblank title="批准机关" maxlength=50>&nbsp;<font style="color:red">*</font>
   </td>
   <td class="lc1" align="center" colspan=2 nowrap="nowrap">清理债权债务单位</td>
   <td class="lc2">
      <input type="text" name="DECLECOMP" size="20" disblank title="清理债权债务单位" maxlength=50>&nbsp;<font style="color:red">*</font>
   </td>
</tr>
<tr>
   <td class="lc1" align="center">批准文号</td>
   <td class="lc2">
      <input type="text" name="SANDOCNO" size="20" disblank title="批准文号" maxlength=25>&nbsp;<font style="color:red">*</font>
   </td>
   <td class="lc1" align="center" nowrap="nowrap">批准日期</td>
   <td class="lc2" colspan=2>
      <input type="text" name="SANDATE" size="20" title="批准日期" datatype=date disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">&nbsp;<font style="color:red">*</font>
   </td>
</tr>


<tr>
   <td class="lc1" align="center">清税情况</td>
   <td class="lc2">
     <input type="radio" name="CLEANTAX" checked size="20" value='10' title='已清理完毕'>已清理完毕 <input type="radio" name="CLEANTAX" size="20" title='未涉及纳税义务 ' value='30' >未涉及纳税义务
   </td>
   
   <td class="lc1" align="center">海关手续<br/>清缴情况</td>
   <td class="lc2" colspan=2>
     <input type="radio" name="CUSTOMSETTLEMENT" checked size="20" value='1' title='已办理完毕'>已办理完毕 <input type="radio" name="CUSTOMSETTLEMENT" size="20" title='未涉及海关事务 ' value='2' >未涉及海关事务
   </td>
</tr>
</table>