<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="4" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>���幤�̻�������Ϣ</font>
        </p>
        </td>
      </tr>
     <tr>
      <td class="lc1" nowrap="nowrap">����</td>
      <td class="lc2" colspan="3">
       <input type="text" name="TRANAME" READONLY size="70" title="" maxlength=50 disblank>&nbsp;<font color=red>*</font></td> 
     </tr>
     <tr>
    <td class="lc1">��������</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="20" maxlength=6 disblank><font color=red>*</font></td> 	
    
    <td class="lc1">��ϵ�绰</td>   
	<td class="lc2">
	<input type="text" name="TEL" size="20" title="��ϵ�绰" maxlength=20 disblank><font color=red>*</font></td>       
	</tr>
     <tr>	
	<td class="lc1" nowrap>��Ӫ����</td>   
 	<td class="lc2" colspan="3">
		<font color="red">˵����</font>��Ӫ�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
 		<select name="PROVINCE" title="ʡ" id="PROVINCE" onchange="writeDOM()">
						<%=icms.getSysDmList("PROVINCE")%>
						</select>
						ʡ/ֱϽ��/�������� 
						<select name="CITY" id="CITY" title="��" maxlength=20 onchange="cityChange()">
						<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>����/����/��/�����ݣ�
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="��" maxlength=20>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,GTDJ_JBXX.getCITY())%>
						</select>����/��/�ؼ���/�죩<br/>
						 <input type="text" name="TOWN" id="TOWN" title="��" size="23" maxlength=25 onchange="writeDOM()">����/������/��/�ֵ���
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="��" size="23" maxlength=25 onchange="writeDOM()">��·/��/������
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="��" size="10" maxlength=25 onchange="writeDOM()">���ţ� 
 		                <font color=red>*</font>
						<br>
						��¼��ľ�Ӫ����Ϊ��<input type="text" name="OPLOC" id="OPLOC" disblank style="width:380px" title="��Ӫ����" >
 		<font color=red>*</font>
 	</td></tr>
 	
<tr>
    <td class="lc1" nowrap="nowrap">��Ӫ����</td>  
	<td class="lc2" width="220px">
	<input type="text" name="OPERNAME" size="20" title="��Ӫ����" maxlength=50 disblank>&nbsp;<font color=red>*</font>
	</td>
    <td class="lc1" nowrap="nowrap">�����ʽ</td>  
	<td class="lc2">	
    <select id="COMPFORM" name="COMPFORM" title="����Ǽ�ͥ��Ӫ�ģ�����д����ļ�ͥ��Ա��������֤��" style="width:162px;" onclick="ifJtjy()" disblank>
	<option value='1'>���˾�Ӫ</option>
	<option value='0'>��ͥ��Ӫ</option>
	</select><font color=red>*</font>
	</td>  	
</tr>
     
<tr id="jtcy_tr" style="display:none">
     <td class="lc1" nowrap="nowrap">��ͥ��Ա����<br/>������֤��</td>
	 <td class="lc2" colspan="3">
	<textarea rows="3" name="FAMMEMBER" title="��ͥ��Ա����������֤��" cols="80" maxlength="333"></textarea>
	</td>   
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">��Ӫ��Χ</td>  
	<td class="lc2" colspan="2">
	<textarea rows="5" id="BUSSCOANDFORM" name="BUSSCOANDFORM" title="��Ӫ��Χ" cols="80" maxlength=1000 ></textarea>   
    </td>  
    <td class="lc2">
	<input type="button" class="button" style="height=20px;width=100px;" name="" value="��Ӫ��Χѡ��..." onClick="getJYFWStr('BUSSCOANDFORM')"> 
	</td>
</tr>

<tr>
    <td class="lc1">��ҵ����</td>   
	<td class="lc2"><input type="text" name="EMPNUM" title="��ҵ����" datatype=int size="15" maxlength=6 disblank>&nbsp;��<font color=red>*</font></td> 	
    
    <td class="lc1">�ʽ�����</td>   
	<td class="lc2">
	<input type="text" name="CAPAM" size="15" title="�ʽ�����" maxlength=20 disblank>&nbsp;��Ԫ<font color=red>*</font></td>       
</tr>
<tr> 	
	<td class="lc1" nowrap>�������Ǽǻ���</td>   
	<td class="lc2" colspan="3"><select id="REGORG" name="REGORG" title="�������Ǽǻ���" disblank style="width:220px;" onchange="loadgss()"> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  
</tr>
<%--<tr> 	
	<td class="lc1">��Ͻ��λ</td>   
	<td class="lc2" colspan="3"><select id="OPELOCDISTRICT" name="OPELOCDISTRICT" disabled title="��Ͻ��λ" style="width:220px;" onclick="loadgss()"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getSysDmListByRemark("REGORG","3",XZQH)%>
	</select></td> 
</tr>
 --%>
<tr> 	
	<td class="lc1">��Ƭ������</td>   
	<td class="lc2" colspan="3"><select id="LOCALADM" name="LOCALADM" id="LOCALADM" title="��Ƭ������" disblank> 
	<option value=''>����ѡ��Ǽǻ���</option>
	</select>&nbsp;<font color=red>*</font></td>
	 
</tr>
 <tr>
	<td class="lc2" colspan="4">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵�����к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>	
 </tr>
</table>