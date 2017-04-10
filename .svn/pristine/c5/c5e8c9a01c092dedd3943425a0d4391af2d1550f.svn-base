<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>个人独资企业基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" width="140px">企业名称</td>   
	<td class="lc2" colspan="3" >
	<input type="text" name="ENTNAME" READONLY size="70" title="企业(机构)名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>
<tr>	
	<td class="lc1" nowrap>企业住所</td>   
 	<td class="lc2" colspan="3">
		<font color="red">说明：</font>企业住所请按下面的格式填写，系统会自动合并。<br/>
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
						您录入的企业住所为：<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="企业住所" >
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
	<textarea rows="4" name="BUSSCOPE" cols="80" maxlength=2000 title="经营范围及方式" disblank></textarea> &nbsp;<font color=red>*</font>
	</td>  
</tr> 
<tr>
	<td class="lc1">出资额</td>   
	<td class="lc2">
	<input type="text" name="REGCAP" id="REGCAP" title="出资额" onblur='doczregcap()' size="14" maxlength=14 datatype=NUM>万元</td>  
	<td class="lc1" >出资方式</td>   
	<td class="lc2">
		<select name="SCONFORM" disblank title="出资方式"  >
			<option value=""></option>
			<%=icms.getSysDmList("SCONFORM")%>
		</select>&nbsp;<font color=red>*</font>
	</td> 	
</tr>
<tr>
    <td class="lc1">投资人姓名</td>   
	<td class="lc2"><input type="text" name="LEREP" title="投资人姓名" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
    
    <td class="lc1">从业人数</td>   
	<td class="lc2" ><input type="text" name="EMPNUM" title="从业人数" disblank datatype=INT size="10" maxlength=5 >&nbsp;<font color=red>*</font></td>    
</tr>
<tr>  
	<td class="lc1" nowrap="nowrap">企业(机构)类型</td>   
	<td class="lc2"><select name="ENTTYPE" disblank title="企业(机构类型)">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","GRDZ")%></select>&nbsp;<font color=red>*</font>
	<!-- <input type="button" class="button"  style="height=20px;width=100px;" name="" value="企业类型简述" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/>-->
	</td>   
	
	<td class="lc1" nowrap="nowrap">拟设立登记机关</td>   
	<td class="lc2"><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  
</tr> 
<tr> 	
	<td class="lc1">管辖单位</td>   
	<td class="lc2"><select name="OPELOCDISTRICT" title="管辖单位"  style="width:220px; " onclick="loadgss()"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
	
	<td class="lc1">管片工商所</td>   
	<td class="lc2"><select name="LOCALADM" id="LOCALADM" title="管片工商所" style="width:220px; "> 
	<option value=''>请先选择管辖单位</option>
	</select></td>
	 
</tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
	所有信息均为为必填项，没有的请填写“无”。
 </tr>
</table>
<script>
function checkSub(){
	//var a=doczregcap();
	//if(a){
		return true;
	//}else{
	//	return false;
	//}	
}
function doczregcap()
{
	var REGCAP =document.getElementById("REGCAP").value;
	if(REGCAP!=null&&REGCAP!="")
	{
	   if (fucCheckNUM(REGCAP))
	   {
		 if (Math.abs(REGCAP)>999999999999)
		  {
			alert('出资额超过系统最大精度！');
			return false;
		  }
	    }else
	    {
		   alert('出资额应为数字！');
		   return false;
	    }
	}
	return true;
}
function setBusscope()
{}
</script>