<table width="100%" border=1 cellpadding="0" cellspacing="0">
<tr>
    <td class="yxsm" colspan="6">&nbsp;注销信息</td> 
</tr>
<tr> 
	<td class="lc1"   align="center" nowrap="nowrap" width="20%">清算组成员《备案通知书》文号</td>
	<td class="lc2" colspan="3">
		<input type="text" name="AFFWRITNO" size="50" disblank title='清算组成员《备案通知书》文号' maxlength='25'>
	</td>
</tr>
<tr>
   <td class="lc1" align="center" >申请注销<br>登 记 的<br>原   因</td>
   <td class="lc2" colspan=3>
	 <%--申请书上的注销原因与sys_dmdz表中type=CANREA的内容对照，取code字段的值作为value值--%>
	 <input type="radio" name="CANREA" value="40">公司被依法宣告破产<br/>
	 <input type="radio" name="CANREA" value="10" checked>公司章程规定的营业期限届满或者其他解散事由出现<br/>
	 <input type="radio" name="CANREA" value="20">股东会、股东大会决议解散或者一人有限责任公司的股东、外商投资的公司董事会议解散<br/>
	 <input type="radio" name="CANREA" value="50">依法被吊销营业执照、责令关闭或者被撤销<br/>
	 <input type="radio" name="CANREA" value="30">人民法院依法予以解散<br/>
	 <input type="radio" name="CANREA" value="90">法律、行政法规规定的其他解散情形<br/>
   </td>
</tr>

<!--  tr>
    <td class="lc1" colspan="2" align="center">债权债务清理情况</td>
	<td class="lc2" colspan="4">
		<input type="radio" name="DECLEBRSIGN" checked value='' title='对外投资已清理完毕'>对外投资已清理完毕<br/>
		<input type="radio" name="DECLEBRSIGN" value='' title='分公司（分支机构）已注销完毕 ' >分公司（分支机构）已注销完毕<br/>
		<input type="radio" name="DECLEBRSIGN" value='' title='债权债务已清理完毕 ' >债权债务已清理完毕<br/>
		<input type="radio" name="DECLEBRSIGN" value='' title='海关、税务已清缴完毕 ' >海关、税务已清缴完毕<br/>
		<input type="radio" name="DECLEBRSIGN" value='' title='批准证书已缴销完毕 ' >批准证书已缴销完毕 <br/>
		<input type="radio" name="DECLEBRSIGN" value='' title='其他 ' >其他
	</td>
</tr -->

<!-- tr>
	<td class="lc1" align="center">批准（决定）机关</td>
	<td class="lc2" colspan='2'><input type="text" name="SANAUTH" size="26" title='分公司注销登记情况' maxlength="30"></td>
	<td class="lc1" colspan='2' nowrap="nowrap" >批准（决定）文号</td>
	<td class="lc2"><input type="text" name="SANDOCNO" size="26" title='分公司注销登记情况' maxlength="30"></td>
</tr-->


<tr>
   <td class="lc1" align="center">对外投资<br/>清理情况</td>
   <td class="lc2">
       <input type="radio" checked name="EXTCLEBRSIGN" size="20" value='1' title='已清理完毕 '>已清理完毕  <input type="radio" name="EXTCLEBRSIGN" size="20" title='无对外投资' value='2' >无对外投资
   </td>
   
   <td class="lc1" align="center">分公司注销<br/>登记情况</td>
   <td class="lc2">
      <input type="radio" checked name="CANCELBRSIGN" size="20" value='1' title='已办理完毕'>已办理完毕 <input type="radio" name="CANCELBRSIGN" size="20" title='无分公司' value='2' >无分公司
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
<!--tr>
    <td class="lc1" rowspan="2" align="center">营业执照<br>缴销情况</td>
    <td class="lc1" align="center">正本数量</td>
    <td class="lc2">
        <input type="text" name="BLICREVORINUM" size="25" title='正本数量' maxlength='25'>
    </td>
    <td class="lc1" align="center">编号</td>
    <td class="lc2" colspan=2>
        <input type="text" name="BLICREVORINO" size="25" title='正本编号' maxlength='25'>
    </td>
</tr>
<tr>
    <td class="lc1" align="center">副本数量</td>
    <td class="lc2">
       <input type="text" name="BLICREVDUPCONUM" size="25" title='副本数量' maxlength='25'>
    </td>
    <td class="lc1" align="center">编号</td>
    <td class="lc2" colspan="2">
       <input type="text" name="BLICREVDUPCONO" size="25" title='副本编号' maxlength='25'>
    </td>
</tr-->
<tr>
    <td class="lc1" align="center">备    注</td>
    <td class="lc2" colspan="3">
       <textarea rows="5" name="REMARK" maxlength=200 cols="89" title="注销备注"></textarea>
    </td>
</tr>        
</table>