<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>�ֹ�˾������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>
	<td class="lc1">��˾����</td>   
	<td class="lc2" style="width:200px;">
	<input type="text" name="SUPENTNAME" id="SUPENTNAME" title="��˾����" size="30" maxlength=40 disblank>&nbsp;<font color=red>*</font></td>  
	<td class="lc1" >ע���/������ô���</td>   
	<td class="lc2">
	<input type="text" name="SUPREGNO" id="SUPREGNO" title="ע���/������ô���" size="15" disblank>&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>   
	<td class="lc1" nowrap="nowrap">�ֹ�˾����</td>   
	<td class="lc2" style="width:200px;">
	<input type="text" name="ENTNAME" READONLY size="20" title="�ֹ�˾����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
	
	<td class="lc1" >������</td>   
	<td class="lc2"><input type="text" name="LEREP" title="������" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
	
</tr>

 <tr>	
	<td class="lc1" nowrap>Ӫҵ����</td>   
 	<td class="lc2" colspan="3">
		<font color="red">˵����</font>Ӫҵ�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
 		<select name="PROVINCE" id="PROVINCE" title="ʡ"  onchange="writeDOM()">
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
	<td class="lc1" nowrap="nowrap">��������</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1">��ϵ�绰</td>   
	<td class="lc2"><input type="text" name="TEL" title="��ϵ�绰" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 	
</tr> 
 
<!--<tr>
	<td class="lc1">��Ӫ��Χ</td> 
	<td colspan="5">
	<table width="100%">
<tr>
	<td class="lc1" rowspan="2">���ɾ�Ӫ��Ŀ</td>   
	<td rowspan="2" class="lc2">
	<textarea rows="5" id="ABUITEMCO" name="ABUITEMCO" title="��Ӫ��Χ��Ϊ���ɾ�Ӫ��Ŀ��һ�㾭Ӫ��Ŀ�������б���Ҫ��дһ����ܶ�Ϊ�ա����ɾ�Ӫ��Ŀ��ָ��ҵ������Ǽ�ǰ���ݷ��ɡ��������桢����Ժ����Ӧ�������йز�����׼����Ŀ���μ�ǰ������Ŀ¼����һ�㾭Ӫ��Ŀ��ָ������׼����ҵ���������������Ŀ����ҵ�ľ�Ӫ��ΧӦ����������������ҵ�����е���ҵ���߾�Ӫ��������Ӫ��Χ����Ӧ�����չ��񾭼���ҵ�����׼���μ���Ӫ��Ŀ������ȡ������֤�����ע��֤����Ч��" cols="60" maxlength=1000></textarea>
	</td>
	<td class="lc2">
	<input type="button" class="button" style="height=20px;width=120px;" name="" value="���ɾ�Ӫ��Ŀѡ��..." onClick="getJYFWStr('ABUITEMCO')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	</td>
</tr>
<tr>
	<td class="lc2">
	<input type="button" class="button"  style="height=20px;width=120px;" name="" value="ǰ��������Ŀ" onclick="javascript:window.showModalDialog('../demo/qzspml.htm','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"></input>
	</td>	
</tr>
<tr>    
	<td class="lc1" >һ�㾭Ӫ��Ŀ</td>   
	<td class="lc2">
	<textarea rows="5"  id="CBUITEM"  name="CBUITEM" title="��Ӫ��Χ��Ϊ���ɾ�Ӫ��Ŀ��һ�㾭Ӫ��Ŀ�������б���Ҫ��дһ����ܶ�Ϊ�ա����ɾ�Ӫ��Ŀ��ָ��ҵ������Ǽ�ǰ���ݷ��ɡ��������桢����Ժ����Ӧ�������йز�����׼����Ŀ���μ�ǰ������Ŀ¼����һ�㾭Ӫ��Ŀ��ָ������׼����ҵ���������������Ŀ����ҵ�ľ�Ӫ��ΧӦ����������������ҵ�����е���ҵ���߾�Ӫ��������Ӫ��Χ����Ӧ�����չ��񾭼���ҵ�����׼���μ���Ӫ��Ŀ������ȡ������֤�����ע��֤����Ч��" cols="60" maxlength=1000 >(�뾭�����ģ�δ����׼ǰ���þ�Ӫ)</textarea>
	</td><td class="lc2">	
	<input type="button" class="button" style="height=20px;width=120px;" name="" value="һ�㾭Ӫ��Ŀѡ��..." onClick="getJYFWStr('CBUITEM')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	</td>    
</tr>
	</table>
	</td>
</tr> 
	-->
<tr>
	<td class="lc1" nowrap>��Ӫ��Χ</td> 
	<td colspan="3">
	<table width="100%" style="border-style:none;">
		<tr>
			<td class="lc2" >
				<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>
			</td>
			<td class="lc2" width="33%">
				<input type="button" class="button" style="height=20px;width=120px;" name="" value="��Ӫ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')" > 
			</td>
		</tr>	
	</table>
	</td>
</tr>

<tr>    
	<td class="lc1" nowrap="nowrap">��ҵ(����)����</td>   
	<td class="lc2" colspan="3"><select name="ENTTYPE" disblank title="��ҵ(��������)">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","FGS")%></select>&nbsp;<font color=red>*</font>
	</td>   
</tr>
<tr> 	
	<td class="lc1" nowrap="nowrap">�������Ǽǻ���</td>   
	<td class="lc2"><select name="REGORG" title="�������Ǽǻ���" disblank > 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  
	<td class="lc1" style="width:80px;">��Ͻ��λ</td>
	<td class="lc2"><select name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:180px;"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
	<td class="lc1" nowrap>ִ�ո�����</td>   
	<td class="lc2" ><input type="text" name="COPYNUM" title="ִ�ո�����" datatype=INT size="10" maxlength=2 value=1 disblank>
	&nbsp;<font color=red>*</font>
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

</table>
<script language="javascript">
function checkSub(){
    return true;	
}
function setBusscope()
{
document.form1.BUSSCOPE.value="���ɾ�Ӫ��Ŀ��"+document.form1.ABUITEMCO.value + "һ�㾭Ӫ��Ŀ��"+document.form1.CBUITEM.value;
}
</script>