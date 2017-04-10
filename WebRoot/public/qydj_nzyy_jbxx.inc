<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>营业单位基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap" align="center">单位名称</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="ENTNAME" READONLY size="70" title="单位名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>
<tr>	
	<td class="lc1" nowrap>地址</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>地址请按下面的格式填写，系统会自动合并。<br/>
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
						您录入的地址为：<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="地址" >
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
 	<td class="lc1" nowrap="nowrap" align="center">邮政编码</td>   
	<td class="lc2" colspan="3"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank style="width:192px; ">&nbsp;<font color=red>*</font></td> 

	<td class="lc1" align="center">负责人</td>   
	<td class="lc2" ><input type="text" name="LEREP" title="负责人" size="15" maxlength=20 disblank style="width:192px; ">&nbsp;<font color=red>*</font></td> 
</tr>
<tr> 
	<td class="lc1" align="center">联系电话</td>   
	<td class="lc2" colspan="5"><input type="text" name="TEL" title="联系电话" size="15" maxlength=20 disblank style="width:192px; ">&nbsp;<font color=red>*</font></td> 	
 	<!--td class="lc1">经营方式</td>
    <td class="lc2" colspan=3>
	<input type="text" style="width:300px;" name="BUSFORM" title="经营方式" maxlength="100" >
 	</td-->
</tr>
<tr>
	<td class="lc1" align="center">资金数额</td>   
	<td class="lc2" colspan="3" nowrap="nowrap">
	<input type="text" name="REGCAP" id="REGCAP" title="资金数额" size="15" onblur='doregcap()' maxlength=14 >(万元)</td>  
    
    <td class="lc1" align="center">经济性质</td>   
	<td class="lc2" colspan="5"><select name="ENTTYPE" disblank title="经济性质" >
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","NZYY")%></select>&nbsp;<font color=red>*</font>
	<!-- <input type="button" class="button"  style="height=20px;width=100px;" name="" value="企业类型简述" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/> -->
	</td>
</tr>  
<tr>
	<td class="lc1" align="center">隶属单位</td>   
	<td class="lc2" colspan="3">
	<input type="text" name="SUPENTNAME" id="SUPENTNAME" title="公司名称" size="15" maxlength=14 disblank style="width:192px; ">&nbsp;<font color=red>*</font></td>  
	<td class="lc1" align="center">隶属单位注册号
	</td>   
	<td class="lc2">
	<input type="text" name="SUPREGNO" id="SUPREGNO" title="隶属单位注册号" size="15" disblank style="width:192px; ">&nbsp;<font color=red>*</font>
	</td> 	
</tr> 
<tr>
	<td class="lc1" nowrap>经营范围</td> 
	<td colspan="5">
	<table width="100%" style="border-style:none;">
		<tr>
			<td class="lc2" >
				<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>
			</td>
			<td class="lc2" width="33%">
				<input type="button" class="button" style="height=20px;width=120px;" name="" value="经营范围选择..." onClick="getJYFWStr('BUSSCOPE')" > 
			</td>
		</tr>	
	</table>
	</td>
</tr>
<%-- 
<tr>   
    <td class="lc1" align="center">企业(机构)类型</td>   
	<td class="lc2" colspan="5"><select name="ENTTYPE" disblank title="企业(机构类型)">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","NZYY")%></select>&nbsp;<font color=red>*</font>
	<!-- <input type="button" class="button"  style="height=20px;width=100px;" name="" value="企业类型简述" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/> -->
	</td> 
</tr>--%> 
<tr>
    <td class="lc1" nowrap="nowrap" align="center">拟设立登记机关</td>   
	<td class="lc2" colspan="3"><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>
	<td class="lc1" style="width:80px;">管辖单位</td>
	<td class="lc2"><select name="OPELOCDISTRICT" title="管辖单位" style="width:180px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
	<td class="lc1" nowrap="nowrap" align="center">执照副本数</td>   
	<td class="lc2" >
	<input type="text" name="COPYNUM" id="COPYNUM" title="执照副本数" size="15" value=1>&nbsp;</td> 	
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
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。
</tr>
</table>
<script language="javascript">
function checkSub(){
    //var a=doregcap();
    //if(a){
       return true;
    //}else{
    //    return false;
    //}    	
}
function doregcap()
{
	var REGCAP =document.getElementById("REGCAP").value;
	if(REGCAP!=null&&REGCAP!="")
	{
	   if (fucCheckNUM(REGCAP))
	   {
		 if (Math.abs(REGCAP)>999999999999)
		  {
			alert('资金数额超过系统最大精度！');
			return false;
		  }
	    }else
	    {
		   alert('资金数额应为数字！');
		   return false;
	    }
	}
	return true;
}
function setBusscope()
{
document.form1.BUSSCOPE.value="许可经营项目："+document.form1.ABUITEMCO.value + "一般经营项目："+document.form1.CBUITEM.value;
}
</script>