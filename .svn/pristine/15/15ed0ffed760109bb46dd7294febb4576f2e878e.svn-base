<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="4" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>个体工商户基本信息</font>
        </p>
        </td>
      </tr>
     <tr>
      <td class="lc1" nowrap="nowrap">名称</td>
      <td class="lc2" colspan="3">
       <input type="text" name="TRANAME" READONLY size="70" title="" maxlength=50 disblank>&nbsp;<font color=red>*</font></td> 
     </tr>
     <tr>
    <td class="lc1">邮政编码</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="邮政编码" datatype=int size="20" maxlength=6 disblank><font color=red>*</font></td> 	
    
    <td class="lc1">联系电话</td>   
	<td class="lc2">
	<input type="text" name="TEL" size="20" title="联系电话" maxlength=20 disblank><font color=red>*</font></td>       
	</tr>
     <tr>	
	<td class="lc1" nowrap>经营场所</td>   
 	<td class="lc2" colspan="3">
		<font color="red">说明：</font>经营场所请按下面的格式填写，系统会自动合并。<br/>
 		<select name="PROVINCE" title="省" id="PROVINCE" onchange="writeDOM()">
						<%=icms.getSysDmList("PROVINCE")%>
						</select>
						省/直辖市/自治区） 
						<select name="CITY" id="CITY" title="市" maxlength=20 onchange="cityChange()">
						<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>（市/地区/盟/自治州）
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="县" maxlength=20>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,GTDJ_JBXX.getCITY())%>
						</select>（区/县/县级市/旗）<br/>
						 <input type="text" name="TOWN" id="TOWN" title="乡" size="23" maxlength=25 onchange="writeDOM()">（乡/民族乡/镇/街道）
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="村" size="23" maxlength=25 onchange="writeDOM()">（路/村/社区）
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="号" size="10" maxlength=25 onchange="writeDOM()">（号） 
 		                <font color=red>*</font>
						<br>
						您录入的经营场所为：<input type="text" name="OPLOC" id="OPLOC" disblank style="width:380px" title="经营场所" >
 		<font color=red>*</font>
 	</td></tr>
 	
<tr>
    <td class="lc1" nowrap="nowrap">经营者名</td>  
	<td class="lc2" width="220px">
	<input type="text" name="OPERNAME" size="20" title="经营者名" maxlength=50 disblank>&nbsp;<font color=red>*</font>
	</td>
    <td class="lc1" nowrap="nowrap">组成形式</td>  
	<td class="lc2">	
    <select id="COMPFORM" name="COMPFORM" title="如果是家庭经营的，请填写下面的家庭成员名及身份证号" style="width:162px;" onclick="ifJtjy()" disblank>
	<option value='1'>个人经营</option>
	<option value='0'>家庭经营</option>
	</select><font color=red>*</font>
	</td>  	
</tr>
     
<tr id="jtcy_tr" style="display:none">
     <td class="lc1" nowrap="nowrap">家庭成员姓名<br/>及身份证号</td>
	 <td class="lc2" colspan="3">
	<textarea rows="3" name="FAMMEMBER" title="家庭成员姓名及身份证号" cols="80" maxlength="333"></textarea>
	</td>   
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">经营范围</td>  
	<td class="lc2" colspan="2">
	<textarea rows="5" id="BUSSCOANDFORM" name="BUSSCOANDFORM" title="经营范围" cols="80" maxlength=1000 ></textarea>   
    </td>  
    <td class="lc2">
	<input type="button" class="button" style="height=20px;width=100px;" name="" value="经营范围选择..." onClick="getJYFWStr('BUSSCOANDFORM')"> 
	</td>
</tr>

<tr>
    <td class="lc1">从业人数</td>   
	<td class="lc2"><input type="text" name="EMPNUM" title="从业人数" datatype=int size="15" maxlength=6 disblank>&nbsp;人<font color=red>*</font></td> 	
    
    <td class="lc1">资金数额</td>   
	<td class="lc2">
	<input type="text" name="CAPAM" size="15" title="资金数额" maxlength=20 disblank>&nbsp;万元<font color=red>*</font></td>       
</tr>
<tr> 	
	<td class="lc1" nowrap>拟设立登记机关</td>   
	<td class="lc2" colspan="3"><select id="REGORG" name="REGORG" title="拟设立登记机关" disblank style="width:220px;" onchange="loadgss()"> 
	<option value=''>请选择登记机关</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  
</tr>
<%--<tr> 	
	<td class="lc1">管辖单位</td>   
	<td class="lc2" colspan="3"><select id="OPELOCDISTRICT" name="OPELOCDISTRICT" disabled title="管辖单位" style="width:220px;" onclick="loadgss()"> 
	<option value=''>请选择管辖单位</option>
	<%=icms.getSysDmListByRemark("REGORG","3",XZQH)%>
	</select></td> 
</tr>
 --%>
<tr> 	
	<td class="lc1">管片工商所</td>   
	<td class="lc2" colspan="3"><select id="LOCALADM" name="LOCALADM" id="LOCALADM" title="管片工商所" disblank> 
	<option value=''>请先选择登记机关</option>
	</select>&nbsp;<font color=red>*</font></td>
	 
</tr>
 <tr>
	<td class="lc2" colspan="4">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。
	<br>	
 </tr>
</table>