<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
    <td class="yxsm" colspan="4">&nbsp;注销信息</td> 
</tr>
<tr>
    <td class="lc1" align="center" nowrap="nowrap" width="10%">注销原   因</td>
    <td class="lc2" colspan="3">
	<%--申请书上的注销原因与sys_dmdz表中type=CANREA的内容对照，取code字段的值作为value值--%>
	   <select name="CANREA" disblank title="申请注销登记的原因" style="width:200">
	     <option value=""></option><%=icms.getSysDmList("CANREA")%>	     
	   </select>
    </td>
</tr>
<tr>
    <td class="lc1" align="center" nowrap="nowrap">清算人备案<br/>确认文书编号</td>
    <td class="lc2" colspan=3>
        <input type="text" name=AFFWRITNO disblank size="65" title="清算人备案确认文书编号" maxlength=100><font color="red">*</font>
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
   <td class="lc2" colspan=3>
     <input type="radio" name="DECLEBRSIGN" checked size="20" value='1' title='已清理完毕'>已清理完毕 <input type="radio" name="DECLEBRSIGN" size="20" title='无债权债务 ' value='2' >无债权债务 
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
   <td class="lc1" align="center" nowrap="nowrap">批准文号</td>
   <td class="lc2">
     <input type="text" name="SANDOCNO" size="15" title="批准文号" maxlength=25>
   </td>
   <td class="lc1" align="center" nowrap="nowrap">批准机关</td>
   <td class="lc2">
     <input type="text" name="SANAUTH" size="20" title="批准机关" maxlength=50>
   </td>
</tr>

<tr>
   <td class="lc1" align="center" nowrap="nowrap">公告报纸名称</td>
   <td class="lc2">
      <input type="text" name="PUBNEWSNAME" size="30" title="公告报纸名称" maxlength=50>
   </td>
   <td class="lc1" align="center" nowrap="nowrap">公告日期</td>
   <td class="lc2">
      <input type="text" name="PUBDATE" size="20" title="公告日期" maxlength=50 datatype=date   class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
   </td>
</tr>

</table>