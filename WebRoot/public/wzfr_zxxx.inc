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
	   </select>
   </td>
</tr>
<tr> 
	<td class="lc1"   align="center" nowrap="nowrap" width="20%">清算组成员《备案通知书》文号</td>
	<td class="lc2" colspan="3">
		<input type="text" name="AFFWRITNO" size="50" disblank title='清算组成员《备案通知书》文号' maxlength='25'>
	</td>
</tr>

<tr>
   <td class="lc1" align="center">对外投资<br/>清理情况</td>
   <td class="lc2">
       <input type="radio" checked name="EXTCLEBRSIGN" size="20" value='1' title='已清理完毕 '>已清理完毕  <input type="radio" name="EXTCLEBRSIGN" size="20" title='无对外投资' value='2' >无对外投资
   </td>
   
   <td class="lc1" align="center">分支机构注销<br/>登记情况</td>
   <td class="lc2">
      <input type="radio" checked name="CANCELBRSIGN" size="20" value='1' title='已办理完毕'>已办理完毕 <input type="radio" name="CANCELBRSIGN" size="20" title='无分支机构' value='2' >无分支机构
   </td>

</tr>
<tr>
   <td class="lc1" align="center">债权债务<br/>清理情况</td>
   <td class="lc2">
     <input type="radio" name="DECLEBRSIGN" checked size="20" value='1' title='已清理完毕'>已清理完毕 <input type="radio" name="DECLEBRSIGN" size="20" title='无债权债务 ' value='2' >无债权债务 
   </td>
   
   <td class="lc1" align="center">批准证书<br/>缴销情况</td>
   <td class="lc2">
     <input type="radio" name="CANCELLATIONCERTIFICATE" checked size="20" value='1' title='批准证书已缴销完毕'>批准证书已缴销完毕 
   </td>
   
</tr>

<tr>
   <td class="lc1" align="center">清税情况</td>
   <td class="lc2">
     <input type="radio" name="CLEANTAX" checked size="20" value='10' title='已清理完毕'>已清理完毕 <input type="radio" name="CLEANTAX" size="20" title='未涉及纳税义务 ' value='30' >未涉及纳税义务 
   </td>
   
   <td class="lc1" align="center">海关手续<br/>清缴情况</td>
   <td class="lc2">
     <input type="radio" name="CUSTOMSETTLEMENT" checked size="20" value='1' title='已办理完毕'>已办理完毕 <input type="radio" name="CUSTOMSETTLEMENT" size="20" title='未涉及海关事务 ' value='2' >未涉及海关事务
   </td>
</tr>

<tr>
    <td class="lc1" rowspan="2" align="center">公告情况</td>
    <td class="lc1" align="center" nowrap="nowrap">公告报纸名称</td>
    <td class="lc2" colspan="2">
       <input type="text" name="PUBNEWSNAME" size="50" title='公告报纸名称' maxlength='25'>
    </td>
</tr>
<tr>
    <td class="lc1" align="center">公告日期</td>
    <td class="lc2" colspan="2">
       <input type="text" name="PUBDATE" size="15" datatype='date' title='公告日期' maxlength='12'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
    </td>
</tr>

</table>