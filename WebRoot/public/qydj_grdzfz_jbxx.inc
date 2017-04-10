<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>个人独资分支机构基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap" style="width:100px;">名   称</td>   
	<td class="lc2" colspan="3" >
	<input type="text" name="ENTNAME" READONLY size="70" title="企业名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>
<tr>	
	<td class="lc1" nowrap>经营场所</td>   
 	<td class="lc2" colspan="3">
		<font color="red">说明：</font>经营场所请按下面的格式填写，系统会自动合并。<br/>
 		<select name="PROVINCE" title="省" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						省/直辖市/自治区） 
						<select name="CITY" id="CITY" title="（市/地区/盟/自治州）" maxlength=20 onchange="cityChange()" disblank>
							<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>
						（市/地区/盟/自治州）
						 <select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="（区/县/县级市/旗） " maxlength=20 disblank>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getCITY())%>
						</select>（区/县/县级市/旗）
						 <input type="text" name="TOWN" id="TOWN" title="乡" size="23" maxlength=25 onchange="writeDOM()">（乡/民族乡/镇/街道）
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="村" size="23" maxlength=25 onchange="writeDOM()">（路/村/社区）
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="号" size="10" maxlength=25 onchange="writeDOM()">（号） 
 		                <font color=red>*</font>
						<br>
						您录入的经营场所为：<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="经营场所" >
 		<font color=red>*</font>
 	</td></tr>
 	
 	
<tr>	
	<td class="lc1" nowrap >生产经营地</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>生产经营地请按下面的格式填写，系统会自动合并。<br/>									
						<select name="PROPROVINCE" id="PROPROVINCE" title="省" onchange="writePROLOC()">
						<%=icms.getSysDmList("PROVINCE")%>
						</select>
						省/直辖市/自治区） 
						<select name="PROCITY" id="PROCITY" title="（市/地区/盟/自治州）" maxlength=20 onchange="procityChange()" disblank>
							<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>
						（市/地区/盟/自治州）
						 <select name="PROCOUNTY" id="PROCOUNTY" onchange="writePROLOC()" title="（区/县/县级市/旗） " maxlength=20 disblank>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getPROCITY())%>
						</select>（区/县/县级市/旗）
						 <input type="text" name="PROTOWN" id="PROTOWN" title="乡" size="23" maxlength=25 onchange="writePROLOC()">（乡/民族乡/镇/街道）
 		                <input type="text" name="PROVILLAGE" id="PROVILLAGE" title="村" size="23" maxlength=25 onchange="writePROLOC()">（路/村/社区）
 		                <input type="text" name="PROHOUSENUMBER" id="PROHOUSENUMBER" title="号" size="10" maxlength=25 onchange="writePROLOC()">（号） 
 		                <font color=red>*</font>
						<br>
						您录入的生产经营地为：<input type="text" name="PROLOC" id="PROLOC" disblank style="width:380px" title="生产经营地" >
 		<font color=red>*</font>
 	</td></tr>
<tr> 	
 	<td class="lc1">邮政编码</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 

    <td class="lc1">联系电话</td>   
	<td class="lc2"><input type="text" name="TEL" title="联系电话" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
</tr>
<tr> 	
	<td class="lc1">经营范围及方式</td>   
	<td class="lc2" colspan="3">
	<textarea rows="4" name="BUSSCOPE" cols="100" maxlength=2000 title="经营范围及方式"></textarea> 
	</td>  
</tr> 
<tr>  	 
	<td class="lc1" >企业(机构)类型</td>   
	<td class="lc2" colspan="3"><select name="ENTTYPE" disblank title="企业(机构类型)">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","GRDZFZ")%></select>&nbsp;<font color=red>*</font>
	<!-- <input type="button" class="button"  style="height=20px;width=100px;" name="" value="企业类型简述" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/> -->
	</td>   
</tr>
<tr>
    <td class="lc1">拟设立登记机关</td>   
	<td class="lc2"><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td> 
	<td class="lc1" style="width:80px;">管辖单位</td>
	<td class="lc2"><select name="OPELOCDISTRICT" title="管辖单位" style="width:220px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
	<td class="lc1" nowrap="nowrap">负责人</td>
    <td class="lc2"><input type="text" name="LEREP" title="负责人" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>     
	
	<td class="lc1">从业人数</td>
	<td class="lc2">   
	<input type="text" name="EMPNUM" size="15" disblank maxlength=5 title='从业人数' datatype='int'>&nbsp;<font color=red>*</font></td>   
</tr>
 <tr>
   
	<td class="lc1" nowrap>核算方式</td>   
	<td class="lc2" colspan="3">
	<select name="CALCULATIONMETHOD" title="核算方式" style="width:180px;" disblank> 
	<option value=''>请选择核算方式</option>
	<%=icms.getSysDmList("CALCULATIONMETHOD")%>
	</select>
	&nbsp;<font color=red>*</font>
	</td>
</tr>	
 <tr>
	<td class="lc2" colspan="4">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
	<br>
    1、有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	2、企业的经营范围应当包含或者体现企业名称中的行业或者经营特征，经营范围用语应当参照国民经济行业分类标准（参见经营项目），有取得许可证书的须注明证书有效期。</p></td>   
 </tr>
</table>
<script language="javascript">
function checkSub(){
	return true;	
}
function setBusscope()
{}
</script>