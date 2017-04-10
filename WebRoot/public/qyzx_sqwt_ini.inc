
<table width="100%" border=1 cellpadding="0" cellspacing="0" >
<tr>
<td class="yxsm" colspan="5">&nbsp;指定代表或者共同委托代理人的证明</td> 
</tr>	
<tr>
    <td class="lc1"  colspan="2" >申请人</td>
    <td class="lc2"  >
        <input type="text" name="APPPER" size="29"  title='申请人' maxlength='100' disblank>
        &nbsp;<font color=red>*</font>
    </td>
    <td class="lc1"  >指定代表或者委托代理人</td>
    <td class="lc2"  >
        <input type="text" name="CONSIGNER" size="29" disblank title='委托代理人' maxlength='15'>
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1"  colspan="2" >委托事项及权限</td>
	<td class="lc2" colspan="3" >
	  	&nbsp;1、办理<input type="text" name="ENTNAME" value="" size="55" disabled>(企业名称)的注销手续<br>
	  	&nbsp;2、<input type="radio" name="IFLICENSE1" value="1">同意&nbsp;<input type="radio" name="IFLICENSE1" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;核对注销登记材料中的复印件并签署核对意见<br>
	  	&nbsp;3、<input type="radio" name="IFLICENSE2" value="1">同意&nbsp;<input type="radio" name="IFLICENSE2" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;修改企业自备文件的错误<br>
	  	&nbsp;4、<input type="radio" name="IFLICENSE3" value="1">同意&nbsp;<input type="radio" name="IFLICENSE3" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;修改有关表格的填写错误<br>
	  	&nbsp;5、<input type="radio" name="IFLICENSE4" value="1">同意&nbsp;<input type="radio" name="IFLICENSE4" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;领取营业执照和有关文书<br>
  	</td>
 </tr>

<tr>
    <td class="lc1"  colspan="2" >指定或者委托的有效期限</td>
    <td class="lc2">
        <input type="text" name="CONFROM" size="30"    title='有效期限自'disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
    <td class="lc1">
         至
    </td>
    <td class="lc2">
        <input type="text" name="CONTO" size="30"   title='有效期限至' disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>   
    <td class="lc1" rowspan="4">指定代表或委托代理人或者经办人信息</td>
    <td class="lc1" height="27" nowrap="nowrap" width="10%">证件类型</td>
    <td class="lc2" colspan="3">
	  <select size="1" name="CERTYPE" title="证件类型" disblank style="width:192px; ">
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font>
	</td> 
</tr>
<tr>	   
    <td class="lc1" height="27" nowrap="nowrap">证件号码</td>
    <td class="lc2" colspan="3" >   
        <input type="text" name="CERNO" disblank title="身份证件号码" maxlength=40 size="30">&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1" height="27" >固定电话</td>
    <td class="lc2" colspan="3" >   
        <input type="text" name="TEL" size="30" title='固定电话和移动电话可填写其中一项' maxlength='30'  datatype="TEL">
    </td>
</tr>
<tr>   
    <td class="lc1" >移动电话</td>
    <td class="lc2" colspan="3">   
        <input type="text" name="MOBTEL" size="30" title='固定电话和移动电话可填写其中一项' maxlength='30' datatype="TEL">
    </td>
</tr>   
<tr>   
    <td class="lc1"  colspan="2">委托日期</td>
    <td class="lc2" colspan="3">   
        <input type="text" name="CONDATE" size="30" title='委托日期' disblank value=''  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：<br>
    1、有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	2、固定电话和移动电话可填写其中一项。
	<br>
	</p></td>   
 </tr>
</table>
