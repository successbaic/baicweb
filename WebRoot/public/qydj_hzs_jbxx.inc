<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="8" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>农民专业合作社基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">名  称</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="ENTNAME" READONLY size="70" title="名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

<tr>	
	<td class="lc1" nowrap>住所</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>住所请按下面的格式填写，系统会自动合并。<br/>
 		<select name="PROVINCE" title="省" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						省/直辖市/自治区） 
						<select name="CITY" id="CITY" title="市" maxlength=20 onchange="cityChange()">
						<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>（市/地区/盟/自治州）
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="县" maxlength=20>
							<!--div id="COUNTYOPT" width='100'></div-->
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getCITY())%>
						</select>（区/县/县级市/旗）
						 <input type="text" name="TOWN" id="TOWN" title="乡" size="20" maxlength=25 onchange="writeDOM()">（乡/民族乡/镇/街道）
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="村" size="23" maxlength=25 onchange="writeDOM()">（路/村/社区）
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="号" size="10" maxlength=25 onchange="writeDOM()">（号） 
 		                <font color=red>*</font>
						<br>
						您录入的住所为：<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="住所" >
 		<font color=red>*</font>
 	</td></tr>
 	
 	
<tr>	
	<td class="lc1" nowrap >生产经营地</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>企业住所地请按下面的格式填写，系统会自动合并。<br/>									
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
						 <input type="text" name="PROTOWN" id="PROTOWN" title="乡" size="20" maxlength=25 onchange="writePROLOC()">（乡/民族乡/镇/街道）
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
	<td class="lc2" colspan="4">
	<input type="text" name="TEL" size="15" title="联系电话" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">成员出资总额</td>   
	<td class="lc2"><input type="text" name="REGCAP" id="REGCAP" title="成员出资总额" size="15" maxlength=20 onblur='doblurregcap()'>(元)</td> 
    
    <td class="lc1" nowrap="nowrap">法定代表人姓名</td>   
	<td class="lc2" colspan="4" ><input type="text" name="LEREP" title="法定代表人" size="20" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr>
	<td class="lc1" >业务范围</td>
	<td class="lc2" colspan="5">
	<table width="100%" style="border-style:none;">
			<tr>
				<td class="lc2" >
					<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="务范围" cols="70" maxlength=333></textarea>
				</td>
				<td class="lc2" width="33%">
					<input type="button" class="button" style="height:20px;width:120px;" name="" value="业务范围选择..." onClick="getJYFWStr('BUSSCOPE')"> 
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
    <td class="lc1" rowspan="2" nowrap>成员总数</td>
    <td class="lc2" rowspan="2">
    <input type="text" class="cyClass" name="MEMNUM" id="MEMNUM" title="成员总数" disblank datatype=INT size="10" maxlength=3 onblur=''>&nbsp;<font color=red>*</font>
    </td>
    <td class="lc1" nowrap>农民成员总数</td>
    <td class="lc2">
    <input type="text" class="cyClass" name="PEAMEMNUM" id="PEAMEMNUM"  title="农民成员总数" disblank datatype=INT size="10" maxlength=3 onblur=''>&nbsp;<font color=red>*</font>
    </td>
    <td class="lc1" nowrap="nowrap" nowrap>所占比例</td>
    <td class="lc2">
    <input type="text"  name="PEAMEMRATE" id="PEAMEMRATE" readonly="readonly" title="农民成员所占比例" disblank onblur=''>%&nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1" nowrap>企业、事业单位或<br/>社会团体成员总数</td>
    <td class="lc2">
    <input type="text" class="cyClass" name="GROMEMNUM" id="GROMEMNUM" title="企业、事业单位或社会团体成员总数" disblank datatype=INT size="10" maxlength=3 onblur=''>&nbsp;<font color=red>*</font>
    </td>
    <td class="lc1" nowrap>所占比例</td>
    <td class="lc2">
    <input type="text" name="GROMEMRATE" id="GROMEMRATE" readonly="readonly" title="企业、事业单位或社会团体成员所占比例" disblank onblur=''>%&nbsp;<font color=red>*</font>
    </td>
