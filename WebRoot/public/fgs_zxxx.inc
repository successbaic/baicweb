<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
   <td class="yxsm" colspan="5">&nbsp;分公司注销信息</td> 
</tr> 
<tr>
   <td class="lc1" align="center" width="">申请注销<br>登 记 的<br>原   因</td>
   <td class="lc2" colspan=4>
	<%--申请书上的注销原因与sys_dmdz表中type=CANREA的内容对照，取code字段的值作为value值--%>
	<input type="radio" name="CANREA" value="32">1、分公司被公司撤销。<br/>
	<input type="radio" name="CANREA" value="31">2、分公司被依法责令关闭。<br/>
	<input type="radio" name="CANREA" value="50">3、分公司被吊销营业执照。<br/>
	<input type="radio" name="CANREA" value="90">4、其它原因<br/>
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
<tr>
   <td class="lc1" align="center">注销说明</td>
   <td class="lc2" colspan="4">
      <textarea rows="5" name="REMARK" maxlength=200 cols="89" title="注销说明"></textarea>
   </td>
</tr>
</table>