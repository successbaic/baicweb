<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>公司基本信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap>企业名称</td>   
	<td class="lc2" colspan="3" >
	<input type="text" name="ENTNAME" READONLY size="60" title="企业(机构)名称" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1" nowrap>法定代表人</td>   
	<td class="lc2"><input type="text" name="LEREP" title="法定代表人" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 

</tr>

<tr>	
	<td class="lc1" nowrap >住所</td>   
 	<td class="lc2" colspan="5">
		<font color="red">说明：</font>企业住所地请按下面的格式填写，系统会自动合并。<br/>									
						<select name="PROVINCE" id="PROVINCE" title="省" onchange="writeDOM()">
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
						您录入的住所为：<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="住所" >
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
	<td class="lc1" nowrap>注册资本</td>   
	<td class="lc2" nowrap>
	<input type="text" name="REGCAP" id="REGCAP" title="注册资本" size="15" onblur='doblurregcap()' maxlength=14  datatype=NUM>万元</td>  
	
	<td class="lc1" nowrap>联系电话</td>   
	<td class="lc2"><input type="text" name="TEL" title="联系电话" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1" nowrap>邮政编码</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 
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
					<input type="button" class="button" style="height:20px;width:120px;" name="" value="经营范围选择..." onClick="getJYFWStr('BUSSCOPE')"> 
				</td>
			</tr>
		</table>
	</td>
</tr> 
<tr>  
	<td class="lc1" nowrap>企业(机构)类型</td>   
	<td class="lc2" colspan="3" ><select id="ENTTYPE" name="ENTTYPE" disblank title="企业(机构类型)" onchange="cheEnttypeForInsform(this.value)">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","GS")%></select>&nbsp;<font color=red>*</font>
	<input type="button" class="button"  style="height=20px;width=100px;" name="" value="企业类型简述" onclick="javascript:window.open('utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/>
	</td>   
	
	<td class="lc1" nowrap>设立方式</td>
	<td class="lc2">
	<select id="INSFORM" name="INSFORM">
	<option value="">无</option><option value='01'>发起设立</option><option value='07'>募集设立</option></select>
	</select>	
	</td>
</tr>
<tr> 	
	<td class="lc1" nowrap>拟登记机关</td>   
	<td class="lc2"><select name="REGORG" title="拟设立登记机关" disblank style="width:192px; "> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td> 
	<td class="lc1" >管辖单位</td>
	<td class="lc2"><select name="OPELOCDISTRICT" title="管辖单位" style="width:220px;"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
	<td class="lc1" nowrap>执照副本数</td>   
	<td class="lc2"><input type="text" name="COPYNUM" title="副本数" datatype=INT size="10" maxlength=2 value=1 disblank>&nbsp;个<font color=red>*</font></td>
	<td class="lc1">营业期限</td>   
	<td class="lc2" width="25%">
		长期<input type="checkbox" name="checkboxInput" id="check1"  title="营业期限" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" id="OPDATETO" title="营业期限" size="10" maxlength=10 >年
		</span><font color=red>*</font>
	</td> 
 </tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">
	说明：有红色<font color=red >*</font>标示的项目为必填项。
	&nbsp;
	其它填写注意事项请点击
	<span style="cursor:pointer;color='red'" onclick="if(document.getElementById('span_info').style.display=='none'){document.getElementById('span_info').style.display='';}else{document.getElementById('span_info').style.display='none';}">这里</span>
	查看
	<span id="span_info" style="display:none">
	<br>
	1、股份有限公司应填写设立方式。设立方式说明：募集设立1含义为200(含200人)人以上公开发行股票，募集设立2含义为其他募集设立。
	<br>
	2、营业期限：请填写“长期”或者“XX年”。企业的营业期限要与公司章程中填写的营业期限一致。
	<br>
	</span></p>	
	</td>   
 </tr>
</table>
<script language="javascript">
function checkSub(){
	//var a=doblurregcap();
	//var b=doblurreccap();
	var c=cheForInsform();
	//var d=cheforregcap();
	//var e=cheforreccap();
	if(c){
		return true;
	}else{
		return false;
	}	
}
function cheforregcap(){
   var REGCAP =document.getElementById("REGCAP").value;
   var REGORG =document.getElementById("REGORG").value;
   if(REGCAP!=null&&REGCAP!="")
	{
	   //if(REGCAP<=500&&REGORG=="371300"){
	   //    alert('注册资本小于等于500万元的，“拟登记机关”应选择企业住所所在地的区(县)工商局！');
	   //    return false;
	   //}
	}
   return true;
}
function cheforreccap(){
   //var REGCAP =document.getElementById("REGCAP").value;
   //var RECCAP = document.getElementById("RECCAP").value;
   //if(REGCAP!=null&&REGCAP!=""&&RECCAP!=null&&RECCAP!=""){
   //   if(RECCAP<0.2*REGCAP){
   //     alert('实收资本应该不低于注册资本的20%');
  //      return false;
   //   }
   //   if(RECCAP<3){
    //    alert('实收资本不得少于3万元');
    //    return false;
    //  }
   //}
   return true;
}
function cheForInsform(){
	var enttype=document.getElementById("ENTTYPE").value;
	if(enttype!=""){
		enttype=enttype.substr(0,2);
		if(enttype=="12" && document.getElementById("INSFORM").value==""){
			alert("股份有限公司应在设立方式栏选择填写信息！");
			return false;
		}
	}
	if(!($("#check1").is(":checked")) && $.trim($("#OPDATETO").val()) == ""){
		alert("请输入营业期限！");
		return false;
	};
	return true;
}
function cheEnttypeForInsform(enttype){
	if(enttype==""){
		document.getElementById("INSFORM").disabled=false;
		return;
	}
	enttype=enttype.substr(0,2);
	if(enttype=="12"){	
		document.getElementById("INSFORM").disabled=false;
	}else{
		document.getElementById("INSFORM").value="";
		document.getElementById("INSFORM").disabled=true;
	}
}
function setBusscope()
{
document.form1.BUSSCOPE.value="许可经营项目："+document.form1.ABUITEMCO.value + "一般经营项目："+document.form1.CBUITEM.value;
}
</script>