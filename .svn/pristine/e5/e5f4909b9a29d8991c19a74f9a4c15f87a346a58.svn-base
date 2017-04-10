<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>外国(地区)企业常驻代表机构基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">代表机构名称</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="ENTNAME" READONLY size="60" title="代表机构名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

 <tr>	
	<td class="lc1" nowrap>驻在场所</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>驻在场所请按下面的格式填写，系统会自动合并。<br/>
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
						您录入的驻在场所为：<input type="text" name="DOM" maxlength=100 id="DOM" disblank style="width:380px" title="驻在场所" >
 		<font color=red>*</font>
 	</td></tr>
<tr>
    <td class="lc1">邮编</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="POSTALCODE" title="邮编" datatype=int maxlength=6 disblank>&nbsp;<font color=red>*</font></td>    
    
    <td class="lc1">联系电话</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="TEL" title="联系电话" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
</tr>
<tr>
    <td class="lc1">驻在期限</td>   
	<td class="lc2" colspan="5">
	自<input type="text" id="OPFROM" name="OPFROM" title="营业期限自" size="15" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	至<input type="text" id="OPTO" name="OPTO" title="营业期限至" size="15" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">首席代表姓名</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="LEREP" size="60" title="首席代表姓名" maxlength=25 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

<tr> 	
	<td class="lc1" nowrap="nowrap">拟设立登记机关</td>   
	<td class="lc2" colspan="2">
	<select name="REGORG" title="拟设立登记机关" disblank style="width:220px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  	
	<td class="lc1">管辖单位</td>
	<td class="lc2" colspan="2"><select name="OPELOCDISTRICT" title="管辖单位" disblank ="true" style="width:180px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select>
	&nbsp;<font color=red>*</font>
	</td> 
</tr>
<tr>
   <td class="lc1" nowrap="nowrap">企业类型</td>   
	<td class="lc2" colspan="2">
	<select name="ENTTYPE" disblank title="企业类型" style="width:220px;" >
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WGDB")%>
	</select>
	&nbsp;
	<font color=red>*</font>
	</td>
</tr>
<tr>
	<td class="lc1" >业务范围</td>
	<td  class="lc2" colspan="5">
		<textarea rows="5" id="BUSSCOPE" name="BUSSCOPE" title="业务范围" cols="70" maxlength=1000 readonly="readonly">从事与隶属外国（地区）企业有关的非营利性业务活动。</textarea>
	</td>
</tr>


<tr>
   <td class="lc1">批准设立机关</td>
   <td class="lc2" >
   <input type="text" name="EXAAUTH" title="批准设立机关" maxlength=50 ></td>      

    <td class="lc1" nowrap>批准日期</td>   
	<td class="lc2" >
	<input type="text" name="SANDATE" title="批准日期" size="20" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">&nbsp;<font color=red>*</font></td>    
    
    <td class="lc1" nowrap>批准文号</td>   
	<td class="lc2">
	<input type="text" name="SANDOCNO" title="批准文号" maxlength=50 ></td>          
</tr>
<tr>
   <td class="lc1">电子邮箱</td>
   <td class="lc2" colspan="3" >
   <input type="text" name="EMAIL" size="60" title="电子邮箱" maxlength=50 ></font>
   </td>    
   <td class="lc2" colspan="2" >
   </td>  
</tr>

<tr>
   <td class="lc1" colspan="6"><p align="center" style="font-color: #000080;font-size: 11pt;font-weight: bold;">外国(地区)企业其他情况</p></td>
</tr>
<tr>
    <td class="lc1" rowspan="2" nowrap>外国(地区)企业名称</td>
    <td class="lc1" nowrap>中文</td>
    <td class="lc2" colspan="4">
      <input type="text" name="FORENTNAME" title="外国(地区)企业中文名称" maxlength=50 disblank size="60">&nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1" >外文</td>
    <td class="lc2" colspan="4">
    <input type="text" name="FORENTFORNAME" title="外国(地区)企业外文名称" maxlength=50 disblank size="60">&nbsp;<font color=red>*</font></td>   
</tr>
<tr>
   <td class="lc1" nowrap>外国(地区)企业境外住所</td>
   <td class="lc2" colspan="5">
   <input type="text" name="FORENTADD" title="外国(地区)企业境外住所" maxlength=500 size="60" disblank>&nbsp;<font color=red>*</font></td>      
</tr>
<tr>
   <td class="lc1" nowrap>存续期限</td>
   <td class="lc2" colspan="5">
   
	自<input type="text" name="FORENTOPFROM" title="存续期限限自" size="15" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	至<input type="text" name="FORENTOPTO" title="存续期限至" size="15" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	<font color=red>*</font></td>      
</tr>
<tr>
	 <td class="lc1">企业责任形式</td>
    <td class="lc2" colspan="2">
      <select name="FORENLIAFOR" title="外国(地区)企业责任形式" style="width:192px; ">
			<option value="0">无</option><option value="2">有限责任形式</option><option value="1">无限责任形式</option>
      </select>
    </td>
    <td class="lc1" nowrap="nowrap">有权签字人姓名</td>   
	<td class="lc2" colspan="2">
	   <input type="text" name="FORENTAUTSIGN" title="有权签字人姓名" maxlength=25 disblank>&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1">资本(资产)</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="FORENTCAP" id="FORENTCAP" title="资本(资产)" datatype=NUM maxlength=18 disblank onblur="checkForentcap()">万美元&nbsp;<font color=red>*</font></td>    
    
    <td class="lc1">国别(地区)</td>   
	<td class="lc2" colspan="2">
	  <input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<font color=red>*</font>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="国别" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="选 择">					
   </td>
</tr>
<tr>
    <td class="lc1" >经营范围</td>
    <td class="lc2" colspan='4'>
        <textarea rows="4" name="FORENTSCOPE" cols="70" title='外国(地区)企业经营范围' maxlength='500'  ></textarea>
    </td>
    <td class="lc2" >
		<input type="button" class="button" style="height=20px;width=120px;" name="" value="经营范围选择..." onClick="getJYFWStr('FORENTSCOPE')" > 
	</td>
</tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
	<br>
    1、有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	2、经营范围不能都为空。企业的经营范围应当包含或者体现企业名称中的行业或者经营特征，经营范围用语应当参照国民经济行业分类标准（参见经营项目），有取得许可证书的须注明证书有效期。
 </tr>
</table>
<script language="javascript">
function checkSub(){
	var a=checkForentcap();
	if(a){
		return true;
	}else{
		return false;
	}	
}
function checkForentcap(){
    var FORENTCAP=document.getElementById("FORENTCAP").value;
	if(FORENTCAP!=null&&FORENTCAP!="")
	{
	   if (fucCheckNUM(FORENTCAP))
	    {
		   if (Math.abs(FORENTCAP)>999999999999)
		    {
			   alert('资本(资产)超过系统最大精度！');
			   return false;
		    }
	    }else
	    {
		   alert('资本(资产)应为数字！');
		   return false;
	    }
	}
	return true;
}
</script>