</tr>
<tr> 	
	<td class="lc1" nowrap="nowrap">拟设立登记机关</td>   
	<td class="lc2" colspan="2"><select id="REGORG" name="REGORG" title="拟设立登记机关" disblank style="width:192px; " onchange="loadgss()"> 
	<option value=''>请选择登记机关</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select>&nbsp;<font color=red>*</font>
	<input type="hidden" name="ENTTYPE" title="企业类型" value="9100">
	</td> 	 	

	<%--td class="lc1">管辖单位</td>   
	<td class="lc2" colspan="2"><select id="OPELOCDISTRICT" name="OPELOCDISTRICT" title="管辖单位" style="width:220px; " disabled> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getSysDmListByRemark("REGORG","3",XZQH)%>
	</select></td> 
</tr>
<tr--%>	
	<td class="lc1">管片工商所</td>   
	<td class="lc2" colspan="5"><select name="LOCALADM" id="LOCALADM" title="管片工商所" style="width:220px; "> 
	<option value=''>请先选择登记机关</option>
	</select></td>
	 
</tr> 
</table>
<script type="text/javascript">
function doblurregcap(){
    var REGCAP =document.getElementById("REGCAP").value;
	if(REGCAP!=null&&REGCAP!="")
	{
	   if (fucCheckNUM(REGCAP))
	    {
		 if (Math.abs(REGCAP)>999999999999)
		  {
			alert('成员出资总额超过系统最大精度！');
			return false;
		  }
	    }else
	    {
		    alert('成员出资总额应为数字！');
		    return false;
	    }
	}
	return true;
}
function doblurmemnum(){
   var MEMNUM =document.getElementById("MEMNUM").value;
	if(MEMNUM!=null&&MEMNUM!="")
	{
	   if (!fucCheckNUM(MEMNUM))
	    {
		    alert('成员总数应为数字！');
		    return false;
	    }
	}
	return true;
}
function doblurpeamemnum(){
   var PEAMEMNUM =document.getElementById("PEAMEMNUM").value;
	if(PEAMEMNUM!=null&&PEAMEMNUM!="")
	{
	   if (!fucCheckNUM(PEAMEMNUM))
	    {
		    alert('农民成员总数应为数字！');
		    return false;
	    }
	}
	return true;
}
function doblurpeamemrate(){
    var PEAMEMRATE = document.getElementById("PEAMEMRATE").value;
	if(PEAMEMRATE!=null&&PEAMEMRATE!=""){
	   if(fucCheckNUM(PEAMEMRATE))
	     {
	       if(Math.abs(PEAMEMRATE)>100)
	        {
	           alert('农民成员所占比例超过100%！');
		       return false;
	        }
	     }
	   else
	     {
	       alert('农民成员所占比例应为数字！');
	       return false;
	     }
	}
	return true;   
}
function doblurgromemnum(){
    var GROMEMNUM =document.getElementById("GROMEMNUM").value;
	if(GROMEMNUM!=null&&GROMEMNUM!="")
	{
	   if (!fucCheckNUM(GROMEMNUM))
	    {
		    alert('企业、事业单位或社会团体成员总数应为数字！');
		    return false;
	    }
	}
	return true;
}
function doblurgromemrate(){
    var GROMEMRATE = document.getElementById("GROMEMRATE").value;
	if(GROMEMRATE!=null&&GROMEMRATE!=""){
	   if(fucCheckNUM(GROMEMRATE))
	     {
	       if(Math.abs(GROMEMRATE)>100)
	        {
	           alert('企业、事业单位或社会团体成员所占比例超过100%！');
		       return false;
	        }
	     }
	   else
	     {
	       alert('企业、事业单位或社会团体成员所占比例应为数字！');
	       return false;
	     }
	}
	return true;  
}
</script>