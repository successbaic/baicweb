<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>�ǹ�˾��ҵ���˻�����Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" width="140px">��  ��</td>   
	<td class="lc2" colspan="3">
	<input type="text" name="ENTNAME" READONLY size="50" title="����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>
<tr>	
	<td class="lc1" nowrap>ס��</td>   
 	<td class="lc2" colspan="5">
		<select name="PROVINCE" title="ʡ" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						ʡ/ֱϽ��/�������� 
						<select name="CITY" id="CITY" title="��" maxlength=20>
						<option value='<%=XZQH%>'><%=icms.getSysDm("XZQH",XZQH)%></option>
						</select>����/����/��/�����ݣ�
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="��" maxlength=20>
							<!--div id="COUNTYOPT" width='100'></div-->
							<%=icms.getSysDmListByRemark("DISCOUS",XZQH) %>
						</select>����/��/�ؼ���/�죩
						 <input type="text" name="TOWN" id="TOWN" title="��" size="23" maxlength=25 onchange="writeDOM()">����/������/��/�ֵ���
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="��" size="23" maxlength=25 onchange="writeDOM()">��·/��/������
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="��" size="10" maxlength=25 onchange="writeDOM()">���ţ� 
 		                <font color=red>*</font>
						<br>
						��¼���ס��Ϊ��<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="ס��" >
 		<font color=red>*</font>
 	</td></tr>
 	

<tr>	
	<td class="lc1" nowrap >������Ӫ��</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>������Ӫ���밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>									
						<select name="PROPROVINCE" id="PROPROVINCE" title="ʡ" onchange="writePROLOC()">
						<%=icms.getSysDmList("PROVINCE")%>
						</select>
						ʡ/ֱϽ��/�������� 
						<select name="PROCITY" id="PROCITY" title="����/����/��/�����ݣ�" maxlength=20 onchange="procityChange()" disblank>
							<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>
						����/����/��/�����ݣ�
						 <select name="PROCOUNTY" id="PROCOUNTY" onchange="writePROLOC()" title="����/��/�ؼ���/�죩 " maxlength=20 disblank>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getPROCITY())%>
						</select>����/��/�ؼ���/�죩
						 <input type="text" name="PROTOWN" id="PROTOWN" title="��" size="23" maxlength=25 onchange="writePROLOC()">����/������/��/�ֵ���
 		                <input type="text" name="PROVILLAGE" id="PROVILLAGE" title="��" size="23" maxlength=25 onchange="writePROLOC()">��·/��/������
 		                <input type="text" name="PROHOUSENUMBER" id="PROHOUSENUMBER" title="��" size="10" maxlength=25 onchange="writePROLOC()">���ţ� 
 		                <font color=red>*</font>
						<br>
						��¼���������Ӫ��Ϊ��<input type="text" name="PROLOC" id="PROLOC" disblank style="width:380px" title="������Ӫ��" >
 		<font color=red>*</font>
 	</td></tr>
 	 	
<tr>
 	<td class="lc1">��ϵ�绰</td>   
	<td class="lc2"><input type="text" name="TEL" title="��ϵ�绰" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 

	<td class="lc1">��������</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 
</tr>
<tr> 
	<td class="lc1" width="140px">����������</td>   
	<td class="lc2"><input type="text" name="LEREP" title="����������" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1">ע���ʽ�</td>   
	<td class="lc2">
	<input type="text" name="REGCAP" id="REGCAP" title="ע���ʱ�" size="15" onblur='doblurregcap()' maxlength=14 datatype=NUM>��Ԫ</td>  
</tr> 
<tr>
	<td class="lc1" nowrap>��Ӫ��Χ</td> 
	<td colspan="5">
	<table width="100%" style="border-style:none;">
	<tr>
	<td class="lc2" >
	<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>
	</td>
	<td class="lc2" width="33%">
	<input type="button" class="button" style="height=20px;width=120px;" name="" value="��Ӫ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')"> 
	</td>
	</tr>
	</table>
	</td>
</tr> 
<tr>  
	<td class="lc1" >��������</td>   
	<td class="lc2" colspan="5"><select name="ENTTYPE" disblank title="��������" style="width:150px; ">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","NZFR")%></select>&nbsp;<font color=red>*</font>
	<!-- <input type="button" class="button"  style="height=20px;width=100px;" name="" value="��ҵ���ͼ���" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/> -->
	</td>   
</tr>

<tr>	
	<td class="lc1" nowrap="nowrap">�������Ǽǻ���</td>   
	<td class="lc2"><select name="REGORG" title="�������Ǽǻ���" disblank style="width:192px; "> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td> 	
	</td>
	<td class="lc1" style="width:80px;">��Ͻ��λ</td>
	<td class="lc2" colspan="3"><select name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:180px;"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">���ܲ���(������)</td>   
	<td class="lc2" colspan="5"><input type="text" name="DEPINCHA" title="���ܲ���(������)" size="40" maxlength=50 disblank>&nbsp;<font color=red>*</font>
 	</td>
 	<!--
 	<td class="lc1">���ܲ���ע���</td>   
	<td class="lc2"><input type="text" name="SUPREGNO" title="���ܲ���ע���" size="15" maxlength=15></td>
	--> 
</tr>
<tr>
	<td class="lc1">Ӫҵ����</td>
	<td class="lc2" >
		����<input type="checkbox" name="checkboxInput" id="check1"  title="Ӫҵ����" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" id="OPDATETO" name="OPDATETO" title="Ӫҵ����" size="10" maxlength=10 >��
		</span><font color=red>*</font>
	</td> 
	<td class="lc1">ִ�ո�����</td>   
	<td class="lc2"><input type="text" name="COPYNUM" title="ִ�ո�����" disblank datatype=INT size="15" maxlength=2 value=1>&nbsp;</td>	
 </tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
	<br>
    1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>
	2��Ӫҵ���ޣ�����д�����ڡ����ߡ�XX�ꡱ��
	<br>
 </tr>
</table>
<script language="javascript">
function checkSub(){
   if(!($("#check1").is(":checked")) && $.trim($("#OPDATETO").val()) == ""){
		alert("������Ӫҵ���ޣ�");
		return false;
	};
	return true;
}
function setBusscope()
{
document.form1.BUSSCOPE.value="���ɾ�Ӫ��Ŀ��"+document.form1.ABUITEMCO.value + "һ�㾭Ӫ��Ŀ��"+document.form1.CBUITEM.value;
}
</script>