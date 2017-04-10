<table width="98%" border=1 cellpadding="0" cellspacing="0" align='center'>
<tr>
    <td class="yxsm" colspan="6" align="center">
       <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>外国（地区）企业在中国境内从事生产经营活动机构基本信息</font></p>
    </td>
</tr>
<tr>
    <td class="lc1" align="center">名 称</td>
	<td class="lc2" colspan=5>
	<input type="text" name="ENTNAME" size="45" disblank title='名 称' maxlength='50'>&nbsp;<font color=red>*</font></td>
</tr>
<tr>	
	<td class="lc1" nowrap>营业场所</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>营业场所请按下面的格式填写，系统会自动合并。<br/>
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
						您录入的营业场所为：<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="营业场所" >
 		<font color=red>*</font>
 	</td></tr>
 	
<tr>
 	<td class="lc1" align="center">电话</td>
	<td class="lc2" colspan=2>
	<input type="text" name="TEL" size="20" disblank title='联系电话' maxlength='20'>&nbsp;<font color=red>*</font></td>
	    
	<td class="lc1" nowrap="nowrap" align="center">邮政编码</td>
	<td class="lc2" colspan=2><input type="text" name="POSTALCODE" size="20" disblank datatype=int title='邮政编码' maxlength='6'>&nbsp;<font color=red>*</font></td>
</tr>
<tr>
    <td class="lc1" align="center">企业类型</td>
    <td class="lc2" colspan=2>
	  	<select size="1" name="ENTTYPE"  datatype=enttype disblank title="企业类型">
		<option value=''>请选择企业类型</option><%=icms.getSysDmList("ENTTYPE","WGJY")%></select>
	&nbsp;<font color=red>*</font>
	</td>
	<td class="lc1" align="center" colspan="1" nowrap="nowrap">主管部门</td>
	<td class="lc2" colspan=2><input type="text" disblank name="DEPINCHA" maxlength=50 size="20" title="主管部门">&nbsp;<font color=red>*</font></td>

</tr>
<tr>
    <td class="lc1" align="center">审批机关</td>
	<td class="lc2" colspan="1"><input type="text" disblank name="EXAAUTH" maxlength=50 size="20" title="审批机关">&nbsp;<font color=red>*</font></td>
    
    <td class="lc1" align="center" width="10%">批准日期</td>
	<td class="lc2"><input type="text" disblank name="SANDATE" size="20" title="批准日期" datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">&nbsp;<font color=red>*</font></td>   
  	<td class="lc1" align="center">负责人</td>
    <td class="lc2" >
	  	<input type="text" name="LEREP" disblank size="20" title='负责人' maxlength='10'><font color=red>*</font>
    </td>
	</tr>
<tr>
<td class="lc1" colspan="1" nowrap="nowrap">资金数额（万元）</td>   
	<td class="lc2" colspan="2" >
	<input type="text" name="REGCAP" disblank size="20" title='资金数额'><font color=red>*</font>
	</td>
<td class="lc1" colspan="1" nowrap="nowrap">币种</td>   
	<td class="lc2" colspan="2" >
	<input type="text" name="REGCAPCUR_TEXT" id="REGCAPCUR_TEXT" disabled>
	<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" title="投资总额币种"><input type="button" class="button" onclick="getSelDm('REGCAPCUR','CURRENCY')" value="选 择..">
		<font color=red>*</font>
	</td>	
</tr>
<tr>
    <td class="lc1" align="center" nowrap>在中国境内经营范围</td>
    <td class="lc2" colspan='5' >
        <textarea rows="4" name="BUSSCOPE" cols="70" disblank title='经营范围' maxlength='1000'></textarea>&nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
	<td class="lc1" align="center">承包工程或经营<br>管理项目</td>
	<td class="lc2" colspan=5 >
	<textarea rows="3" name="ITEMOFOPORCPRO" cols="70" disblank title="承包工程或经营管理项目" maxlength=256> </textarea><font color=red>*</font>    
	</td>
</tr>	
<tr>
    <td class="lc1" colspan="1" nowrap="nowrap">拟设立登记机关</td>   
	<td class="lc2" colspan="2" ><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>
		<td class="lc1">管辖单位</td>
	<td class="lc2" colspan="2"><select name="OPELOCDISTRICT" title="管辖单位" style="width:220px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>	
	<td class="lc1" colspan=1 align="center">经营期限</td>
	<td class="lc2" colspan="5">
	长期<input type="checkbox" name="checkboxInput" id="check1"  title="营业期限" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" title="营业期限" size="10" maxlength=10 >年
		</span><font color=red>*</font>      
    </td>
</tr> 
<tr>
    <td class="lc1" rowspan="3" align="center" nowrap>外国(地区)<br>企业情况</td>
    <td class="lc1" align="center" nowrap="nowrap">企业名称</td>
	<td class="lc2" colspan="3"><input type="text" name="FORENTNAME" size="50" disblank title='外国企业名称' maxlength='50'>&nbsp;<font color=red>*</font></td>
</tr>
<tr>
    <td class="lc1" align="center">境外住所</td>
	<td class="lc2" colspan='4'><input type="text" name="FORENTADD" size="50" disblank title='境外住所' maxlength='50'>&nbsp;<font color=red>*</font></td>  
</tr>
<tr>
    <td class="lc1" width="15%" align="center">境外企业注册的<br>经营范围
    <td class="lc2" colspan='4'>
    <textarea rows="4" name="FORENTSCOPE" cols="70" title='外国(地区)企业境外经营范围' disblank maxlength='500'></textarea>  &nbsp;<font color=red>*</font>
    </td>
</tr>

<%--tr>
	<td class="lc1" colspan=2 align="center">承包工程或经营<br>管理内容</td>
	<td class="lc2" colspan=4 >
	<textarea rows="3" name="CONOFCONTRPRO" cols="70" title="承包工程或经营管理内容" maxlength=256> </textarea>
	</td>
</tr--%>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。		
</tr>
</TABLE>
<script language="javascript">
function checkSub(){
	//var a=doblurregcap();
	//if(a){
		return true;
	//}else{
	//	return false;
	//}	
}
function doblurregcap(){
  var FORENTCAP=document.getElementById("FORENTCAP").value;
	if(FORENTCAP!=null&&FORENTCAP!="")
	{
	   if (fucCheckNUM(FORENTCAP))
	    {
		   if (Math.abs(FORENTCAP)>999999999999)
		    {
			   alert('境外企业注册资本超过系统最大精度！');
			   return false;
		    }
	    }else
	    {
		   alert('境外企业注册资本应为数字！');
		   return false;
	    }
	}
	return true;
}
</script>