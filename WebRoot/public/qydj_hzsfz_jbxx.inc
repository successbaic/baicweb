<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="8" algin="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>ũ��רҵ�������֧����������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">��  ��</td>   
	<td class="lc2" colspan="4">
	<input type="text" name="ENTNAME" READONLY size="70" title="����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

<tr>	
	<td class="lc1" nowrap>Ӫҵ����</td>   
 	<td class="lc2" colspan="4">
		<font color="red">˵����</font>Ӫҵ�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
 		<select name="PROVINCE" title="ʡ" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						ʡ/ֱϽ��/�������� 
						<select name="CITY" id="CITY" title="��" maxlength=20 onchange="cityChange()">
						<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>����/����/��/�����ݣ�
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="��" maxlength=20>
							<!--div id="COUNTYOPT" width='100'></div-->
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getCITY())%>
						</select>����/��/�ؼ���/�죩
						 <input type="text" name="TOWN" id="TOWN" title="��" size="23" maxlength=25 onchange="writeDOM()">����/������/��/�ֵ���
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="��" size="23" maxlength=25 onchange="writeDOM()">��·/��/������
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="��" size="10" maxlength=25 onchange="writeDOM()">���ţ� 
 		                <font color=red>*</font>
						<br>
						��¼���Ӫҵ����Ϊ��<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="Ӫҵ����" >
 		<font color=red>*</font>
 	</td></tr>
 	
 	
<tr>	
	<td class="lc1" nowrap >������Ӫ��</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>��ҵס�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>									
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
    <td class="lc1">��������</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
    
    <td class="lc1" style="width:110px;">��ϵ�绰</td>   
	<td class="lc2">
	<input type="text" name="TEL" size="15" title="��ϵ�绰" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
</tr>
<tr>   
    <td class="lc1" nowrap="nowrap">����������</td>   
	<td class="lc2" colspan="4" ><input type="text" name="LEREP" title="����������" size="20" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr>
	<td class="lc1" >ҵ��Χ</td>
	<td colspan="4">
		<table width="100%" style="border-style:none;">
			<tr>
				<td class="lc2" >
					<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="ҵ��Χ" cols="70" maxlength=333></textarea>
				</td>
				<td class="lc2" width="33%">
					<input type="button" class="button" style="height:20px;width:120px;" name="" value="ҵ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')"> 
				</td>
			</tr>
		</table>
	</td>
	 </td>  
</tr>
<tr> 	
	<td class="lc1" nowrap="nowrap">�������Ǽǻ���</td>   
	<td class="lc2" colspan="2"><select name="REGORG" id="REGORG" title="���������Ǽǻ��ء�" disblank style="width:192px; " onchange="loadgss()"> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select>&nbsp;<font color=red>*</font>
	<input type="hidden" name="ENTTYPE" title="��ҵ����" value="9200">
	</td> 	 	
	<td class="lc1" nowrap>���㷽ʽ</td>   
	<td class="lc2" >
	<select name="CALCULATIONMETHOD" title="���㷽ʽ" style="width:180px;" disblank> 
	<option value=''>��ѡ����㷽ʽ</option>
	<%=icms.getSysDmList("CALCULATIONMETHOD")%>
	</select>
	&nbsp;<font color=red>*</font>
	</td>
</tr>
<%--tr> 	
	<td class="lc1">��Ͻ��λ</td>   
	<td class="lc2" colspan="3"><select id="OPELOCDISTRICT" name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:220px; " disabled> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getSysDmListByRemark("REGORG","3",XZQH)%>
	</select></td> 
</tr--%>
<tr>	
	<td class="lc1">��Ƭ������</td>   
	<td class="lc2" colspan="4"><select name="LOCALADM" id="LOCALADM" title="��Ƭ������" style="width:220px; "> 
	<option value=''>����ѡ��Ǽǻ���</option>
	</select></td>
	</td>
</tr>
 <tr>
	<td class="lc2" colspan="8">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
	������Ϣ��Ϊ�����û�е�����д���ޡ���
 </tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
</script>