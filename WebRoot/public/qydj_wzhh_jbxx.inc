<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>���ʺϻ﹫˾������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap" colspan="1" align="center" width="15%">����</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="ENTNAME" READONLY size="70" title="����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
	
   </tr>
<tr>	
	<td class="lc1" nowrap>Ӫҵ����</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>Ӫҵ�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
 		<select name="PROVINCE" title="ʡ" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						ʡ/ֱϽ��/�������� 
						<select name="CITY" id="CITY" title="����/����/��/�����ݣ�" maxlength=20 onchange="cityChange()" disblank>
							<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>
						����/����/��/�����ݣ�
						 <select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="����/��/�ؼ���/�죩 " maxlength=20 disblank>
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
	
 	 <td class="lc1" align="center">��ϵ�绰</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="TEL" size="15" title="��ϵ�绰" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
 	
 	<td class="lc1" align="center">��������</td>   
	<td class="lc2" colspan="2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr> 	
 	<td class="lc1" nowrap="nowrap" colspan="2" align="center">ִ������ϻ��˻�ί�ɴ���</td>   
	<td class="lc2" colspan="2"><input type="text" name="LEREP" title="ִ������ϻ��˻�ί�ɴ���" size="30" maxlength=6 disblank>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1">����</td>
	<td class="lc2">	
	  <input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" size="10" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="����" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="ѡ ��..">					
		<font color=red>*</font> 	
</tr>
<tr>
    <td class="lc1" nowrap="nowrap" colspan="1" align="center">��ҵ����</td>   
	<td class="lc2" colspan="5" >
	<select name="ENTTYPE" disblank title="��ҵ����" style="width:150px; ">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZHH")%></select>&nbsp;<font color=red>*</font></td>
</tr>

<tr>	
	<td class="lc1" nowrap="nowrap" colspan="1" align="center">�Ͻɳ��ʶ�</td>   
	<td class="lc2" colspan="2" >
	<input type="text" name="REGCAP" disblank size="20" maxlength=20 title="�Ͻɳ��ʶ�" >��Ԫ&nbsp; <font color=red>*</font></td>
    <td class="lc1" nowrap="nowrap" align="center">����</td> 
	<td class="lc2" align="center" colspan="2"><input type="text" name="REGCAPCUR_TEXT" id="REGCAPCUR_TEXT" disabled>
		<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" title="ע���ʱ�����" disblank><input type="button" class="button" onclick="getSelDm('REGCAPCUR','CURRENCY')" value="ѡ ��..">					
		<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1" align="center">ʵ�ɳ��ʶ�</td>   
	<td class="lc2" colspan="5" width="30%">
	<input type="text" name="RECCAP" size="20"  maxlength=20 disblank title="ʵ�ɳ��ʶ�">��Ԫ&nbsp; <font color=red>*</font></td> 
	<%--td class="lc1" nowrap="nowrap" align="center">����</td> 
    <td class="lc2" colspan="2" align="center"><input type="text" name="RECCAPCUR_TEXT" id="RECCAPCUR_TEXT" disabled>
		<input type="hidden" name="RECCAPCUR" id="RECCAPCUR" title="ʵ���ʱ�����" disblank><input type="button" class="button" onclick="getSelDm('RECCAPCUR','CURRENCY')" value="ѡ ��..">					
		<font color=red>*</font>
    </td--%>
</tr>

<tr>
	<td class="lc1" align="center">��<br>Ӫ<br>��<br>Χ</td>
	<td class="lc2" colspan="5">
	<textarea rows="6" id="BUSSCOPE" name="BUSSCOPE" title="��Ӫ��Χ" cols="100" maxlength=1000></textarea>
	</td>
</tr>
<tr> 	
	<td class="lc1" colspan="1" align="center">�������Ǽǻ���</td>   
	<td class="lc2" colspan="2"><select name="REGORG" title="�������Ǽǻ���" disblank style="width:180px; "> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  	
	<td class="lc1" style="width:80px;">��Ͻ��λ</td>
	<td class="lc2" colspan="2"><select name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:220px;"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
 </tr>
 <tr> 	
	<td class="lc1" nowrap="nowrap">ִ�ո�����</td>   
	<td class="lc2" colspan="2"><input type="text" name="COPYNUM" title="ִ�ո�����" disblank datatype=INT size="20" maxlength=2 value=1>��
    &nbsp;<font color=red >*</font>&nbsp;
    </td>
    
    <td class="lc1" width="15%">Ӫҵ����</td>   
	<td class="lc2" colspan="2" >
	����<input type="checkbox" name="checkboxInput" id="check1"  title="Ӫҵ����" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" disblank title="Ӫҵ����" size="10" maxlength=10 >��
		</span><font color=red>*</font>
	</td> 
    
 </tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵�����к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����	
    </font></p></td>   
 </tr>
</table>
<script language="javascript">

function checkSub(){

		return true;
}

</script>